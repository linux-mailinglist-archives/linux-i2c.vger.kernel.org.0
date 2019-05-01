Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3866B1089D
	for <lists+linux-i2c@lfdr.de>; Wed,  1 May 2019 15:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfEAN7g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 May 2019 09:59:36 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:39400 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbfEAN7g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 May 2019 09:59:36 -0400
Received: by mail-ed1-f67.google.com with SMTP id e24so3862255edq.6
        for <linux-i2c@vger.kernel.org>; Wed, 01 May 2019 06:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=83sr06AgQn1jRuIcaK5X1yiTVGSuWSOa0kQfrlePHUU=;
        b=AIfZImryGTkNdlWMCuRcUg1+XcKtnv7sF9q5fd/P4RBvwaN2AaGlQ0QGXVGaDQLn2C
         U4Ocgpe61xoDDxJ8qCJluZzBzVd2mZuZopjJ7lvuGtKUhp1/uqPOipUwwke5OR4XzFN9
         uiiaABN51+v2qDWCoz6EGujlfLGJ8+c5KBYcfnFDcCajq90/u3zugjDzQ//6kRONakPx
         9zwoCae9bwdHVZSmdnkBitR8YHn/vYXcApIq7VXiwhY0vHgw9oodUZ5/Diw6HWeX7uGz
         vC/MpZTsl1tgdwz0dLC8daRB4yoJUMIrgDg0YgTWa3RFLgTOKL8iGT1tIPRlXP65HAZD
         PCKw==
X-Gm-Message-State: APjAAAUc6xJrgNTB7hWHD+kiLZvOm2bFvv+u8xIO2ieA+j0BdjPVHpht
        bwnAjwdTKVaydf7DWt5gXUV/gw==
X-Google-Smtp-Source: APXvYqxYKS4Vj/3QRBYncxCJHhAbkZPzU6Aw3dd6oWUSeaR4tEWi+YnJej2mPcJsYcIRjaiZMMtc7g==
X-Received: by 2002:a50:f706:: with SMTP id g6mr12436994edn.187.1556719174404;
        Wed, 01 May 2019 06:59:34 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id d8sm6812919ejb.19.2019.05.01.06.59.33
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 06:59:33 -0700 (PDT)
Subject: Re: [PATCH RFT] i2c: designware: ratelimit 'transfer when suspended'
 errors
To:     skidnik <skidnik@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
References: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
 <1a8172c8-3d2e-1897-88dd-d86aa0130ed8@gmail.com>
 <56faab09-c2ec-047a-886e-669d0a106e7b@redhat.com>
 <39b2ddc1-0f96-8977-f57f-840025aff4f2@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <231dde8f-0e5b-0d88-abf6-544ccc4d2390@redhat.com>
Date:   Wed, 1 May 2019 15:59:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <39b2ddc1-0f96-8977-f57f-840025aff4f2@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 30-04-19 22:15, skidnik wrote:
> On 4/30/19 5:09 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 4/25/19 9:21 PM, skidnik wrote:
>>> On 4/24/19 7:16 PM, Wolfram Sang wrote:
>>>> There are two problems with dev_err() here. One: It is not ratelimited.
>>>> Two: We don't see which driver tried to transfer something with a
>>>> suspended adapter. Switch to dev_WARN_ONCE to fix both issues. Drawback
>>>> is that we don't see if multiple drivers are trying to transfer while
>>>> suspended. They need to be discovered one after the other now. This is
>>>> better than a high CPU load because a really broken driver might try to
>>>> resend endlessly.
>>>>
>>>> Link: https://bugs.archlinux.org/task/62391
>>>> Fixes: 275154155538 ("i2c: designware: Do not allow i2c_dw_xfer() calls while suspended")
>>>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>> ---
>>>>
>>>> skdnik: Would you be so kind and test this patch? I can only build-test here.
>>>>
>>>> I have a prototype to fix the similar issue in the core, but this needs more
>>>> testing first, so I am sending this one out already.
>>>>
>>>>   drivers/i2c/busses/i2c-designware-master.c | 3 +--
>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
>>>> index bb8e3f149979..d464799e40a3 100644
>>>> --- a/drivers/i2c/busses/i2c-designware-master.c
>>>> +++ b/drivers/i2c/busses/i2c-designware-master.c
>>>> @@ -426,8 +426,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>>>>       pm_runtime_get_sync(dev->dev);
>>>> -    if (dev->suspended) {
>>>> -        dev_err(dev->dev, "Error %s call while suspended\n", __func__);
>>>> +    if (dev_WARN_ONCE(dev->dev, dev->suspended, "Transfer while suspended\n")) {
>>>>           ret = -ESHUTDOWN;
>>>>           goto done_nolock;
>>>>       }
>>>>
>>> This solves system journal flooding, but I still have one core under full load after resume from hibernation. The touchpad attached to that bus works perfectly fine after resume.
>>
>> Ah, this is on a resume from hibernate, in that case I think this patch will fix this:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?id=c8afd03486c26accdda4846e5561aa3f8e862a9d
>>
>> Can you build a kernel with that patch added?
>>
>> Regards,
>>
>> Hans
>>
> Built linux-5.1.0-rc7 (linux-mainline PKGBUILD from aur) with both patches applied.
> 
> This has fixed the issue. After resume from hibernation idle CPU usage goes back to normal (around 1%). The i2c_designware related error doesn't appear in kernel log.
> 
> I'm going to report back to Archlinux bug tracker that the issue has been fixed. Please can you tell which kernel release will have these fixes so that I can provide relevant information.

The patch is scheduled for inclusion into 5.2 and it has a Cc: stable,
so it will get backported to older kernels like the 5.1.x and 5.0.x releases
once it is merged into Linus' tree.

Regards,

Hans
