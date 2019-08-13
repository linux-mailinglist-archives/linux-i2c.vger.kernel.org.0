Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60A5D8BA20
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 15:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbfHMN14 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 09:27:56 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45354 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbfHMN1z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Aug 2019 09:27:55 -0400
Received: by mail-pf1-f194.google.com with SMTP id w26so6348724pfq.12;
        Tue, 13 Aug 2019 06:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4JmovL7f7Lc0USMR5vQs5t5TbhaKHeGM3aHleOs6qmw=;
        b=LKFtXvz11efc7CJTzzmu1BuRwYK+8OrP73+IlmRQ559j/wXEsngo0iA3xEE+2EBpwK
         oLdCdF6XfOLYtdukHfJNHrWOqNzp/4n/atIH6PIb5q6Twn1IhJK+EDygqlJKU6oRxOh/
         X5XL4XWb/N9s72GzQda+4QoqiH3H7+1YjH2tgeEUiPogutNNFmGWNeEvLZkjA9R2VRpd
         v8i3RolYLgQYaSRfy/0QAAVwRk8k1eUn6nY5ElpTr3em8oZWVl8FXRgdJ4yYlZiUfnkF
         7jCy2PqT4Dnv5N8NADq1oU3zeT07s+88fQEaixJO73QTWI/Ha6ho04T0bVRh7gk8xWRh
         J77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4JmovL7f7Lc0USMR5vQs5t5TbhaKHeGM3aHleOs6qmw=;
        b=YdeYmt1i96CHJRmZ4WAoRgHbC+HAHoVTt0zJ/p/ywKtYBZ3nxF5rd0JgtyZSIpEpSM
         jvJtwuZTZGN35qg5eeXBKPS843LMTrzfq55iPdc09rtFAKhqESBQLVPosOEOJthn/HA8
         ZItp4DVd9X0ySQUSwWfA0PRk2eiq60qMw6gKOZtnQBQ3iVkzSpw33EJqGnIDMIJ2AeCl
         sOL5ZOM7Zus1QSL633sYEKIsIy01mNMkvRFksCxHcIzpcs6dUW8tE/8ibBL+ke3E1B5z
         /DqGrNxwsXdylwHiE83tnGqINivNGbB18yBS+GGLiR6D3WiVz27NiM7C3RGc7oMJfx/T
         sdXA==
X-Gm-Message-State: APjAAAUkVbs1cI8Od0jpM4hLgGLHUczxYoyOmSLAdZUiO8YPG7P07fL6
        a40wZNn11OoV2QfLYlwFAbM=
X-Google-Smtp-Source: APXvYqys1+pYpliynHFt1addLrKuiPBg5I5dWMCuCfnBxy7e8zqoNwUxpHWnaWDqw2TCSIDNbMM9XQ==
X-Received: by 2002:aa7:8611:: with SMTP id p17mr7366380pfn.41.1565702875093;
        Tue, 13 Aug 2019 06:27:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s5sm93731155pfm.97.2019.08.13.06.27.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 06:27:54 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] hwmon/ltc2990: Add platform_data support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Max Staudt <max@enpas.org>, Linux I2C <linux-i2c@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20190812235237.21797-1-max@enpas.org>
 <20190812235237.21797-3-max@enpas.org> <20190813080237.GA29986@roeck-us.net>
 <CAMuHMdXHbjfrdusGB3qvcu1a=W65Ef1-NrvcCv1h9E9uicknLg@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1aff162f-f548-954c-b9d4-c6207a6c5875@roeck-us.net>
Date:   Tue, 13 Aug 2019 06:27:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXHbjfrdusGB3qvcu1a=W65Ef1-NrvcCv1h9E9uicknLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/13/19 1:27 AM, Geert Uytterhoeven wrote:
> Hi Günter,
> 
> On Tue, Aug 13, 2019 at 10:02 AM Guenter Roeck <linux@roeck-us.net> wrote:
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
>>>   #define LTC2990_STATUS       0x00
>>>   #define LTC2990_CONTROL      0x01
>>> @@ -206,6 +207,7 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
>>>        int ret;
>>>        struct device *hwmon_dev;
>>>        struct ltc2990_data *data;
>>> +     struct ltc2990_platform_data *pdata = dev_get_platdata(&i2c->dev);
>>>        struct device_node *of_node = i2c->dev.of_node;
>>>
>>>        if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
>>> @@ -227,6 +229,13 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
>>>                if (data->mode[0] & ~LTC2990_MODE0_MASK ||
>>>                    data->mode[1] & ~LTC2990_MODE1_MASK)
>>>                        return -EINVAL;
>>> +     } else if (pdata) {
>>> +             data->mode[0] = pdata->meas_mode[0];
>>> +             data->mode[1] = pdata->meas_mode[1];
>>> +
>>> +             if (data->mode[0] & ~LTC2990_MODE0_MASK ||
>>> +                 data->mode[1] & ~LTC2990_MODE1_MASK)
>>> +                     return -EINVAL;
>>
>> I would prefer if the driver was modified to accept device
>> properties, and if those were set using the appropriate
>> fwnode function. Any reason for not doing that ?
> 
> That was my first thought as well, but isn't that limited to DT and ACPI
> properties (for now)?
> 

tcpm and, for example, the wcove driver don't seem to have a problem using
it, I don't see acpi involved there. Also, the code resides in the core driver
code and is always enabled unless I am missing something. What am I missing ?

Guenter
