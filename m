Return-Path: <linux-i2c+bounces-7606-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F0A9B18A6
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 16:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0E71B21E6B
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 14:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AD118AEA;
	Sat, 26 Oct 2024 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1ta72/t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9C28BE7;
	Sat, 26 Oct 2024 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729953742; cv=none; b=NZKj4tX9zKxLr/BoxopXBpZpLyvjEj4IpTV3carZ4ns+OUB/anOH3YN5qAVnvZb0ZOHEbjogihkfI+W/fXzs9ILNbCeLIj0cngUYLfYlrrDBZscA3MNTKRthl195f+MsqwFhKsvfDTQXSK0/bf9BOLxCqg6lf5m/W3v5Gerjr4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729953742; c=relaxed/simple;
	bh=kJLb/7qKxg51UDFL7vVw7ZRE/Ii9wbcrd9Hmsz+StWw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=urR0VSKr5Nyu2HwzU4X1xCmVaUekKWJd0f38uW0nqE1hoEg1EECnZgQAQpv2+u9sjlHbu8/uQNzNH8R/WAXSDBY+abUXlk6mZ5rf0ggFwH5H+YpS2g/rQsz8YjP16LfA+lNipFXSeUZNYX0h85x6Bw+EuT1hRwBy4vr602lirQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1ta72/t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B35C4CEC6;
	Sat, 26 Oct 2024 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729953741;
	bh=kJLb/7qKxg51UDFL7vVw7ZRE/Ii9wbcrd9Hmsz+StWw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y1ta72/tZ/POjQgIho6jPB6LNm0u1YttInsoLA2qX2IcNo6zmu67ALnovUrrtVK64
	 SckZuck5DnedZveYtM5+qe8G5uRc6TVPXQ6ClgQRjmrDncUtipUqYcFe+1C5KnyZ4j
	 doXEdVq9yHKc9slPocqM8tRKOzneOod5FqB7Uq5s33U6N/oSm934W1XJu1hdpagzC+
	 qhww+VkmJtdp8xI/ZFvUo5gT8PcS4LSDp/XNVKG71C7U1qcGCxqW0md3nZttDDiNyw
	 DmRIdqavWzZYy7Z0Y1gw5t3VWo8HCC/oQbJeYABdcMMOes5JEgkZOKeZODQlsT3S9P
	 qkcJG6KI46MwA==
Date: Sat, 26 Oct 2024 15:41:13 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
 mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com,
 lars@metafoo.de, ukleinek@kernel.org, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 7/9] iio: adc: Add Nuvoton NCT6694 IIO support
Message-ID: <20241026154113.66fe0324@jic23-huawei>
In-Reply-To: <20241024085922.133071-8-tmyu0@nuvoton.com>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
	<20241024085922.133071-8-tmyu0@nuvoton.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Oct 2024 16:59:20 +0800
Ming Yu <a0282524688@gmail.com> wrote:

> This driver supports IIO functionality for NCT6694 MFD device
> based on USB interface.
> 
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
Hi Ming Yu,

Welcome to IIO.

Various comments inline.  I'm assuming the stuff commented on in other
reviews for other parts of the driver will be fixed up in v2 of this
patch as well so mostly haven't duplicated that.

Jonathan


> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 6c4e74420fd2..302511d166db 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1018,6 +1018,16 @@ config NPCM_ADC
>  	  This driver can also be built as a module. If so, the module
>  	  will be called npcm_adc.
>  
> +config NCT6694_ADC
Same comment on ordering.

> +	tristate "Nuvoton NCT6694 ADC driver"
> +	depends on MFD_NCT6694
> +	help
Match formatting of other entries. Help text should be indented.

> +	If you say yes to this option, support will be included for Nuvoton
> +	NCT6694, a USB device to ADC.
> +
> +	This driver can also be built as a module. If so, the module
> +	will be called nct6694_adc.
> +
>  config PAC1921
>  	tristate "Microchip Technology PAC1921 driver"
>  	depends on I2C
> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index 7b91cd98c0e0..db419f77365c 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -92,6 +92,7 @@ obj-$(CONFIG_MP2629_ADC) += mp2629_adc.o
>  obj-$(CONFIG_MXS_LRADC_ADC) += mxs-lradc-adc.o
>  obj-$(CONFIG_NAU7802) += nau7802.o
>  obj-$(CONFIG_NPCM_ADC) += npcm_adc.o
> +obj-$(CONFIG_NCT6694_ADC) += nct6694_adc.o
Alphabetical order. So one line up is appropriate.

>  obj-$(CONFIG_PAC1921) += pac1921.o
>  obj-$(CONFIG_PAC1934) += pac1934.o
>  obj-$(CONFIG_PALMAS_GPADC) += palmas_gpadc.o
> diff --git a/drivers/iio/adc/nct6694_adc.c b/drivers/iio/adc/nct6694_adc.c
> new file mode 100644
> index 000000000000..de4cddc8addc
> --- /dev/null
> +++ b/drivers/iio/adc/nct6694_adc.c
> @@ -0,0 +1,616 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 IIO driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/iio/iio.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/nct6694.h>
> +
> +#define DRVNAME "nct6694-iio"

Use string directly inline and drop this define. Whilst common this is
not helpful for code readability or for grepping etc.

({ typeof(x) x_ = x;		\
> +	   (x_ < 10) ? x_ : x_ + 6; })
> +
> +/* Message Channel*/
> +/* Command 00h */
> +#define REQUEST_IIO_CMD0_LEN	0x40
> +#define REQUEST_IIO_CMD0_OFFSET 0x0000	/* OFFSET = SEL|CMD */
> +#define IIO_VIN_EN(x)		(0x00 + (x))
> +#define IIO_TMP_EN(x)		(0x02 + (x))
> +/* Command 02h */
> +#define REQUEST_IIO_CMD2_LEN	0x90
> +#define REQUEST_IIO_CMD2_OFFSET 0x0002	/* OFFSET = SEL|CMD */
> +#define IIO_SMI_CTRL_IDX	0x00
> +#define IIO_VIN_LIMIT_IDX(x)	(0x10 + ((x) * 2))
> +#define IIO_TMP_LIMIT_IDX(x)	(0x30 + ((x) * 2))
> +#define IIO_CMD2_HYST_MASK	0x1F
> +/* Command 03h */
> +#define REQUEST_IIO_CMD3_LEN	0x08
> +#define REQUEST_IIO_CMD3_OFFSET 0x0003	/* OFFSET = SEL|CMD */
> +
Namespace for the part,
	NCT6694_REQUEST_CMD3_LEN etc

the IIO bit isn't particularly useful in an IIO driver.

> +struct nct6694_iio_data {
> +	struct nct6694 *nct6694;
> +
> +	/* Make sure read & write commands are consecutive */
> +	struct mutex iio_lock;
Not sure the iio part is useful here. Name it after what is being
protected or just call it lock

> +};
> +
> +static const struct iio_event_spec nct6694_volt_events[] = {
> +	{
> +		.type = IIO_EV_TYPE_THRESH,
> +		.dir = IIO_EV_DIR_RISING,
> +		.mask_separate = BIT(IIO_EV_INFO_VALUE) |
> +				 BIT(IIO_EV_INFO_ENABLE),
> +	},
> +	{
> +		.type = IIO_EV_TYPE_THRESH,
> +		.dir = IIO_EV_DIR_FALLING,
> +		.mask_separate = BIT(IIO_EV_INFO_VALUE) |
> +				 BIT(IIO_EV_INFO_ENABLE),
> +	}
> +};
> +
> +static const struct iio_event_spec nct6694_temp_events[] = {
> +	{
> +		.type = IIO_EV_TYPE_THRESH,
> +		.dir = IIO_EV_DIR_RISING,
> +		.mask_separate = BIT(IIO_EV_INFO_VALUE) |
> +				 BIT(IIO_EV_INFO_ENABLE),
> +	}
> +};
> +
> +#define NCT6694_VOLTAGE_CHANNEL(num, addr) {			\
> +	.type = IIO_VOLTAGE,					\
> +	.indexed = 1,						\
> +	.channel = num,						\
> +	.address = addr,					\
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_ENABLE) |	\

ADC channels do not normally ENABLE.  Can you not enable on demand
when the channel is read?

> +			      BIT(IIO_CHAN_INFO_PROCESSED),	\
It is very rare to have processed channels for an ADC.
Provide RAW and SCALE instead as the relationship seems to be linear
and that pushes the maths to the consumer (who may not care).
The main reason for this design choice in IIO is that the _RAW data
tends to be easier to back if you add buffered access in future.


> +	.event_spec = nct6694_volt_events,			\
> +	.num_event_specs = ARRAY_SIZE(nct6694_volt_events),	\
> +}
> +
> +#define NCT6694_TEMPERATURE_CHANNEL(num, addr) {		\
> +	.type = IIO_TEMP,					\
> +	.indexed = 1,						\
> +	.channel = num,						\
> +	.address = addr,					\
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_ENABLE) |	\
As with ADCs, unusual to see ENABLE for a temperature channel.
Can we not do this on demand?

> +			      BIT(IIO_CHAN_INFO_PROCESSED) |	\
As above, provide _RAW and _SCALE (and maybe _OFFSET)


> +			      BIT(IIO_CHAN_INFO_HYSTERESIS),	\
I ask about this below. Not sure what it is.

> +	.event_spec = nct6694_temp_events,			\
> +	.num_event_specs = ARRAY_SIZE(nct6694_temp_events),	\
> +}
> +
> +static const struct iio_chan_spec nct6694_iio_channels[] = {
> +	NCT6694_VOLTAGE_CHANNEL(0, 0x0),	/* VIN0 */
Set datasheet_name.  That is both useful when binding to these channels
and will make the comments here unnecessary (as that name will be
in the macro parameters).

> +	NCT6694_VOLTAGE_CHANNEL(1, 0x1),	/* VIN1 */
> +	NCT6694_VOLTAGE_CHANNEL(2, 0x2),	/* VIN2 */
> +	NCT6694_VOLTAGE_CHANNEL(3, 0x3),	/* VIN3 */
> +	NCT6694_VOLTAGE_CHANNEL(4, 0x4),	/* VIN5 */
> +	NCT6694_VOLTAGE_CHANNEL(5, 0x5),	/* VIN6 */
> +	NCT6694_VOLTAGE_CHANNEL(6, 0x6),	/* VIN7 */
> +	NCT6694_VOLTAGE_CHANNEL(7, 0x7),	/* VIN14 */
> +	NCT6694_VOLTAGE_CHANNEL(8, 0x8),	/* VIN15 */
> +	NCT6694_VOLTAGE_CHANNEL(9, 0x9),	/* VIN16 */
> +	NCT6694_VOLTAGE_CHANNEL(10, 0xA),	/* VBAT */
> +	NCT6694_VOLTAGE_CHANNEL(11, 0xB),	/* VSB */
> +	NCT6694_VOLTAGE_CHANNEL(12, 0xC),	/* AVSB */
> +	NCT6694_VOLTAGE_CHANNEL(13, 0xD),	/* VCC */
> +	NCT6694_VOLTAGE_CHANNEL(14, 0xE),	/* VHIF */
> +	NCT6694_VOLTAGE_CHANNEL(15, 0xF),	/* VTT */
> +
> +	NCT6694_TEMPERATURE_CHANNEL(0, 0x10),	/* THR1 */
> +	NCT6694_TEMPERATURE_CHANNEL(1, 0x12),	/* THR2 */
> +	NCT6694_TEMPERATURE_CHANNEL(2, 0x14),	/* THR14 */
> +	NCT6694_TEMPERATURE_CHANNEL(3, 0x16),	/* THR15 */
> +	NCT6694_TEMPERATURE_CHANNEL(4, 0x18),	/* THR16 */
> +	NCT6694_TEMPERATURE_CHANNEL(5, 0x1A),	/* TDP0 */
> +	NCT6694_TEMPERATURE_CHANNEL(6, 0x1C),	/* TDP1 */
> +	NCT6694_TEMPERATURE_CHANNEL(7, 0x1E),	/* TDP2 */
> +	NCT6694_TEMPERATURE_CHANNEL(8, 0x20),	/* TDP3 */
> +	NCT6694_TEMPERATURE_CHANNEL(9, 0x22),	/* TDP4 */
> +
> +	NCT6694_TEMPERATURE_CHANNEL(10, 0x30),	/* DTIN0 */
> +	NCT6694_TEMPERATURE_CHANNEL(11, 0x32),	/* DTIN1 */
> +	NCT6694_TEMPERATURE_CHANNEL(12, 0x34),	/* DTIN2 */
> +	NCT6694_TEMPERATURE_CHANNEL(13, 0x36),	/* DTIN3 */
> +	NCT6694_TEMPERATURE_CHANNEL(14, 0x38),	/* DTIN4 */
> +	NCT6694_TEMPERATURE_CHANNEL(15, 0x3A),	/* DTIN5 */
> +	NCT6694_TEMPERATURE_CHANNEL(16, 0x3C),	/* DTIN6 */
> +	NCT6694_TEMPERATURE_CHANNEL(17, 0x3E),	/* DTIN7 */
> +	NCT6694_TEMPERATURE_CHANNEL(18, 0x40),	/* DTIN8 */
> +	NCT6694_TEMPERATURE_CHANNEL(19, 0x42),	/* DTIN9 */
> +	NCT6694_TEMPERATURE_CHANNEL(20, 0x44),	/* DTIN10 */
> +	NCT6694_TEMPERATURE_CHANNEL(21, 0x46),	/* DTIN11 */
> +	NCT6694_TEMPERATURE_CHANNEL(22, 0x48),	/* DTIN12 */
> +	NCT6694_TEMPERATURE_CHANNEL(23, 0x4A),	/* DTIN13 */
> +	NCT6694_TEMPERATURE_CHANNEL(24, 0x4C),	/* DTIN14 */
> +	NCT6694_TEMPERATURE_CHANNEL(25, 0x4E),	/* DTIN15 */
> +};
> +
> +static int nct6694_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct nct6694_iio_data *data = iio_priv(indio_dev);
> +	unsigned char buf[2], tmp_hyst, enable_idx;
> +	int ret;
> +
> +	if (chan->type != IIO_VOLTAGE && chan->type != IIO_TEMP)
> +		return -EOPNOTSUPP;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_ENABLE:
> +		switch (chan->type) {
> +		case IIO_VOLTAGE:
> +			enable_idx = IIO_VIN_EN(chan->channel / 8);
> +			break;
> +
> +		case IIO_TEMP:
> +			enable_idx = IIO_TMP_EN(chan->channel / 8);
> +			break;
> +
> +		default:
> +			return -EINVAL;
> +		}
> +		ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
> +				       REQUEST_IIO_CMD0_OFFSET,
> +				       REQUEST_IIO_CMD0_LEN, enable_idx,
> +				       1, buf);
> +		if (ret)
> +			return -EINVAL;
> +
> +		*val = buf[0] & BIT(chan->channel % 8) ? 1 : 0;
> +
> +		return IIO_VAL_INT;
> +
> +	case IIO_CHAN_INFO_PROCESSED:

Commented on elsewhere - provide _RAW access as processed is only needed
when there is a nonlinear conversion involved that we cannot easily
represent to userspace.

> +		ret = nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
> +				       chan->address, 2, 0, 2, buf);
> +		if (ret)
> +			return -EINVAL;
> +
> +		switch (chan->type) {
> +		case IIO_VOLTAGE:	/* in micro Voltage */
> +			*val = buf[0] * 16;
> +
> +			return IIO_VAL_INT;
> +
> +		case IIO_TEMP:	/* in milli degrees Celsius */
> +			*val = (signed char)buf[0] * 1000;
> +			*val += buf[1] & 0x80 ? 500 : 0;
> +			*val += buf[1] & 0x40 ? 250 : 0;
> +			*val += buf[1] & 0x20 ? 125 : 0;
As above provide attrs to allow (_RAW + _OFFSET) * _SCALE for
userspace. 

I'm not sure what this maths is doing but looks like a really
odd way to encode  *val += 125 * FIELD_GET(buf[1], GENMASK(7, 5))
or something like that.
> +
> +			return IIO_VAL_INT;
> +
> +		default:
> +			return -EINVAL;
> +		}
> +
> +	case IIO_CHAN_INFO_HYSTERESIS:
> +		ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
> +				       REQUEST_IIO_CMD2_OFFSET,
> +				       REQUEST_IIO_CMD2_LEN,
> +				       IIO_TMP_LIMIT_IDX(chan->channel),
> +				       2, buf);
> +		if (ret)
> +			return -EINVAL;
> +
> +		switch (chan->type) {
> +		case IIO_TEMP:	/* in milli degrees Celsius */

Check channel type earlier as no point in reading if it's not temperature.

As mentioned elsewhere I'm a little confused as to what this is.


> +			tmp_hyst = buf[0] >> 5;
> +			*val = (buf[1] - tmp_hyst) * 1000;
> +
> +			return IIO_VAL_INT;
> +
> +		default:
> +			return -EINVAL;
> +		}
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int nct6694_write_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int val, int val2, long mask)
> +{
> +	struct nct6694_iio_data *data = iio_priv(indio_dev);
> +	unsigned char enable_buf[REQUEST_IIO_CMD0_LEN] = {0};
> +	unsigned char buf[REQUEST_IIO_CMD2_LEN] = {0};
> +	unsigned char delta_hyst;
> +	int ret;
> +
> +	if (chan->type != IIO_VOLTAGE && chan->type != IIO_TEMP)
> +		return -EOPNOTSUPP;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_ENABLE:

This is very unusual for an ADC channel. 
You should not have explicit enable /disable but rather just do it when
needed to deliver requested data.

> +		mutex_lock(&data->iio_lock);

Add some scope with { } and use guard(mutex)(...) within it. 
Then you can just return on error rather than goto.

> +		ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
> +				       REQUEST_IIO_CMD0_OFFSET,
> +				       REQUEST_IIO_CMD0_LEN, 0,
> +				       REQUEST_IIO_CMD0_LEN,
> +				       enable_buf);
> +		if (ret)
> +			goto err;
> +
> +		switch (chan->type) {
> +		case IIO_VOLTAGE:
> +			if (val) {
> +				enable_buf[IIO_VIN_EN(chan->channel / 8)] |=
> +				BIT(chan->channel % 8);

Indent this line by one more tab. Sam ein other similar cases.

> +			} else {
> +				enable_buf[IIO_VIN_EN(chan->channel / 8)] &=
> +				~BIT(chan->channel % 8);
> +			}
> +
> +			break;
> +
> +		case IIO_TEMP:
> +			if (val) {
> +				enable_buf[IIO_TMP_EN(chan->channel / 8)] |=
> +				BIT(chan->channel % 8);
> +			} else {
> +				enable_buf[IIO_TMP_EN(chan->channel / 8)] &=
> +				~BIT(chan->channel % 8);
> +			}
> +
> +			break;
> +
> +		default:
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
> +		ret = nct6694_write_msg(data->nct6694, REQUEST_IIO_MOD,
> +					REQUEST_IIO_CMD0_OFFSET,
> +					REQUEST_IIO_CMD0_LEN, enable_buf);
> +		if (ret)
> +			goto err;
> +
> +		break;
> +
> +	case IIO_CHAN_INFO_HYSTERESIS:

Hysteresis for an ADC is normally event related as it doesn't have obvious meaning otherwise.
Perhaps you can give more detail on what this is, and why it isn't IIO_EV_INFO_HYSTERESIS and
in the event description.

> +		switch (chan->type) {
> +		case IIO_TEMP:
> +			mutex_lock(&data->iio_lock);
> +			ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
> +					       REQUEST_IIO_CMD2_OFFSET,
> +					       REQUEST_IIO_CMD2_LEN, 0,
> +					       REQUEST_IIO_CMD2_LEN, buf);
> +			if (ret)
> +				goto err;
> +
> +			delta_hyst = buf[IIO_TMP_LIMIT_IDX(chan->channel) + 1] - (u8)val;
> +			if (delta_hyst > 7) {
> +				pr_err("%s: The Hysteresis value must be less than 7!\n",
> +				       __func__);
> +				ret = -EINVAL;
> +				goto err;
> +			}
> +
> +			buf[IIO_TMP_LIMIT_IDX(chan->channel)] &= IIO_CMD2_HYST_MASK;
> +			buf[IIO_TMP_LIMIT_IDX(chan->channel)] |= (delta_hyst << 5);
> +			break;
> +
> +		default:
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +		ret = nct6694_write_msg(data->nct6694, REQUEST_IIO_MOD,
> +					REQUEST_IIO_CMD2_OFFSET,
> +					REQUEST_IIO_CMD2_LEN, buf);
> +		if (ret)
> +			goto err;
> +
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +err:
> +	mutex_unlock(&data->iio_lock);
> +	return ret;
> +}


> +
> +static int nct6694_write_event_value(struct iio_dev *indio_dev,
> +				     const struct iio_chan_spec *chan,
> +				     enum iio_event_type type,
> +				     enum iio_event_direction dir,
> +				     enum iio_event_info info,
> +				     int val, int val2)
> +{
> +	struct nct6694_iio_data *data = iio_priv(indio_dev);
> +	unsigned char buf[REQUEST_IIO_CMD2_LEN] = {0};
> +	int ret;
> +
> +	if (chan->type != IIO_VOLTAGE && chan->type != IIO_TEMP)
> +		return -EOPNOTSUPP;
> +
> +	mutex_lock(&data->iio_lock);
guard(mutex)(&data->iio_lock);
and direct returns in error paths.


> +	ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
> +			       REQUEST_IIO_CMD2_OFFSET,
> +			       REQUEST_IIO_CMD2_LEN, 0,
> +			       REQUEST_IIO_CMD2_LEN, buf);
> +	if (ret)
	With guard() as above, can return here instead of goto.

> +		goto err;
> +
> +	switch (dir) {
> +	case IIO_EV_DIR_RISING:
> +		switch (chan->type) {
> +		case IIO_VOLTAGE:
> +			buf[IIO_VIN_LIMIT_IDX(chan->channel)] = (u8)val;

Check range of val before using it. That goes directly from userspace.
Also check val2 == 0 as user might have provided a decimal form.


> +			break;
> +
> +		case IIO_TEMP:
> +			buf[IIO_TMP_LIMIT_IDX(chan->channel) + 1] = (s8)val;
> +			break;
> +
> +		default:
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +		break;
> +
> +	case IIO_EV_DIR_FALLING:
> +		switch (chan->type) {
> +		case IIO_VOLTAGE:
> +			buf[IIO_VIN_LIMIT_IDX(chan->channel) + 1] = (u8)val;
> +			break;
> +
> +		default:
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	ret = nct6694_write_msg(data->nct6694, REQUEST_IIO_MOD,
> +				REQUEST_IIO_CMD2_OFFSET,
> +				REQUEST_IIO_CMD2_LEN, buf);
> +	if (ret)
> +		goto err;
> +
> +err:
> +	mutex_unlock(&data->iio_lock);

With guard above can drop the explicit lock as it is then managed with the scope.

> +	return ret;
> +}
> +
> +static const struct iio_info nct6694_iio_info = {
> +	.read_raw = nct6694_read_raw,
> +	.write_raw = nct6694_write_raw,
> +	.read_event_config = nct6694_read_event_config,

No ability to disable the event?  That is unusual.

> +	.read_event_value = nct6694_read_event_value,
> +	.write_event_value = nct6694_write_event_value,
> +};
> +
> +static int nct6694_iio_init(struct nct6694_iio_data *data)
> +{
> +	unsigned char buf[REQUEST_IIO_CMD2_LEN] = {0};
{};

Has the same effect and makes it clear you just want to clear everything.

> +	int ret;
> +
> +	/* Set VIN & TMP Real Time alarm mode */
> +	mutex_lock(&data->iio_lock);

	guard(mutex)(&data->iio_lock);

> +	ret = nct6694_read_msg(data->nct6694, REQUEST_IIO_MOD,
> +			       REQUEST_IIO_CMD2_OFFSET,
> +			       REQUEST_IIO_CMD2_LEN, 0,
> +			       REQUEST_IIO_CMD2_LEN, buf);
> +	if (ret)

With guard() in use, can return directly instead of the goto.

> +		goto err;
> +
> +	buf[IIO_SMI_CTRL_IDX] = 0x02;
> +	ret = nct6694_write_msg(data->nct6694, REQUEST_IIO_MOD,
> +				REQUEST_IIO_CMD2_OFFSET,
> +				REQUEST_IIO_CMD2_LEN, buf);
> +	if (ret)
> +		goto err;
> +
> +err:
> +	mutex_unlock(&data->iio_lock);
> +	return ret;
> +}
> +
> +static int nct6694_iio_probe(struct platform_device *pdev)
> +{
> +	struct iio_dev *indio_dev;
> +	struct nct6694_iio_data *data;
> +	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*data));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	data = iio_priv(indio_dev);
> +	data->nct6694 = nct6694;
> +	mutex_init(&data->iio_lock);
> +	platform_set_drvdata(pdev, data);
Not used, so don't set it.

> +
> +	ret = nct6694_iio_init(data);
> +	if (ret)
> +		return -EIO;
> +
> +	indio_dev->name = pdev->name;

Name should be the part number.  Just encode the string here as "nct6694"

> +	indio_dev->channels = nct6694_iio_channels;
> +	indio_dev->num_channels = ARRAY_SIZE(nct6694_iio_channels);
> +	indio_dev->info = &nct6694_iio_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +
> +	/* Register iio device to IIO framework */
> +	ret = devm_iio_device_register(&pdev->dev, indio_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register iio device!\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver nct6694_iio_driver = {
> +	.driver = {
> +		.name	= DRVNAME,
Put the string inline.

> +	},
> +	.probe		= nct6694_iio_probe,
> +};
> +
> +static int __init nct6694_init(void)
> +{
> +	int err;
> +
> +	err = platform_driver_register(&nct6694_iio_driver);
> +	if (!err) {
> +		if (err)
> +			platform_driver_unregister(&nct6694_iio_driver);
> +	}
> +
> +	return err;
> +}
> +subsys_initcall(nct6694_init);
> +
> +static void __exit nct6694_exit(void)
> +{
> +	platform_driver_unregister(&nct6694_iio_driver);
> +}
> +module_exit(nct6694_exit);
I'll not comment on this handling as it is will covered in other
parts of the series.

> +
> +MODULE_DESCRIPTION("USB-IIO driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");


