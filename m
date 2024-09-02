Return-Path: <linux-i2c+bounces-5998-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0A896890A
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 15:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D45C6B230CF
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 13:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5329205E20;
	Mon,  2 Sep 2024 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="k0CCwUTb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3DC184D;
	Mon,  2 Sep 2024 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725284317; cv=none; b=PCrMQ03kV1kGsSMqN8ZNmlWDQ5UYAmN5ojw0/dZE/adUe6jS2FaaBrn3CAz6rHKSm7OJm+bvyapFEBTicLq83U3iE7Q3CkPgyiD1kAWKPdQ49PV9SiPSnsCC4c9+eILEmQW48CZrmwMnRNRohj7tgLXU9dvMmFJ8TTjwodGtfII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725284317; c=relaxed/simple;
	bh=VmbSlwz30CrgBjxHN1m/rtFJOQFx3FRyCzp3Ry2x69s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twk/6kxs0FTb+Dt10NLPnXHcDzuVNbLGb51TWPRBGD0mlsJSI5RhVe1vAXGzhxXPVdVtluTMQ0KvtGPSML5dUQtIeMzlZAwuQ/48HU5c2GeiKXVszN1j6KX8USS9Hd1kZ1CdIqHI4crTw5b/+3E1vnalQnKopblepXxyfDHA3ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=k0CCwUTb; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7C8A40006;
	Mon,  2 Sep 2024 13:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725284305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQY4ArvB7ONJr6lW7dYcvuSILbt3nf3xqfBfKcm34kM=;
	b=k0CCwUTbIe+E+p6iI7jRvjha8V3FntUrfWrWbfTojJwp6sv+/k6g2jXTYCsc5viQVGz2ik
	/BNqnhbIGPuZGgmkfgiW6qNcLlgBYKe907EsCVFnYCyCa8uXELTBB6SGIkFaLRSQpOHkJv
	BBG+W2oz9x2gIb1OS7tBgzMlpxwnQyP7P8ezng/AtibztVPy2T68tNo9SBTHMQQowBYrWg
	Mmv8fX26CMPzknYLLm/QLpFT8YqrYKXukJob9pGBdqi8HtU2yuk8nzjiVzP4cBa1Iaa1gw
	9I+En5JjFKpvi5a7rip8Ew9zP+8naSzdLbWb8iFgwjGGtBtWrShBoWXgTcyBkw==
Message-ID: <13c328c9-eb44-4a40-9f0e-734a84594bef@bootlin.com>
Date: Mon, 2 Sep 2024 15:38:23 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] watchdog: Congatec Board Controller watchdog timer
 driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-watchdog@vger.kernel.org, thomas.petazzoni@bootlin.com,
 blake.vermeer@keysight.com
References: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
 <20240503-congatec-board-controller-v1-4-fec5236270e7@bootlin.com>
 <d37e3fea-d35e-4688-a845-02be6ea5eaa3@roeck-us.net>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <d37e3fea-d35e-4688-a845-02be6ea5eaa3@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

Hi Guenter,

>> +
>> +struct cgbc_wdt_cmd_cfg {
>> +	u8 cmd;
>> +	u8 mode;
>> +	u8 action;
>> +	u8 timeout1[3];
>> +	u8 timeout2[3];
>> +	u8 reserved[3];
>> +	u8 delay[3];
>> +} __packed;
>> +
>> +static_assert(sizeof(struct cgbc_wdt_cmd_cfg) == 15);
> 
> static_assert() is declared in linux/build_bug.h. Please include all
> necessary include files explicitly and do not depend on indirect includes.

Fixed in next iteration.

> 
>> +
>> +static int cgbc_wdt_start(struct watchdog_device *wdd)
>> +{
>> +	struct cgbc_wdt_data *wdt_data = watchdog_get_drvdata(wdd);
> 
> Unusual way to get wdt_data instead of using container_of().
> Any special reason ?

No special reason, I saw that watchdog_get_drvdata() was often used in
watchdog drivers (more than container_of()) to get wdt_data.
But I can use container_of() if you think I should.

> 
>> +	struct cgbc_device_data *cgbc = wdt_data->cgbc;
>> +	unsigned int timeout1 = (wdd->timeout - wdd->pretimeout) * 1000;
>> +	unsigned int timeout2 = wdd->pretimeout * 1000;
>> +	u8 action;
>> +
>> +	struct cgbc_wdt_cmd_cfg cmd_start = {
>> +		.cmd = CGBC_WDT_CMD_INIT,
>> +		.mode = CGBC_WDT_MODE_SINGLE_EVENT,
>> +		.timeout1[0] = (u8)timeout1,
>> +		.timeout1[1] = (u8)(timeout1 >> 8),
>> +		.timeout1[2] = (u8)(timeout1 >> 16),
>> +		.timeout2[0] = (u8)timeout2,
>> +		.timeout2[1] = (u8)(timeout2 >> 8),
>> +		.timeout2[2] = (u8)(timeout2 >> 16),
>> +	};
>> +
>> +	if (wdd->pretimeout) {
>> +		action = 2;
>> +		action |= wdt_data->pretimeout_action << 2;
>> +		action |= wdt_data->timeout_action << 4;
>> +	} else {
>> +		action = 1;
>> +		action |= wdt_data->timeout_action << 2;
>> +	}
>> +
>> +	cmd_start.action = action;
>> +
>> +	return cgbc_command(cgbc, &cmd_start, sizeof(cmd_start), NULL, 0, NULL);
>> +}
>> +
>> +static int cgbc_wdt_stop(struct watchdog_device *wdd)
>> +{
>> +	struct cgbc_wdt_data *wdt_data = watchdog_get_drvdata(wdd);
>> +	struct cgbc_device_data *cgbc = wdt_data->cgbc;
>> +	struct cgbc_wdt_cmd_cfg cmd_stop = {
>> +		.cmd = CGBC_WDT_CMD_INIT,
>> +		.mode = CGBC_WDT_DISABLE,
>> +	};
>> +
>> +	return cgbc_command(cgbc, &cmd_stop, sizeof(cmd_stop), NULL, 0, NULL);
>> +}
>> +
>> +static int cgbc_wdt_keepalive(struct watchdog_device *wdd)
>> +{
>> +	struct cgbc_wdt_data *wdt_data = watchdog_get_drvdata(wdd);
>> +	struct cgbc_device_data *cgbc = wdt_data->cgbc;
>> +	u8 cmd_ping = CGBC_WDT_CMD_TRIGGER;
>> +
>> +	return cgbc_command(cgbc, &cmd_ping, sizeof(cmd_ping), NULL, 0, NULL);
>> +}
>> +
>> +static int cgbc_wdt_set_pretimeout(struct watchdog_device *wdd,
>> +				   unsigned int pretimeout)
>> +{
>> +	struct cgbc_wdt_data *wdt_data = watchdog_get_drvdata(wdd);
>> +
>> +	wdd->pretimeout = pretimeout;
>> +	wdt_data->pretimeout_action = ACTION_SMI;
>> +
>> +	if (watchdog_active(wdd))
>> +		return cgbc_wdt_start(wdd);
>> +
>> +	return 0;
>> +}
>> +
>> +static int cgbc_wdt_set_timeout(struct watchdog_device *wdd,
>> +				unsigned int timeout)
>> +{
>> +	struct cgbc_wdt_data *wdt_data = watchdog_get_drvdata(wdd);
>> +
>> +	if (timeout < wdd->pretimeout) {
>> +		dev_warn(wdd->parent, "timeout <= pretimeout. Setting pretimeout to zero\n");
> 
> That is a normal condition which does not warrant a log message.
> Also see drivers/watchdog/watchdog_dev.c around line 385.

Fixed in next iteration.

> 
>> +		wdd->pretimeout = 0;
>> +	}
>> +
>> +	wdd->timeout = timeout;
>> +	wdt_data->timeout_action = ACTION_RESET;
> 
> Both timeout_action and pretimeout_action are set statically.
> What is the point of doing that instead of just using
> ACTION_RESET and ACTION_SMI as needed irectly ?

Yes indeed, using ACTION_RESET and ACTION_SMI directly in
cgbc_wdt_start() makes the code smaller.

> 
>> +
>> +	if (watchdog_active(wdd))
>> +		return cgbc_wdt_start(wdd);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct watchdog_info cgbc_wdt_info = {
>> +	.identity	= "CGBC Watchdog",
>> +	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
>> +		WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT
>> +};
>> +
>> +static const struct watchdog_ops cgbc_wdt_ops = {
>> +	.owner		= THIS_MODULE,
>> +	.start		= cgbc_wdt_start,
>> +	.stop		= cgbc_wdt_stop,
>> +	.ping		= cgbc_wdt_keepalive,
>> +	.set_timeout	= cgbc_wdt_set_timeout,
>> +	.set_pretimeout = cgbc_wdt_set_pretimeout,
>> +};
>> +
>> +static int cgbc_wdt_probe(struct platform_device *pdev)
>> +{
>> +	struct cgbc_device_data *cgbc = dev_get_drvdata(pdev->dev.parent);
>> +	struct device *dev = &pdev->dev;
>> +	struct cgbc_wdt_data *wdt_data;
>> +	struct watchdog_device *wdd;
>> +	int ret;
>> +
>> +	wdt_data = devm_kzalloc(dev, sizeof(*wdt_data), GFP_KERNEL);
> 
> devm_kzalloc() is declared in linux/device.h. Again, please include all
> necessary include files explicitly.

Fixed in next iteration.

> 
>> +	if (!wdt_data)
>> +		return -ENOMEM;
>> +
>> +	wdt_data->cgbc = cgbc;
>> +	wdd = &wdt_data->wdd;
>> +	wdd->parent = dev;
>> +
> 
> No limits ? That is unusual. Are you sure the driver accepts all
> timeouts from 0 to UINT_MAX ?

Yes limits are needed.
For next iteration I added 1s as min_timeout (which seems to be the
usual value, and it is accepted by the hardware), and a max_timeout.

> 
>> +	wdd->info = &cgbc_wdt_info;
>> +	wdd->ops = &cgbc_wdt_ops;
>> +
>> +	watchdog_set_drvdata(wdd, wdt_data);
>> +	watchdog_set_nowayout(wdd, nowayout);
>> +
>> +	cgbc_wdt_set_timeout(wdd, timeout);
>> +	cgbc_wdt_set_pretimeout(wdd, pretimeout);
> 
> The more common approach would be to set default limits in wdd->{timout,pretimeout}
> and only override the values if needed, ie if provided using module parameters.
> That implies initializing the module parameters with 0. YOur call, though.

Ok.
For next iteration I added limits (min_timeout, max_timeout), the
timeout module parameter is set to 0 by default, and
watchdog_init_timeout() is called in the probe.

> 
>> +
>> +	platform_set_drvdata(pdev, wdt_data);
>> +	watchdog_stop_on_reboot(wdd);
>> +	watchdog_stop_on_unregister(wdd);
>> +
>> +	ret = devm_watchdog_register_device(dev, wdd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
> 
> Why not just
> 	return devm_watchdog_register_device(dev, wdd);
> ?

I don't know :)
Fixed in the next iteration.

Thanks for the review !!

Thomas.

