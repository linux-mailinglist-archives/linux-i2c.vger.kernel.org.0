Return-Path: <linux-i2c+bounces-152-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E29337EB2F0
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 16:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82EE31F246CC
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 15:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDE841227;
	Tue, 14 Nov 2023 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1TAhgSM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3404120D
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 15:00:13 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9E8114
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 07:00:11 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9c603e2354fso1151069066b.1
        for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 07:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699974010; x=1700578810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uAWHrKOC7vZH6Gfd6MnZZGfcu6w/fYCRM8s4j/a6g/I=;
        b=k1TAhgSMyQfq9U9J3SwNvz2xjao3UsHjMwrlDJsjk22jRjGag02f/95dsVKIwMNYD/
         TfNfmn7+bIVsZQYV6BjoA59UYNsCXBK5ok1YdjK1ZTGwnLE1eDVmaqD7CW2h/iIDG6NG
         n1qs8O1NQBSSCUVd3vVa5o0QpkgRpXSR9ZlSmrbMLkRlzOTUAIeO21HR6RJVZagneRpH
         smjqynwpZHZn+CTyDd2uLwgVZtWhMOQMFWSegj4Y+XX4yeddNmEiBQ3O863JyokZj3h0
         iCvW5OkjIrkLKPVtJKDhMr0AgHltliew69qkkPbAJItOpixbASpEPxrRTUXD8/FT9lC7
         eROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699974010; x=1700578810;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAWHrKOC7vZH6Gfd6MnZZGfcu6w/fYCRM8s4j/a6g/I=;
        b=Xy/PvjZIHJR5NxNWSsutlduzF/547sMdz0Ln1XsDOlwa4GW7BQ80sn392/k3emmAXj
         O1BrqYpj7w1PasYz5iO3b6UR8dM5+BP1drNl5JHUKknm/4dMD03MUcDjE7AITgeKxg3O
         8sR8DRW8WwDuDXMnOCgZhzzqbAB0EfASZpHKw+Z0pAES3Oxcy7Y3OvTHtqocApiwGa5b
         kdbmCf3QoXLHK02T7of+l/UhIUE+5cKPpnIgt5zsgkPU1XHdiGd2/4SAY6Ss9pP8iE0k
         cAPI1/CtV6UgmdI73lNZZr5EzWG8c5Gnlkk7DSriwZXNeP6GsVu3bDtGjsln0VBaluBB
         R7TQ==
X-Gm-Message-State: AOJu0YxxA5FGof82Z5XinPxgHjzMAI7x4LZ9tvW45Vh5EwDFiNM1p72I
	D4rzTkHaS2pkBggNSXiRcxk=
X-Google-Smtp-Source: AGHT+IFlLS/zfE6nYiEAa/if2xWdG6SzidFU3bAohm4iju8UNcfILWg3Nmm1OiLcREQglKLn81OEww==
X-Received: by 2002:a17:907:9629:b0:9ee:295:5696 with SMTP id gb41-20020a170907962900b009ee02955696mr2679455ejc.2.1699974009333;
        Tue, 14 Nov 2023 07:00:09 -0800 (PST)
Received: from ?IPV6:2a01:c22:774d:c900:c14e:307a:8e88:ee47? (dynamic-2a01-0c22-774d-c900-c14e-307a-8e88-ee47.c22.pool.telefonica.de. [2a01:c22:774d:c900:c14e:307a:8e88:ee47])
        by smtp.googlemail.com with ESMTPSA id b9-20020aa7c909000000b0053e6e40cc1asm5144471edt.86.2023.11.14.07.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 07:00:08 -0800 (PST)
Message-ID: <26de522a-6f51-424c-b7fb-2b01cd509e70@gmail.com>
Date: Tue, 14 Nov 2023 16:00:08 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] i2c: i801: Add i801_register_jc42, similar to
 i2c_register_spd
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-i2c@vger.kernel.org
References: <79977020-69c3-4f87-b861-b043c7fb9077@gmail.com>
 <b9a832d6-f7a8-4a9d-b639-181e074b4e9a@gmail.com>
 <20231114150001.6823e277@endymion.delvare>
 <37aa2c39-8192-42be-8021-a2147252f27b@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <37aa2c39-8192-42be-8021-a2147252f27b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2023 15:44, Heiner Kallweit wrote:
> On 14.11.2023 15:00, Jean Delvare wrote:
>> Hi Heiner,
>>
>> On Wed, 08 Nov 2023 11:28:45 +0100, Heiner Kallweit wrote:
>>> On 08.11.2023 08:27, Heiner Kallweit wrote:
>>>> As discussed, this is a RFC version of changing jc42 auto-detection
>>>> with the goal to get rid of I2C_CLASS_SPD completely mid-term.
>>>>
>>>> Code of i801_jc42_probe() was copied from jc42 driver, just w/o
>>>> the device id check. I think it's safe enough w/o this check.
>>>>
>>>> I don't have hw to test this, therefore it's compile-tested only.
>>>>
>>>> Link:
>>>> https://lore.kernel.org/linux-i2c/a22978a4-88e4-46f4-b71c-032b22321599@gmail.com/
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com> ---
>>>>  drivers/i2c/busses/i2c-i801.c | 48
>>>> ++++++++++++++++++++++++++++++++--- 1 file changed, 44
>>>> insertions(+), 4 deletions(-) 
>>>
>>> That's quite some code for more or less nothing. I2C_CLASS_SPD is
>>> relevant only for users:
>>> - having one of the specific old ASUS machines with i2c-muxing
>>> - having RAM with a jc42-compatible temperature sensor
>>> - manually loading module jc42 to expose the temp sensor
>>
>> People running such systems would typically run sensors-detect to setup
>> their hardware monitoring, so the jc42 driver would be loaded at boot
>> by the lm-sensors service. This is "manual" from the kernel's
>> perspective, but still this is integrated and has been working for
>> years. If you break that, this is a functional regression.
>>
>> There is nothing fundamentally specific to i2c-i801 or these Asus
>> boards here. The only reason why we are discussing it in this context
>> is because SMBus multiplexing adds some implementation constraints, and
>> it turns out that right now only the i2c-i801 driver has support for
>> PC-style boards with multiplexed SMBus.
>>
>> The solution however needs to work on all PC-style systems, Intel or
>> AMD (or anything else that exists), with SMBus multiplexed or not.
>>
>> Originally, I2C_CLASS_SPD was there, the eeprom and jc42 drivers were
>> using it, and just loading these drivers would instantiate all the
>> devices. This is the level of user-friendliness we must aim at.
>>
>> Now, the eeprom driver is gone, so class-based SPD device support no
>> longer exists. This was replaced by i2c_register_spd(), but is
>> currently only working on non-multiplexed Intel-based systems. Ideally
>> this should be extended to non-Intel systems (I'm surprised nobody
>> reported about that regression yet) and Intel systems with multiplexed
>> SMBus (that would be achieved by calling i2c_register_spd explicitly on
>> these segments, possibly with a few changes, as discussed earlier).
>>
>> The jc42 driver still works the way it used to. If you remove
>> I2C_CLASS_SPD, this will still work on most non-SMBus-multiplexed
>> systems (thanks to I2C_CLASS_HWMON), but will stop working on the
>> multiplexed Asus boards (because the bus segments which host the memory
>> modules don't have I2C_CLASS_HWMON, and can't have it), or any other
>> board using SMbus multiplexing which we would like to support in the
>> future. I believe there are still many such systems out there, as
>> server systems with more than 8 memory slots are legions and this is
>> the hard limit of how many memory slots can be connected to a single
>> SMBus segment. We could receive a request to support such recent server
>> boards at any time, so we better be ready for it.
>>
>> This is the reason why I asked for jc42 devices to be instantiated
>> automatically on multiplexed SMBus segments. The function doing that
>> should however not live in the i2c-i801 driver, it must be usable by
>> any SMBus controller driver. Also, while we only need this for
>> multiplexed SMBus segments, we could still use it everywhere
>> i2c_register_spd() is used, so that jc42 devices get instantiated at
>> boot-time without the need for user-space support.
>>
>>> From a maintenance point of view the easiest solution would be:
>>> - set flag I2C_CLASS_DEPRECATED in addition to I2C_CLASS_SPD
>>>   to encourage potential users to switch to explicit instantiating
>>
>> Bad idea. That's just going to spam a warning message on millions of
>> systems while there's just nothing most users can do about it. That's
>> not helpful, we are already aware of the problem, and we are the guys
>> looking into it.
>>
> I'm afraid I wasn't precise enough when writing this. What I meant is
> adding I2C_CLASS_DEPRECATED for the mux'ed child segments in i801.
> So it should affect users of the few Asus systems only.
> i2c_register_spd() isn't used there, so I'd assume these users don't
> miss the temp sensors on their RAM modules.
> 
>>> - wait few kernel versions and remove class-based instantiation
>>
>> Assuming you only refer to I2C_CLASS_SPD and not I2C_CLASS_HWMON, then
>> yes. I2C_CLASS_HWMON must stay as there's no suitable replacement for
>> it yet (and sadly I can't foresee any).
>>
> Sure, I was referring to I2C_CLASS_SPD only. A lot of hwmon drivers
> support auto-detection, so getting rid of I2C_CLASS_HWMON would be
> much harder.
> 
>> I think the steps to follow are:
>> * Extend i2c_register_spd() to support up to 8 memory modules (I'm
>>   already working on that, patch is coming).
>> * Call i2c_register_spd() on the mux'd SMBus segments on the Asus
>>   boards.
>> * Extend i2c_register_spd() to also instantiate jc42 devices in
>>   addition to at24 (or ee1004) devices. I think this is better than
>>   writing a separate function as I initially suggested. The reason why
>>   I think so is because the SPD EEPROM does contain the information
>>   about thermal sensor presence. So the code which instantiates the at24
>>   or ee1004 device could also read from it to figure out whether a jc42
>>   device must be instantiated. This removes the need for probing.
> 
> I miss some insight here on which type of memory modules we can expect
> jc42-4 compatible temp sensors. I saw DDR3 mentioned (including LPDDR3?),
> not sure about DDR4. In case of DDR4 we would have to read the EE1004
> data structure to check the "temp sensor present" bit. So I wonder
> whether instantiating the temp sensor should be in ee1004 driver.
> 
ee1004 driver supports a single I2C bus only. So maybe we have to extend
this driver too?

>> * Get rid of I2C_CLASS_SPD.
>>
> 


