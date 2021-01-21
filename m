Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28BCE2FDE61
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Jan 2021 02:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731356AbhAUBBl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Jan 2021 20:01:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387891AbhAUATD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Jan 2021 19:19:03 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A70C061575;
        Wed, 20 Jan 2021 16:18:23 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id a9so89527wrt.5;
        Wed, 20 Jan 2021 16:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SJHTWN+UmjC7kDG+OZAjjp9XFjtpJ9pb9RuUrSerpQQ=;
        b=Mk+hwGJ9H7bmk5yqm0nlMaWGnQhulvWhkPgdnaPlE4wodtsIVDDIG2qZBaQNxw9duh
         ruX3zme5H3I1ytRQDECrzRNtbh+BMH3IMfifNgzXk4ec+VZrb54RTAVpkoCziHJtwfKW
         M/4X6mCkEIAOWzHpDf/xtyBxtFTvyVJEpmSSBTItdrp+hJLgZEAax7Yvuow3aKM+ryiB
         Rix9sqJeYpUGM59ZT4BODRKnen0NbFYELWC0Uk9oAA0OmJj0eCDoNsUVp58otM/MsARd
         1++v9ScCxsnahwcTX+7ZkjLUS9sHU3aGUtYJFAYinNMcp2LJj5LPRUngeJ23H/mimew/
         jP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SJHTWN+UmjC7kDG+OZAjjp9XFjtpJ9pb9RuUrSerpQQ=;
        b=SBe+IMGGN53SxGcj+rI3wCwRzltn6ra1QD1WtgtRxnTcRCcQ6/b8G6Y65Pi8LfRogU
         f9Xu7XZGHFzYt1y57PvVpEIcIgXehvPVS1vfPSQYWzFNGehEb0HtcA9esRNbLXAYEJAm
         ykFrgRHY2KUDvBsQVLlrZ5F9kg8c6A/WgIA7+D+7fGvpX11ZsdRXCghV9oPJA8vxbsRl
         3OWfOMSkDPOWifXCriAmJzkYMHtnI60h1u1f1d32Q+8IOQ3fjmu2FDG6xMWu6pvu0/ZC
         lhvdwZcXxHOo+Y/7KcjaIP8psU1Mb6zCJkZE/F0KeV/G/HVQRB16DOIQb3vZI9ylHVGE
         n4Mw==
X-Gm-Message-State: AOAM533T3f05IglnUu7RDScRLbVWKlYC2QFhwLVYA1/4cQiRyAWUMVFt
        MPeY/Ye5WHBWQBkfQij1KuQ=
X-Google-Smtp-Source: ABdhPJyUObPtdQW1KbIbHfTZAVKWBK+OIGCy9M/FxdP5HjG5B3AeywJLyymiA4e1/loXzZtSzo1Udg==
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr11649462wrv.132.1611188301978;
        Wed, 20 Jan 2021 16:18:21 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id q16sm29388057wme.1.2021.01.20.16.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jan 2021 16:18:21 -0800 (PST)
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
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
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <e8f697c9-821e-1d15-9e57-cda71626cbb9@gmail.com>
Date:   Thu, 21 Jan 2021 00:18:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YAgo06hhlael1/rm@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20/01/2021 12:57, Andy Shevchenko wrote:
> On Wed, Jan 20, 2021 at 06:21:41AM +0200, Laurent Pinchart wrote:
>> On Tue, Jan 19, 2021 at 07:51:14PM +0200, Andy Shevchenko wrote:
>>> On Tue, Jan 19, 2021 at 06:48:15PM +0200, Laurent Pinchart wrote:
>>>> On Tue, Jan 19, 2021 at 01:08:37PM +0200, Andy Shevchenko wrote:
>>>>> On Tue, Jan 19, 2021 at 10:40:42AM +0000, Daniel Scally wrote:
>>>>>> On 19/01/2021 09:24, Andy Shevchenko wrote:
>>>>>>>>>>> +static struct i2c_driver int3472_tps68470 = {
>>>>>>>>>>> +	.driver = {
>>>>>>>>>>> +		.name = "int3472-tps68470",
>>>>>>>>>>> +		.acpi_match_table = int3472_device_id,
>>>>>>>>>>> +	},
>>>>>>>>>>> +	.probe_new = skl_int3472_tps68470_probe,
>>>>>>>>>>> +};
>>>>>>>>> I'm not sure we want to have like this. If I'm not mistaken the I²C driver can
>>>>>>>>> be separated without ACPI IDs (just having I²C IDs) and you may instantiate it
>>>>>>>>> via i2c_new_client_device() or i2c_acpi_new_device() whichever suits better...
>>>>>>>> Sorry, I'm a bit confused by this. The i2c device is already
>>>>>>>> present...we just want the driver to bind to them, so what role do those
>>>>>>>> functions have there?
>>>>>>> What I meant is something like
>>>>>>>
>>>>>>>  *_i2c.c
>>>>>>> 	real I²C driver for the TPS chip, but solely with I²C ID table, no ACPI
>>>>>>> 	involved (and it sounds like it should be mfd/tps one, in which you
>>>>>>> 	just cut out ACPI IDs and convert to pure I²C one, that what I had
>>>>>>> 	suggested in the first place)
>>>>>>
>>>>>> Ahh; sorry - i misunderstood what you meant there. I understand now I
>>>>>> think, but there is one complication; the ACPI subsystem already creates
>>>>>> a client for that i2c adapter and address; i2c_new_client_device()
>>>>>> includes a check to see whether that adapter / address combination has
>>>>>> an i2c device already.  So we would have to have the platform driver
>>>>>> with ACPI ID first find the existing i2c_client and unregister it before
>>>>>> registering the new one...the existing clients have a name matching the
>>>>>> ACPI device instance name (e.g i2c-INT3472:00) which we can't use as an
>>>>>> i2c_device_id of course.
>>>>>
>>>>> See how INT33FE is being handled. Hint: drivers/acpi/scan.c:~1600
>>>>>
>>>>> static const struct acpi_device_id i2c_multi_instantiate_ids[] = {
>>>>> 	{"BSG1160", },
>>>>> 	{"BSG2150", },
>>>>> 	{"INT33FE", },
>>>>> 	{"INT3515", },
>>>>> 	{}
>>>>> };
>>>>>
>>>>> So, we quirklist it here and instantiate manually from platform driver (new
>>>>> coming one).
>>>>
>>>> This is documented as used for devices that have multiple I2cSerialBus
>>>> resources. That's not the case for the INT3472 as far as I can tell. I
>>>> don't think we should abuse this mechanism.
>>>
>>> This is quite a similar case to that one. Let's avoid yak shaving, right?
>>
>> Exactly my point, that's why I think this patch is good overall, I don't
>> think it requires a complete rewrite.
> 
> The approach in the series is to reinvent the MFD driver which I against of.
> I don;t think we need to kill it there and reborn in a new form and dragging
> code from there to here to there.
> 
> On top of that the approach with a quirk driver in the middle seems to me
> cleaner than using different paths how the two drivers are being initialized.
> In the proposed approach there will be one making decision point and easy to
> understand what's going on.
> 
> The bad example of two making decision points is acpi_lpss.c vs. individual
> drivers (however in that case it have different ID's, i.e. ACPI vs. PCI),


Right; so if I understand correctly, the proposal is:

1. Add INT3472 to the i2c_multi_instantiate_ids, which blocks it getting
created as an i2c device
2. instead of intel-skl-int3472 registering an i2c and a platform
driver, just register a platform driver that binds to the INT3472
acpi_device_id. We can check hardware type like in
intel_cht_int33fe_common.c and call either discrete probe that does what
the discrete driver is doing now, or else call tps68470 which is just a
stub driver registering an i2c device like intel_cht_int33fe_microb.c
3. Change the existing tps68470 mfd driver to match to that created i2c
device instead of ACPI match, and move the code from
intel_skl_int3472_tps68470.c to that driver instead

I think I finally got what you meant there, Andy, but correct me if I'm
wrong please.

I'm not sure that one's better than the other, to be honest. Either the
multi-function device functionality lives in the conventional place, or
else _all_ of the int3472 handling code lives together in one module.


>>>> Don't forget that the TPS68470 I2C driver needs to be ACPI-aware, as it
>>>> has to register an OpRegion for ACPI-based Chrome OS devices. On other
>>>> platforms (including DT platforms), it should only register regulators,
>>>> clocks and GPIOs. Given the differences between those platforms, I don't
>>>> think a TPS68470 driver that would fake being unaware of being probed
>>>> through ACPI would be a good idea. We can always refactor the code later
>>>> when we'll have a non-ACPI based platform using the TPS68470, without
>>>> such a platform there's no way we can test the I2C driver without ACPI
>>>> anyway.
>>>
>>> Are you agree that MFD approach should stay? How then we can manage to have an
>>> MFD driver cohabit with our new driver? I proposed a clean solution which will
>>> handle all possible cases via quirk driver. Having two drivers enumerated by
>>> different scenarios is a call for troubles (we have already with one of that
>>> sensors).

What kind of troubles do you anticipate here?

>> I think we should solve this problem when it will arise. Solving
>> problems with complex architectures without a platform to test the code
>> on is a pretty sure way to get the architecture design wrong. Let's get
>> this merged, it's an improvement compared to the current situation, and
>> then let's improve it further on top when we'll need to support more use
>> cases.
> 
> But this is problem already here right now. The submitted code is to support
> a new platform that needs a quirk and treats INT3472 differently. The usual
> way is to refactor the existing solution to make them both to have a best
> compromise.
> 
>>> And there is no "faking" anything, it's rather gating it depending on the
>>> platform.
> 

