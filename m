Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D59BA45ECAD
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 12:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346561AbhKZLfx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 06:35:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30307 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232467AbhKZLdx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Nov 2021 06:33:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637926240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z5ik7YG8p9gNvEW13DLwcnNRZjdhh0zPjIHxbhsbWM0=;
        b=AiHfSlh5BnqH6yQuOwzNMi5Nc962DobpTKXZqiwiEdN5sr8syo3u2wtQc2xPW6/Bi694E2
        ndjq3HTIpytA2CV+1TG92pX9dDcaZ8OIYnJ4mUos4UHS8EaNIWvAtWcdmTjD3NLDK9PB1w
        U08HnWewiUUu1c31edp2Cbg1Rq3rqKo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-vSWuYU52Ppatldfs1yI-8Q-1; Fri, 26 Nov 2021 06:30:38 -0500
X-MC-Unique: vSWuYU52Ppatldfs1yI-8Q-1
Received: by mail-ed1-f69.google.com with SMTP id m12-20020a056402430c00b003e9f10bbb7dso7784107edc.18
        for <linux-i2c@vger.kernel.org>; Fri, 26 Nov 2021 03:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z5ik7YG8p9gNvEW13DLwcnNRZjdhh0zPjIHxbhsbWM0=;
        b=TBZ71LQpRMq7Gbf/kNMYM+2jX/KTxn7S/eryW3B3bvrHaXQwp2M1aUaccoFrhbGewp
         iF9mm2vKFQFgj9ryYyPNTBTY7tWG0WItvxIDDspDfpId1CNZeL6Uj7Ul+Uy+iQPvLD/Z
         pyuUxRtc8k2IBJfjbV4b8mJrS0iCxJLU3MagHBCW1W5IZpMRxPMcA8RU7XMqs79IzuB1
         sJtdcngbF3cVG4WCQw3auyQeOJv88bI4m8WIC8KKn6dvGAg1ozyLXaszj9LF5LO5y2s0
         OqMUzo/+qVxDG7JuYzGHAVgRNY4HqeKPMG8KpSj9oxu3jF+SgBwn+pqqdp2B9diPU/ZJ
         aqQA==
X-Gm-Message-State: AOAM5327i6pgUfab9d+PZwefqLzEKO0/5Oypfp8exn+oW0qhilL6/iPg
        4/h0kQQ4NvtmbAcBBxvnxtfB9x6UU7BTwugL5XiGZ1p9y2p0y3Gh685HyLMmvygigqqTVg3q/Ah
        olzp604mzDFoj+Fk7zZNT
X-Received: by 2002:aa7:cc09:: with SMTP id q9mr46331674edt.102.1637926237551;
        Fri, 26 Nov 2021 03:30:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNH3TFN6QArzI7U0tifV1PgV6k8S+lW361fy2F8KWSB9PeK9LJbHHVOGhB5qwhp+O2mToBGw==
X-Received: by 2002:aa7:cc09:: with SMTP id q9mr46331643edt.102.1637926237378;
        Fri, 26 Nov 2021 03:30:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b7sm4303521edd.26.2021.11.26.03.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 03:30:37 -0800 (PST)
Message-ID: <03306e12-40ec-39ab-3b40-42b0395e1b65@redhat.com>
Date:   Fri, 26 Nov 2021 12:30:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 07/15] platform/x86: int3472: Enable I2c daisy chain
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YaAel9HuAvemRg2s@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 11/26/21 00:39, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Thu, Nov 25, 2021 at 05:54:04PM +0100, Hans de Goede wrote:
>> From: Daniel Scally <djrscally@gmail.com>
>>
>> The TPS68470 PMIC has an I2C passthrough mode through which I2C traffic
>> can be forwarded to a device connected to the PMIC as though it were
>> connected directly to the system bus. Enable this mode when the chip
>> is initialised.
> 
> Is there any drawback doing this unconditionally, if nothing is
> connected to the bus on the other side (including no pull-ups) ?

I actually never took a really close look at this patch, I just
sorta inherited it from Daniel.

Now that I have taken a close look, I see that it is setting the
exact same bits as which get set when enabling the VSIO regulator.

The idea here is that the I2C-passthrough only gets enabled when
the VSIO regulator is turned on, because some sensors end up
shorting the I2C pins to ground when the sensor is not powered.

Since we set these bits when powering up the VSIO regulator
and since we do that before trying to talk to the sensor
I don't think that we need this (hack) anymore.

I will give things a try without this change and if things
still work I will drop this patch from the set.

Daniel, what do you think?

Regards,

Hans






> 
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>  .../x86/intel/int3472/intel_skl_int3472_tps68470.c         | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c b/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
>> index c05b4cf502fe..42e688f4cad4 100644
>> --- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
>> +++ b/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
>> @@ -45,6 +45,13 @@ static int tps68470_chip_init(struct device *dev, struct regmap *regmap)
>>  		return ret;
>>  	}
>>  
>> +	/* Enable I2C daisy chain */
>> +	ret = regmap_write(regmap, TPS68470_REG_S_I2C_CTL, 0x03);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable i2c daisy chain\n");
>> +		return ret;
>> +	}
>> +
>>  	dev_info(dev, "TPS68470 REVID: 0x%02x\n", version);
>>  
>>  	return 0;
> 

