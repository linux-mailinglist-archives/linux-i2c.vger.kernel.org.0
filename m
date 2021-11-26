Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B149445ECEC
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 12:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347219AbhKZLvR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 06:51:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41453 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345338AbhKZLtQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Nov 2021 06:49:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637927163;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c1ya2zAC+GLUoT5O0PKB3gUVIZyk51duRXmMGKOgUc4=;
        b=UWEUWbfolEyBTP5kP/4FHgZktfqhwzZUH3emD8oALL2xAH7OHW8MHxUmrYS9xMk/P1meK8
        /6NxtyJrVRuimFJjq4hC9f5fWZuJS/RWjv7cIeNAnjXuhrd30l1J9CBIf9mtPfO8iRSY8K
        hLVkio6dUvFFouvqqfMZR03CleIWCv0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-1fHcdL-OMKav_BhVOaRCMA-1; Fri, 26 Nov 2021 06:46:02 -0500
X-MC-Unique: 1fHcdL-OMKav_BhVOaRCMA-1
Received: by mail-ed1-f71.google.com with SMTP id bx28-20020a0564020b5c00b003e7c42443dbso7806165edb.15
        for <linux-i2c@vger.kernel.org>; Fri, 26 Nov 2021 03:46:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c1ya2zAC+GLUoT5O0PKB3gUVIZyk51duRXmMGKOgUc4=;
        b=DDK9Ph0wJzYAjDyI6/B7ShuFpSNfzVQ5Id6SdSyoRLpzN7g1i7zXLyou+pLrMUduvh
         lTCUfQPjpsIa8auSPm7TeuKkCd/aal2MO4h1+2oIr7lmjhBFufuWUf19UK3w7rRJ8VoB
         oUg+6OrkWghBa/fl24to37OaEK+kI77hLtQ98JZXteGj3vpMvigqNoQUqYbaMDIO+7/C
         JZLx82aiRUSQUNB2tgim8l37CkZXu7hphr+MA51imOUqo2NTxHBQ/XADErtcE8wQpiBX
         x1F0QLlwq70JQpC3SBtkz31VrSPthipeoLItkUjRUZ1f3Ab9XMIyP/5iX2cR0V59h6Ac
         RAIg==
X-Gm-Message-State: AOAM530FaIPYVHfa6bp/a6ynAc93QDfWmfLhG793JfLwVna5uOeQlb2Q
        Qz+7pdVXR/hE3dxX06NCTMqcWxez+cq0Aw8iXSo4nlFygZfj2N4nMLEQ5bo/UCJs2oZD4JR/vPU
        Kw6m5A+OhkQ48w1IICxCy
X-Received: by 2002:a17:906:8c3:: with SMTP id o3mr38686180eje.10.1637927161125;
        Fri, 26 Nov 2021 03:46:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQ7am4Ala1kqDx7YmdB+rbbqSZypeAXzclZOGZ1kAkUizNdbpr5ikUpVseAcA4iSm5SH/CwA==
X-Received: by 2002:a17:906:8c3:: with SMTP id o3mr38686160eje.10.1637927160921;
        Fri, 26 Nov 2021 03:46:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f7sm3747090edl.33.2021.11.26.03.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 03:46:00 -0800 (PST)
Message-ID: <2fd5400e-e587-54d2-1071-ad8df49a8a68@redhat.com>
Date:   Fri, 26 Nov 2021 12:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 07/15] platform/x86: int3472: Enable I2c daisy chain
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>,
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4ab5efa7-65b0-009c-293a-d7a49776e78d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 11/26/21 12:39, Daniel Scally wrote:
> Hello
> 
> On 26/11/2021 11:30, Hans de Goede wrote:
>> Hi,
>>
>> On 11/26/21 00:39, Laurent Pinchart wrote:
>>> Hi Hans,
>>>
>>> Thank you for the patch.
>>>
>>> On Thu, Nov 25, 2021 at 05:54:04PM +0100, Hans de Goede wrote:
>>>> From: Daniel Scally <djrscally@gmail.com>
>>>>
>>>> The TPS68470 PMIC has an I2C passthrough mode through which I2C traffic
>>>> can be forwarded to a device connected to the PMIC as though it were
>>>> connected directly to the system bus. Enable this mode when the chip
>>>> is initialised.
>>> Is there any drawback doing this unconditionally, if nothing is
>>> connected to the bus on the other side (including no pull-ups) ?
>> I actually never took a really close look at this patch, I just
>> sorta inherited it from Daniel.
>>
>> Now that I have taken a close look, I see that it is setting the
>> exact same bits as which get set when enabling the VSIO regulator.
>>
>> The idea here is that the I2C-passthrough only gets enabled when
>> the VSIO regulator is turned on, because some sensors end up
>> shorting the I2C pins to ground when the sensor is not powered.
>>
>> Since we set these bits when powering up the VSIO regulator
>> and since we do that before trying to talk to the sensor
>> I don't think that we need this (hack) anymore.
>>
>> I will give things a try without this change and if things
>> still work I will drop this patch from the set.
>>
>> Daniel, what do you think?
> 
> 
> Humm, we're only using the VSIO regulator with the VCM though right?

Nope, there is a mapping from VSIO to dovdd for the ov8865 in the
board_data; and I'm pretty sure I copied that from your earlier
attempts at getting regulator lookups registered :)

And even if the VSIO regulator was only used by the VCM, then it would
get turned off after probing the VCM, clearing the 2 bits which this
commit sets. Which would break things if we did not re-enable it when
the ov8865 needs it.

> Which might not be on when the ov8865 tries to probe. I haven't tried
> without this patch to be honest; I set it because that was what Windows
> does when powering on the PMIC.

See above, I'm pretty sure we can do without this patch which means
that the INT3472 code will no longer be poking at the PMIC directly
itself, which is good :)

Anyways I'll give this a try sometime next week and then drop the
patch.

Regards,

Hans




>>>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>>> ---
>>>>  .../x86/intel/int3472/intel_skl_int3472_tps68470.c         | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c b/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
>>>> index c05b4cf502fe..42e688f4cad4 100644
>>>> --- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
>>>> +++ b/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
>>>> @@ -45,6 +45,13 @@ static int tps68470_chip_init(struct device *dev, struct regmap *regmap)
>>>>  		return ret;
>>>>  	}
>>>>  
>>>> +	/* Enable I2C daisy chain */
>>>> +	ret = regmap_write(regmap, TPS68470_REG_S_I2C_CTL, 0x03);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Failed to enable i2c daisy chain\n");
>>>> +		return ret;
>>>> +	}
>>>> +
>>>>  	dev_info(dev, "TPS68470 REVID: 0x%02x\n", version);
>>>>  
>>>>  	return 0;
> 

