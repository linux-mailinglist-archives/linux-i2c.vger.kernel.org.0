Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 633851691DF
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2020 22:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgBVV0w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Feb 2020 16:26:52 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37352 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgBVV0w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Feb 2020 16:26:52 -0500
Received: by mail-pl1-f193.google.com with SMTP id c23so2372088plz.4;
        Sat, 22 Feb 2020 13:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YIYXGSS8fcmSn+/UDOu18mOj75c8PxzQTNkib8e4EmA=;
        b=aTvdhtDL2+Mbhb5VETddMZfDxbWJ6EZbCYCSx9D6sUrCe7Uenur7XB6+LX454vOb89
         Md/Ww1N8czpeKjPMs2tk1lpbniKQA1BMw66AVtPvna49MpPRFZdOhiMevSUjYSfs37fP
         FJq/iGw5MR+c1ba3+LwSvlxtKSZNyspFmCNzTwGe/i1vjUQB+wVI1co0OEn2di8G6wEZ
         loPSUWHD+Dp+rq6j0b+oJE3zN5lGzoPRMQGA7KBocF/77+4Bomtm+z3ejC+u5MAeBvBE
         XH4ixL8ZAkSCwxnJFu0Dy/57u04y3hcatyLH7Pid11LpQrwmtZ8ddGTVk4n6TT+fdUHc
         hqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YIYXGSS8fcmSn+/UDOu18mOj75c8PxzQTNkib8e4EmA=;
        b=el+DJBaOzT9Bz2yVA+m2shV1t+SA1ysTin2libLjNayD9v2XNoyrUgtWCRNSu5JGB+
         Q36YTEkL3HruqnJJBoLocQUjEMldIITARhNY0Kx+cSvOab7f2kc1nUYSSrKOHCkKGSLz
         5kPrKdN8V55T3s9CJ9Ea0LLQBU9TI24XVaEVwww0Dpr+Ch0Luwk15my/pBgB+crGBGYR
         /IZmbWxJHaxvRWc9qu0wHcHyec4bYRimvTBjRY0OqvQTFBWk5wf0eH2JIRP6B8dzf25l
         UNx8hA8w53zaI4G/XAgRrCVjBLmaLzLVtIfaWtJ3M6q+HsX+e0Nfnwy49BaVDbLZkD7Y
         W02Q==
X-Gm-Message-State: APjAAAWcmvrGKnjU1tBk6r95caQ30e/rG4+nB0gZR9MspTOMsfvMjTfr
        /RWY9WogyTX9hR0tgj7TDFWwhrrn
X-Google-Smtp-Source: APXvYqxGHhG+YoimZM6KOAYrgFZeqwXLYxLIW+5+yyIxTusu61LzJRVvDSMP/nnIjlm0W5kplxOhJg==
X-Received: by 2002:a17:902:343:: with SMTP id 61mr43399823pld.332.1582406811177;
        Sat, 22 Feb 2020 13:26:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r7sm7570933pfg.34.2020.02.22.13.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2020 13:26:50 -0800 (PST)
Subject: Re: [regression] nct6775 does not load in 5.4 and 5.5, bisected to
 b84398d6d7f90080
To:     Martin Volf <martin.volf.42@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
 <1bdbac08-86f8-2a57-2b0d-8cd2beb2a1c0@roeck-us.net>
 <CAM1AHpSKFk9ZosQf=k-Rm2=EFqco7y4Lpfb7m07r=j_uJd4T0A@mail.gmail.com>
 <85356d1a-f90d-e94d-16eb-1071d4e94753@roeck-us.net>
 <CAM1AHpSpEFshpUGxKdhLV3XuThQg_XVaPgOWzvrTv6YtzHyO+A@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <bec1f81c-09a8-ba48-c6c4-5d9b340f7c0b@roeck-us.net>
Date:   Sat, 22 Feb 2020 13:26:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAM1AHpSpEFshpUGxKdhLV3XuThQg_XVaPgOWzvrTv6YtzHyO+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/22/20 12:49 PM, Martin Volf wrote:
> Hello,
> 
> On Sat, Feb 22, 2020 at 8:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 2/22/20 9:55 AM, Martin Volf wrote:
>>> On Sat, Feb 22, 2020 at 4:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> On 2/22/20 3:13 AM, Martin Volf wrote:
>>>>> hardware monitoring sensors NCT6796D on my Asus PRIME Z390M-PLUS
>>>>> motherboard with Intel i7-9700 CPU don't work with 5.4 and newer linux
>>>>> kernels, the driver nct6775 does not load.
>>>>>
>>>>> It is working OK in version 5.3. I have used almost all released stable
>>>>> versions from 5.3.8 to 5.3.16; I didn't try older kernels.
>>> ...
>>>> My wild guess would be that the i801 driver is a bit aggressive with
>>>> reserving memory spaces, but I don't immediately see what it does
>>>> differently in that regard after the offending patch. Does it work
>>>> if you unload the i2c_i801 driver first ?
>>>
>>> Yes, after unloading i2c_i801, the nct6775 works.
> ...
>>> This is diff of /proc/ioports in 5.3.18 with loaded nct6775 and in
>>> 5.4.21 without:
>>>
>>> --- ioports-5.3.18
>>> +++ ioports-5.4.21
>>> @@ -2,6 +2,7 @@
>>>      0000-001f : dma1
>>>      0020-0021 : pic1
>>>      002e-0031 : iTCO_wdt
>>> +    002e-0031 : iTCO_wdt
>>>      0040-0043 : timer0
>>>      0050-0053 : timer1
> ...
>>> So 0x2e is the resource the two drivers are fighting for.
> ...
>> Yes, and it should not do that, since the range can be used to access
>> different segments of the same chip from multiple drivers. This region
>> should only be reserved temporarily, using request_muxed_region() when
>> needed and release_region() after the access is complete. Either case,
>> I don't immediately see why that region would be interesting for the
>> iTCO watchdog driver.
>>
>> Can you add some debugging into the i801 driver to see what memory regions
>> it reserves, and how it gets to reserve 0x2e..0x31 ? That range really
>> doesn't make any sense to me.
> 
> in the function i801_add_tco() in drivers/i2c/busses/i2c-i801.c
> (line 1601 in 5.4.21), there is this code:
> 
>          /*
>           * Power Management registers.
>           */
>          devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 2);
>          pci_bus_read_config_dword(pci_dev->bus, devfn, ACPIBASE, &base_addr);
> 
>          res = &tco_res[ICH_RES_IO_SMI];
>          res->start = (base_addr & ~1) + ACPIBASE_SMI_OFF;
>          res->end = res->start + 3;
>          res->flags = IORESOURCE_IO;
> 
> base_addr is 0xffffffff after pci_bus_read_config_dword() call.
> ACPIBASE_SMI_OFF is 0x030, therefore res->start is 0x2e.
> Not that I understand even a bit of this...
> 

Outch. This means that the code is broken. ACPIBASE is not configured,
or disabled, or the code reads from the wrong PCI configuration register.
What I don't understand is why this works with v5.3 kernels; the code
looks just as bad there for me. I must be missing something. Either case,
the only thing you can really do at this point is to blacklist the
iTCO_wdt driver.

Other than that, we can only hope that someone who understands above
code can provide a fix. Maybe Wolfram has an idea.


Guenter
