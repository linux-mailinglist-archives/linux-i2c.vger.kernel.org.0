Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E813245EDB0
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 13:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240621AbhKZMQ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 07:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343909AbhKZMO1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Nov 2021 07:14:27 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDBDC0619E7;
        Fri, 26 Nov 2021 03:39:50 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id j3so18056995wrp.1;
        Fri, 26 Nov 2021 03:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=iX+f1uyx++e1PfiAJEhjf8D0NbgE8L13VwCfPsLSyYo=;
        b=WCLOgLxotTeja9KA1RnyKis/UnR6TQkLZ/2BZxOfrTrvyRT9ZRgo9BxCiUvww68uBP
         tWWJP2H3pL07bC4xihSXPE1lbLTFVaQw1jYRbQ1tcqJpTTsjYhwF95bPNgoBBNmloLpU
         EN3gJCjSmJaw68EU38/Nr0AKEwuKiSmZNyJQ4bbua69fe2B6nqx7iPXhi9Drz+Ynn2bD
         amxNCPYVAtH1EyuWZC/sF+jNEfDt52kN1c4AUT0sW6Zxi5ArhfuN/X4GIcfqVkGZ8vFA
         VcY41RS/TnDcWu6UwAnlQ0hALhi5oWk2Rt4HCXFmzXdnN0jsXxy6aMb/xkwXs+OLdLDp
         q6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=iX+f1uyx++e1PfiAJEhjf8D0NbgE8L13VwCfPsLSyYo=;
        b=St072fT6bArGDjL5dJScsqIAekNdkemodlqa3oOIyzj+AShfG3zA9O2+zkCKec7bL5
         CtSJXV/GdNU+qZW7vuTwFTK2uSiUWk2HdB1wOlaO7mwR4d/bbMeLKfR9VMZk1iPmTCuX
         VN76xEubeHOJyQMGgfqsc3HjVsoBcTJLyUHfjMqcZBjrjDuSWoHrZ6SChd9N8VIrPlzS
         tH5MCqrVSkNXhkYkHowWeC4R1YoDJYlGskzlfZHITTbiN6tMTn/XRmLN0jVjyui83zgq
         VdABbEfsDZjEIkYutncrowCr2cBxCQrbv6WyIA2owZ75KaH6uAsMx+4AIvF0iANNWoJK
         01IA==
X-Gm-Message-State: AOAM531V/Tcjrx3DbekmpI3EIuC78yGnx60+uJwKUnmE63mmzwnwdi/c
        aWlF56Lwkra2PbVv/jtXqNk=
X-Google-Smtp-Source: ABdhPJxOgeATD1Kuhdekh2S7YAr3WPJwjYYaj8HDqyjiYg6iqM2bjIafeBzvf4Uv8iJmjw+37Ewisg==
X-Received: by 2002:adf:8b1e:: with SMTP id n30mr13387106wra.75.1637926788245;
        Fri, 26 Nov 2021 03:39:48 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id x21sm10135004wmc.14.2021.11.26.03.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 03:39:47 -0800 (PST)
Subject: Re: [PATCH v6 07/15] platform/x86: int3472: Enable I2c daisy chain
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20211125165412.535063-1-hdegoede@redhat.com>
 <20211125165412.535063-8-hdegoede@redhat.com>
 <YaAel9HuAvemRg2s@pendragon.ideasonboard.com>
 <03306e12-40ec-39ab-3b40-42b0395e1b65@redhat.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <4ab5efa7-65b0-009c-293a-d7a49776e78d@gmail.com>
Date:   Fri, 26 Nov 2021 11:39:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <03306e12-40ec-39ab-3b40-42b0395e1b65@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello

On 26/11/2021 11:30, Hans de Goede wrote:
> Hi,
>
> On 11/26/21 00:39, Laurent Pinchart wrote:
>> Hi Hans,
>>
>> Thank you for the patch.
>>
>> On Thu, Nov 25, 2021 at 05:54:04PM +0100, Hans de Goede wrote:
>>> From: Daniel Scally <djrscally@gmail.com>
>>>
>>> The TPS68470 PMIC has an I2C passthrough mode through which I2C traffic
>>> can be forwarded to a device connected to the PMIC as though it were
>>> connected directly to the system bus. Enable this mode when the chip
>>> is initialised.
>> Is there any drawback doing this unconditionally, if nothing is
>> connected to the bus on the other side (including no pull-ups) ?
> I actually never took a really close look at this patch, I just
> sorta inherited it from Daniel.
>
> Now that I have taken a close look, I see that it is setting the
> exact same bits as which get set when enabling the VSIO regulator.
>
> The idea here is that the I2C-passthrough only gets enabled when
> the VSIO regulator is turned on, because some sensors end up
> shorting the I2C pins to ground when the sensor is not powered.
>
> Since we set these bits when powering up the VSIO regulator
> and since we do that before trying to talk to the sensor
> I don't think that we need this (hack) anymore.
>
> I will give things a try without this change and if things
> still work I will drop this patch from the set.
>
> Daniel, what do you think?


Humm, we're only using the VSIO regulator with the VCM though right?
Which might not be on when the ov8865 tries to probe. I haven't tried
without this patch to be honest; I set it because that was what Windows
does when powering on the PMIC.

> Regards,
>
> Hans
>
>
>
>
>
>
>>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>> ---
>>>  .../x86/intel/int3472/intel_skl_int3472_tps68470.c         | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c b/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
>>> index c05b4cf502fe..42e688f4cad4 100644
>>> --- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
>>> +++ b/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
>>> @@ -45,6 +45,13 @@ static int tps68470_chip_init(struct device *dev, struct regmap *regmap)
>>>  		return ret;
>>>  	}
>>>  
>>> +	/* Enable I2C daisy chain */
>>> +	ret = regmap_write(regmap, TPS68470_REG_S_I2C_CTL, 0x03);
>>> +	if (ret) {
>>> +		dev_err(dev, "Failed to enable i2c daisy chain\n");
>>> +		return ret;
>>> +	}
>>> +
>>>  	dev_info(dev, "TPS68470 REVID: 0x%02x\n", version);
>>>  
>>>  	return 0;
