Return-Path: <linux-i2c+bounces-8925-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FBAA02200
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 10:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D2AE1883445
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 09:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F9F1D9334;
	Mon,  6 Jan 2025 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eq2udhdt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DD619343B;
	Mon,  6 Jan 2025 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736156333; cv=none; b=UaI7JlGmvHyitcu4VrzrmGk5UliKT8hMuLD6wo+PCioKtHwuLiU1fM+uaQWBQAB6bMw5/MrNtkjf+7dwAm7WWyOoUsMNXqYQwaRYoYrADyWlvQFAGsLCdPLDgsqSJ8UYA7dLcuzFbPQ3GWaAMaxfpbqxx8FlCDFIPTz5Hz8boCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736156333; c=relaxed/simple;
	bh=wXUDSC+KjmeORBaO11pq0QSTWrOACZqdIZWgNf632kQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=egkyuPiuD5jmMyJHZmyTyVUdCdEWZF1NvDJQBAVFM3yLyyHaK/G+O1g7nAa/qMB4g2ZybpKY7/Ljp1vxwl5ZPXnk4XP14S/2HGeN4W9OnLJR+/deg/6kJQs/UAScLi7+xkLKV6AOctsEpzPg4SUiG8M/FjgGNjUciwP9AgExjgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eq2udhdt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C3EC2A5;
	Mon,  6 Jan 2025 10:37:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736156276;
	bh=wXUDSC+KjmeORBaO11pq0QSTWrOACZqdIZWgNf632kQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eq2udhdtCfCH1HeSr51HV1Yp6tcXuy0k+3rBaYuenpdPmMPinXdVBNCWhsqro5MuH
	 ryS8Sqa1gRcVG1pe4d3kZOFnGjhh6KzdxWS/6hc8p3sn4b14oKWdKtJc9JXt7gbsPn
	 ztnCtxX1NIhOmp84B0aX50/YjjfFhlHetmSUOWmE=
Message-ID: <73dd31df-cce6-445e-bf69-67b9854e9444@ideasonboard.com>
Date: Mon, 6 Jan 2025 11:38:43 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] media: i2c: ds90ub960: Protect alias_use_mask with
 a mutex
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20241230-fpc202-v4-0-761b297dc697@bootlin.com>
 <20241230-fpc202-v4-3-761b297dc697@bootlin.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20241230-fpc202-v4-3-761b297dc697@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/12/2024 15:22, Romain Gantois wrote:
> The aliased_addrs list represents the occupation of an RX port's hardware
> alias table. This list and the underlying hardware table are only accessed
> in the attach/detach_client() callbacks.
> 
> These functions are only called from a bus notifier handler in i2c-atr.c,
> which is always called with the notifier chain's semaphore held. This
> indirectly prevents concurrent access to the aliased_addrs list.
> However, more explicit and direct locking is preferable. Moreover, with the
> introduction of dynamic address translation in a future patch, the
> attach/detach_client() callbacks will be called from outside of the
> notifier chain's read section.
> 
> Introduce a mutex to protect access to the aliased_addrs list and its
> underlying hardware table.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>   drivers/media/i2c/ds90ub960.c | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 7534ddf2079fef466d3a114f0be98599427639fa..0510427ac4e9214132bcdf3fa18873ec78c48a5e 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -467,6 +467,8 @@ struct ub960_rxport {
>   		};
>   	} eq;
>   
> +	/* lock for aliased_addrs and associated registers */
> +	struct mutex aliased_addrs_lock;
>   	u16 aliased_addrs[UB960_MAX_PORT_ALIASES];
>   };
>   
> @@ -1030,6 +1032,9 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
>   	struct ub960_rxport *rxport = priv->rxports[chan_id];
>   	struct device *dev = &priv->client->dev;
>   	unsigned int reg_idx;
> +	int ret = 0;
> +
> +	mutex_lock(&rxport->aliased_addrs_lock);

A mutex guard could be used here and below.

  Tomi

>   
>   	for (reg_idx = 0; reg_idx < UB960_MAX_PORT_ALIASES; reg_idx++) {
>   		if (!rxport->aliased_addrs[reg_idx])
> @@ -1038,7 +1043,8 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
>   
>   	if (reg_idx == UB960_MAX_PORT_ALIASES) {
>   		dev_err(dev, "rx%u: alias pool exhausted\n", rxport->nport);
> -		return -EADDRNOTAVAIL;
> +		ret = -EADDRNOTAVAIL;
> +		goto out_unlock;
>   	}
>   
>   	rxport->aliased_addrs[reg_idx] = client->addr;
> @@ -1051,7 +1057,9 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
>   	dev_dbg(dev, "rx%u: client 0x%02x assigned alias 0x%02x at slot %u\n",
>   		rxport->nport, client->addr, alias, reg_idx);
>   
> -	return 0;
> +out_unlock:
> +	mutex_unlock(&rxport->aliased_addrs_lock);
> +	return ret;
>   }
>   
>   static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
> @@ -1062,6 +1070,8 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
>   	struct device *dev = &priv->client->dev;
>   	unsigned int reg_idx;
>   
> +	mutex_lock(&rxport->aliased_addrs_lock);
> +
>   	for (reg_idx = 0; reg_idx < UB960_MAX_PORT_ALIASES; reg_idx++) {
>   		if (rxport->aliased_addrs[reg_idx] == client->addr)
>   			break;
> @@ -1070,7 +1080,7 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
>   	if (reg_idx == UB960_MAX_PORT_ALIASES) {
>   		dev_err(dev, "rx%u: client 0x%02x is not mapped!\n",
>   			rxport->nport, client->addr);
> -		return;
> +		goto out_unlock;
>   	}
>   
>   	rxport->aliased_addrs[reg_idx] = 0;
> @@ -1079,6 +1089,9 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
>   
>   	dev_dbg(dev, "rx%u: client 0x%02x released at slot %u\n", rxport->nport,
>   		client->addr, reg_idx);
> +
> +out_unlock:
> +	mutex_unlock(&rxport->aliased_addrs_lock);
>   }
>   
>   static const struct i2c_atr_ops ub960_atr_ops = {
> @@ -3181,6 +3194,8 @@ static void ub960_rxport_free_ports(struct ub960_data *priv)
>   		fwnode_handle_put(rxport->source.ep_fwnode);
>   		fwnode_handle_put(rxport->ser.fwnode);
>   
> +		mutex_destroy(&rxport->aliased_addrs_lock);
> +
>   		kfree(rxport);
>   		priv->rxports[nport] = NULL;
>   	}
> @@ -3401,6 +3416,8 @@ static int ub960_parse_dt_rxport(struct ub960_data *priv, unsigned int nport,
>   	if (ret)
>   		goto err_put_remote_fwnode;
>   
> +	mutex_init(&rxport->aliased_addrs_lock);
> +
>   	return 0;
>   
>   err_put_remote_fwnode:
> 


