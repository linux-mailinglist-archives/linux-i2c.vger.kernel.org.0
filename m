Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660E82EFEE4
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jan 2021 11:01:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbhAIJ6v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jan 2021 04:58:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbhAIJ6u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 Jan 2021 04:58:50 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D94C061786;
        Sat,  9 Jan 2021 01:58:10 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id m5so11296378wrx.9;
        Sat, 09 Jan 2021 01:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gL3/Ra544UmXMsRokx3MeIRI3LWNCM8pYM7Ye7rk538=;
        b=P3yITzy4KP/TEzZpDthHQrkRRKfwsIwhSdxsF2VhudSCcA6HsEzvdE93cBKUe39wbB
         v6qg9G/6HIA6pzN+O25I5WP1MmgH08PDxzfLzrfA75MZMBDqXUmSe82IqyJXxYFBsinX
         OZ43l8tKeaTZ4yGT6sxyGH0bube7rX0hDtp6BrSFso1tHfTDCITu8eQdPxHQZU/7Gm2Q
         Hj8veQN5HLpqODc6tfKIxygKQjzsFpld2eXCR4dWedJHEKctv2d7f8ZuRvi9kg6YqgNG
         VcITkCm+PpS2VaHiFTR7v1OLoKC/zWyurMbJ5AV6FvYVH5ubyA2fWK+hp3qiaBgfSt+y
         IYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gL3/Ra544UmXMsRokx3MeIRI3LWNCM8pYM7Ye7rk538=;
        b=riNRPbxmycAU/pAy12o6GortDjsXwmoijCo5J5j7i7RQythldmE7AjHbJCB457TRnF
         e69/3T8q+0p4bR4JKN9q4LM0UC81UcBOEMAojXXnAiOhvh4jp87qDZL4ksw4oN+gsHlf
         DhvaApiL1Pgr9u5G14mCLiooZwXE+Y37Ir5BX/NqsA7SSSOyzLLEHITf7QegaGIG7J78
         Dt2KIcwAiV/19wEqQBvoqHZ9Z8cI/laM/Gr46DaO3oWdnByT7qsbguTLdME/J8JdqKfj
         gmpk5e2hP1nsH1DF+zII1zauGeWAaBohKI224uQSLX8ysiVMZFWdZr/VPQ86dtIG5l7g
         p9Dg==
X-Gm-Message-State: AOAM530xZ7PZVEjxdHKl6+tpy9opun7i6CQmB13Y0TJMUmm5hipE/tIH
        2PYguWTeLvRdnQrgXWNyyZk=
X-Google-Smtp-Source: ABdhPJywEA2rYMsdN+vyJkjpq/bBJv58ZCK0HdiRSxqB5tBhoqfQY1wFavOpqlxRhU4ZjJhOqr/REw==
X-Received: by 2002:a5d:4bc2:: with SMTP id l2mr7612962wrt.204.1610186288681;
        Sat, 09 Jan 2021 01:58:08 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id l7sm14838781wme.4.2021.01.09.01.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Jan 2021 01:58:07 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "devel@acpica.org" <devel@acpica.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jordan Hand <jorhand@linux.microsoft.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <778f23fc-b99c-33a2-642d-ca0e47fd4ed5@gmail.com>
 <CAHp75VeYOqJt9iKaGPA4=dkb2kYUbqUV4PGTn8uSsnUt_kSGSw@mail.gmail.com>
 <360b3783-b0ff-bdb8-5bcf-ec88a554503f@gmail.com>
 <CAHp75Vcy878xKUUUDH5ory9uS-Vhhx_W1PZc=S6hsSLYJ0i60w@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <4cec819b-603f-102c-5e83-61c37b495973@gmail.com>
Date:   Sat, 9 Jan 2021 09:58:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vcy878xKUUUDH5ory9uS-Vhhx_W1PZc=S6hsSLYJ0i60w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 09/01/2021 09:17, Andy Shevchenko wrote:
> On Saturday, January 9, 2021, Daniel Scally <djrscally@gmail.com> wrote:
>
>> Hi Andy
>>
>> On 08/01/2021 12:17, Andy Shevchenko wrote:
>>> On Fri, Jan 8, 2021 at 1:56 AM Daniel Scally <djrscally@gmail.com>
>> wrote:
>>>> On 30/11/2020 20:07, Andy Shevchenko wrote:
>>>>> On Mon, Nov 30, 2020 at 01:31:29PM +0000, Daniel Scally wrote:
>>> ...
>>>
>>>>> It's solely Windows driver design...
>>>>> Luckily I found some information and can clarify above table:
>>>>>
>>>>> 0x00 Reset
>>>>> 0x01 Power down
>>>>> 0x0b Power enable
>>>>> 0x0c Clock enable
>>>>> 0x0d LED (active high)
>>>>>
>>>>> The above text perhaps should go somewhere under Documentation.
>>>> Coming back to this; there's a bit of an anomaly with the 0x01 Power
>>>> Down pin for at least one platform.  As listed above, the OV2680 on one
>>>> of my platforms has 3 GPIOs defined, and the table above gives them as
>>>> type Reset, Power down and Clock enable. I'd assumed from this table
>>>> that "power down" meant a powerdown GPIO (I.E. the one usually called
>>>> PWDNB in Omnivision datasheets and "powerdown" in drivers), but the
>>>> datasheet for the OV2680 doesn't list a separate reset and powerdown
>>>> pin, but rather a single pin that performs both functions.
>>> All of them are GPIOs, the question here is how they are actually
>>> connected on PCB level and I have no answer to that. You have to find
>>> schematics somewhere.
>> Yeah; I've been trying to get those but so far, no dice.
>>
>>
> Can you share the exact name / model of the hardware in question here? I
> would try to search for the schematics.
Lenovo Miix 510-12ISK 80U1 - I also tried asking Lenovo for them but
that didn't really go anywhere; but of course I'm just contacting their
usual support line and explaining what I'm after, so I didn't really
expect it to.
>
>
>>>> Am I wrong to treat that as something that ought to be mapped as a
>>>> powerdown GPIO to the sensors? Or do you know of any other way to
>>>> reconcile that discrepancy?
>>> The GPIOs can go directly to the sensors or be a control pin for
>>> separate discrete power gates.
>>> So, we can do one of the following:
>>>  a) present PD GPIO as fixed regulator;
>>>  b) present PD & Reset GPIOs as regulator;
>>>  c) provide them as is to the sensor and sensor driver must do what it
>>> considers right.
>>>
>>> Since we don't have schematics (yet?) and we have plenty of variations
>>> of sensors, I would go to c) and update the driver of the affected
>>> sensor as needed. Because even if you have separate discrete PD for
>>> one sensor on one platform there is no guarantee that it will be the
>>> same on another. Providing a "virtual" PD in a sensor that doesn't
>>> support it is the best choice I think. Let's hear what Sakari and
>>> other experienced camera sensor developers say.
>>>
>>> My vision is purely based on electrical engineering background,
>>> experience with existing (not exactly camera) sensor drivers and
>>> generic cases.
>> Alright; thanks. I'm happy with C being the answer, so unless someone
>> thinks differently I'll work on that basis.
>>
>>
> Laurent answered that it is not the best choice from camera sensor driver
> perspective.
Yep, seen - no problem. I will look at doing it via the method he suggests.
