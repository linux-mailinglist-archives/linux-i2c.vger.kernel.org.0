Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF1F45EDDD
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 13:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237249AbhKZMb3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 07:31:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233765AbhKZM33 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Nov 2021 07:29:29 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C220C08C5DA;
        Fri, 26 Nov 2021 03:56:14 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id j3so18148910wrp.1;
        Fri, 26 Nov 2021 03:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=FjiDebeN0lftz9SIBVsy6WJxvM/l3Hn6Nmxtkdqni4Q=;
        b=qV59eAZvwVT28HDrcNzurtuW8qs60Idx7SSZRN9FdnyyNugUBTneHz/X8BbSom+Z1M
         FFMacGSf/yxmIocne/ESqk797izSzsl0zwq2x5T1LtE4DJnz1Reh0lJKpbLTeXWO0rj5
         9HBk0KmDA3+OnrTaG4/bfBNt/rfhnivxrjflJzSuvH/OKfqln4diqOEZl7uE1VcIhE+m
         GWaKb+CQxgLCkHCCEQpQdNoIDijAt2a0E8uM+fhYQLDvRfNEoXUGjXZzkTgcIw7T2Tp0
         FII8k3XvwMmffzfIZPlTJh4/eMfb+xXov9RUY7mNhj9BRbQjckh7AWLjwqPXf5M0w0I4
         tGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=FjiDebeN0lftz9SIBVsy6WJxvM/l3Hn6Nmxtkdqni4Q=;
        b=lCByU3f0B5ufhtD32kXeMylQfmSZAQBw4xJa3fXvULVCnZ38S1NlihoSyBE4I9dwoN
         T+vxvLAWuIWYa1P7EhcHgx1TNGVwNQWp7MKqhSeC7Y184OhfO63+QahBcdn2Y4BMMeI7
         sKKpY/yWYFH8epG76qysRIQWkMz390pw3+Ymjj6n5rLsqxcNrlBqw2sIzAQ7tb8+147R
         5dfMsRNHLmcLFQuCE6bDU5UxE3adBQ1y+f65GVcMp/4LP8Gcc0qPkx+lg8Hrwl8VRtBy
         +9TmbQeYzQ161jKIvmYO8Rtn358NoMio8GzAJpe607jHGJGumJGUNjsPO5/hmRbYoPXh
         ZsvQ==
X-Gm-Message-State: AOAM533bS5l1zGecK2RUs4F08r0p9ozTotsuUbSEhwUVfO/EFtoMd7Eo
        U2iXwGE9I86dMNg7tASp5qI=
X-Google-Smtp-Source: ABdhPJzfUgA3+l4rR+XNu5HeQbUXPQ1u3phKl+rWgA+uxctzFaji7KrNTSrX0cUbU77wZeGV2rlWOA==
X-Received: by 2002:adf:c10e:: with SMTP id r14mr13062187wre.558.1637927772579;
        Fri, 26 Nov 2021 03:56:12 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id p13sm10797690wmi.0.2021.11.26.03.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 03:56:12 -0800 (PST)
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
 <4ab5efa7-65b0-009c-293a-d7a49776e78d@gmail.com>
 <2fd5400e-e587-54d2-1071-ad8df49a8a68@redhat.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <ef123ea0-f51f-50e1-dbc2-c442a97722e4@gmail.com>
Date:   Fri, 26 Nov 2021 11:56:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2fd5400e-e587-54d2-1071-ad8df49a8a68@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 26/11/2021 11:45, Hans de Goede wrote:
> Hi,
>
> On 11/26/21 12:39, Daniel Scally wrote:
>> Hello
>>
>> On 26/11/2021 11:30, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 11/26/21 00:39, Laurent Pinchart wrote:
>>>> Hi Hans,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On Thu, Nov 25, 2021 at 05:54:04PM +0100, Hans de Goede wrote:
>>>>> From: Daniel Scally <djrscally@gmail.com>
>>>>>
>>>>> The TPS68470 PMIC has an I2C passthrough mode through which I2C traffic
>>>>> can be forwarded to a device connected to the PMIC as though it were
>>>>> connected directly to the system bus. Enable this mode when the chip
>>>>> is initialised.
>>>> Is there any drawback doing this unconditionally, if nothing is
>>>> connected to the bus on the other side (including no pull-ups) ?
>>> I actually never took a really close look at this patch, I just
>>> sorta inherited it from Daniel.
>>>
>>> Now that I have taken a close look, I see that it is setting the
>>> exact same bits as which get set when enabling the VSIO regulator.
>>>
>>> The idea here is that the I2C-passthrough only gets enabled when
>>> the VSIO regulator is turned on, because some sensors end up
>>> shorting the I2C pins to ground when the sensor is not powered.
>>>
>>> Since we set these bits when powering up the VSIO regulator
>>> and since we do that before trying to talk to the sensor
>>> I don't think that we need this (hack) anymore.
>>>
>>> I will give things a try without this change and if things
>>> still work I will drop this patch from the set.
>>>
>>> Daniel, what do you think?
>>
>> Humm, we're only using the VSIO regulator with the VCM though right?
> Nope, there is a mapping from VSIO to dovdd for the ov8865 in the
> board_data; and I'm pretty sure I copied that from your earlier
> attempts at getting regulator lookups registered :)

Oh yeah derp; I was looking at the supply names rather than the
regulator names, my bad!
> And even if the VSIO regulator was only used by the VCM, then it would
> get turned off after probing the VCM, clearing the 2 bits which this
> commit sets. Which would break things if we did not re-enable it when
> the ov8865 needs it.
>
>> Which might not be on when the ov8865 tries to probe. I haven't tried
>> without this patch to be honest; I set it because that was what Windows
>> does when powering on the PMIC.
> See above, I'm pretty sure we can do without this patch which means
> that the INT3472 code will no longer be poking at the PMIC directly
> itself, which is good :)


Yeah, in that case I think you're right and this can be dropped.

> Anyways I'll give this a try sometime next week and then drop the
> patch.


Sounds good

>
> Regards,
>
> Hans
>
>
>
>
>>>>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>>>> ---
>>>>>  .../x86/intel/int3472/intel_skl_int3472_tps68470.c         | 7 +++++++
>>>>>  1 file changed, 7 insertions(+)
>>>>>
>>>>> diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c b/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
>>>>> index c05b4cf502fe..42e688f4cad4 100644
>>>>> --- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
>>>>> +++ b/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
>>>>> @@ -45,6 +45,13 @@ static int tps68470_chip_init(struct device *dev, struct regmap *regmap)
>>>>>  		return ret;
>>>>>  	}
>>>>>  
>>>>> +	/* Enable I2C daisy chain */
>>>>> +	ret = regmap_write(regmap, TPS68470_REG_S_I2C_CTL, 0x03);
>>>>> +	if (ret) {
>>>>> +		dev_err(dev, "Failed to enable i2c daisy chain\n");
>>>>> +		return ret;
>>>>> +	}
>>>>> +
>>>>>  	dev_info(dev, "TPS68470 REVID: 0x%02x\n", version);
>>>>>  
>>>>>  	return 0;
