Return-Path: <linux-i2c+bounces-9349-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D37BCA2CC61
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 20:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EE4C167E2F
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 19:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008901A3143;
	Fri,  7 Feb 2025 19:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Y6AeUfa3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-71.smtpout.orange.fr [80.12.242.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEF323C8D8;
	Fri,  7 Feb 2025 19:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738955741; cv=none; b=dTqcghZtMTyk5gwFdawoPo60cVKVynem3+RRHa1q9kNR6CHKoDGw05d91xI7q0R/04/pV31ErpOejtVoUnH0LHw76BaI6RoiUQ/lwQxut/RKzodqcJeOPamSFXzVDocTlmy/FlT/sev7R86AJ69KMpD3Ox8wBuIPQKjaD+oN10g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738955741; c=relaxed/simple;
	bh=FcL9rqAxwTwnO8DU+oECLsHcs3OBhNbHUgR1vVXaKDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LWf1wxJbnm8AejxfqrHaxO6gpjHpMuxFkLx5buZ0Yf0h/jql84B8/fZV1zqyN8lP9/DYRU0b4R+YleHJBbCx7z6FN+spIS9G13wNLg3YySGcpUMvrp45kRRFNmZmEIaxOrEZAfP6amqtVaSYC4EAdlWhHMCrcIYSvouGz+lX3BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Y6AeUfa3; arc=none smtp.client-ip=80.12.242.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id gTgJtDinHS3EkgTgNtvaZD; Fri, 07 Feb 2025 20:06:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738955196;
	bh=bhHSi90GsFsWXWaNGZwev+3zlg20387bXu2VxNKk4dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Y6AeUfa3realFOVJA41W1z3xCXnFmhOtVsYF6esw7xL8GVOsXhbYYkndCbY/enFpO
	 a6hkz+4IoRPX8ff/xTQO5hKpyU4KFpNSAoFnIi7GgRvVGKb9157eXYUDKzhm3rADjB
	 XeINf//OCDuRmf2oHC2TLUL1OruABJKeopgztEE8EWP/oY5vLziYesAUfgKff38cj9
	 4c1WVOw6m0gcTMRVbPDevhwGdNZ5vxr9G9j0Q03+7DOMyM8A7U0bwf8KX6rjMQ45gb
	 YE+UKUuMXFqDQ6f7vpKDqzeibXihoksvQpZnauqW5lECtl8vwnF9t8yPYD0C8T3Fw6
	 +CY1paxxApqSg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 07 Feb 2025 20:06:36 +0100
X-ME-IP: 90.11.132.44
Message-ID: <01801937-6257-4381-bf18-90badf795da8@wanadoo.fr>
Date: Fri, 7 Feb 2025 20:06:27 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] i2c: Add Nuvoton NCT6694 I2C support
To: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
 jdelvare@suse.com, alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-4-a0282524688@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250207074502.1055111-4-a0282524688@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 07/02/2025 à 08:44, Ming Yu a écrit :
> This driver supports I2C adapter functionality for NCT6694 MFD
> device based on USB interface, each I2C controller use default
> baudrate(100K).

...

> +static int nct6694_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +{
> +	struct nct6694_i2c_data *data = adap->algo_data;
> +	struct nct6694_i2c_deliver *deliver = &data->deliver;
> +	static const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_I2C_MOD,
> +		.cmd = NCT6694_I2C_DELIVER,
> +		.sel = NCT6694_I2C_DELIVER_SEL,
> +		.len = cpu_to_le16(sizeof(*deliver))
> +	};
> +	int ret, i;
> +
> +	for (i = 0; i < num ; i++) {

Tiny tiny nitpick: unneeded extra space after num

> +		struct i2c_msg *msg_temp = &msgs[i];

...

CJ

