Return-Path: <linux-i2c+bounces-7545-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A74C49AE966
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 16:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67586282478
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 14:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482A31E490B;
	Thu, 24 Oct 2024 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="distI/A4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14EB1D515C;
	Thu, 24 Oct 2024 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729781638; cv=none; b=F8Ht4uOh5/moG60B8KV667n3eKga/TMI+o7EwaryokUtWWVilPwzupTWyb0lZ2lKjYeF0nq1tDcMbrkh7igaSV//ToYbTx3V+IrXVI+hxGEZtgZ+ggpiNnunx4sgiNGi8m/n8FJPjBJfQ5tkdR83sc3AcnEsL9p0pku8YurmjNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729781638; c=relaxed/simple;
	bh=51kMXBkDD4XIbD3+euSldqKUI+1SmuaH1i/mluJvUxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJWPOH7sj+Noq3MS7KSRK8MvwPmkxM8sFOoXBMZk3AZ+IzjOeplhvDUTYIgMB0p1I9sOUM1uAAAPUwsnS2xxdJAx8mijqngLiMeRXzJkE8HM6yzmU0zFXLDWNhalYFR6cp2sV4d5rXWRrhVvOHmnZiWPuNdcqvzXBfs1H/gPtZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=distI/A4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c8b557f91so7974855ad.2;
        Thu, 24 Oct 2024 07:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729781634; x=1730386434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=f2ttd/ECqBzmU1/EoABwtn860WFHQsSVMUrDIgAr8uA=;
        b=distI/A4C6+3gKViGflOYzjPg84ZNz7Xmu5sx3CMI1DoSfdMgUBq41tSpMLeIcx9CC
         72sRFBQ2adBOMWXh7Bae7n5KYnKSoTt1nmf56aHebcJxHZfaE7BbN/gr7Gm0IM1qu1eR
         oHr7hcjGX6uXWsSvGpUgNQ1G4YNNVY13GL1ibrP0VruQfcVNNWFGUTj9yjgVvsfoIsXn
         IoGfp7/LX8s6ReDVEbrvncHOeUdkho+b1lw3N1xTPfnJK8/ahJ/ZQ/cWWQEB8PzlBGBp
         SxGymVGCytfZoRzYbkZ7AzurqAUfCyEcjSm9qFtahYo2NKZxHaV76644C4kIjT5KPyDV
         Sm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729781634; x=1730386434;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2ttd/ECqBzmU1/EoABwtn860WFHQsSVMUrDIgAr8uA=;
        b=VBhwTDfvLYe/b4EnQYB9MXOuYEODdh8rJWN702RlarUCmkHijZpBMEFv1M0y4Ak6vU
         J0lRtYzc3TANZoR7Tu57oqDXS5I7kWnxYc9Pn1Vh1iwZZG3It5csrOfrBQTCrhQ26+wa
         hNnmViyglsfSf2UtQkllkXLk78EwqKcPe2QVpQ/slnXbFdgodacRK2rQe9ceOGFa9XCY
         Y6DNx7ENWCN540hQEzmnTfXHoSihvBCd5wJrZOrh/pHzoV4GtmOe2hpPVXgrCYC/O/C4
         kElqyV1HnCdKq8t7uTcRzkh3tdoGv7GqcBNKNE6siHbG82RWETt75ynkZxaR40/RkpX2
         sc5A==
X-Forwarded-Encrypted: i=1; AJvYcCUS7CFNkjyx6GJEKc4hVzr65eXktiYjWejf9q2x+PaIx/X3WJ/hN9EuFpKrUVSirf1pgQVfX9hssEz/@vger.kernel.org, AJvYcCUuChVzgc6Kh1duPXsDhNM9Ryah5BH0O81I8iKzxcwX85iYbQLLfTJKTWPKxpDePrezkc67HvP8kpUW@vger.kernel.org, AJvYcCV1CK4gEetuOMz39LkpOycM6wuoySHzX1N2kf3WSyvQevw2J2Gc4l+bh0MRVTL8vIrW7pBl5b8Up0z/dw==@vger.kernel.org, AJvYcCV1o577fy1OK1DkUwOPv7UvOh8UuuHuibJ8C/F213fys9s9P9j+AmK6I930Nl9pV93yO1h+vtspWtQo@vger.kernel.org, AJvYcCVUJ3Jipv4JE7tJdzvmslniBXx7A6IIgOEaQ45IcWTzAJS7zSthgsJchipLjika2mcHHVtIFhipTH0VCoOp@vger.kernel.org, AJvYcCWEZJOHB2OmUnzugauTHoAmK8uMao0/3RRh5eJ6oLF99Ca6ugkpL8Os1JwhWcDnBUZcPpBzd+qYQyok@vger.kernel.org, AJvYcCWhDjwJKYy1opGroxHFPuBsJ+OkMZmUuPqlmJye565OhLWVeAPBXyHCKruNLct77PMpWFdPikz6O6k=@vger.kernel.org, AJvYcCXAKjZWFPx/uKxuQo/EhEzBumYdZahh7TeOr8MzgZyuyIpvu3u851Rx4pblzU1TRkTH9BPt8iH5QHz5SRosFRo=@vger.kernel.org, AJvYcCXDIFnyf2I+Z0tG88mU5qQbe3vWf6Fd3fylVfzlucPHp7fUc0YTeL/dd+rnZUniqPScGk6sQWnNO+HxQiw=@vger.kernel.org, AJvYcCXgrYw+YcscVOfpntvZVT8tSb8/
 4FcgMHuo7sAF0zKa6BHlkgDZDM11s8lhKTnkPlZqG3tgp0MD@vger.kernel.org
X-Gm-Message-State: AOJu0YxfV4Y6H1vrBPbuavMcEYvSvsSI3Pjc+T4rncFCj0ujDrQ1l2dR
	+wnv4Yh9HSjvHIpJdKc6hxfY25yp2np2Dp802LlcYYPEJJMVLyvs
X-Google-Smtp-Source: AGHT+IGvqwSVAi5l04WIPPn5YBnDWxL/P4gEudoNx1XEHdKH0sXpWiLTTaob5kAw4XS8nS3Cl/QY5A==
X-Received: by 2002:a17:903:244d:b0:20b:ab74:f567 with SMTP id d9443c01a7336-20fb99499ddmr26707585ad.27.1729781633917;
        Thu, 24 Oct 2024 07:53:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef0cc12sm73489815ad.95.2024.10.24.07.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:53:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <62ea5a91-816f-4600-bfec-8f70798051db@roeck-us.net>
Date: Thu, 24 Oct 2024 07:53:50 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/9] hwmon: Add Nuvoton NCT6694 HWMON support
To: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>,
 Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
 mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wim@linux-watchdog.org, jdelvare@suse.com, jic23@kernel.org,
 lars@metafoo.de, ukleinek@kernel.org, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-7-tmyu0@nuvoton.com>
 <CAH-L+nPGGhgDFge0Ov4rX_7vUyLN8uu51cks80=kt38h22N7zQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAH-L+nPGGhgDFge0Ov4rX_7vUyLN8uu51cks80=kt38h22N7zQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/24/24 02:20, Kalesh Anakkur Purayil wrote:
> On Thu, Oct 24, 2024 at 2:33 PM Ming Yu <a0282524688@gmail.com> wrote:
>>
>> This driver supports Hardware monitor functionality for NCT6694 MFD
>> device based on USB interface.
>>
>> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
>> ---
>>   MAINTAINERS                   |   1 +
>>   drivers/hwmon/Kconfig         |  10 +
>>   drivers/hwmon/Makefile        |   1 +
>>   drivers/hwmon/nct6694-hwmon.c | 407 ++++++++++++++++++++++++++++++++++
>>   4 files changed, 419 insertions(+)
>>   create mode 100644 drivers/hwmon/nct6694-hwmon.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 63387c0d4ab6..2aa87ad84156 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -16439,6 +16439,7 @@ M:      Ming Yu <tmyu0@nuvoton.com>
>>   L:     linux-kernel@vger.kernel.org
>>   S:     Supported
>>   F:     drivers/gpio/gpio-nct6694.c
>> +F:     drivers/hwmon/nct6694-hwmon.c
>>   F:     drivers/i2c/busses/i2c-nct6694.c
>>   F:     drivers/mfd/nct6694.c
>>   F:     drivers/net/can/nct6694_canfd.c
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 08a3c863f80a..740e4afe6582 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -1625,6 +1625,16 @@ config SENSORS_NCT6683
>>            This driver can also be built as a module. If so, the module
>>            will be called nct6683.
>>
>> +config SENSORS_NCT6694
>> +       tristate "Nuvoton NCT6694 Hardware Monitor support"
>> +       depends on MFD_NCT6694
>> +       help
>> +         Say Y here to support Nuvoton NCT6694 hardware monitoring
>> +         functionality.
>> +
>> +         This driver can also be built as a module. If so, the module
>> +         will be called nct6694-hwmon.
>> +
>>   config SENSORS_NCT6775_CORE
>>          tristate
>>          select REGMAP
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index 9554d2fdcf7b..729961176d00 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
>>   obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
>>   obj-$(CONFIG_SENSORS_MR75203)  += mr75203.o
>>   obj-$(CONFIG_SENSORS_NCT6683)  += nct6683.o
>> +obj-$(CONFIG_SENSORS_NCT6694)  += nct6694-hwmon.o
>>   obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
>>   nct6775-objs                   := nct6775-platform.o
>>   obj-$(CONFIG_SENSORS_NCT6775)  += nct6775.o
>> diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwmon.c
>> new file mode 100644
>> index 000000000000..7d7d22a650b0
>> --- /dev/null
>> +++ b/drivers/hwmon/nct6694-hwmon.c
>> @@ -0,0 +1,407 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Nuvoton NCT6694 HWMON driver based on USB interface.
>> + *
>> + * Copyright (C) 2024 Nuvoton Technology Corp.
>> + */
>> +
>> +#include <linux/slab.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/mfd/nct6694.h>
>> +
>> +#define DRVNAME "nct6694-hwmon"
>> +
>> +/* Host interface */
>> +#define REQUEST_RPT_MOD                        0xFF
>> +#define REQUEST_HWMON_MOD              0x00
>> +
>> +/* Report Channel */
>> +#define HWMON_FIN_IDX(x)               (0x50 + ((x) * 2))
>> +#define HWMON_FIN_STS(x)               (0x6E + (x))
>> +#define HWMON_PWM_IDX(x)               (0x70 + (x))
>> +
>> +/* Message Channel*/
>> +/* Command 00h */
>> +#define REQUEST_HWMON_CMD0_LEN         0x40
>> +#define REQUEST_HWMON_CMD0_OFFSET      0x0000  /* OFFSET = SEL|CMD */
>> +#define HWMON_FIN_EN(x)                        (0x04 + (x))
>> +#define HWMON_PWM_FREQ_IDX(x)          (0x30 + (x))
>> +/* Command 02h */
>> +#define REQUEST_HWMON_CMD2_LEN         0x90
>> +#define REQUEST_HWMON_CMD2_OFFSET      0x0002  /* OFFSET = SEL|CMD */
>> +#define HWMON_SMI_CTRL_IDX             0x00
>> +#define HWMON_FIN_LIMIT_IDX(x)         (0x70 + ((x) * 2))
>> +#define HWMON_CMD2_HYST_MASK           0x1F
>> +/* Command 03h */
>> +#define REQUEST_HWMON_CMD3_LEN         0x08
>> +#define REQUEST_HWMON_CMD3_OFFSET      0x0003  /* OFFSET = SEL|CMD */
>> +
>> +struct nct6694_hwmon_data {
>> +       struct nct6694 *nct6694;
>> +
>> +       /* Make sure read & write commands are consecutive */
>> +       struct mutex hwmon_lock;
>> +};
>> +
>> +#define NCT6694_HWMON_FAN_CONFIG (HWMON_F_ENABLE | HWMON_F_INPUT | \
>> +                                 HWMON_F_MIN | HWMON_F_MIN_ALARM)
>> +#define NCT6694_HWMON_PWM_CONFIG (HWMON_PWM_INPUT | HWMON_PWM_FREQ)
>> +
>> +static const struct hwmon_channel_info *nct6694_info[] = {
>> +       HWMON_CHANNEL_INFO(fan,
>> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN0 */
>> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN1 */
>> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN2 */
>> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN3 */
>> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN4 */
>> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN5 */
>> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN6 */
>> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN7 */
>> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN8 */
>> +                          NCT6694_HWMON_FAN_CONFIG),   /* FIN9 */
>> +
>> +       HWMON_CHANNEL_INFO(pwm,
>> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM0 */
>> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM1 */
>> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM2 */
>> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM3 */
>> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM4 */
>> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM5 */
>> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM6 */
>> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM7 */
>> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM8 */
>> +                          NCT6694_HWMON_PWM_CONFIG),   /* PWM9 */
>> +       NULL
>> +};
>> +
>> +static int nct6694_fan_read(struct device *dev, u32 attr, int channel,
>> +                           long *val)
>> +{
>> +       struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
>> +       unsigned char buf[2];
>> +       int ret;
>> +
>> +       switch (attr) {
>> +       case hwmon_fan_enable:
>> +               ret = nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
>> +                                      REQUEST_HWMON_CMD0_OFFSET,
>> +                                      REQUEST_HWMON_CMD0_LEN,
>> +                                      HWMON_FIN_EN(channel / 8),
>> +                                      1, buf);
>> +               if (ret)
>> +                       return -EINVAL;
>> +
>> +               *val = buf[0] & BIT(channel % 8) ? 1 : 0;
>> +
>> +               break;
>> +
>> +       case hwmon_fan_input:
>> +               ret = nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
>> +                                      HWMON_FIN_IDX(channel), 2, 0,
>> +                                      2, buf);
>> +               if (ret)
>> +                       return -EINVAL;
>> +
>> +               *val = (buf[1] | (buf[0] << 8)) & 0xFFFF;
>> +
>> +               break;
>> +
>> +       case hwmon_fan_min:
>> +               ret = nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
>> +                                      REQUEST_HWMON_CMD2_OFFSET,
>> +                                      REQUEST_HWMON_CMD2_LEN,
>> +                                      HWMON_FIN_LIMIT_IDX(channel),
>> +                                      2, buf);
>> +               if (ret)
>> +                       return -EINVAL;
>> +
>> +               *val = (buf[1] | (buf[0] << 8)) & 0xFFFF;
>> +
>> +               break;
>> +
>> +       case hwmon_fan_min_alarm:
>> +               ret = nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
>> +                                      HWMON_FIN_STS(channel / 8),
>> +                                      1, 0, 1, buf);
>> +               if (ret)
>> +                       return -EINVAL;
>> +
>> +               *val = buf[0] & BIT(channel % 8);
>> +
>> +               break;
>> +
>> +       default:
>> +               return -EOPNOTSUPP;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int nct6694_pwm_read(struct device *dev, u32 attr, int channel,
>> +                           long *val)
>> +{
>> +       struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
>> +       unsigned char buf;
>> +       int ret;
>> +
>> +       switch (attr) {
>> +       case hwmon_pwm_input:
>> +               ret = nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
>> +                                      HWMON_PWM_IDX(channel),
>> +                                      1, 0, 1, &buf);
>> +               if (ret)
>> +                       return -EINVAL;
>> +
>> +               *val = buf;
>> +
>> +               break;
>> +       case hwmon_pwm_freq:
>> +               ret = nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
>> +                                      REQUEST_HWMON_CMD0_OFFSET,
>> +                                      REQUEST_HWMON_CMD0_LEN,
>> +                                      HWMON_PWM_FREQ_IDX(channel),
>> +                                      1, &buf);
>> +               if (ret)
>> +                       return -EINVAL;
>> +
>> +               *val = buf * 25000 / 255;
>> +
>> +               break;
>> +
>> +       default:
>> +               return -EOPNOTSUPP;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int nct6694_fan_write(struct device *dev, u32 attr, int channel,
>> +                            long val)
>> +{
>> +       struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
>> +       unsigned char enable_buf[REQUEST_HWMON_CMD0_LEN] = {0};
> [Kalesh] Please try to maintain RCT order for variable declaration

Ok, but that is already the case here ?

>> +       unsigned char buf[REQUEST_HWMON_CMD2_LEN] = {0};
>> +       u16 fan_val = (u16)val;
>> +       int ret;
>> +
>> +       switch (attr) {
>> +       case hwmon_fan_enable:
>> +               mutex_lock(&data->hwmon_lock);
>> +               ret = nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
>> +                                      REQUEST_HWMON_CMD0_OFFSET,
>> +                                      REQUEST_HWMON_CMD0_LEN, 0,
>> +                                      REQUEST_HWMON_CMD0_LEN,
>> +                                      enable_buf);
>> +               if (ret)
>> +                       goto err;
>> +
>> +               if (val)
>> +                       enable_buf[HWMON_FIN_EN(channel / 8)] |= BIT(channel % 8);
>> +               else
>> +                       enable_buf[HWMON_FIN_EN(channel / 8)] &= ~BIT(channel % 8);
>> +
>> +               ret = nct6694_write_msg(data->nct6694, REQUEST_HWMON_MOD,
>> +                                       REQUEST_HWMON_CMD0_OFFSET,
>> +                                       REQUEST_HWMON_CMD0_LEN, enable_buf);
>> +               if (ret)
>> +                       goto err;
>> +
>> +               break;
>> +
>> +       case hwmon_fan_min:
>> +               mutex_lock(&data->hwmon_lock);
>> +               ret = nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
>> +                                      REQUEST_HWMON_CMD2_OFFSET,
>> +                                      REQUEST_HWMON_CMD2_LEN, 0,
>> +                                      REQUEST_HWMON_CMD2_LEN, buf);
>> +               if (ret)
>> +                       goto err;
>> +
>> +               buf[HWMON_FIN_LIMIT_IDX(channel)] = (u8)((fan_val >> 8) & 0xFF);
>> +               buf[HWMON_FIN_LIMIT_IDX(channel) + 1] = (u8)(fan_val & 0xFF);
>> +               ret = nct6694_write_msg(data->nct6694, REQUEST_HWMON_MOD,
>> +                                       REQUEST_HWMON_CMD2_OFFSET,
>> +                                       REQUEST_HWMON_CMD2_LEN, buf);
>> +               if (ret)
>> +                       goto err;
>> +
>> +               break;
>> +
>> +       default:
>> +               ret = -EOPNOTSUPP;
> [Kalesh] If you initialize "ret = -EOPNOTSUPP;" during declararion,
> you can just break from here.

You are missing the point. The lock wasn't acquired here in the first place.
It is conceptually wrong to acquire a lock in the switch statement and release
it outside. This patch is a case in point.

>> +               goto err;
>> +       }
>> +
>> +err:
>> +       mutex_unlock(&data->hwmon_lock);
>> +       return ret;
>> +}
>> +
>> +static int nct6694_read(struct device *dev, enum hwmon_sensor_types type,
>> +                       u32 attr, int channel, long *val)
>> +{
>> +       switch (type) {
>> +       case hwmon_fan: /* in RPM */
>> +               return nct6694_fan_read(dev, attr, channel, val);
>> +
>> +       case hwmon_pwm: /* in value 0~255 */
>> +               return nct6694_pwm_read(dev, attr, channel, val);
>> +
>> +       default:
>> +               return -EOPNOTSUPP;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int nct6694_write(struct device *dev, enum hwmon_sensor_types type,
>> +                        u32 attr, int channel, long val)
>> +{
>> +       switch (type) {
>> +       case hwmon_fan:
>> +               return nct6694_fan_write(dev, attr, channel, val);
>> +       default:
>> +               return -EOPNOTSUPP;
>> +       }
> [Kalesh] You can use simple if condition here than a switch like:
> if (type != hwmon_fan)
>           return -EOPNOTSUPP;
> return nct6694_fan_write(dev, attr, channel, val);

That is a bit POV. I'd leave that to the developer.
More important is that the return statements after the switch are unnecessary
and never reached if each case returns immediately.

>> +
>> +       return 0;
>> +}
>> +
>> +static umode_t nct6694_is_visible(const void *data, enum hwmon_sensor_types type,
>> +                                 u32 attr, int channel)
>> +{
>> +       switch (type) {
>> +       case hwmon_fan:
>> +               switch (attr) {
>> +               case hwmon_fan_enable:
>> +               case hwmon_fan_min:
>> +                       return 0644;
> [Kalesh] I think there is no need to leave a new line in between cases
>> +
>> +               case hwmon_fan_input:
>> +               case hwmon_fan_min_alarm:
>> +                       return 0444;
>> +
>> +               default:
>> +                       return 0;
>> +               }
>> +
>> +       case hwmon_pwm:
>> +               switch (attr) {
>> +               case hwmon_pwm_input:
>> +               case hwmon_pwm_freq:
>> +                       return 0444;
>> +               default:
>> +                       return 0;
>> +               }
>> +
>> +       default:
>> +               return 0;
>> +       }
>> +
>> +       return 0;
> [Kalesh] This return statement looks redundant as the execution never
> reaches here. Same comment applies to other functions above as well.
>> +}
>> +
>> +static const struct hwmon_ops nct6694_hwmon_ops = {
>> +       .is_visible = nct6694_is_visible,
>> +       .read = nct6694_read,
>> +       .write = nct6694_write,
>> +};
>> +
>> +static const struct hwmon_chip_info nct6694_chip_info = {
>> +       .ops = &nct6694_hwmon_ops,
>> +       .info = nct6694_info,
>> +};
>> +
>> +static int nct6694_hwmon_init(struct nct6694_hwmon_data *data)
>> +{
>> +       unsigned char buf[REQUEST_HWMON_CMD2_LEN] = {0};
>> +       int ret;
>> +
>> +       /* Set Fan input Real Time alarm mode */
>> +       mutex_lock(&data->hwmon_lock);
>> +       ret = nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
>> +                              REQUEST_HWMON_CMD2_OFFSET,
>> +                              REQUEST_HWMON_CMD2_LEN, 0,
>> +                              REQUEST_HWMON_CMD2_LEN, buf);
>> +       if (ret)
>> +               goto err;
> [Kalesh] It would be better to rename the label as "unlock". Same
> comment on other functions as well.

The lock is not needed here in the first place. The function is called
exactly once during initialization.

>> +
>> +       buf[HWMON_SMI_CTRL_IDX] = 0x02;
>> +
>> +       ret = nct6694_write_msg(data->nct6694, REQUEST_HWMON_MOD,
>> +                               REQUEST_HWMON_CMD2_OFFSET,
>> +                               REQUEST_HWMON_CMD2_LEN, buf);
>> +       if (ret)
>> +               goto err;
>> +
>> +err:
>> +       mutex_unlock(&data->hwmon_lock);
>> +       return ret;
>> +}
>> +
>> +static int nct6694_hwmon_probe(struct platform_device *pdev)
>> +{
>> +       struct nct6694_hwmon_data *data;
>> +       struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
>> +       struct device *hwmon_dev;
>> +       int ret;
>> +
>> +       data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>> +       if (!data)
>> +               return -ENOMEM;
>> +
>> +       data->nct6694 = nct6694;
>> +       mutex_init(&data->hwmon_lock);
>> +       platform_set_drvdata(pdev, data);
>> +
>> +       ret = nct6694_hwmon_init(data);
>> +       if (ret)
>> +               return -EIO;
>> +
>> +       /* Register hwmon device to HWMON framework */
>> +       hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
>> +                                                        "nct6694", data,
>> +                                                        &nct6694_chip_info,
>> +                                                        NULL);
>> +       if (IS_ERR(hwmon_dev)) {
>> +               dev_err(&pdev->dev, "%s: Failed to register hwmon device!\n",
>> +                       __func__);
>> +               return PTR_ERR(hwmon_dev);
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static struct platform_driver nct6694_hwmon_driver = {
>> +       .driver = {
>> +               .name   = DRVNAME,
>> +       },
>> +       .probe          = nct6694_hwmon_probe,
>> +};
>> +
>> +static int __init nct6694_init(void)
>> +{
>> +       int err;
>> +
>> +       err = platform_driver_register(&nct6694_hwmon_driver);
>> +       if (!err) {
>> +               if (err)
> [Kalesh] This whole check looks strange. You can simplify this function as:
> return platform_driver_register(&nct6694_hwmon_driver);
>> +                       platform_driver_unregister(&nct6694_hwmon_driver);
>> +       }
>> +
>> +       return err;
>> +}
>> +subsys_initcall(nct6694_init);
>> +
>> +static void __exit nct6694_exit(void)
>> +{
>> +       platform_driver_unregister(&nct6694_hwmon_driver);
>> +}
>> +module_exit(nct6694_exit);
>> +
>> +MODULE_DESCRIPTION("USB-HWMON driver for NCT6694");
>> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
>> +MODULE_LICENSE("GPL");
>> --
>> 2.34.1
>>
>>
> 
> 


