Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD7992EFBAA
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jan 2021 00:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbhAHXZ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jan 2021 18:25:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbhAHXZ2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jan 2021 18:25:28 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14C3C061574;
        Fri,  8 Jan 2021 15:24:47 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id c133so9020773wme.4;
        Fri, 08 Jan 2021 15:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ZTVjz7zCgsSu6PVGr/bnHMO3eNJHXSh+io9UTv2G2+8=;
        b=qKb+hU98rQjhEPlmUg2xbV2M65NyOuB5U9eJEXmhpkEogAeFH1gZ7vof5wKzfgstL5
         6p4LtFu9y6Eiy/BcFGvv7yfV5CunJwog3bK7ItnmEk6ae4EEJaG58FU1sbmh8JRekxxw
         +BblvuUTtLO+9O6+wPGDeKtqIb/gPzfnt+lSMNjQmJn4+qeNtocg9VRLJ48D25fROaFv
         wo7F20BqL4dqj3X03Ndbua4UwCZfLUbDKa2eo5OkSo8uWb9nTrdHjHe+/+REcsj1iarx
         tJoZhYiNhXwmoXKt18o4s1nwSgou+HsP9Ndf/ews1rxAwAvcA22AzdxI42x4AQIpe6H2
         LFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ZTVjz7zCgsSu6PVGr/bnHMO3eNJHXSh+io9UTv2G2+8=;
        b=j6KkNRFe8wuZE90z+MdXnPFnjtA75BCOJhGkWRe+NQdaMPm2eDng2R63mYU+Y2y4Uo
         N+dzQ7uWQSANHWu0yL9c9ExbMtzhbNgYoffa0KY4NJjs6NHEgDHCBESGBaE3n+ldVxFV
         g9x+L8ICeZaRqWjChlBhSfd3vJQrOh+/kG2KAomCuyeows8alTCNCCya5Fb1sbAv2n/W
         gYbV9kY76eHsOaciqRF2LVQs5TaTtkdS4gVIZIbT5fNuFCaWL77ivKi5r0AoWA97rumd
         qtMdJ/9zDqBtwTWaHKJZ0ej8wv66c5KYw8H7vyP4poby2oNd1RnYmPhXZ50kwT32cd4w
         0fDQ==
X-Gm-Message-State: AOAM530anBokXK9sXrMMFE7K5pCZmbyAobMx8bvb3nSsvfs33v4tpqdQ
        gb/IizgNSpeByKUpOuKwnSU=
X-Google-Smtp-Source: ABdhPJwK4d0nHoCWkgUEfRiA/81UbPANMjLuiyUl1XoiJ/Fh8XDuz2QHzVAo/qI23xyAMUYFIMpgxA==
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr4797925wmb.15.1610148286192;
        Fri, 08 Jan 2021 15:24:46 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id q15sm14372061wrw.75.2021.01.08.15.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jan 2021 15:24:45 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devel@acpica.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
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
        kieran.bingham+renesas@ideasonboard.com,
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
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <360b3783-b0ff-bdb8-5bcf-ec88a554503f@gmail.com>
Date:   Fri, 8 Jan 2021 23:24:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeYOqJt9iKaGPA4=dkb2kYUbqUV4PGTn8uSsnUt_kSGSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy

On 08/01/2021 12:17, Andy Shevchenko wrote:
> On Fri, Jan 8, 2021 at 1:56 AM Daniel Scally <djrscally@gmail.com> wrote:
>> On 30/11/2020 20:07, Andy Shevchenko wrote:
>>> On Mon, Nov 30, 2020 at 01:31:29PM +0000, Daniel Scally wrote:
> ...
>
>>> It's solely Windows driver design...
>>> Luckily I found some information and can clarify above table:
>>>
>>> 0x00 Reset
>>> 0x01 Power down
>>> 0x0b Power enable
>>> 0x0c Clock enable
>>> 0x0d LED (active high)
>>>
>>> The above text perhaps should go somewhere under Documentation.
>> Coming back to this; there's a bit of an anomaly with the 0x01 Power
>> Down pin for at least one platform.  As listed above, the OV2680 on one
>> of my platforms has 3 GPIOs defined, and the table above gives them as
>> type Reset, Power down and Clock enable. I'd assumed from this table
>> that "power down" meant a powerdown GPIO (I.E. the one usually called
>> PWDNB in Omnivision datasheets and "powerdown" in drivers), but the
>> datasheet for the OV2680 doesn't list a separate reset and powerdown
>> pin, but rather a single pin that performs both functions.
> All of them are GPIOs, the question here is how they are actually
> connected on PCB level and I have no answer to that. You have to find
> schematics somewhere.

Yeah; I've been trying to get those but so far, no dice.

>
>> Am I wrong to treat that as something that ought to be mapped as a
>> powerdown GPIO to the sensors? Or do you know of any other way to
>> reconcile that discrepancy?
> The GPIOs can go directly to the sensors or be a control pin for
> separate discrete power gates.
> So, we can do one of the following:
>  a) present PD GPIO as fixed regulator;
>  b) present PD & Reset GPIOs as regulator;
>  c) provide them as is to the sensor and sensor driver must do what it
> considers right.
>
> Since we don't have schematics (yet?) and we have plenty of variations
> of sensors, I would go to c) and update the driver of the affected
> sensor as needed. Because even if you have separate discrete PD for
> one sensor on one platform there is no guarantee that it will be the
> same on another. Providing a "virtual" PD in a sensor that doesn't
> support it is the best choice I think. Let's hear what Sakari and
> other experienced camera sensor developers say.
>
> My vision is purely based on electrical engineering background,
> experience with existing (not exactly camera) sensor drivers and
> generic cases.

Alright; thanks. I'm happy with C being the answer, so unless someone
thinks differently I'll work on that basis.

>> Failing that; the only way I can think to handle this is to register
>> proxy GPIO pins assigned to the sensors as you suggested previously, and
>> have them toggle the GPIO's assigned to the INT3472 based on platform
>> specific mapping data (I.E. we register a pin called "reset", which on
>> most platforms just toggles the 0x00 pin, but on this specific platform
>> would drive both 0x00 and 0x01 together. We're already heading that way
>> for the regulator consumer supplies so it's sort of nothing new, but I'd
>> still rather not if it can be avoided.
>
