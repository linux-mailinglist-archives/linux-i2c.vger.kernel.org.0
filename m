Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56ECC7E6EEC
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 17:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343989AbjKIQes (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 11:34:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235095AbjKIQeg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 11:34:36 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA43384E
        for <linux-i2c@vger.kernel.org>; Thu,  9 Nov 2023 08:34:16 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53e751aeb3cso1673539a12.2
        for <linux-i2c@vger.kernel.org>; Thu, 09 Nov 2023 08:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699547655; x=1700152455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HB0b+gquJYx5Qtl58JFz3PJ8XX5Hn5z3uf6OPTkmWgQ=;
        b=ALdumlNPiUb4UyS8cNbUd+a/IMJAUUpm5WXefu2qRmZ9uc4y/DrUexUWM5wU/elMtX
         XFr9zTM0C9UknnXDDuAzM2lhjKdcxF8OgB6yH0svOk55Yp88FlwTrw0W4+bvBwwzwIUd
         1Wck5IyiILMKorv5dNssvw7WFirEEL4olvyB/CbO/MrtVrnvl686S1ivGRfvmT/Qcp/5
         SUjirOo72Xe1BSO144opohnWfvgdnrYjtU312hUg7mzyUh1ytCx46Oh0NAUjqjR20gsg
         6qPiCrSVmrHZSXvUihsRtkdQM+BiSVkXsn5xMvbEkauOgo3Lwk7CwSk0bYdYvFpsc6DE
         bfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699547655; x=1700152455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HB0b+gquJYx5Qtl58JFz3PJ8XX5Hn5z3uf6OPTkmWgQ=;
        b=cFt6mT7Nkf487Js1kHHfYtggxazL7pv7Vvc3+Zvn+z1ZLTK/QSloihk4WjwJFPKf7i
         D4TWAzrtKAuVc+owVJRF1JgYoz7AdZTKkbZxRcHbVFzGOXY52bdXHJ1ktLnBBVgR3Ooy
         WohBH5t6ZuxULUTIk0y/suvzhsKMDZ6l4ujKp4wUj0y+lcnHEGV1ANMghhTIy5Fz1b1p
         LR+q/iMYlVf6AhqloJIPLtoGdqu2NjtIQd1g+QvmL1BUG4co2QgBCgzVeJQ8uiXmgrXB
         +twoVedLdt9OptlXWP+4110Oqi5zFEpw7Py7IrJxOHpO7P37AbcKzvJXqUbBWLp2GA9+
         3QWg==
X-Gm-Message-State: AOJu0Yx6LJniMhns8e+LJ/XDIiNHXbTHOG+TrFwNtenPdtUIYV+JzuZ3
        aDhRdkYvgnkMTECFLosCIBo=
X-Google-Smtp-Source: AGHT+IFJldsWy66TYCI1qe1Euxjg+suVceIjgOA+9dwgfC0Eve81sukz8pmNJfMLXL5l9Glv+plEZw==
X-Received: by 2002:a50:a452:0:b0:544:97d6:ba64 with SMTP id v18-20020a50a452000000b0054497d6ba64mr4642590edb.0.1699547654445;
        Thu, 09 Nov 2023 08:34:14 -0800 (PST)
Received: from ?IPV6:2a01:c23:bd8b:e400:ed81:899c:b431:d0cc? (dynamic-2a01-0c23-bd8b-e400-ed81-899c-b431-d0cc.c23.pool.telefonica.de. [2a01:c23:bd8b:e400:ed81:899c:b431:d0cc])
        by smtp.googlemail.com with ESMTPSA id x9-20020aa7cd89000000b005435faef9cfsm16684edv.52.2023.11.09.08.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 08:34:14 -0800 (PST)
Message-ID: <4fdf5873-b366-4601-a9cd-58814eed321d@gmail.com>
Date:   Thu, 9 Nov 2023 17:34:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i801: Use I2C_CLASS_HWMON for i2c mux children
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
References: <45c5366f-cbee-4c7d-bb62-a446935b2729@gmail.com>
 <20231106155036.366fb752@endymion.delvare>
 <a22978a4-88e4-46f4-b71c-032b22321599@gmail.com>
 <20231109145212.01f7b597@endymion.delvare>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20231109145212.01f7b597@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09.11.2023 14:52, Jean Delvare wrote:
> Hi Heiner,
> 
> On Tue, 7 Nov 2023 09:04:34 +0100, Heiner Kallweit wrote:
>> On 06.11.2023 15:50, Jean Delvare wrote:
>>> There may also be a hardware monitoring device on the parent segment on
>>> these boards. With this change, that device will no longer be detected.
>>> That would be a regression, so I have to nack this proposed change,
>>> sorry.
>>
>> Hmm, right. To me it seems we have a fundamental problem:
>> The parent has no way to find out whether a detected device sits on
>> the parent segment or whether it belongs to a muxed child segment.
>> In the latter case the device may show up twice, as you mentioned
>> before.
> 
> Indeed. This is a fundamental limitation of SMBus multiplexing, which
> makes devices on the parent segment also visible on all children
> segments.
> 
>> And the core check "supported classes of parent and child must not
>> overlap" doesn't consider that we may have e.g. hwmon devices
>> on parent segment and on muxed child segment too.
> 
> Indeed. This worked when I implemented it only due to the combination
> of 3 factors:
> * The only hardware monitoring devices on the children SMBus segments
>   of the supported Asus boards were the temperature sensors optionally
>   integrated in the memory modules.
> * No I2C device driver was using more than one auto-detection class, so
>   it was possible to partition auto-detection based on class flags
>   (this assumption got broken by commit eacc48ce3acc later on).
> * The jc42 driver was using class I2C_CLASS_SPD instead of
>   I2C_CLASS_HWMON (something we want to change now).
> 
> The only safe and universal way to handle a muxed SMBus topology is to
> get rid of auto-detection entirely and instead explicitly instantiate
> all devices on the bus segment where we know they reside.
> 
>>> The only way forward I can think of (if we want to get rid of
>>> I2C_CLASS_SPD) would be to remove device auto-detection on children
>>> segments completely (.class = 0 for them) and instead actively probe
>>> for SPD EEPROMs and JC42 thermal sensors on these segments. For SPD we
>>> should be able to just reuse i2c_register_spd(). For JC42 we would need
>>> similar code, which doesn't exist yet.
>>
>> Regarding the first part, removing auto-detection on muxed children:
>> We have only two i2c mux drivers supporting auto-detection, i2c-mux-gpio
>> and i2c-mux-reg. Both do not support auto-detection for DT-configured
>> systems.
> 
> Well, if a device tree has been defined then devices are listed
> explicitly and auto-detection isn't needed.
> 
>> Only user for i2c-mux-gpio is i801. Only user for i2c-mux-reg is
>> drivers/platform/x86/mlx-platform, and it doesn't make use of
>> auto-detection.
>> So I think as first step we should remove auto-detection support from
>> i2c-mux-reg.
> 
> If it's unused, yes, we could and should, to prevent future usage as we
> now know this isn't the way to go.
> 
>> Then we could do the same for i2c-mux-gpio, and afterwards remove the
>> class parameter from i2c_mux_add_adapter().
> 
> Right now, things are a bit clumsy, as the same device may end up being
> registered twice (once on the parent segment, once on the child
> segment) but this does not prevent monitoring the system. If you drop
> auto-detection without providing a replacement, you actually break
> system monitoring altogether. So the explicit device registration code
> must be ready before we consider dropping auto-detection support.
> 
> In other words, we must convert the users first, and only when there's
> no user left, we can drop the unused code.
> 
>> So we need an "i2c_register_jc42()" only for use by i801.
>> What's good, because we can make this function private to i801 and
>> won't attract any potential additional users.
> 
> I disagree on that point. There's nothing i2c-i801-specific to
> i2c_register_jc42(), and it should be just as public and usable by
> other I2C bus drivers as i2c_register_spd(). Not only we don't want to
> discourage people from using these functions, but with the removal of
> the legacy eeprom driver, we actually want to encourage people to use
> these fonctions, to restore the lost functionality.
> 
> My work on i2c-i801 with commit 01590f361e94 ("i2c: i801: Instantiate
> SPD EEPROMs automatically") was meant as an experiment to pave the
> road. There's no reason why other SMBus controller drivers used on
> PC-style systems wouldn't do exactly the same. The i2c-piix4 driver is
> a prime example of this. Not sure if there are actually other drivers
> falling into that category, as I think all Intel-based systems would use
> i2c-i801 and all AMD-based systems would use i2c-piix4 these days.
> 
> About i2c_register_jc42(), I'm not sure if it can be a standalone
> function separated from i2c_register_spd(). While SPD EEPROMs are
> mandatory to have on memory modules, temperature sensors aren't. Also I
> think I recall that the JC42.4 temperature sensors standard is tied to
> the DDR4 memory type. So, to be on the safe side, we shouldn't blindly

At least the Kconfig descriptions mentions that supported temperature
sensors can be found on certain DDR3 modules.

> probe for jc42 devices on all supported addresses. Instead, we should
> only probe for addresses which correspond to an SPD EEPROM which has
> been successfully probed earlier, and only if memory type is DDR4.
> 
> For example, if DMI data says the system is using DDR4 and we were able
> to detect and instantiate an ee1004 SPD device at I2C address 0x50 then
> we should probe for a JC42.4-compliant temperature sensor device at I2C
> address 0x18. An SPD EEPROM at 0x51 would correspond to a possible
> JC42.4-compliant device at 0x19, and so on.
> 
Nice idea. How about our ASUS use case in i801? i2c_register_spd() isn't
called in case of muxing, neither for the parent nor for the mux children.

> This is a little more work than probing all supported addresses
> arbitrarily, but this will avoid poking at other devices in ways which
> could have nasty side effects.
> 

