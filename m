Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38649100AC
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 22:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfD3UQl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 16:16:41 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33053 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfD3UQl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 16:16:41 -0400
Received: by mail-lj1-f196.google.com with SMTP id f23so14036666ljc.0;
        Tue, 30 Apr 2019 13:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B8reHkuIqjZZzeoD65y6KLq1gTHu9jNtA3g0IFRbx/c=;
        b=uYDaBudsEZvTpxVhkVz4jHPYJhET0ZEnzxU/AVJ9EBN9ApoCiqiuackPf23wUUQqZu
         /MMpphf/5GImubqoQoMp2z8DJ2QdWMQMQMrSjHQNKeB+VOcuDyAazY9fUmibDoP5WnNV
         /a5bDzIJN5EbEDWuNzU2sgsw41v0iWwLLoe3NblwHq+Zo6+AKJq+RQq1hABOvl64+lmM
         oz2gDsyDywL9v3zZQFG+078DqALNBotcXU0TRv7i7zgeaP/kGgmOXQ5iKQtK88X1eDCG
         +wenayQ+dzRmtdKpW2iEgHFgk5Rib8Q0YIenEWAGV/tjGDRn+kah4Via/L86BGMkbiAp
         lr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B8reHkuIqjZZzeoD65y6KLq1gTHu9jNtA3g0IFRbx/c=;
        b=MaKlNeqmBeVx4q518xQUWrj/GXYdI8bMqrp/6q+Ek9wDntFQ4LSk2eMtAIbiTdC6nc
         XJZpvdFCNZ4xiII/KRQGQs9vdeEHvkBdX3cEttaPs6SsW6818Q59qYK/K/Be2QXS+4o8
         JKN0xjCgDKVvF5oU03OfWmL9OopODjmcapjRRGomb37sebjyEiIR+NO0FFCr3r6iyPwJ
         AiL4kYstcAdClcIbMy1UX7ttrM3xcFWahBC5IHSlPuBAz1HgXHrRjV8nL02VWKtQoIRY
         lxjg79D+ryWIRNnl2B9y30Lgy6BgHhj5NgV4gTB5uuCJZ7tn/T1a6oHlgU+eb3mEpSW5
         5FIA==
X-Gm-Message-State: APjAAAVIUHhtM5bIgAsc3t8EyNcpQxfjP6g3CpXfZbjG62KheVUIIH/z
        0gWqbjiq1MN0Nejmra5jEXMeMGjcIRY=
X-Google-Smtp-Source: APXvYqyo+jG2w3BDdgmT0B3aMuxzZVO8jkOL+oCFKXrGF+pOZC/fnkaMYvRNdRkf8brE/cJPrxwFeQ==
X-Received: by 2002:a2e:5c49:: with SMTP id q70mr7728889ljb.16.1556655398352;
        Tue, 30 Apr 2019 13:16:38 -0700 (PDT)
Received: from [192.168.88.248] ([77.222.156.95])
        by smtp.gmail.com with ESMTPSA id x25sm4222882ljj.95.2019.04.30.13.16.36
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 13:16:37 -0700 (PDT)
Subject: Re: [PATCH RFT] i2c: designware: ratelimit 'transfer when suspended'
 errors
To:     Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
References: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
 <1a8172c8-3d2e-1897-88dd-d86aa0130ed8@gmail.com>
 <56faab09-c2ec-047a-886e-669d0a106e7b@redhat.com>
From:   skidnik <skidnik@gmail.com>
Message-ID: <39b2ddc1-0f96-8977-f57f-840025aff4f2@gmail.com>
Date:   Tue, 30 Apr 2019 23:15:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <56faab09-c2ec-047a-886e-669d0a106e7b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/30/19 5:09 PM, Hans de Goede wrote:
> Hi,
> 
> On 4/25/19 9:21 PM, skidnik wrote:
>> On 4/24/19 7:16 PM, Wolfram Sang wrote:
>>> There are two problems with dev_err() here. One: It is not ratelimited.
>>> Two: We don't see which driver tried to transfer something with a
>>> suspended adapter. Switch to dev_WARN_ONCE to fix both issues. Drawback
>>> is that we don't see if multiple drivers are trying to transfer while
>>> suspended. They need to be discovered one after the other now. This is
>>> better than a high CPU load because a really broken driver might try to
>>> resend endlessly.
>>>
>>> Link: https://bugs.archlinux.org/task/62391
>>> Fixes: 275154155538 ("i2c: designware: Do not allow i2c_dw_xfer() 
>>> calls while suspended")
>>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>> ---
>>>
>>> skdnik: Would you be so kind and test this patch? I can only 
>>> build-test here.
>>>
>>> I have a prototype to fix the similar issue in the core, but this 
>>> needs more
>>> testing first, so I am sending this one out already.
>>>
>>>   drivers/i2c/busses/i2c-designware-master.c | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-designware-master.c 
>>> b/drivers/i2c/busses/i2c-designware-master.c
>>> index bb8e3f149979..d464799e40a3 100644
>>> --- a/drivers/i2c/busses/i2c-designware-master.c
>>> +++ b/drivers/i2c/busses/i2c-designware-master.c
>>> @@ -426,8 +426,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct 
>>> i2c_msg msgs[], int num)
>>>       pm_runtime_get_sync(dev->dev);
>>> -    if (dev->suspended) {
>>> -        dev_err(dev->dev, "Error %s call while suspended\n", __func__);
>>> +    if (dev_WARN_ONCE(dev->dev, dev->suspended, "Transfer while 
>>> suspended\n")) {
>>>           ret = -ESHUTDOWN;
>>>           goto done_nolock;
>>>       }
>>>
>> This solves system journal flooding, but I still have one core under 
>> full load after resume from hibernation. The touchpad attached to that 
>> bus works perfectly fine after resume.
> 
> Ah, this is on a resume from hibernate, in that case I think this patch 
> will fix this:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?id=c8afd03486c26accdda4846e5561aa3f8e862a9d 
> 
> 
> Can you build a kernel with that patch added?
> 
> Regards,
> 
> Hans
> 
Built linux-5.1.0-rc7 (linux-mainline PKGBUILD from aur) with both 
patches applied.

This has fixed the issue. After resume from hibernation idle CPU usage 
goes back to normal (around 1%). The i2c_designware related error 
doesn't appear in kernel log.

I'm going to report back to Archlinux bug tracker that the issue has 
been fixed. Please can you tell which kernel release will have these 
fixes so that I can provide relevant information.

Thanks for the great work, regards
skidnik
