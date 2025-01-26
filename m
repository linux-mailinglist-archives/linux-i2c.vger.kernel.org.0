Return-Path: <linux-i2c+bounces-9203-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 204D2A1C7E5
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jan 2025 14:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6536C7A30EB
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jan 2025 13:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C96136326;
	Sun, 26 Jan 2025 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyp/O8o3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB025A65D;
	Sun, 26 Jan 2025 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737897499; cv=none; b=BhkhD/YbLTpKmTkXnHu2svSp0uEyt/ZzUOGqmMNba9IsK1QiJOI94pJsfsHW/OGCwX/e60uDJU0FMfzu9VN7Wng/zlKpW1G+WluqE2rxU+mVUUD0LcHpT91nsdkxRnX2X3NgnjlUq+SU7t5t3FPgdgAl5MNcvLXWg3JMof6v2wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737897499; c=relaxed/simple;
	bh=mG3KC8E87HrVYVrx+3h1eyt0R0jzL5dqBps/ZIaD4TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HS9/LVew1bGAUQAr/p2DziItvQKcqLPr/oJvPjTMLDxFPctmWT8U2ORzH/AvQTx7uOCH93ELnjwEGOONJBmbXgDbFxr6lTnxLCH0B//upr6QqFACaeecqoLotbZUWPRmspU8SO0YJ9VQvLjQpVtrmsld5WqhF3Utdhx3Bl2V5K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyp/O8o3; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2161eb94cceso42551045ad.2;
        Sun, 26 Jan 2025 05:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737897496; x=1738502296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QLoVlx6oEIPZAT8q+IhaVOvydmmsMymu4vL1n+j7EdA=;
        b=dyp/O8o3pDnRI5O+GH8p/2mJ+g2C9G03YHQVh11jsDgF5TmL2uQtHnSQIari/PpPCX
         Qw0eL6B4OHvypQZdMiGzk+aB3007wq+FKqXvjSVA9UTFLJHJeL7BABOM5XMerE/z8xng
         fZHIoIJXptR3dsd1dQfAgyEZLG7ITfSRWtlPMn4WYtBjMzZX5XC8zochAUjr3zSLQ9hO
         VYWXs7XSeOX4RPCYykgmhyzKrD/YzEia5Sjp3yIShrQf6qzPT/fSmCU81QDxE9LOQwQG
         0IC2Kk7uHSny4yvoJUITJkkAE/ZrhyICqfYr8htrT20PLFRLEjp/a1bEeiNm8q4Eg7R1
         MqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737897496; x=1738502296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLoVlx6oEIPZAT8q+IhaVOvydmmsMymu4vL1n+j7EdA=;
        b=Clvxm2EVyXNSgyKm1mKGj5duEw2FbzVBgy4SOIzF9fFIbIQsGKn/XxRDdN7FYBLgMG
         y3rpQ2831FOEgocSTWQuj2q89rQfNzA8XY2ULIKaq+PxTpoYCs19AcOEOFnzUfv3AVzv
         U3MSTprhl0XXg7CrBYWVL62GG18y8HWzJq/B7GMtfp+94YLdxkleCeb7Z5FNnxQjrcGO
         HGB4k8Hp2vUaIorWHLdpsJE2lH31qZR0k2YlIceYNMO06N6g5Cc+OYHLQH3QHug0dpzp
         pzek/BePWyIEhVae7/qqIO5RHl2lzJCSyn1ZE7hrzuuswCBcQSyVJysGrkcfozDUl6gU
         9y9g==
X-Forwarded-Encrypted: i=1; AJvYcCUnrSE47wC0I2GOWT74iIQeksnIuowu/kEP+wd5EtBBKkdBF6DMRoA5QKF8EcMbnDEcvMDc5tiqVsjl@vger.kernel.org, AJvYcCUohuv9FjyfNtfGh5vl87Am3Su5KFFuGtMK9Wsq0QZy4LjyrntT/gM6V9Nisd/Pkg0/brkRpbmWQ78=@vger.kernel.org, AJvYcCVU89/JNr5FwmcIBqVS4EaM52uO+sYSM/vI3Uk/dMgl8wQnUZPrc02p5I9mjfQlzrkaameBvqIVocB4Pw==@vger.kernel.org, AJvYcCVZf4XMOVZl2JqG9ndzf0PUKRZFtPHypnTulA0sfpzf4gIYYYlXDflibR7w13Wfm+99tYcBUthM11SBtJ/YwkI=@vger.kernel.org, AJvYcCVd9+2V4ayJApNhjUBIPoCd1sh0y7TkDlOfl/Mcdvfjn9CL99qzMxTOYSjHkuOT3ATn/T24EHazKV7kLEA=@vger.kernel.org, AJvYcCVoAJ04ixrrQEgFxbRhWIPLkbiWkGe2td9q6Of68R1nWotkkb5Qq7kw+UOy1AGQbELZFMR1mlXhoJ7d@vger.kernel.org, AJvYcCWZUw9QKDBZl2pQ53fALbHZPY/JSoU/S1n+SDl13ei9ovuH7XtXeaCoSVpwdw11HJce9nIOxhwgbJfC@vger.kernel.org, AJvYcCWqgNyTRwW8/ns2aJQIeyh0GcDTpOEDE7PLY7IXKmy0kbKn0ak1drt10Cc9P01ljx+QAlgBJ7tAPeC8Dnk5@vger.kernel.org, AJvYcCXXMEQvKyE9vLOpjCFEyg/L8L5LrT7N2jRCVbkLP/uBst+aUs401DIlPw7LnYIOvLRBcUoaTx90@vger.kernel.org
X-Gm-Message-State: AOJu0Yyllj4XKv3igB8b1p/Bj5qy3W0SvOZpC/2b2iaccl9Q5lL4m0Xi
	3qracw2AcqvzKUn7ZjLVW2abgA9dcpG9QFjMxBGHZ0YIi+QeBdZB
X-Gm-Gg: ASbGnctBQevylELUaZp59dhYr5FFSeR8FBfDQdekZ1nZHA7xxeKijw4dgb7kw4pyiWj
	xr6bp/bB2Fw30TuHE9K3+XONXnzPVhfrILwOWcRWnBXrXEHJ2MtMHrLCz/Vq/wYevNI5xJ3Oizf
	fwu0n1PZq7txJH89vN3pHe2VQOqgqEOQ7SC1qjxans6hEIpWLqgHZDPZVXYPs4U9LvtOv1QGQ9a
	pF3pnFrcVRX2v/v9NiCqY96x4Rjle9+qxjjhhQvON9JCA7WD7pNQKxfNpzloFvWUI0XIBMMY4f+
	0peCQw3VWysOOZ8msP1ltcQuxbadPspFhvXOjY6OVleV3LwcXgYTBA==
X-Google-Smtp-Source: AGHT+IGMFiG105rSZ+Ev6CZzF2/4EhkVYSQdfdofXpKjATJ+ONYcld8Z1l0e0aViptb8FeBRJuyqvA==
X-Received: by 2002:a17:90b:1f8f:b0:2ee:aa95:6de9 with SMTP id 98e67ed59e1d1-2f782d8c0c4mr58878158a91.33.1737897495787;
        Sun, 26 Jan 2025 05:18:15 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa44cadsm5138806a91.4.2025.01.26.05.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 05:18:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <685ce5ff-127a-4f8b-b058-d36d3adb1c0d@roeck-us.net>
Date: Sun, 26 Jan 2025 05:18:11 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
 jdelvare@suse.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250123091115.2079802-1-a0282524688@gmail.com>
 <20250123091115.2079802-7-a0282524688@gmail.com>
 <c1cbb337-9ca5-4071-b05a-a97ab451f358@wanadoo.fr>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <c1cbb337-9ca5-4071-b05a-a97ab451f358@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/25/25 23:42, Vincent Mailhol wrote:
> On 23/01/2025 at 18:11, Ming Yu wrote:
>> This driver supports Hardware monitor functionality for NCT6694 MFD
>> device based on USB interface.
>>
>> Signed-off-by: Ming Yu <a0282524688@gmail.com>
>> ---
> 
> (...)
> 
>> +static int nct6694_temp_write(struct device *dev, u32 attr, int channel,
>> +			      long val)
>> +{
>> +	struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
>> +	struct nct6694_cmd_header cmd_hd;
>> +	unsigned char temp_hyst;
>> +	signed char temp_max;
>> +	int ret;
>> +
>> +	guard(mutex)(&data->lock);
>> +
>> +	switch (attr) {
>> +	case hwmon_temp_enable:
>> +		if (val == 0)
>> +			data->hwmon_en.tin_en[channel / 8] &= ~BIT(channel % 8);
>> +		else if (val == 1)
>> +			data->hwmon_en.tin_en[channel / 8] |= BIT(channel % 8);
>> +		else
>> +			return -EINVAL;
>> +
>> +		cmd_hd = (struct nct6694_cmd_header) {
>> +			.mod = NCT6694_HWMON_MOD,
>> +			.cmd = NCT6694_HWMON_CONTROL,
>> +			.sel = NCT6694_HWMON_CONTROL_SEL,
>> +			.len = cpu_to_le16(sizeof(data->hwmon_en))
>> +		};
>> +
>> +		return nct6694_write_msg(data->nct6694, &cmd_hd,
>> +					 &data->hwmon_en);
>> +	case hwmon_temp_max:
>> +		cmd_hd = (struct nct6694_cmd_header) {
>> +			.mod = NCT6694_HWMON_MOD,
>> +			.cmd = NCT6694_HWMON_ALARM,
>> +			.sel = NCT6694_HWMON_ALARM_SEL,
>> +			.len = cpu_to_le16(sizeof(data->msg->hwmon_alarm))
>> +		};
>> +		ret = nct6694_read_msg(data->nct6694, &cmd_hd,
>> +				       &data->msg->hwmon_alarm);
>> +		if (ret)
>> +			return ret;
>> +
>> +		val = clamp_val(val, -127000, 127000);
>> +		data->msg->hwmon_alarm.tin_cfg[channel].hl = temp_to_reg(val);
>> +
>> +		return nct6694_write_msg(data->nct6694, &cmd_hd,
>> +					 &data->msg->hwmon_alarm);
>> +	case hwmon_temp_max_hyst:
>> +		cmd_hd = (struct nct6694_cmd_header) {
>> +			.mod = NCT6694_HWMON_MOD,
>> +			.cmd = NCT6694_HWMON_ALARM,
>> +			.sel = NCT6694_HWMON_ALARM_SEL,
>> +			.len = cpu_to_le16(sizeof(data->msg->hwmon_alarm))
>> +		};
>> +		ret = nct6694_read_msg(data->nct6694, &cmd_hd,
>> +				       &data->msg->hwmon_alarm);
>> +
>> +		val = clamp_val(val, -127000, 127000);
>> +		temp_max = data->msg->hwmon_alarm.tin_cfg[channel].hl;
>> +		temp_hyst = temp_max - temp_to_reg(val);
>> +		temp_hyst = clamp_val(temp_hyst, 0, 7);
> 
> temp_hyst is unsigned. It can not be smaller than zero. No need for
> clamp(), using min here is sufficient.
> 

Wrong conclusion. It needs to be declared as signed variable because
"temp_max - temp_to_reg(val)" could be negative.

Guenter


