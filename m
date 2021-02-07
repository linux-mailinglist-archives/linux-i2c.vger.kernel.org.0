Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00543123B8
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Feb 2021 12:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhBGLBf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Feb 2021 06:01:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhBGLBb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Feb 2021 06:01:31 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF24DC06174A;
        Sun,  7 Feb 2021 03:00:50 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id 7so13631180wrz.0;
        Sun, 07 Feb 2021 03:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=SQBQLnbtdDlyVZxDVGrHUxgDUBiSM8FT2WujY5MPTrI=;
        b=MXJxaOmA1xXAQKTbUCC3iVQBhqHo7HtYn8DeMAaI3jBYsAcRYFLIqbXKAn5OYnGeLT
         7QQYmJzLyJrwaZNdiQnUygcDCf7TFiF1MRBqdnowJDhBeHiH8tEiH+w4/FV+OfYPbhgt
         CH7b9lzpisuw7HVS4R6/rsXHcdCyzl9QTwwzD8dQFPY4HH6Vsn7DXsQKjPjFZiXe3v/d
         30aX5bIf/Q+a9TVidt9LKQ74fyN9d79EvlvA2Ftwj9na1M2mkXuacPCIgrLknhZQqN5K
         ZingH94p6Q47A2u75iPKt7FHt4UNkTvqpy78AsC2esO+BDfgejL+rQ6Ufv8F7b//v5QV
         vvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=SQBQLnbtdDlyVZxDVGrHUxgDUBiSM8FT2WujY5MPTrI=;
        b=beAhH9SZt9EYHIpwckh5aDPR/Etc3o4W/mbXMhtIMVERA318ziYN2uSmvER2U3p+LO
         EtcQj3Es4K23kXPk79rjohIK5WX8yN9iH3sSVN1cVsmcNolBfBP/5M5gPMwqTP6mwS2L
         xSBRhr+FWxfirBxywIjAJ4JibktSLwFHPIlmNR26+ARZVd/f2j4zyJorrRCV2pItJQDX
         MoMNqKOnPsZrTLcgY8FRwR7zWKaLJ1qb7vnEsgY6twNEb8d6htW0ey0iLUlR+OLrU9Fe
         e5hI7TEPvH43i9ZJgiH7j2t3Ydw1VvhG1Pbo3S8m14NRW7ZV0hOyLgvun0caidE/8xwd
         Et+Q==
X-Gm-Message-State: AOAM5313lW+qKhbksiuhVoDhHEp54jGQFxfuho2JHaKtW3OgKz/rnAlK
        x6Yjudqn1c/BGeIKS1qQzx0=
X-Google-Smtp-Source: ABdhPJxMdyjx7URHlSSEzEdYBuEsPacQCtsiUF273hb+1hWogMm6ae5QCN1sykkJymF9nrYdC8HrKQ==
X-Received: by 2002:a5d:69ce:: with SMTP id s14mr14068204wrw.206.1612695647784;
        Sun, 07 Feb 2021 03:00:47 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id e12sm22565166wrs.67.2021.02.07.03.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Feb 2021 03:00:46 -0800 (PST)
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
From:   Daniel Scally <djrscally@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, kieran.bingham@ideasonboard.com
References: <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <20210119092448.GN4077@smile.fi.intel.com>
 <a735380b-57ac-1950-b29a-07fe6cb708d2@gmail.com>
 <20210119110837.GT4077@smile.fi.intel.com>
 <YAcNT1d5zQHGsoe6@pendragon.ideasonboard.com>
 <YAccEtQIBrbKPSmv@smile.fi.intel.com>
 <YAev1YviLVfEHSg6@pendragon.ideasonboard.com>
 <YAgo06hhlael1/rm@smile.fi.intel.com>
 <e8f697c9-821e-1d15-9e57-cda71626cbb9@gmail.com>
Message-ID: <2f85ec6d-b47e-6d86-02bc-5563cff7576d@gmail.com>
Date:   Sun, 7 Feb 2021 11:00:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e8f697c9-821e-1d15-9e57-cda71626cbb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Andy, Laurent

On 21/01/2021 00:18, Daniel Scally wrote:
> On 20/01/2021 12:57, Andy Shevchenko wrote:
>> On Wed, Jan 20, 2021 at 06:21:41AM +0200, Laurent Pinchart wrote:
>>> On Tue, Jan 19, 2021 at 07:51:14PM +0200, Andy Shevchenko wrote:
>>>> On Tue, Jan 19, 2021 at 06:48:15PM +0200, Laurent Pinchart wrote:
>>>>> On Tue, Jan 19, 2021 at 01:08:37PM +0200, Andy Shevchenko wrote:
>>>>>> On Tue, Jan 19, 2021 at 10:40:42AM +0000, Daniel Scally wrote:
>>>>>>> On 19/01/2021 09:24, Andy Shevchenko wrote:
>>>>>>>>>>>> +static struct i2c_driver int3472_tps68470 = {
>>>>>>>>>>>> +	.driver = {
>>>>>>>>>>>> +		.name = "int3472-tps68470",
>>>>>>>>>>>> +		.acpi_match_table = int3472_device_id,
>>>>>>>>>>>> +	},
>>>>>>>>>>>> +	.probe_new = skl_int3472_tps68470_probe,
>>>>>>>>>>>> +};
>>>>>>>>>> I'm not sure we want to have like this. If I'm not mistaken the I²C driver can
>>>>>>>>>> be separated without ACPI IDs (just having I²C IDs) and you may instantiate it
>>>>>>>>>> via i2c_new_client_device() or i2c_acpi_new_device() whichever suits better...
>>>>>>>>> Sorry, I'm a bit confused by this. The i2c device is already
>>>>>>>>> present...we just want the driver to bind to them, so what role do those
>>>>>>>>> functions have there?
>>>>>>>> What I meant is something like
>>>>>>>>
>>>>>>>>  *_i2c.c
>>>>>>>> 	real I²C driver for the TPS chip, but solely with I²C ID table, no ACPI
>>>>>>>> 	involved (and it sounds like it should be mfd/tps one, in which you
>>>>>>>> 	just cut out ACPI IDs and convert to pure I²C one, that what I had
>>>>>>>> 	suggested in the first place)
>>>>>>> Ahh; sorry - i misunderstood what you meant there. I understand now I
>>>>>>> think, but there is one complication; the ACPI subsystem already creates
>>>>>>> a client for that i2c adapter and address; i2c_new_client_device()
>>>>>>> includes a check to see whether that adapter / address combination has
>>>>>>> an i2c device already.  So we would have to have the platform driver
>>>>>>> with ACPI ID first find the existing i2c_client and unregister it before
>>>>>>> registering the new one...the existing clients have a name matching the
>>>>>>> ACPI device instance name (e.g i2c-INT3472:00) which we can't use as an
>>>>>>> i2c_device_id of course.
>>>>>> See how INT33FE is being handled. Hint: drivers/acpi/scan.c:~1600
>>>>>>
>>>>>> static const struct acpi_device_id i2c_multi_instantiate_ids[] = {
>>>>>> 	{"BSG1160", },
>>>>>> 	{"BSG2150", },
>>>>>> 	{"INT33FE", },
>>>>>> 	{"INT3515", },
>>>>>> 	{}
>>>>>> };
>>>>>>
>>>>>> So, we quirklist it here and instantiate manually from platform driver (new
>>>>>> coming one).
>>>>> This is documented as used for devices that have multiple I2cSerialBus
>>>>> resources. That's not the case for the INT3472 as far as I can tell. I
>>>>> don't think we should abuse this mechanism.
>>>> This is quite a similar case to that one. Let's avoid yak shaving, right?
>>> Exactly my point, that's why I think this patch is good overall, I don't
>>> think it requires a complete rewrite.
>> The approach in the series is to reinvent the MFD driver which I against of.
>> I don;t think we need to kill it there and reborn in a new form and dragging
>> code from there to here to there.
>>
>> On top of that the approach with a quirk driver in the middle seems to me
>> cleaner than using different paths how the two drivers are being initialized.
>> In the proposed approach there will be one making decision point and easy to
>> understand what's going on.
>>
>> The bad example of two making decision points is acpi_lpss.c vs. individual
>> drivers (however in that case it have different ID's, i.e. ACPI vs. PCI),
>
> Right; so if I understand correctly, the proposal is:
>
> 1. Add INT3472 to the i2c_multi_instantiate_ids, which blocks it getting
> created as an i2c device
> 2. instead of intel-skl-int3472 registering an i2c and a platform
> driver, just register a platform driver that binds to the INT3472
> acpi_device_id. We can check hardware type like in
> intel_cht_int33fe_common.c and call either discrete probe that does what
> the discrete driver is doing now, or else call tps68470 which is just a
> stub driver registering an i2c device like intel_cht_int33fe_microb.c
> 3. Change the existing tps68470 mfd driver to match to that created i2c
> device instead of ACPI match, and move the code from
> intel_skl_int3472_tps68470.c to that driver instead
>
> I think I finally got what you meant there, Andy, but correct me if I'm
> wrong please.
>
> I'm not sure that one's better than the other, to be honest. Either the
> multi-function device functionality lives in the conventional place, or
> else _all_ of the int3472 handling code lives together in one module.
Can we come to a consensus on this? I would rather be in agreement than
leave it hanging...I do see the argument that it's better not to rebirth
the MFD driver away from that subsystem, but at the moment I lean
towards the view that having all the code handling this particular _HID
in one place is probably preferable, if only to make it easier for
anyone coming in the future to understand what's happening. That said;
I'm not particularly precious about it, I'd just like to agree an
approach so I can move forward with the next version
>>>>> Don't forget that the TPS68470 I2C driver needs to be ACPI-aware, as it
>>>>> has to register an OpRegion for ACPI-based Chrome OS devices. On other
>>>>> platforms (including DT platforms), it should only register regulators,
>>>>> clocks and GPIOs. Given the differences between those platforms, I don't
>>>>> think a TPS68470 driver that would fake being unaware of being probed
>>>>> through ACPI would be a good idea. We can always refactor the code later
>>>>> when we'll have a non-ACPI based platform using the TPS68470, without
>>>>> such a platform there's no way we can test the I2C driver without ACPI
>>>>> anyway.
>>>> Are you agree that MFD approach should stay? How then we can manage to have an
>>>> MFD driver cohabit with our new driver? I proposed a clean solution which will
>>>> handle all possible cases via quirk driver. Having two drivers enumerated by
>>>> different scenarios is a call for troubles (we have already with one of that
>>>> sensors).
> What kind of troubles do you anticipate here?
>
>>> I think we should solve this problem when it will arise. Solving
>>> problems with complex architectures without a platform to test the code
>>> on is a pretty sure way to get the architecture design wrong. Let's get
>>> this merged, it's an improvement compared to the current situation, and
>>> then let's improve it further on top when we'll need to support more use
>>> cases.
>> But this is problem already here right now. The submitted code is to support
>> a new platform that needs a quirk and treats INT3472 differently. The usual
>> way is to refactor the existing solution to make them both to have a best
>> compromise.
>>
>>>> And there is no "faking" anything, it's rather gating it depending on the
>>>> platform.
