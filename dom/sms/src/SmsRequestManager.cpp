/* -*- Mode: C++; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is mozilla.org code.
 *
 * The Initial Developer of the Original Code is Mozilla Foundation
 * Portions created by the Initial Developer are Copyright (C) 2011
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *   Mounir Lamouri <mounir.lamouri@mozilla.com> (Original Author)
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either of the GNU General Public License Version 2 or later (the "GPL"),
 * or the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */

#include "SmsRequestManager.h"
#include "SmsRequest.h"
#include "nsIDOMSmsMessage.h"
#include "nsDOMEvent.h"

/**
 * We have to use macros here because our leak analysis tool things we are
 * leaking strings when we have |static const nsString|. Sad :(
 */
#define SUCCESS_EVENT_NAME NS_LITERAL_STRING("success")
#define ERROR_EVENT_NAME   NS_LITERAL_STRING("error")

namespace mozilla {
namespace dom {
namespace sms {

SmsRequestManager* SmsRequestManager::sInstance = nsnull;

void
SmsRequestManager::Init()
{
  NS_PRECONDITION(!sInstance,
                  "sInstance shouldn't be set. Did you call Init() twice?");
  sInstance = new SmsRequestManager();
}

void
SmsRequestManager::Shutdown()
{
  NS_PRECONDITION(sInstance, "sInstance should be set. Did you call Init()?");

  delete sInstance;
  sInstance = nsnull;
}

/* static */ SmsRequestManager*
SmsRequestManager::GetInstance()
{
  return sInstance;
}

PRInt32
SmsRequestManager::CreateRequest(nsPIDOMWindow* aWindow,
                                 nsIScriptContext* aScriptContext,
                                 nsIDOMMozSmsRequest** aRequest)
{
  nsCOMPtr<nsIDOMMozSmsRequest> request =
    new SmsRequest(aWindow, aScriptContext);

  PRInt32 size = mRequests.Count();

  // Look for empty slots.
  for (PRInt32 i=0; i<size; ++i) {
    if (mRequests[i]) {
      continue;
    }

    mRequests.ReplaceObjectAt(request, i);
    NS_ADDREF(*aRequest = request);
    return i;
  }


  mRequests.AppendObject(request);
  NS_ADDREF(*aRequest = request);
  return size;
}

nsresult
SmsRequestManager::DispatchTrustedEventToRequest(const nsAString& aEventName,
                                                 nsIDOMMozSmsRequest* aRequest)
{
  nsRefPtr<nsDOMEvent> event = new nsDOMEvent(nsnull, nsnull);
  nsresult rv = event->InitEvent(aEventName, false, false);
  NS_ENSURE_SUCCESS(rv, rv);

  rv = event->SetTrusted(PR_TRUE);
  NS_ENSURE_SUCCESS(rv, rv);

  bool dummy;
  return aRequest->DispatchEvent(event, &dummy);
}

void
SmsRequestManager::NotifySmsSent(PRInt32 aRequestId, nsIDOMMozSmsMessage* aMessage)
{
  NS_ASSERTION(mRequests.Count() > aRequestId && mRequests[aRequestId],
               "Got an invalid request id or it has been already deleted!");

  // It's safe to use the static_cast here given that we did call
  // |new SmsRequest()|.
  SmsRequest* request = static_cast<SmsRequest*>(mRequests[aRequestId]);
  request->SetSuccess(aMessage);

  DispatchTrustedEventToRequest(SUCCESS_EVENT_NAME, request);

  mRequests.ReplaceObjectAt(nsnull, aRequestId);
}

} // namespace sms
} // namespace dom
} // namespace mozilla
