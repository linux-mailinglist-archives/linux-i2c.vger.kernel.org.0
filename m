Return-Path: <linux-i2c+bounces-9347-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8538DA2CBE5
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 19:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0982167E47
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 18:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074B31ADFE4;
	Fri,  7 Feb 2025 18:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="nHaBnrUd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-65.smtpout.orange.fr [80.12.242.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C653419CD19;
	Fri,  7 Feb 2025 18:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953987; cv=none; b=U5cIoV1Log3WK8pL7fBd+f3J/HlBEkVrmnoNb2dHdPt6HwBwJHegiI2AqwEq2LeIb8DHni1sDqEmqjBbMBq0vRG9p1wVCV3UsWIsPvkHwvREQ2NqZmseQaZGPFLi7SAh6ozWI9GKNRjZiHhurlVGuqsEspSVNEiWLpFYVJXW5no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953987; c=relaxed/simple;
	bh=jG9PP8OmSmsAi3gu2ND0UFBXsklxiSRJ0nVDoTXKJjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FzEZcYjrLr/e+N/57VzZTy8FCqH3XmiGEhdMJOUbXa3Gle3tDsfv9haUjp7+pWPcPUHStfaMjSQvVlpo9tAaJZ3kUSK1x3z8myTlgsx7O5lEAflRnOPoo5kD5cjh0zqZOmHAi4K6mqT1PjDXdaGsD8m0y66FIJC4aZtb4zShlsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=nHaBnrUd; arc=none smtp.client-ip=80.12.242.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id gTDktBe395xHLgTDntrXhH; Fri, 07 Feb 2025 19:37:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738953425;
	bh=6PlvsS0qz2CZcL8tmalhXpsBjS7gKY13HQPvHB3Mi8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=nHaBnrUdPy2gXkXp1Wx7o8rVZjSVn4a+/+Mp+IizYUbpbvBBy3HoHLGJMgWzlxKvK
	 5mx95ssZsPeC5rsYQbglj27IczHL+NWevccjj363Yq+Rf4LvKqqgIKlI563wq+hmiG
	 g4sWQJ7WfTaafSCF9z1teOIui76v+b9w9DP1hJciI4GLT1yyT09v9SyWBZYlhZVe2b
	 +5iNuQOPcZGanus78zusUL+B02npJA3gBILv3KU6Myi1E5A4eVu25j7bb5slSrpAXS
	 ao6+TeuupJbe8BNAdA+VveQj+8ZmmL9B1wxVhhjhyiAj1n3SjQQMilYPY8a5dWpeUs
	 bKu8dZTtMSyZw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 07 Feb 2025 19:37:05 +0100
X-ME-IP: 90.11.132.44
Message-ID: <1ee664ec-f912-467e-aedb-81208987ea2a@wanadoo.fr>
Date: Fri, 7 Feb 2025 19:36:56 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] mfd: Add core driver for Nuvoton NCT6694
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
 <20250207074502.1055111-2-a0282524688@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250207074502.1055111-2-a0282524688@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 07/02/2025 à 08:44, Ming Yu a écrit :
> The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> PWM, and RTC.
> 
> This driver implements USB device functionality and shares the
> chip's peripherals as a child device.
> 
> Each child device can use the USB functions nct6694_read_msg()
> and nct6694_write_msg() to issue a command. They can also request
> interrupt that will be called when the USB device receives its
> interrupt pipe.

...

> +static struct irq_chip nct6694_irq_chip = {

This could be const.

(I'm working on a serie that should constify struct irq_chip, so this 
one would already be done)

> +	.name = "nct6694-irq",
> +	.flags = IRQCHIP_SKIP_SET_WAKE,
> +	.irq_bus_lock = nct6694_irq_lock,
> +	.irq_bus_sync_unlock = nct6694_irq_sync_unlock,
> +	.irq_enable = nct6694_irq_enable,
> +	.irq_disable = nct6694_irq_disable,
> +};
> +
> +static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq,
> +				  irq_hw_number_t hw)
> +{
> +	struct nct6694 *nct6694 = d->host_data;
> +
> +	irq_set_chip_data(irq, nct6694);
> +	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
> +
> +	return 0;
> +}

...

CJ


