Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09D488BA0F
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 15:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbfHMNZA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 09:25:00 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46058 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728134AbfHMNZA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Aug 2019 09:25:00 -0400
Received: by mail-pf1-f195.google.com with SMTP id w26so6344082pfq.12;
        Tue, 13 Aug 2019 06:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=icok7aUr9NjweCwQOu8d7MJikZLhsx5ZtDw4IRqdFmk=;
        b=n/PBxuPvRSj5AVujeC45Mob83CCsceHP3yjY1iNaBLJwlMFst4E2GqrYsM0PROsXZ5
         wJ6mj+XWYBBsKBfXXxUbI0CQius4QTLEl3YCwm9D4GZligWL4yceNNdWsGPaEb2CxGvU
         GA1F88P4BCZGrkAwk1aKBTn+pAOlVhMhTPeH8lH3A0Qf4LUzh1cdkUsVPDBQ63nY8l8e
         UnzHJFeYj8OHFQi3+99VI+vxI1WYPjyQjmWcbagGHNEPGjUg7qpcladCGgMFCpfung24
         qaYRgDe2lhzQP1Nsgk4A2WhzgVkwXNrXaiLFKzpJQASpU1P14/Gf0OcpVfr9HZppWt12
         Mwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=icok7aUr9NjweCwQOu8d7MJikZLhsx5ZtDw4IRqdFmk=;
        b=rTl2rCgZ9jT64V+qJgaaOV0AG4xoiNeehVr9JZNuhliK8DtNJEtyCLfCzGIBWMYdRp
         F1h7YO35yB9wJxOwNLITbdqQ9Q1VuGZUdn08BtGtTXSiVhfleOMN1x06bV4WUEaN70nC
         lvwFJTkDKEB5haxp6M7H92sBRgQht5qsNGy1s2xAHcuE8gGphxFUjJM7M3vTLIUo+KgI
         s9TeP31OLemWFzdF3ru8FxG/6IF4XYH3+mtupj9a6aYimb4b5GoX1sesiQrym4VU6m1a
         FC5u4a+2nbDLRfT2eGN4eKUt0OXh+2aAtqpoaa+LoIf0Yq32FmK4Y9QIr3BN9oZOdJAC
         izgQ==
X-Gm-Message-State: APjAAAVgBG6ykGi6qGcml7Xt6WLx3NHYukT+9HvuzU53W+lPmwfWUhlW
        lgUcHOXPzl9sSHO6AkBdHx/3APQj
X-Google-Smtp-Source: APXvYqytu7jljMXl7piQTtFyuq5M5HqC4HT4b0x+oerpWvA/dJtA2SMtGmXVK6JxQNJW6ot9uaCZ6Q==
X-Received: by 2002:a65:68c8:: with SMTP id k8mr34088677pgt.192.1565702699770;
        Tue, 13 Aug 2019 06:24:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p65sm110032557pfp.58.2019.08.13.06.24.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 06:24:58 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] hwmon/ltc2990: Add platform_data support
To:     Max Staudt <max@enpas.org>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>, linux-m68k@vger.kernel.org,
        linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
References: <20190812235237.21797-1-max@enpas.org>
 <20190812235237.21797-3-max@enpas.org> <20190813080237.GA29986@roeck-us.net>
 <6912362a-1f58-a9d6-f86b-d16930aa359c@enpas.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <275c42b3-9a91-a73a-0696-3c5a0a344509@roeck-us.net>
Date:   Tue, 13 Aug 2019 06:24:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6912362a-1f58-a9d6-f86b-d16930aa359c@enpas.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/13/19 3:10 AM, Max Staudt wrote:
> On 08/13/2019 10:02 AM, Guenter Roeck wrote:
>> On Tue, Aug 13, 2019 at 01:52:36AM +0200, Max Staudt wrote:
>>> This allows code using i2c_new_device() to specify a measurement mode.
>>>
>>> Signed-off-by: Max Staudt <max@enpas.org>
>>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> ---
>>>   drivers/hwmon/ltc2990.c               |  9 +++++++++
>>>   include/linux/platform_data/ltc2990.h | 11 +++++++++++
>>>   2 files changed, 20 insertions(+)
>>>   create mode 100644 include/linux/platform_data/ltc2990.h
>>>
>>> diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
>>> index f9431ad43..f19b9c50c 100644
>>> --- a/drivers/hwmon/ltc2990.c
>>> +++ b/drivers/hwmon/ltc2990.c
>>> @@ -14,6 +14,7 @@
>>>   #include <linux/kernel.h>
>>>   #include <linux/module.h>
>>>   #include <linux/of.h>
>>> +#include <linux/platform_data/ltc2990.h>
>>>   
>>>   #define LTC2990_STATUS	0x00
>>>   #define LTC2990_CONTROL	0x01
>>> @@ -206,6 +207,7 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
>>>   	int ret;
>>>   	struct device *hwmon_dev;
>>>   	struct ltc2990_data *data;
>>> +	struct ltc2990_platform_data *pdata = dev_get_platdata(&i2c->dev);
>>>   	struct device_node *of_node = i2c->dev.of_node;
>>>   
>>>   	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
>>> @@ -227,6 +229,13 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
>>>   		if (data->mode[0] & ~LTC2990_MODE0_MASK ||
>>>   		    data->mode[1] & ~LTC2990_MODE1_MASK)
>>>   			return -EINVAL;
>>> +	} else if (pdata) {
>>> +		data->mode[0] = pdata->meas_mode[0];
>>> +		data->mode[1] = pdata->meas_mode[1];
>>> +
>>> +		if (data->mode[0] & ~LTC2990_MODE0_MASK ||
>>> +		    data->mode[1] & ~LTC2990_MODE1_MASK)
>>> +			return -EINVAL;
>>
>> I would prefer if the driver was modified to accept device
>> properties, and if those were set using the appropriate
>> fwnode function. Any reason for not doing that ?
> 
> The driver does have DT support implemented right above my new platform_data code, and DT takes precedence. However, I can't set DT data programatically when instantiating the client using i2c_new_device() - hence the platform_data support.
> 

Sorry, I don't understand. Why exactly can't you replace of_property_read_u32_array()
with device_property_read_u32_array() and use fwnode_create_software_node()
in the calling code to set the properties ?

Guenter
