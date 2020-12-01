Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2BA62C997A
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 09:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgLAIar (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 03:30:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgLAIaq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 03:30:46 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A739C0613D2;
        Tue,  1 Dec 2020 00:30:06 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id g14so1247481wrm.13;
        Tue, 01 Dec 2020 00:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qtpj3egnra4ZZU0TbrQ37tPgpaj2+cZFkHeijdXKAeU=;
        b=EAzNKiGomjSnaNRmQ65TXQJAGUW8QqGwPjt6wFsO0Qd9ALHq64aE9M9Q06SJDFYCZN
         2xKGYA4PBz4w5xVVbGXJD4la7OlzI/bm/uM3OBu2qdVurzLWmFsEZC9DbOs43l4wHywc
         0hv3ki3RFljr7/b4uZNiZQNbvE+/k8jrf9g2//vFM2CPjSEEfJkUoy7e9XTnbv47z7Wx
         t/pqs2wHCB6dn8uXl/qXG91+Ie0HfnLbf127HRFvWF797gsAR8YgoY8KgRN8UTheCoAU
         BzUvLkz+psit8bx+K8XzR3nAsftunc8xsGvD7cS8BHRL2j2q90uoVmye4b+ekEk0yON3
         NDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qtpj3egnra4ZZU0TbrQ37tPgpaj2+cZFkHeijdXKAeU=;
        b=GRszugA5FQxrPh5NTmmlE6Pl6Fk+ASaNZr+B/eO70xeYI2P33TpeSB94i9J6RQr7ze
         Derx1FpYX1YO5mz+7oxYtjl3Aiiy3vJ6Tt4fqXEytfO/gvFp8OjROXq1VG1ZmXH0So4A
         kRqJCSXsX2GNzZST99edujS4cHyWw893IWg1zkhkF1A+LRJfrMMmYmnW/lvY7VAUsMuw
         tbeRpBwsKqKfpAE/QV9tYvsEl7bco5axLHBKi/lcB+vrlBIOa6JPvin3RRDQ0bv4naCC
         A3KGsnsypfzCZGYHAIXQePfNiGd4zLZFvDyefYITptClViHuze1wcjigKxR2TzeiNX8o
         lbhA==
X-Gm-Message-State: AOAM531FJhhEELEH68rra2cdSRfw/9C12CTu0FpE1/5/ILweWj7RihKn
        YykBhnJkoDgJy1uNYmRwxTA=
X-Google-Smtp-Source: ABdhPJxJgYy4Io1mLJkX6yDdyPc1KYLKHfKDWCE7bFpWi95tnPIxoZq+nai2Np1R7ubMk+nwerPivA==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr2245958wru.422.1606811405199;
        Tue, 01 Dec 2020 00:30:05 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id a14sm1613839wmj.40.2020.12.01.00.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 00:30:04 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <8a1b0f5b-1289-256b-b25d-cf8af43bdc84@gmail.com>
Date:   Tue, 1 Dec 2020 08:30:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130200719.GB4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy, thanks for comments

On 30/11/2020 20:07, Andy Shevchenko wrote:
>> We know that at least some of those pins have to be toggled active for the
>> sensor devices to be available in i2c, so the conclusion we came to was
>> that those GPIO entries assigned to the INT3472 device actually represent
>> GPIOs and regulators to be consumed by the sensors themselves. Tsuchiya
>> noticed that the lowest byte in the return values of the _DSM method
>> seemed to represent the type or function of the GPIO line, and we
>> confirmed that by testing on each surface device that GPIO lines where the
>> low byte in the _DSM entry for that pin was 0x0d controlled the privacy
>> LED of the cameras.
>>
>> We're guessing as to the exact meaning of the function byte, but I
>> conclude they're something like this:
>>
>> 0x00 - probably a reset GPIO
>> 0x01 - regulator for the sensor
>> 0x0c - regulator for the sensor
>> 0x0b - regulator again, but for a VCM or EEPROM
>> 0x0d - privacy led (only one we're totally confident of since we can see
>>        it happen!)
> It's solely Windows driver design...
> Luckily I found some information and can clarify above table:
>
> 0x00 Reset
> 0x01 Power down
> 0x0b Power enable
> 0x0c Clock enable
> 0x0d LED (active high)
>
> The above text perhaps should go somewhere under Documentation.

Ah! That's really useful, thank you. We can handle the clock the same
way as regulators are being handled now, so that's no problem. And
likewise 0x01 for power down can just be mapped to the Sensor device
along with the reset pin and led pins. "Power enable" sounds like a
regulator indeed...it's not present on many (most) of our sensors
actually but that's not a problem for them of course as they'll just be
driven by the dummy regulators.


Thanks for the info


>
> ...
>
>> +	table_entry = (struct gpiod_lookup)GPIO_LOOKUP_IDX(acpi_dev_name(adev),
>> +							   ares->data.gpio.pin_table[0],
>> +							   func, 0, GPIO_ACTIVE_HIGH);
> You won't need this if you have regular INT3472 platform driver.
> Simple call there _DSM to map resources to the type and use devm_gpiod_get on
> consumer behalf. Thus, previous patch is not needed.
But the resources need to be available to the sensor devices; they're
basically in the wrong place. They should be in _CRS of the sensor,
rather than INT3472, so we need to map them across.
> ...
>
>> +static struct regulator_consumer_supply miix_510_ov2680[] = {
>> +	{ "i2c-OVTI2680:00", "avdd" },
>> +	{ "i2c-OVTI2680:00", "dovdd" },
>> +};
> Can we use acpi_dev_first_match_dev() to get instance name out of their HIDs?
We need the full i2c device name, which afaik isn't available from the
acpi_device
>> +static struct int3472_sensor_regulator_map int3472_sensor_regulator_maps[] = {
>> +	{ "GNDF140809R", 2, miix_510_ov2680 },
>> +	{ "YHCU", 2, surface_go2_ov5693 },
>> +	{ "MSHW0070", 2, surface_book_ov5693 },
>> +};
> Hmm... Usual way is to use DMI for that. I'm not sure above will not give us
> false positive matches.
I considered DMI too, no problem to switch to that if it's a better choice.
