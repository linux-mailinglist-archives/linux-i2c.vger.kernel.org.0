Return-Path: <linux-i2c+bounces-10043-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3962DA72223
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 23:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7416A173CAC
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 22:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420FC1F8736;
	Wed, 26 Mar 2025 22:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ehIwNvUZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AD11B040D;
	Wed, 26 Mar 2025 22:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743026778; cv=none; b=fIs/6oAgX/q15BL4N01pzI0W/9P+X9AkSWsLUvMdiXn4aT5X+ErwZ2rOhXbK3gdoQBJzjjwV1DdEQCo47KWzhvNwi/1EZgy305570Py17glIbskDevsV/73qom0H1gbZPz+pamdJIo0A2hdy+owI6OGJedF010iBMz4ZFoHOlkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743026778; c=relaxed/simple;
	bh=wBUZtm7tQMfLpH6iDp+77aS8r5MvIGZkKqcqaUwCPlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MnznXBBkgJMDY4LR+nIU2hlBPA+gFf1vV9oSjGiIKNA389xgl3JbeNjzUsM3bhwXcRo0XlwiFq3GafNUFmoeAQCEP7BmMmbqj2dkHaoUT2MOI6oG9KsFa5ld95orDIpovZCvpOlYOaluL1vOMKY3dwyeHIWYCWA7Z2PIBQZX9Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ehIwNvUZ; arc=none smtp.client-ip=80.12.242.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id xYjetXqeFG2llxYjhtb0U8; Wed, 26 Mar 2025 22:56:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743026200;
	bh=Hkg1tTedGB+Nrzuw+UGSEvgfhzz7DWhq6NfPcD6jls0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ehIwNvUZRrYlyHrVPoKyhA9+6FelPnghZEwndDyTk9A7kX5ZiDyZT8xOF9MYv5AxH
	 MJlqH6+TnWRuEC+VLGvnUFpwpoPkS957gtuI1Db/64vG1VT0s+n5oyRUEaa1Sy9ZeE
	 sjLRmqegaUeObIO47DnC7Z6aI1y2gh6x49WfYR52riStnVUkv+ZtstQrZg0NEZMuLZ
	 kYE9LlZxQeBgxRmLZw1CVWiqFYaUEeko2/SFASpYW01pxMjnbvtk5FH/5A/Ke0Zxqu
	 MsNghiRcYtxVGichRbfu5nWMZQwUUAA6qLQFxMOGkI2IYsr3GtozA6PSHx2dhKnPjR
	 U+bmi2yH/2OHw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 26 Mar 2025 22:56:40 +0100
X-ME-IP: 90.11.132.44
Message-ID: <08f1177f-6623-46ff-8936-5b628326d8bf@wanadoo.fr>
Date: Wed, 26 Mar 2025 22:56:30 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
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
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250225081644.3524915-5-a0282524688@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 25/02/2025 à 09:16, Ming Yu a écrit :
> This driver supports Socket CANFD functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

...

> +static int nct6694_can_probe(struct platform_device *pdev)
> +{
> +	const struct mfd_cell *cell = mfd_get_cell(pdev);
> +	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
> +	struct nct6694_can_priv *priv;
> +	struct net_device *ndev;
> +	int ret, irq, can_clk;
> +
> +	irq = irq_create_mapping(nct6694->domain,
> +				 NCT6694_IRQ_CAN0 + cell->id);
> +	if (!irq)
> +		return irq;

Should irq_dispose_mapping() be caled in the error handling path and in 
the remove function?

> +
> +	ndev = alloc_candev(sizeof(struct nct6694_can_priv), 1);
> +	if (!ndev)
> +		return -ENOMEM;
> +
> +	ndev->irq = irq;
> +	ndev->flags |= IFF_ECHO;
> +	ndev->dev_port = cell->id;
> +	ndev->netdev_ops = &nct6694_can_netdev_ops;
> +	ndev->ethtool_ops = &nct6694_can_ethtool_ops;
> +
> +	priv = netdev_priv(ndev);
> +	priv->nct6694 = nct6694;
> +	priv->ndev = ndev;
> +
> +	can_clk = nct6694_can_get_clock(priv);
> +	if (can_clk < 0) {
> +		ret = dev_err_probe(&pdev->dev, can_clk,
> +				    "Failed to get clock\n");
> +		goto free_candev;
> +	}
> +
> +	INIT_WORK(&priv->tx_work, nct6694_can_tx_work);
> +
> +	priv->can.state = CAN_STATE_STOPPED;
> +	priv->can.clock.freq = can_clk;
> +	priv->can.bittiming_const = &nct6694_can_bittiming_nominal_const;
> +	priv->can.data_bittiming_const = &nct6694_can_bittiming_data_const;
> +	priv->can.do_set_mode = nct6694_can_set_mode;
> +	priv->can.do_get_berr_counter = nct6694_can_get_berr_counter;
> +	priv->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK |
> +		CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR_REPORTING |
> +		CAN_CTRLMODE_FD | CAN_CTRLMODE_FD_NON_ISO;
> +
> +	ret = can_rx_offload_add_manual(ndev, &priv->offload,
> +					NCT6694_NAPI_WEIGHT);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "Failed to add rx_offload\n");
> +		goto free_candev;
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +	SET_NETDEV_DEV(priv->ndev, &pdev->dev);
> +
> +	ret = register_candev(priv->ndev);
> +	if (ret)
> +		goto rx_offload_del;
> +
> +	return 0;
> +
> +rx_offload_del:
> +	can_rx_offload_del(&priv->offload);
> +free_candev:
> +	free_candev(ndev);
> +	return ret;
> +}
> +
> +static void nct6694_can_remove(struct platform_device *pdev)
> +{
> +	struct nct6694_can_priv *priv = platform_get_drvdata(pdev);
> +
> +	unregister_candev(priv->ndev);
> +	can_rx_offload_del(&priv->offload);
> +	free_candev(priv->ndev);
> +}

...

CJ

