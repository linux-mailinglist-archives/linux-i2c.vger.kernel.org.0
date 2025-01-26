Return-Path: <linux-i2c+bounces-9201-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED92DA1C74A
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jan 2025 11:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65BCD3A728E
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jan 2025 10:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBCC1547FE;
	Sun, 26 Jan 2025 10:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ap9LKuh7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-15.smtpout.orange.fr [193.252.22.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950EB2D613;
	Sun, 26 Jan 2025 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737886433; cv=none; b=P1kJQyDkNOXR2iuZHBtTRQcY1pPGDKAe5hOPFxhgVg/SWTglrx3mzlUiBkN+XXWgOxaDu7iEp5OGDtjwlGWDgqlUWs2V+g/ylsVgI5+HJsLIu6QoT4Hj3SY/Pp/kKGPFBCHulFdR+a0zNyGpOm8j0PgJALEklNkrFKsOXRql760=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737886433; c=relaxed/simple;
	bh=uD5OVzo0nbIKLlTxZkXR0NJMvGjiwqmqvlf9vxpCAZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QMzpRRZBj4O2zLYjHq6IKfVuemb3Mffx9rZlq3GOem1f4HHiVGkFD3HbL7FAhOnURinbGrS0xqN2XlEUYvldTm62WFBpYpYg2O/mk+2Peq2eRhicpp35MUm9enlPeRnDHLV/XY/b9Q7hvjV4VYqDBDhq7l9x2YP9S9s33UNy12w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ap9LKuh7; arc=none smtp.client-ip=193.252.22.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id bzdzt3S1NOC04bze3tixCZ; Sun, 26 Jan 2025 11:13:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737886428;
	bh=hEq9dZjYaIApUyBFIuiJTtheymkaJ0ZQsN2y0VgOHEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ap9LKuh7HboHc9BOQ0Gu7MDOMwvDLJSYYFNcODObX9mc+1Ud4UljfpGtf6XLoHVIx
	 4K9Yj4sNYbGH4sdUP7VRtTLFGAGBzbhG8gJoMXCScORLJ2rkQ/tkWyR8/FZGmyKtR1
	 t3GEc/zXA6lVNwrbBCAnA7JfWu7xMTYXu3mIZiJqZQAICduUcb+NJOVnOnpbyaeGgF
	 HNEPu8ZfvNzXgVnLjfTv4BniEyqcortK3IdNkowld2LeQMm0T90IeiUjgxh18JPZ21
	 2GITZ0iK1Mi+FzPFNrCbDFJs51i0ZLnCeKtdMNWOI+eVe5X8OEAXZAQrNjE5lmEcaY
	 YwoTlcR6vZhIg==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 Jan 2025 11:13:48 +0100
X-ME-IP: 124.33.176.97
Message-ID: <825dad63-4241-4dd2-92fb-c9f95bd2220b@wanadoo.fr>
Date: Sun, 26 Jan 2025 19:13:30 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] watchdog: Add Nuvoton NCT6694 WDT support
To: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com,
 alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250123091115.2079802-1-a0282524688@gmail.com>
 <20250123091115.2079802-6-a0282524688@gmail.com>
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
In-Reply-To: <20250123091115.2079802-6-a0282524688@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2025 at 18:11, Ming Yu wrote:
> This driver supports Watchdog timer functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> ---

(...)

> +static int nct6694_wdt_set_timeout(struct watchdog_device *wdev,
> +				   unsigned int timeout)
> +{
> +	int ret;
> +
> +	ret = nct6694_wdt_setting(wdev, timeout, NCT6694_ACTION_GPO,
> +				  wdev->pretimeout, NCT6694_ACTION_GPO);
> +	if (ret)
> +		return ret;
> +
> +	wdev->timeout = timeout;
> +
> +	return 0;
> +}

Not critical but I would rather like you to fix this shadow warning:

  drivers/watchdog/nct6694_wdt.c: In function 'nct6694_wdt_set_timeout':
  drivers/watchdog/nct6694_wdt.c:168:49: warning: declaration of
'timeout' shadows a global declaration [-Wshadow]
    168 |                                    unsigned int timeout)
        |                                    ~~~~~~~~~~~~~^~~~~~~
  drivers/watchdog/nct6694_wdt.c:36:21: note: shadowed declaration is here
     36 | static unsigned int timeout = NCT6694_DEFAULT_TIMEOUT;
        |                     ^~~~~~~

> +static int nct6694_wdt_set_pretimeout(struct watchdog_device *wdev,
> +				      unsigned int pretimeout)
> +{
> +	int ret;
> +
> +	ret = nct6694_wdt_setting(wdev, wdev->timeout, NCT6694_ACTION_GPO,
> +				  pretimeout, NCT6694_ACTION_GPO);
> +	if (ret)
> +		return ret;
> +
> +	wdev->pretimeout = pretimeout;
> +
> +	return 0;
> +}

Idem:

  drivers/watchdog/nct6694_wdt.c: In function 'nct6694_wdt_set_pretimeout':
  drivers/watchdog/nct6694_wdt.c:183:52: warning: declaration of
'pretimeout' shadows a global declaration [-Wshadow]
    183 |                                       unsigned int pretimeout)
        |                                       ~~~~~~~~~~~~~^~~~~~~~~~
  drivers/watchdog/nct6694_wdt.c:40:21: note: shadowed declaration is here
     40 | static unsigned int pretimeout = NCT6694_DEFAULT_PRETIMEOUT;
        |                     ^~~~~~~~~~

(...)


Yours sincerely,
Vincent Mailhol


