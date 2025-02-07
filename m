Return-Path: <linux-i2c+bounces-9345-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B12CA2C666
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 16:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1B647A5482
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 15:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47561A9B23;
	Fri,  7 Feb 2025 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ltR/Bra9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-15.smtpout.orange.fr [193.252.22.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15356238D52;
	Fri,  7 Feb 2025 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940471; cv=none; b=PohG2zyZKZrzCfNcR1k99ffARgQJ7VD2Ne6nn7TsxkQMLScdRSVZn2E6ITATZxO9rsL7p5ju1w/ixah7r/qz59ktPmP/DgYB7tr5Jk/O6rPSL7MqqNROLIf8P08uvwUE5gu3I2xZWItPDg9iQ7vGGLMnPCVjrrERMZw1fCPOafE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940471; c=relaxed/simple;
	bh=Ismxwm1c+xEaqBjLFJVdqK9TSoif2Fk0K+yMxRkINVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYR9ybp/2M5pr5QzBHTMbiKESRtx582ocPyncHDLb1HU4p8DYS/hzclOcoTOkIXl22gDVKtV5f4iFuWAd/fjIp/j9K/sa2sIYdTeMpKQNZZSnk5xXZKIUHT/Ex5Ol+ORlgC57GoD4Z7DkOp/8TQAg47quKT8v2Uqd4h/ghW6dAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ltR/Bra9; arc=none smtp.client-ip=193.252.22.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id gPqWtL8WXFt3IgPqatESry; Fri, 07 Feb 2025 16:01:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738940461;
	bh=Pyha5odVGsX/CKqH1ZkXIQ53HwwjGzZ3ipFrj9lnhz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ltR/Bra9iY/vwRcNq/YBqz4kt3s9oCNpzfGigntH9sfQiTTrkWuSMYZeRdTVHAm9q
	 ELN6QjvKXUDDagncZdtHNzfc4Dph6J9ZbNAMnJ2T8uTjBMkcQOy0w1CmQsZPJ0LpWT
	 dOCxl+huYkYk1+Wj2h6oeNsysoenQmB6u8IMRd2y9Xmr3zkUCeN66z+Hha7pFLRs/W
	 89ZI+zgAKMoUKsVRYls4qKSqE9WdR4rHvgwufNzfv2EPxKESy+aJXcg95jlM25oO+E
	 8PurBrxhE+/r4TKOfBZKrvfxeXyUB4hsDku2l6X/asT6VfDK7fDLpwcmkDwpo0QgCf
	 a+3PA3c1yBBLw==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Fri, 07 Feb 2025 16:01:01 +0100
X-ME-IP: 124.33.176.97
Message-ID: <9a3f1242-794e-41f1-80a5-bc6d18ff6641@wanadoo.fr>
Date: Sat, 8 Feb 2025 00:00:43 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Marc Kleine-Budde <mkl@pengutronix.de>, Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, andi.shyti@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
 jdelvare@suse.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-5-a0282524688@gmail.com>
 <20250207-savvy-beaver-of-culture-45698d-mkl@pengutronix.de>
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
In-Reply-To: <20250207-savvy-beaver-of-culture-45698d-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/02/2025 at 21:15, Marc Kleine-Budde wrote:
> On 07.02.2025 15:44:59, Ming Yu wrote:

(...)

>> +static netdev_tx_t nct6694_can_start_xmit(struct sk_buff *skb,
>> +					  struct net_device *ndev)
>> +{
>> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
>> +
>> +	if (can_dev_dropped_skb(ndev, skb))
>> +		return NETDEV_TX_OK;
>> +
>> +	netif_stop_queue(ndev);
>> +	can_put_echo_skb(skb, ndev, 0, 0);
>> +	queue_work(priv->wq, &priv->tx_work);

What is the reason to use a work queue here? xmit() is not a hard IRQ.
Also, the other USB CAN devices just directly send the USB message in
their xmit() without the need to rely on such worker.

Sorry if this was discussed in the past, I can not remember if this
question has already been raised.

>> +	return NETDEV_TX_OK;
>> +}

(...)

Yours sincerely,
Vincent Mailhol


