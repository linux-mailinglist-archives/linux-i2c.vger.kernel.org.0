Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA4DF2CA325
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 13:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390596AbgLAMtN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 07:49:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390585AbgLAMtM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 07:49:12 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21895C0613CF;
        Tue,  1 Dec 2020 04:48:32 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id e7so2442066wrv.6;
        Tue, 01 Dec 2020 04:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=E7KISZiUZx5OJ0OBhs8wlh6COiaDQH/ZVHVCHKyzjEk=;
        b=etC6JcuALdpc+RtrgJomZYX0mIy+qG2liKm9JXAo5RZJQwGx+6CEc8UmOX+O6ibWAH
         tvjkpDIkIWSCqbCFhtngBD3D4/6vnpbG0harZSRjm0XHN95o81Znfzj/07+K3e+/ZgcT
         r/yvfgVUsTyGuDCxzQLfceO8tfRsNggB9Hq4DEdWc4w2M2xoGmmLUQNz7z53ahQ4dM/Z
         Hap0ZGGVlKXLOD2KI3j8HmRH1WIqLozKjrE9cBOJsOQo2MZslGwaoYX2aU3AEVW3g6Az
         HgJbzV2HAsEthdwW0XHXPhurtpFenVdU8qoaVVTwVx9YJWPQihsji1jZSM5KnHJTv1Hr
         suVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=E7KISZiUZx5OJ0OBhs8wlh6COiaDQH/ZVHVCHKyzjEk=;
        b=WmmA9GJ+vfvVFXeuLwd6fuJ8fsrQdu0zsqRv+BPBXFOTdkCqP5JbzeyilCchwpYsvk
         Pw3PMhfvgCJagmGXfrl4CCMGzEX4oprSjHr4p480xWZNkJeBygLYwrKBUGVDMujyEEXs
         ht4BxItmHRIPaf8MjrSc/7BtojZgHvDVsuSSiDjipYeBSaqmelWTLfToZiJsoAOuTuvJ
         jlTCQObbPTgBmU55+xKdIa/WIzLUmCXMvZdrOiFCX6z1AscE6TKqdOnQ/hxSsZI3Ha+M
         Qus4+4BQ3cug+sZIFybtSDpjZnD8jc5ydPGRb2sEI1QHNwaBRvIHJ7L7JUAArg7YIHik
         cQAA==
X-Gm-Message-State: AOAM530g+defYqbuTb2smPZvp+iqvvwB/vpTWbSQ0kdfNeX3LZFzJOMV
        Z/FZOUI+Y6wtJajQLvng2nY=
X-Google-Smtp-Source: ABdhPJygrmmsdIFW8rKXVfMkLtQWY8gptVJpqzq0f98XrHiiDQPIDru+U45QZZ5AVf8FFNLLIWC8tg==
X-Received: by 2002:adf:f3c7:: with SMTP id g7mr3624806wrp.91.1606826910838;
        Tue, 01 Dec 2020 04:48:30 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id w21sm2624343wmi.29.2020.12.01.04.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 04:48:30 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130205203.GQ4351@valkosipuli.retiisi.org.uk>
 <3e8494a0-a2c0-59e7-46bb-9635c3c239dd@gmail.com>
 <20201201064421.GR4351@valkosipuli.retiisi.org.uk>
 <2a548835-78c6-8fe3-cceb-1fc000707157@gmail.com>
 <20201201123244.GT4351@valkosipuli.retiisi.org.uk>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <0f85d875-cac2-8273-d687-e5845f4c2bb8@gmail.com>
Date:   Tue, 1 Dec 2020 12:48:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201123244.GT4351@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 01/12/2020 12:32, Sakari Ailus wrote:
> Hi Dan,
>
> On Tue, Dec 01, 2020 at 08:08:26AM +0000, Dan Scally wrote:
>> On 01/12/2020 06:44, Sakari Ailus wrote:
>>> Hi Dan,
>>>
>>> On Mon, Nov 30, 2020 at 11:06:03PM +0000, Dan Scally wrote:
>>>> Hi Sakari
>>>>
>>>> On 30/11/2020 20:52, Sakari Ailus wrote:
>>>>>> +static const struct acpi_device_id int3472_device_id[] = {
>>>>>> +	{ "INT3472", 0 },
>>>>> The INT3472 _HID is really allocated for the tps68470 PMIC chip. It may not
>>>>> be used by other drivers; people will want to build kernels where both of
>>>>> these ACPI table layouts are functional.
>>>>>
>>>>> Instead, I propose, that you add this as an option to the tps68470 driver
>>>>> that figures out whether the ACPI device for the tps68470 device actually
>>>>> describes something else, in a similar fashion you do with the cio2-bridge
>>>>> driver. I think it may need a separate Kconfig option albeit this and
>>>>> cio2-bridge cannot be used separately.
>>>> It actually occurs to me that that may not work (I know I called that
>>>> out as an option we considered, but that was a while ago actually). The
>>>> reason I wasn't worried about the existing tps68470 driver binding to
>>>> these devices is that it's an i2c driver, and these dummy devices don't
>>>> have an I2cSerialBusV2, so no I2C device is created by them the kernel.
>>>>
>>>>
>>>> Won't that mean the tps68470 driver won't ever be probed for these devices?
>>> Oops. I missed this indeed was not an I²C driver. So please ignore the
>>> comment.
>>>
>>> So I guess this wouldn't be an actual problem. I'd still like to test this
>>> on a system with tps68470, as the rest of the set.
>> On my Go2, it .probes() for the actual tps68740 (that machine has both
>> types of INT3472 device) but fails with EINVAL when it can't find the
>> CLDB buffer that these discrete type devices have. My understanding is
>> that means it's free for the actual tps68470 driver to grab the device;
>> although that's not happening because I had to blacklist that driver or
>> it stops the machine from booting at the moment - haven't gotten round
>> to investigating yet.
> Oh, then the problem is actually there. If it probes the tps68470 driver on
> the systems with Windows ACPI tables, then it should be that driver which
> works with the Windows ACPI tables, too.
Sorry, clarification here: The INT3472 driver in patch #18 runs probe()
for the device representing a physical tps68470, but then -EINVAL's. The
existing tps68470 mfd driver doesn't probe() for the dummy INT3472 device.
