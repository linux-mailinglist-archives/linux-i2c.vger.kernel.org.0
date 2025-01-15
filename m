Return-Path: <linux-i2c+bounces-9116-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BA6A1290F
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 17:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB2AE1666A3
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 16:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28C3199FDE;
	Wed, 15 Jan 2025 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="VVjKTBR3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-16.smtpout.orange.fr [193.252.22.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5951BBBC5;
	Wed, 15 Jan 2025 16:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736959533; cv=none; b=NLAPtHuImYotzoXfyDKinmI/DtNpj0XOgEJexBwZcTOJtD4ffd6hmgdZYmSNuloKsfZGCsdR/5p9bkBs0Cz1U8d/xkTu+CdFBlZodVKCKIjwxpuFj1tBBh4t1wyJKoJvCsBSBYDjR8i5grcIvUjVimHKLN4IEMf/8+yLNxiOaQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736959533; c=relaxed/simple;
	bh=FvS7/9I2GnMN906sdtqPLHpRpFYIqgyNF/PPN97ma84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iQ4T6gRtgylSE2ZX1c8D5tN5cD81LNQxOHhiyFmjtXu0MFaYIGT7Jf+AWMXX7Xzv6TB0rCSdBfK/EUEVm7c13nP18o14YH3gC0Sj7av96Wn6HLuMNm9jE6b9+Jnty3io4/jwyGiCJcuQRchGKg2BOjVCHGGGBnMl+toJhuuxm3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=VVjKTBR3; arc=none smtp.client-ip=193.252.22.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id Y6VrtDFe4QUNRY6VwtCvLc; Wed, 15 Jan 2025 17:45:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736959520;
	bh=p50mlgWffUEX45aXIchC5f+eGOCl4aumziWGcWmIY94=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=VVjKTBR3UYceUdiNxKUVv5cm9EplKoT4EwGxOwTg/k8XmfEebeb4pjAIrHvSnLXVr
	 gyjG3tM8eGKe4g7wECKnaackaaCzSxrXvd6ag3f2EtHFA9SCZ5tiYxtFNXwd1cmf27
	 Gmb3A6pLlnsNRU2NznSAWQzXI86ZM7hruXaPn7NR4b4uNsuS1TgZxWhuZSsQ9MGBah
	 h5+wpyLhmQ2+wn4vJ0KRa0NO15jjfayygMaHOl1DnxgSQJsQabAAqijlfvoJ54x0G8
	 jfdJSteMXvFyrYB8y4Zqv6IqrKM6w8oZu/eoNUigDz1Wq7hBjcZ6Rz2+2TQL1VLoWB
	 rvljtw20fSjew==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Wed, 15 Jan 2025 17:45:20 +0100
X-ME-IP: 124.33.176.97
Message-ID: <cef1b9bf-59f6-484d-861e-82b405653ca1@wanadoo.fr>
Date: Thu, 16 Jan 2025 01:45:02 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] can: Add Nuvoton NCT6694 CAN support
To: Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, tmyu0@nuvoton.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com,
 alexandre.belloni@bootlin.com
References: <20250114033010.2445925-1-a0282524688@gmail.com>
 <20250114033010.2445925-5-a0282524688@gmail.com>
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
In-Reply-To: <20250114033010.2445925-5-a0282524688@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/01/2025 at 12:30, Ming Yu wrote:

(...)

> +static void nct6694_can_clean(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +
> +	if (priv->tx_skb || netif_queue_stopped(ndev))
> +		ndev->stats.tx_errors++;
> +	dev_kfree_skb(priv->tx_skb);

Use:

  	can_flush_echo_skb(ndev);

(related to the following comments).

> +	priv->tx_skb = NULL;
> +}

(...)

> +static void nct6694_can_tx_work(struct work_struct *work)
> +{
> +	struct nct6694_can_priv *priv = container_of(work,
> +						     struct nct6694_can_priv,
> +						     tx_work);
> +	struct net_device *ndev = priv->ndev;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	if (priv->tx_skb) {
> +		if (priv->can.state == CAN_STATE_BUS_OFF) {

Just stop the queue when the can bus is off so that you do not have do
check the bus status each time a frame is sent.

> +			nct6694_can_clean(ndev);
> +		} else {
> +			nct6694_can_tx(ndev);
> +			can_put_echo_skb(priv->tx_skb, ndev, 0, 0);
> +			priv->tx_skb = NULL;
> +		}
> +	}
> +}
> +
> +static netdev_tx_t nct6694_can_start_xmit(struct sk_buff *skb,
> +					  struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +
> +	if (can_dev_dropped_skb(ndev, skb))
> +		return NETDEV_TX_OK;
> +
> +	if (priv->tx_skb) {
> +		netdev_err(ndev, "hard_xmit called while tx busy\n");
> +		return NETDEV_TX_BUSY;
> +	}
> +
> +	netif_stop_queue(ndev);
> +	priv->tx_skb = skb;

Here, you can directly do:

  	can_put_echo_skb(skb, ndev, 0, 0);

The skb remains accessible under priv->can.echo_skb[0]. With this, you
can remove the priv->tx_skb field.

> +	queue_work(priv->wq, &priv->tx_work);
> +
> +	return NETDEV_TX_OK;
> +}


Yours sincerely,
Vincent Mailhol


