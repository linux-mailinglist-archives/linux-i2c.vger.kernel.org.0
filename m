Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1E637F873
	for <lists+linux-i2c@lfdr.de>; Thu, 13 May 2021 15:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233358AbhEMNRD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 May 2021 09:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38896 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233293AbhEMNRB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 May 2021 09:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620911743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qsfYYVuA4z4/qDu23wSBRsngQvHS7+tVBTsrP7EpQa4=;
        b=cbNmWUDmPJI8AsNCR7j6MFnyXHyl8iG5qMOULumNH/9P93AvMH41b8ezjbz3TRKBV2xX6X
        DqBx83xDtm9RysUm0bOScvqPk33xKGxILTBPK9kIbjWPIvvzBU1ip8EWLBRIvaXykBMrR+
        GKEHmHnJSm/madsRpbqjsTvKzMr0qv8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-le027oWTNamV8T2J8HwKGA-1; Thu, 13 May 2021 09:15:41 -0400
X-MC-Unique: le027oWTNamV8T2J8HwKGA-1
Received: by mail-qt1-f200.google.com with SMTP id s4-20020ac85cc40000b02901b59d9c0986so17925697qta.19
        for <linux-i2c@vger.kernel.org>; Thu, 13 May 2021 06:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qsfYYVuA4z4/qDu23wSBRsngQvHS7+tVBTsrP7EpQa4=;
        b=YRc2NF9ScDMxV530rP3tVUBTs/ctDgwqSIgkvewqMu9aZBcMTN3mJeyq/VPthTrkTr
         iiVDcc805tbDsx5b9xtLjIUAJ7S8dnSMCS8DXP7F6nf6XQTXlrlkfvg+/t5UOUOmIcC/
         vYe9jCMRX6qNuBYRmGp3DXSnzNZnV4k0Tav/Q+0OLhTDQFIV7Y1v4SDoiaAx4T6OF5uB
         ETzkLlVKGxl8JPx2jJ0LV+VrBGqOHvYT5H9qTIjsZ0AlPOqUot82HUL7DQOOkLoOpkHA
         MblBzjhWzTviT/0ykn7/EXtDP8eJSv6aSkWyvFX9KOKcCmgqWY6xioq9MNwfNok2xtHX
         BPsA==
X-Gm-Message-State: AOAM531458M+xpYQIjNEcLJFjByYDyLok9W6MNdZiLyXZTucgEF8DaMA
        xH1rnD0i/xM93Y4ubKiHg8KcFsayELVemscVoe+qU4wFAqh1IpOeYydkN9k8+EfcAUh1OVdMUt2
        xv2KkzW0FXgGIX+69Nm0l
X-Received: by 2002:a05:622a:341:: with SMTP id r1mr9994081qtw.307.1620911741379;
        Thu, 13 May 2021 06:15:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwEjyY3u1J/G6+Cm8z9/t8ewZ6vW2TOaD0qCa1us8rfNgrCbblKdYRP+6ulsrYSiTB+uVbAA==
X-Received: by 2002:a05:622a:341:: with SMTP id r1mr9994062qtw.307.1620911741198;
        Thu, 13 May 2021 06:15:41 -0700 (PDT)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id l10sm2519572qtn.28.2021.05.13.06.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 06:15:40 -0700 (PDT)
Subject: Re: [PATCH v4] HID: ft260: improve error handling of
 ft260_hid_feature_report_get()
To:     Jiri Kosina <jikos@kernel.org>,
        Michael Zaidman <michael.zaidman@gmail.com>
Cc:     benjamin.tissoires@redhat.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210511101208.16401-1-michael.zaidman@gmail.com>
 <nycvar.YFH.7.76.2105131308260.28378@cbobk.fhfr.pm>
From:   Tom Rix <trix@redhat.com>
Message-ID: <8c48cdcc-ee47-3352-4023-db24b7a94759@redhat.com>
Date:   Thu, 13 May 2021 06:15:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2105131308260.28378@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 5/13/21 4:09 AM, Jiri Kosina wrote:
> On Tue, 11 May 2021, Michael Zaidman wrote:
>
>> Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
>>
>> The ft260_hid_feature_report_get() checks if the return size matches
>> the requested size. But the function can also fail with at least -ENOMEM.
>> Add the < 0 checks.
>>
>> In ft260_hid_feature_report_get(), do not do the memcpy to the caller's
>> buffer if there is an error.
>>
>> ---
>> v4   Fixed commit message
>> ---
>> v3   Simplify and optimize the changes
>> ---
>> v2:  add unlikely()'s for error conditions
>> ---
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> Who should be the author of the git commit?

Go with the latest patch's author, Micheal.

Tom

>
> Thanks,
>

