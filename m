Return-Path: <linux-i2c+bounces-8928-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FF9A02725
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 14:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A2ED3A27DF
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 13:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E531DE4C9;
	Mon,  6 Jan 2025 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HONbxsFL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F06C1DE3AD;
	Mon,  6 Jan 2025 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736171502; cv=none; b=uOZXOsZYC0PvR5Lyv1WVzAXnGvkooHBTWMlPxFBPXYygj902qvg5kfH9XiWywmzML1Bc72cTQeL06G/rYSZ5IOsNUQj9ZPCurS1UbLJk/ZEJaCFcb/r6Y5Lpm4j79CIKV3mUX190u1RSN7qHI+HrKBWfTUouyxltzujuwqw4BEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736171502; c=relaxed/simple;
	bh=9cbt6uU2Bhth2rTU/9lUv7C/QAINveDuqpZQMALpw+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrRoM64VB5T8qkE/lD8MrfJLWEe66cJQVF97lHrBfU3UNZZnsgGy8FaeM2tD/6fkGRylsY322lMH+wXVnaoF6oJa//+n2Pcx5gM4c4FvZ/82kOtQWtZove49o7Rb+plWpyPUuduBvdrfP2vnI8P9VdRjPWcGeVSoJPuS/h7zhZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HONbxsFL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A32C4CED2;
	Mon,  6 Jan 2025 13:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736171501;
	bh=9cbt6uU2Bhth2rTU/9lUv7C/QAINveDuqpZQMALpw+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HONbxsFLg/rhfQfPY2XNAUUtkgHHd6FQY39p9qrZSghgbXCDIHpTLJqkq5R0q5BAW
	 m+Hxrhb9F537eMYWWN/4KpfS9KF8exdp1aWF+rChMnol8B7QoLJpbk7gNIEM1QYVXg
	 RLFp9LQpHC+a8nmb53XBLs0B36Nf1L4LFRmUAOzKVMW3CT8WYz61Lx8bRG7BGYjn8P
	 cdMsqtUbkCtnN7coiCzRvsWIBB5Blhm9PduSo92v2M7dzkY9ei999anlNp+wvMCn/y
	 AoB1Kk6NkT4NBvfQTnRAshYW1dbfaWVPDEjkTC8EKi45VjIdU4TJUA02FulbQztRgl
	 XdulCvFxpTNvA==
Date: Mon, 6 Jan 2025 13:51:35 +0000
From: Simon Horman <horms@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
Message-ID: <20250106135135.GN4068@kernel.org>
References: <20241227095727.2401257-1-a0282524688@gmail.com>
 <20241227095727.2401257-7-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227095727.2401257-7-a0282524688@gmail.com>

On Fri, Dec 27, 2024 at 05:57:26PM +0800, Ming Yu wrote:
> This driver supports Hardware monitor functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

...

> diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwmon.c

...

> +struct __packed nct6694_hwmon_alarm {
> +	u8 smi_ctrl;
> +	u8 reserved1[15];
> +	struct {
> +		u8 hl;
> +		u8 ll;
> +	} vin_limit[16];
> +	struct {
> +		u8 hyst;
> +		s8 hl;
> +	} tin_cfg[32];
> +	__be16 fin_ll[10];
> +	u8 reserved2[4];
> +};

...

> +union nct6694_hwmon_rpt {
> +	u8 vin;
> +	struct {
> +		u8 msb;
> +		u8 lsb;
> +	} tin;
> +	__be16 fin;
> +	u8 pwm;
> +	u8 status;
> +};
> +
> +union nct6694_hwmon_msg {
> +	struct nct6694_hwmon_control hwmon_ctrl;
> +	struct nct6694_hwmon_alarm hwmon_alarm;
> +	struct nct6694_pwm_control pwm_ctrl;
> +};
> +
> +struct nct6694_hwmon_data {
> +	struct nct6694 *nct6694;
> +	struct mutex lock;
> +	struct nct6694_hwmon_control hwmon_en;
> +	union nct6694_hwmon_rpt *rpt;
> +	union nct6694_hwmon_msg *msg;
> +};

...

> +static int nct6694_pwm_read(struct device *dev, u32 attr, int channel,
> +			    long *val)
> +{
> +	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
> +	unsigned char pwm_en;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	switch (attr) {
> +	case hwmon_pwm_enable:
> +		pwm_en = data->hwmon_en.pwm_en[channel / 8];
> +		*val = !!(pwm_en & BIT(channel % 8));
> +
> +		return 0;
> +	case hwmon_pwm_input:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> +				       NCT6694_PWM_IDX(channel),
> +				       sizeof(data->rpt->fin),
> +				       &data->rpt->fin);
> +		if (ret)
> +			return ret;
> +
> +		*val = data->rpt->fin;

Hi Ming Yu,

*val is host byte order, but fin is big endian.
Elsewhere in this patch this seems to be handled using,
which looks correct to me:

		*val = be16_to_cpu(data->rpt->fin);

Flagged by Sparse.

> +
> +		return 0;
> +	case hwmon_pwm_freq:
> +		*val = NCT6694_FREQ_FROM_REG(data->hwmon_en.pwm_freq[channel]);
> +
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}

...

> +static int nct6694_fan_write(struct device *dev, u32 attr, int channel,
> +			     long val)
> +{
> +	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	switch (attr) {
> +	case hwmon_fan_enable:
> +		if (val == 0)
> +			data->hwmon_en.fin_en[channel / 8] &= ~BIT(channel % 8);
> +		else if (val == 1)
> +			data->hwmon_en.fin_en[channel / 8] |= BIT(channel % 8);
> +		else
> +			return -EINVAL;
> +
> +		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
> +					 NCT6694_HWMON_CONTROL,
> +					 sizeof(data->msg->hwmon_ctrl),
> +					 &data->hwmon_en);
> +	case hwmon_fan_min:
> +		ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
> +				       NCT6694_HWMON_ALARM,
> +				       sizeof(data->msg->hwmon_alarm),
> +				       &data->msg->hwmon_alarm);
> +		if (ret)
> +			return ret;
> +
> +		val = clamp_val(val, 1, 65535);
> +		data->msg->hwmon_alarm.fin_ll[channel] = (u16)cpu_to_be16(val);

cpu_to_be16() returns a 16bit big endian value.
And, AFAIKT, the type of data->msg->hwmon_alarm.fin_ll[channel] is __be16.

So the cast above seems both unnecessary and misleading.

Also flagged by Sparse,

> +
> +		return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD,
> +					 NCT6694_HWMON_ALARM,
> +					 sizeof(data->msg->hwmon_alarm),
> +					 &data->msg->hwmon_alarm);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}

...

