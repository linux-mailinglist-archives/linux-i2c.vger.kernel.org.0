Return-Path: <linux-i2c+bounces-7530-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CC9AE06C
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C9811F22A0C
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062501ADFE6;
	Thu, 24 Oct 2024 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VBvlqi46"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D6C1AE001
	for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729761649; cv=none; b=fwnwiEfXWeRYU6A/DCYqGrQNgy9WkuO7HgQMizOBnN8L6jWEo9j6OqTwYcEkSAky0ZmtOVGzL6oOXS7cZrenGTTTc8jo8rmedT+9/GoQq0NzDqVio8t+4Nz5jhGYNCApVufsNscNmUNToq4SlgEI5mRHMj7hljVSk37sWqdgyiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729761649; c=relaxed/simple;
	bh=etg4E+XV10+j0b42AVWOSSwP4IGRw59BDRFOZYPVwUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2b4hgRyG0ZqxnPOLlLdF2IX6Lwbn9dFLLJ2SVlwWJpNxOJPNqBWrI/L/WPXW4F53Rjs+s95IZBIffg+CKUOgefTsfoyQ1ZyARvXRC5hZyDZTVbsxumN2wFXXXPDWAHtl9KeCvhK7iHZt91o7DP6LYrE2330mgwwYCkc73HGwGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VBvlqi46; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f1292a9bso797308e87.2
        for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1729761643; x=1730366443; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k4m9q00/gZ0xNVGTsTt7/62lCXl9dHIGktkva4FnisI=;
        b=VBvlqi46mw5FIcxG7QoUqDh9W0AuhrFFtVi3nTnsD26+WllgGGtAVl4Uaxpvui1BBQ
         mELcUlfc898Ewaz32yqQWRP1WWGhjdeB8vjwuMxxyTBe9CnwTyCU5Mbvl++5Ok1O2LR8
         +Y+4to+epHi8h3D/JSpZ9lHjH915Y97cvVo+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761643; x=1730366443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4m9q00/gZ0xNVGTsTt7/62lCXl9dHIGktkva4FnisI=;
        b=kLOtXSzd8TMIQcehpwvYBGbsYbdUsEEQFc3fr87IzODUsdsaa9vStLozlmpxjF6Qz2
         BPLOX31Nr7XYqPxTVe5L9hCYQEt2X0cHOjPt/3knaSrmfuEgZLa39Igs+WfpiEGqiy6J
         mavPcdMuOZv/M59QJBTTETxuZ8xZdZZhawVwNY3C5e+XUuvM6jQmGAb4wcg0zdr+XXxc
         7ByJwo0xDuUrPWFmXWfrsgSSIITDiZbDLdb1dZi4hg5iT/Aybe4bn89vXhKwUyfjIMPm
         GJ5Mx7mR7iQx8aZ3OaV9gMscnt73nviJU6bsrRg86kgqzeNe6i008yun5wXAdJlY10y0
         iyug==
X-Forwarded-Encrypted: i=1; AJvYcCVU417GXx2tzk+PG/eKc3UwaRMV4aen+q3j8kLLdRXORzILwW2IPosjidekqweVuiEEMGFxn0M8I9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVEeYWuSAgdAgigCkH0Ct+j7/kRUGNqCmicq4YZA6gZpzVpLpM
	9uyP8jE2JBX1NxE5prALhTQXIa0slN6c8M5Izsd5Sq394roGrc6H2O2yb6Ykf/ws9goRcrfVHxH
	e8FR7ozNnx6R+0ImDiT/+sjVAI96uJoGoM1vn
X-Google-Smtp-Source: AGHT+IFAFO5VFAC9bnaHVF85/PTOy373I2/tOYzsIEcGmSnKUuusWoO3H05Yiy7BRFebZwiDoiyDU3ubc3xxK3u9rIA=
X-Received: by 2002:ac2:4c55:0:b0:539:fc75:99ae with SMTP id
 2adb3069b0e04-53b23e1df9emr664185e87.31.1729761643106; Thu, 24 Oct 2024
 02:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-7-tmyu0@nuvoton.com>
In-Reply-To: <20241024085922.133071-7-tmyu0@nuvoton.com>
From: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>
Date: Thu, 24 Oct 2024 14:50:30 +0530
Message-ID: <CAH-L+nPGGhgDFge0Ov4rX_7vUyLN8uu51cks80=kt38h22N7zQ@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] hwmon: Add Nuvoton NCT6694 HWMON support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, jic23@kernel.org, lars@metafoo.de, 
	ukleinek@kernel.org, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000052cd5c0625358497"

--00000000000052cd5c0625358497
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 2:33=E2=80=AFPM Ming Yu <a0282524688@gmail.com> wro=
te:
>
> This driver supports Hardware monitor functionality for NCT6694 MFD
> device based on USB interface.
>
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
>  MAINTAINERS                   |   1 +
>  drivers/hwmon/Kconfig         |  10 +
>  drivers/hwmon/Makefile        |   1 +
>  drivers/hwmon/nct6694-hwmon.c | 407 ++++++++++++++++++++++++++++++++++
>  4 files changed, 419 insertions(+)
>  create mode 100644 drivers/hwmon/nct6694-hwmon.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 63387c0d4ab6..2aa87ad84156 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16439,6 +16439,7 @@ M:      Ming Yu <tmyu0@nuvoton.com>
>  L:     linux-kernel@vger.kernel.org
>  S:     Supported
>  F:     drivers/gpio/gpio-nct6694.c
> +F:     drivers/hwmon/nct6694-hwmon.c
>  F:     drivers/i2c/busses/i2c-nct6694.c
>  F:     drivers/mfd/nct6694.c
>  F:     drivers/net/can/nct6694_canfd.c
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 08a3c863f80a..740e4afe6582 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1625,6 +1625,16 @@ config SENSORS_NCT6683
>           This driver can also be built as a module. If so, the module
>           will be called nct6683.
>
> +config SENSORS_NCT6694
> +       tristate "Nuvoton NCT6694 Hardware Monitor support"
> +       depends on MFD_NCT6694
> +       help
> +         Say Y here to support Nuvoton NCT6694 hardware monitoring
> +         functionality.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called nct6694-hwmon.
> +
>  config SENSORS_NCT6775_CORE
>         tristate
>         select REGMAP
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 9554d2fdcf7b..729961176d00 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) +=3D mlxreg-fan.o
>  obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) +=3D menf21bmc_hwmon.o
>  obj-$(CONFIG_SENSORS_MR75203)  +=3D mr75203.o
>  obj-$(CONFIG_SENSORS_NCT6683)  +=3D nct6683.o
> +obj-$(CONFIG_SENSORS_NCT6694)  +=3D nct6694-hwmon.o
>  obj-$(CONFIG_SENSORS_NCT6775_CORE) +=3D nct6775-core.o
>  nct6775-objs                   :=3D nct6775-platform.o
>  obj-$(CONFIG_SENSORS_NCT6775)  +=3D nct6775.o
> diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwmon.=
c
> new file mode 100644
> index 000000000000..7d7d22a650b0
> --- /dev/null
> +++ b/drivers/hwmon/nct6694-hwmon.c
> @@ -0,0 +1,407 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 HWMON driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/hwmon.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/nct6694.h>
> +
> +#define DRVNAME "nct6694-hwmon"
> +
> +/* Host interface */
> +#define REQUEST_RPT_MOD                        0xFF
> +#define REQUEST_HWMON_MOD              0x00
> +
> +/* Report Channel */
> +#define HWMON_FIN_IDX(x)               (0x50 + ((x) * 2))
> +#define HWMON_FIN_STS(x)               (0x6E + (x))
> +#define HWMON_PWM_IDX(x)               (0x70 + (x))
> +
> +/* Message Channel*/
> +/* Command 00h */
> +#define REQUEST_HWMON_CMD0_LEN         0x40
> +#define REQUEST_HWMON_CMD0_OFFSET      0x0000  /* OFFSET =3D SEL|CMD */
> +#define HWMON_FIN_EN(x)                        (0x04 + (x))
> +#define HWMON_PWM_FREQ_IDX(x)          (0x30 + (x))
> +/* Command 02h */
> +#define REQUEST_HWMON_CMD2_LEN         0x90
> +#define REQUEST_HWMON_CMD2_OFFSET      0x0002  /* OFFSET =3D SEL|CMD */
> +#define HWMON_SMI_CTRL_IDX             0x00
> +#define HWMON_FIN_LIMIT_IDX(x)         (0x70 + ((x) * 2))
> +#define HWMON_CMD2_HYST_MASK           0x1F
> +/* Command 03h */
> +#define REQUEST_HWMON_CMD3_LEN         0x08
> +#define REQUEST_HWMON_CMD3_OFFSET      0x0003  /* OFFSET =3D SEL|CMD */
> +
> +struct nct6694_hwmon_data {
> +       struct nct6694 *nct6694;
> +
> +       /* Make sure read & write commands are consecutive */
> +       struct mutex hwmon_lock;
> +};
> +
> +#define NCT6694_HWMON_FAN_CONFIG (HWMON_F_ENABLE | HWMON_F_INPUT | \
> +                                 HWMON_F_MIN | HWMON_F_MIN_ALARM)
> +#define NCT6694_HWMON_PWM_CONFIG (HWMON_PWM_INPUT | HWMON_PWM_FREQ)
> +
> +static const struct hwmon_channel_info *nct6694_info[] =3D {
> +       HWMON_CHANNEL_INFO(fan,
> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN0 */
> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN1 */
> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN2 */
> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN3 */
> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN4 */
> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN5 */
> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN6 */
> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN7 */
> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN8 */
> +                          NCT6694_HWMON_FAN_CONFIG),   /* FIN9 */
> +
> +       HWMON_CHANNEL_INFO(pwm,
> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM0 */
> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM1 */
> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM2 */
> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM3 */
> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM4 */
> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM5 */
> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM6 */
> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM7 */
> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM8 */
> +                          NCT6694_HWMON_PWM_CONFIG),   /* PWM9 */
> +       NULL
> +};
> +
> +static int nct6694_fan_read(struct device *dev, u32 attr, int channel,
> +                           long *val)
> +{
> +       struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> +       unsigned char buf[2];
> +       int ret;
> +
> +       switch (attr) {
> +       case hwmon_fan_enable:
> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD=
,
> +                                      REQUEST_HWMON_CMD0_OFFSET,
> +                                      REQUEST_HWMON_CMD0_LEN,
> +                                      HWMON_FIN_EN(channel / 8),
> +                                      1, buf);
> +               if (ret)
> +                       return -EINVAL;
> +
> +               *val =3D buf[0] & BIT(channel % 8) ? 1 : 0;
> +
> +               break;
> +
> +       case hwmon_fan_input:
> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
> +                                      HWMON_FIN_IDX(channel), 2, 0,
> +                                      2, buf);
> +               if (ret)
> +                       return -EINVAL;
> +
> +               *val =3D (buf[1] | (buf[0] << 8)) & 0xFFFF;
> +
> +               break;
> +
> +       case hwmon_fan_min:
> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD=
,
> +                                      REQUEST_HWMON_CMD2_OFFSET,
> +                                      REQUEST_HWMON_CMD2_LEN,
> +                                      HWMON_FIN_LIMIT_IDX(channel),
> +                                      2, buf);
> +               if (ret)
> +                       return -EINVAL;
> +
> +               *val =3D (buf[1] | (buf[0] << 8)) & 0xFFFF;
> +
> +               break;
> +
> +       case hwmon_fan_min_alarm:
> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
> +                                      HWMON_FIN_STS(channel / 8),
> +                                      1, 0, 1, buf);
> +               if (ret)
> +                       return -EINVAL;
> +
> +               *val =3D buf[0] & BIT(channel % 8);
> +
> +               break;
> +
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int nct6694_pwm_read(struct device *dev, u32 attr, int channel,
> +                           long *val)
> +{
> +       struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> +       unsigned char buf;
> +       int ret;
> +
> +       switch (attr) {
> +       case hwmon_pwm_input:
> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
> +                                      HWMON_PWM_IDX(channel),
> +                                      1, 0, 1, &buf);
> +               if (ret)
> +                       return -EINVAL;
> +
> +               *val =3D buf;
> +
> +               break;
> +       case hwmon_pwm_freq:
> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD=
,
> +                                      REQUEST_HWMON_CMD0_OFFSET,
> +                                      REQUEST_HWMON_CMD0_LEN,
> +                                      HWMON_PWM_FREQ_IDX(channel),
> +                                      1, &buf);
> +               if (ret)
> +                       return -EINVAL;
> +
> +               *val =3D buf * 25000 / 255;
> +
> +               break;
> +
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int nct6694_fan_write(struct device *dev, u32 attr, int channel,
> +                            long val)
> +{
> +       struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> +       unsigned char enable_buf[REQUEST_HWMON_CMD0_LEN] =3D {0};
[Kalesh] Please try to maintain RCT order for variable declaration
> +       unsigned char buf[REQUEST_HWMON_CMD2_LEN] =3D {0};
> +       u16 fan_val =3D (u16)val;
> +       int ret;
> +
> +       switch (attr) {
> +       case hwmon_fan_enable:
> +               mutex_lock(&data->hwmon_lock);
> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD=
,
> +                                      REQUEST_HWMON_CMD0_OFFSET,
> +                                      REQUEST_HWMON_CMD0_LEN, 0,
> +                                      REQUEST_HWMON_CMD0_LEN,
> +                                      enable_buf);
> +               if (ret)
> +                       goto err;
> +
> +               if (val)
> +                       enable_buf[HWMON_FIN_EN(channel / 8)] |=3D BIT(ch=
annel % 8);
> +               else
> +                       enable_buf[HWMON_FIN_EN(channel / 8)] &=3D ~BIT(c=
hannel % 8);
> +
> +               ret =3D nct6694_write_msg(data->nct6694, REQUEST_HWMON_MO=
D,
> +                                       REQUEST_HWMON_CMD0_OFFSET,
> +                                       REQUEST_HWMON_CMD0_LEN, enable_bu=
f);
> +               if (ret)
> +                       goto err;
> +
> +               break;
> +
> +       case hwmon_fan_min:
> +               mutex_lock(&data->hwmon_lock);
> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD=
,
> +                                      REQUEST_HWMON_CMD2_OFFSET,
> +                                      REQUEST_HWMON_CMD2_LEN, 0,
> +                                      REQUEST_HWMON_CMD2_LEN, buf);
> +               if (ret)
> +                       goto err;
> +
> +               buf[HWMON_FIN_LIMIT_IDX(channel)] =3D (u8)((fan_val >> 8)=
 & 0xFF);
> +               buf[HWMON_FIN_LIMIT_IDX(channel) + 1] =3D (u8)(fan_val & =
0xFF);
> +               ret =3D nct6694_write_msg(data->nct6694, REQUEST_HWMON_MO=
D,
> +                                       REQUEST_HWMON_CMD2_OFFSET,
> +                                       REQUEST_HWMON_CMD2_LEN, buf);
> +               if (ret)
> +                       goto err;
> +
> +               break;
> +
> +       default:
> +               ret =3D -EOPNOTSUPP;
[Kalesh] If you initialize "ret =3D -EOPNOTSUPP;" during declararion,
you can just break from here.
> +               goto err;
> +       }
> +
> +err:
> +       mutex_unlock(&data->hwmon_lock);
> +       return ret;
> +}
> +
> +static int nct6694_read(struct device *dev, enum hwmon_sensor_types type=
,
> +                       u32 attr, int channel, long *val)
> +{
> +       switch (type) {
> +       case hwmon_fan: /* in RPM */
> +               return nct6694_fan_read(dev, attr, channel, val);
> +
> +       case hwmon_pwm: /* in value 0~255 */
> +               return nct6694_pwm_read(dev, attr, channel, val);
> +
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int nct6694_write(struct device *dev, enum hwmon_sensor_types typ=
e,
> +                        u32 attr, int channel, long val)
> +{
> +       switch (type) {
> +       case hwmon_fan:
> +               return nct6694_fan_write(dev, attr, channel, val);
> +       default:
> +               return -EOPNOTSUPP;
> +       }
[Kalesh] You can use simple if condition here than a switch like:
if (type !=3D hwmon_fan)
         return -EOPNOTSUPP;
return nct6694_fan_write(dev, attr, channel, val);
> +
> +       return 0;
> +}
> +
> +static umode_t nct6694_is_visible(const void *data, enum hwmon_sensor_ty=
pes type,
> +                                 u32 attr, int channel)
> +{
> +       switch (type) {
> +       case hwmon_fan:
> +               switch (attr) {
> +               case hwmon_fan_enable:
> +               case hwmon_fan_min:
> +                       return 0644;
[Kalesh] I think there is no need to leave a new line in between cases
> +
> +               case hwmon_fan_input:
> +               case hwmon_fan_min_alarm:
> +                       return 0444;
> +
> +               default:
> +                       return 0;
> +               }
> +
> +       case hwmon_pwm:
> +               switch (attr) {
> +               case hwmon_pwm_input:
> +               case hwmon_pwm_freq:
> +                       return 0444;
> +               default:
> +                       return 0;
> +               }
> +
> +       default:
> +               return 0;
> +       }
> +
> +       return 0;
[Kalesh] This return statement looks redundant as the execution never
reaches here. Same comment applies to other functions above as well.
> +}
> +
> +static const struct hwmon_ops nct6694_hwmon_ops =3D {
> +       .is_visible =3D nct6694_is_visible,
> +       .read =3D nct6694_read,
> +       .write =3D nct6694_write,
> +};
> +
> +static const struct hwmon_chip_info nct6694_chip_info =3D {
> +       .ops =3D &nct6694_hwmon_ops,
> +       .info =3D nct6694_info,
> +};
> +
> +static int nct6694_hwmon_init(struct nct6694_hwmon_data *data)
> +{
> +       unsigned char buf[REQUEST_HWMON_CMD2_LEN] =3D {0};
> +       int ret;
> +
> +       /* Set Fan input Real Time alarm mode */
> +       mutex_lock(&data->hwmon_lock);
> +       ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
> +                              REQUEST_HWMON_CMD2_OFFSET,
> +                              REQUEST_HWMON_CMD2_LEN, 0,
> +                              REQUEST_HWMON_CMD2_LEN, buf);
> +       if (ret)
> +               goto err;
[Kalesh] It would be better to rename the label as "unlock". Same
comment on other functions as well.
> +
> +       buf[HWMON_SMI_CTRL_IDX] =3D 0x02;
> +
> +       ret =3D nct6694_write_msg(data->nct6694, REQUEST_HWMON_MOD,
> +                               REQUEST_HWMON_CMD2_OFFSET,
> +                               REQUEST_HWMON_CMD2_LEN, buf);
> +       if (ret)
> +               goto err;
> +
> +err:
> +       mutex_unlock(&data->hwmon_lock);
> +       return ret;
> +}
> +
> +static int nct6694_hwmon_probe(struct platform_device *pdev)
> +{
> +       struct nct6694_hwmon_data *data;
> +       struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> +       struct device *hwmon_dev;
> +       int ret;
> +
> +       data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->nct6694 =3D nct6694;
> +       mutex_init(&data->hwmon_lock);
> +       platform_set_drvdata(pdev, data);
> +
> +       ret =3D nct6694_hwmon_init(data);
> +       if (ret)
> +               return -EIO;
> +
> +       /* Register hwmon device to HWMON framework */
> +       hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev,
> +                                                        "nct6694", data,
> +                                                        &nct6694_chip_in=
fo,
> +                                                        NULL);
> +       if (IS_ERR(hwmon_dev)) {
> +               dev_err(&pdev->dev, "%s: Failed to register hwmon device!=
\n",
> +                       __func__);
> +               return PTR_ERR(hwmon_dev);
> +       }
> +
> +       return 0;
> +}
> +
> +static struct platform_driver nct6694_hwmon_driver =3D {
> +       .driver =3D {
> +               .name   =3D DRVNAME,
> +       },
> +       .probe          =3D nct6694_hwmon_probe,
> +};
> +
> +static int __init nct6694_init(void)
> +{
> +       int err;
> +
> +       err =3D platform_driver_register(&nct6694_hwmon_driver);
> +       if (!err) {
> +               if (err)
[Kalesh] This whole check looks strange. You can simplify this function as:
return platform_driver_register(&nct6694_hwmon_driver);
> +                       platform_driver_unregister(&nct6694_hwmon_driver)=
;
> +       }
> +
> +       return err;
> +}
> +subsys_initcall(nct6694_init);
> +
> +static void __exit nct6694_exit(void)
> +{
> +       platform_driver_unregister(&nct6694_hwmon_driver);
> +}
> +module_exit(nct6694_exit);
> +
> +MODULE_DESCRIPTION("USB-HWMON driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>
>


--=20
Regards,
Kalesh A P

--00000000000052cd5c0625358497
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQiwYJKoZIhvcNAQcCoIIQfDCCEHgCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3iMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBWowggRSoAMCAQICDDfBRQmwNSI92mit0zANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAwODI5NTZaFw0yNTA5MTAwODI5NTZaMIGi
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xHzAdBgNVBAMTFkthbGVzaCBBbmFra3VyIFB1cmF5aWwxMjAw
BgkqhkiG9w0BCQEWI2thbGVzaC1hbmFra3VyLnB1cmF5aWxAYnJvYWRjb20uY29tMIIBIjANBgkq
hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxnv1Reaeezfr6NEmg3xZlh4cz9m7QCN13+j4z1scrX+b
JfnV8xITT5yvwdQv3R3p7nzD/t29lTRWK3wjodUd2nImo6vBaH3JbDwleIjIWhDXLNZ4u7WIXYwx
aQ8lYCdKXRsHXgGPY0+zSx9ddpqHZJlHwcvas3oKnQN9WgzZtsM7A8SJefWkNvkcOtef6bL8Ew+3
FBfXmtsPL9I2vita8gkYzunj9Nu2IM+MnsP7V/+Coy/yZDtFJHp30hDnYGzuOhJchDF9/eASvE8T
T1xqJODKM9xn5xXB1qezadfdgUs8k8QAYyP/oVBafF9uqDudL6otcBnziyDBQdFCuAQN7wIDAQAB
o4IB5DCCAeAwDgYDVR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZC
aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJj
YTIwMjAuY3J0MEEGCCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3Iz
cGVyc29uYWxzaWduMmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcC
ARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNV
HR8EQjBAMD6gPKA6hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNp
Z24yY2EyMDIwLmNybDAuBgNVHREEJzAlgSNrYWxlc2gtYW5ha2t1ci5wdXJheWlsQGJyb2FkY29t
LmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGP
zzAdBgNVHQ4EFgQUI3+tdStI+ABRGSqksMsiCmO9uDAwDQYJKoZIhvcNAQELBQADggEBAGfe1o9b
4wUud0FMjb/FNdc433meL15npjdYWUeioHdlCGB5UvEaMGu71QysfoDOfUNeyO9YKp0h0fm7clvo
cBqeWe4CPv9TQbmLEtXKdEpj5kFZBGmav69mGTlu1A9KDQW3y0CDzCPG2Fdm4s73PnkwvemRk9E2
u9/kcZ8KWVeS+xq+XZ78kGTKQ6Wii3dMK/EHQhnDfidadoN/n+x2ySC8yyDNvy81BocnblQzvbuB
a30CvRuhokNO6Jzh7ZFtjKVMzYas3oo6HXgA+slRszMu4pc+fRPO41FHjeDM76e6P5OnthhnD+NY
x6xokUN65DN1bn2MkeNs0nQpizDqd0QxggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25h
bFNpZ24gMiBDQSAyMDIwAgw3wUUJsDUiPdpordMwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcN
AQkEMSIEIAQVu6F7Fbsgh2O7hgqg+KcqcbRxJXxqkSheDu0Cab99MBgGCSqGSIb3DQEJAzELBgkq
hkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MTAyNDA5MjA0M1owaQYJKoZIhvcNAQkPMVwwWjAL
BglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG
9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCXgePVJX96
YcmqvjhW+nb4/AamSxSFHNxkfEdPQo/L2+fEsTt/UvSP23zeJwyOLNUaIwPi17q5ymWpC3uObXrN
nsTLH2O4UR/KNBNOsUl8urZI/oG+ivdVRKV5FlfAsgu/9NDjEU/aAAtEGjmTVb8cxudeWcCOgEF0
qpC43FAr8QcB/q6MGbY/ymb6pmIhaILMlj9TbJSW5p6vWI7sUNn9/ztCgzhcfdUINSmCMxAqQypX
5Rvz0BSbBv+eI/cvV5PYzPIA3Azl4X1KnfNy4oxgmnv05EJm9FBFb7e2eH7zVUAYZc7IE+AhU6W5
qZgvkrQElo2VNkZZ3cN+aG/2Nu/K
--00000000000052cd5c0625358497--

