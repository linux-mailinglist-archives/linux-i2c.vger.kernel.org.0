Return-Path: <linux-i2c+bounces-9199-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE10A1C6B2
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jan 2025 08:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32F863A7102
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jan 2025 07:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54B213A265;
	Sun, 26 Jan 2025 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="DNlKtnZz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-17.smtpout.orange.fr [193.252.22.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EC27081C;
	Sun, 26 Jan 2025 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737877462; cv=none; b=Dwre2BufOyE7djhG++X3UpT0oWe2I+1mg9Q9krgScC1BATsmYMTpNRTYmpf82Tzf+k5pHyL9oa3Bz04bC0QgMaxoKZDhcp1sbQ+LgMG1vQn2wqBuwfJvzn77hdy6wlZ1gVz2XEYgYbSMo3dytyimWYabbQVjIgL9o5dkB+NtIGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737877462; c=relaxed/simple;
	bh=1OVy6Lem4f1Vg/Yf9kU/VmQgIy/Z0Q8dDr+dpKSJSKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3H6QnYuWaGvbU/9VrIIrga1UCEN/PUk+yRFyc4NFbmfOZ45zODvyDklnnAlNEEBEOKfwqmGM9GE1q63EVSbGzEsdBR1hvXIfFUY1Zp8+0vGde18nOpN3pomK5Qt3VOzhFJESxv7lQPgpSo8Qkxv79QZLh82+V6wT6acAFVjyVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=DNlKtnZz; arc=none smtp.client-ip=193.252.22.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id bxIBttXPnw9eWbxIGtuSz9; Sun, 26 Jan 2025 08:43:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737877389;
	bh=iJFajcXa1FrZHaKdnu3kC7HPgn0SCPMstJG73iEZNgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=DNlKtnZzphkCOkjZUQfGGdua4csAoe5hF/0CLWiAIvUTWbmpSWiW4bFUjqvmzeuFD
	 Bc7NI7bMhmjnJj1ita3Z5XZg6qFwyYm9G9TjFQWSwbTnFzdx2j8YEwScgx31gsyJMx
	 UmpUJGgImMFHFi5sGCh8+3swkUYYsIFEzV+sZB/BEomzfwDugfTkxI+Z+TwlXezFAx
	 jcdsL+7b/674caqylux5c+13LDCzJG7FZDsdu7KVTnGScdKWaHv+nq1m0dT4X7ZJJu
	 ooG5N/dHYMiDCLItUcvzu2QuerjO8AdqIDh5o2NLXWClg/aCxHS7dtfslGZH5Ll/g7
	 YZwXSHTL5TapA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 Jan 2025 08:43:09 +0100
X-ME-IP: 124.33.176.97
Message-ID: <c1cbb337-9ca5-4071-b05a-a97ab451f358@wanadoo.fr>
Date: Sun, 26 Jan 2025 16:42:50 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
 linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250123091115.2079802-1-a0282524688@gmail.com>
 <20250123091115.2079802-7-a0282524688@gmail.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20250123091115.2079802-7-a0282524688@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2025 at 18:11, Ming Yu wrote:
> This driver supports Hardware monitor functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> ---

(...)

> +static int nct6694_temp_write(struct device *dev, u32 attr, int channel,
> +			      long val)
> +{
> +	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
> +	struct nct6694_cmd_header cmd_hd;
> +	unsigned char temp_hyst;
> +	signed char temp_max;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	switch (attr) {
> +	case hwmon_temp_enable:
> +		if (val == 0)
> +			data->hwmon_en.tin_en[channel / 8] &= ~BIT(channel % 8);
> +		else if (val == 1)
> +			data->hwmon_en.tin_en[channel / 8] |= BIT(channel % 8);
> +		else
> +			return -EINVAL;
> +
> +		cmd_hd = (struct nct6694_cmd_header) {
> +			.mod = NCT6694_HWMON_MOD,
> +			.cmd = NCT6694_HWMON_CONTROL,
> +			.sel = NCT6694_HWMON_CONTROL_SEL,
> +			.len = cpu_to_le16(sizeof(data->hwmon_en))
> +		};
> +
> +		return nct6694_write_msg(data->nct6694, &cmd_hd,
> +					 &data->hwmon_en);
> +	case hwmon_temp_max:
> +		cmd_hd = (struct nct6694_cmd_header) {
> +			.mod = NCT6694_HWMON_MOD,
> +			.cmd = NCT6694_HWMON_ALARM,
> +			.sel = NCT6694_HWMON_ALARM_SEL,
> +			.len = cpu_to_le16(sizeof(data->msg->hwmon_alarm))
> +		};
> +		ret = nct6694_read_msg(data->nct6694, &cmd_hd,
> +				       &data->msg->hwmon_alarm);
> +		if (ret)
> +			return ret;
> +
> +		val = clamp_val(val, -127000, 127000);
> +		data->msg->hwmon_alarm.tin_cfg[channel].hl = temp_to_reg(val);
> +
> +		return nct6694_write_msg(data->nct6694, &cmd_hd,
> +					 &data->msg->hwmon_alarm);
> +	case hwmon_temp_max_hyst:
> +		cmd_hd = (struct nct6694_cmd_header) {
> +			.mod = NCT6694_HWMON_MOD,
> +			.cmd = NCT6694_HWMON_ALARM,
> +			.sel = NCT6694_HWMON_ALARM_SEL,
> +			.len = cpu_to_le16(sizeof(data->msg->hwmon_alarm))
> +		};
> +		ret = nct6694_read_msg(data->nct6694, &cmd_hd,
> +				       &data->msg->hwmon_alarm);
> +
> +		val = clamp_val(val, -127000, 127000);
> +		temp_max = data->msg->hwmon_alarm.tin_cfg[channel].hl;
> +		temp_hyst = temp_max - temp_to_reg(val);
> +		temp_hyst = clamp_val(temp_hyst, 0, 7);

temp_hyst is unsigned. It can not be smaller than zero. No need for
clamp(), using min here is sufficient.

> +		data->msg->hwmon_alarm.tin_cfg[channel].hyst =
> +			(data->msg->hwmon_alarm.tin_cfg[channel].hyst & ~NCT6694_TIN_HYST_MASK) |
> +			FIELD_PREP(NCT6694_TIN_HYST_MASK, temp_hyst);
> +
> +		return nct6694_write_msg(data->nct6694, &cmd_hd,
> +					 &data->msg->hwmon_alarm);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}

(...)

Yours sincerely,
Vincent Mailhol


