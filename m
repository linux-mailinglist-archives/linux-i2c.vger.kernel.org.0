Return-Path: <linux-i2c+bounces-8926-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B24FA0222F
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 10:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADE973A26A8
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 09:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4401D95A3;
	Mon,  6 Jan 2025 09:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ScJ1hj1M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0765E1CCEF8;
	Mon,  6 Jan 2025 09:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736157096; cv=none; b=pB7LgDhheFH5DwKcnq3HIbLgZtI8+6OaySMJ5tgi4cNABUiMh31dXEUTJvfW8y6iEOegkPFv3hggwcILWl3Tw8Mx0cZscCdaoS2dmpEfYEOtxkP7RIzp058Sy8pFpfsSJwgJpsAUwiLJZ+icH9FMhGhi4UoBncBHP2TAETSWh44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736157096; c=relaxed/simple;
	bh=dBWjb1IT3V9uRUOR70yQApnZqiLFvWlOCWrBKkDOirk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mIvZU2DtyqCuihAAtqfUPawv/Rv4qsx6CRtkqGw1aqxK5HL15YuYEZ94tQnZOcBVrXGP3PELPNEEL4lk/sjedT7konkQZYTC1Ybcjhru9MnI5k0mbKlSpS/DdiijkxTuume1g4RL+Tf6EdNuB+nKSvwsqQNaqonDPlTN/rUkQdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ScJ1hj1M; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D17454CE;
	Mon,  6 Jan 2025 10:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736157034;
	bh=dBWjb1IT3V9uRUOR70yQApnZqiLFvWlOCWrBKkDOirk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ScJ1hj1MsKpNMgTiaL1l4T4fnWA/j1Ab/vbSi1Km4vAhqBqKMU2IRcJne4pLkNOuL
	 JSM8XyIkkRpUVDMKjbNTS06emkLdpgFXTBCE5KbbCnkdY2aX6/4S0rkQyfVoN/ApL4
	 OvbCm54yozXtzx0UToCYhqi4sjhaMhSvxTNEdHPw=
Message-ID: <f63b7744-b86e-4dbe-aa49-10614a025b7e@ideasonboard.com>
Date: Mon, 6 Jan 2025 11:51:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] i2c: use client addresses directly in ATR
 interface
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
 <20241230-fpc202-v4-4-761b297dc697@bootlin.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20241230-fpc202-v4-4-761b297dc697@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/12/2024 15:22, Romain Gantois wrote:
> The I2C Address Translator (ATR) module defines mappings from i2c_client
> structs to aliases. However, only the physical address of each i2c_client
> struct is actually relevant to the workings of the ATR module. Moreover,
> some drivers require address translation functionality but do not allocate
> i2c_client structs, accessing the adapter directly instead. The SFP
> subsystem is an example of this.
> 
> Replace the "i2c_client" field of the i2c_atr_alias_pair struct with a u16
> "addr" field. Rewrite helper functions and callbacks as needed.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>   drivers/i2c/i2c-atr.c         | 52 ++++++++++++++++---------------------------
>   drivers/media/i2c/ds90ub960.c | 24 ++++++++++----------
>   include/linux/i2c-atr.h       | 20 ++++++++---------
>   3 files changed, 41 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index f21475ae592183a45b5e46a20e7a0699fb88132c..894787246846b9965deb03a7ec7eb600b102ddad 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -21,16 +21,16 @@
>   #define ATR_MAX_SYMLINK_LEN 11	/* Longest name is 10 chars: "channel-99" */
>   
>   /**
> - * struct i2c_atr_alias_pair - Holds the alias assigned to a client.
> + * struct i2c_atr_alias_pair - Holds the alias assigned to a client address.
>    * @node:   List node
> - * @client: Pointer to the client on the child bus
> + * @addr:   Address of the client on the child bus.
>    * @alias:  I2C alias address assigned by the driver.
>    *          This is the address that will be used to issue I2C transactions
>    *          on the parent (physical) bus.
>    */
>   struct i2c_atr_alias_pair {
>   	struct list_head node;
> -	const struct i2c_client *client;
> +	u16 addr;
>   	u16 alias;
>   };
>   
> @@ -97,27 +97,13 @@ struct i2c_atr {
>   	struct i2c_adapter *adapter[] __counted_by(max_adapters);
>   };
>   
> -static struct i2c_atr_alias_pair *
> -i2c_atr_find_mapping_by_client(const struct list_head *list,
> -			       const struct i2c_client *client)
> -{
> -	struct i2c_atr_alias_pair *c2a;
> -
> -	list_for_each_entry(c2a, list, node) {
> -		if (c2a->client == client)
> -			return c2a;
> -	}
> -
> -	return NULL;
> -}
> -
>   static struct i2c_atr_alias_pair *
>   i2c_atr_find_mapping_by_addr(const struct list_head *list, u16 phys_addr)
>   {
>   	struct i2c_atr_alias_pair *c2a;
>   
>   	list_for_each_entry(c2a, list, node) {
> -		if (c2a->client->addr == phys_addr)
> +		if (c2a->addr == phys_addr)
>   			return c2a;
>   	}
>   
> @@ -313,8 +299,8 @@ static void i2c_atr_release_alias(struct i2c_atr *atr, u16 alias)
>   	dev_warn(atr->dev, "Unable to find mapped alias\n");
>   }
>   
> -static int i2c_atr_attach_client(struct i2c_adapter *adapter,
> -				 const struct i2c_client *client)
> +static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
> +			       u16 addr)
>   {
>   	struct i2c_atr_chan *chan = adapter->algo_data;
>   	struct i2c_atr *atr = chan->atr;
> @@ -334,14 +320,14 @@ static int i2c_atr_attach_client(struct i2c_adapter *adapter,
>   		goto err_release_alias;
>   	}
>   
> -	ret = atr->ops->attach_client(atr, chan->chan_id, client, alias);
> +	ret = atr->ops->attach_addr(atr, chan->chan_id, addr, alias);
>   	if (ret)
>   		goto err_free;
>   
> -	dev_dbg(atr->dev, "chan%u: client 0x%02x mapped at alias 0x%02x (%s)\n",
> -		chan->chan_id, client->addr, alias, client->name);
> +	dev_dbg(atr->dev, "chan%u: addr 0x%02x mapped at alias 0x%02x\n",
> +		chan->chan_id, addr, alias);

This, and the dev_dbg() below, sound a bit odd to my ear. But I'm not 
sure what would be a good print... "added alias 0x12 for address 0x34"?

Other than that, the patch looks fine.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

>   
> -	c2a->client = client;
> +	c2a->addr = addr;
>   	c2a->alias = alias;
>   	list_add(&c2a->node, &chan->alias_list);
>   
> @@ -355,16 +341,16 @@ static int i2c_atr_attach_client(struct i2c_adapter *adapter,
>   	return ret;
>   }
>   
> -static void i2c_atr_detach_client(struct i2c_adapter *adapter,
> -				  const struct i2c_client *client)
> +static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
> +				u16 addr)
>   {
>   	struct i2c_atr_chan *chan = adapter->algo_data;
>   	struct i2c_atr *atr = chan->atr;
>   	struct i2c_atr_alias_pair *c2a;
>   
> -	atr->ops->detach_client(atr, chan->chan_id, client);
> +	atr->ops->detach_addr(atr, chan->chan_id, addr);
>   
> -	c2a = i2c_atr_find_mapping_by_client(&chan->alias_list, client);
> +	c2a = i2c_atr_find_mapping_by_addr(&chan->alias_list, addr);
>   	if (!c2a) {
>   		 /* This should never happen */
>   		dev_warn(atr->dev, "Unable to find address mapping\n");
> @@ -374,8 +360,8 @@ static void i2c_atr_detach_client(struct i2c_adapter *adapter,
>   	i2c_atr_release_alias(atr, c2a->alias);
>   
>   	dev_dbg(atr->dev,
> -		"chan%u: client 0x%02x unmapped from alias 0x%02x (%s)\n",
> -		chan->chan_id, client->addr, c2a->alias, client->name);
> +		"chan%u: addr 0x%02x unmapped from alias 0x%02x\n",
> +		chan->chan_id, addr, c2a->alias);
>   
>   	list_del(&c2a->node);
>   	kfree(c2a);
> @@ -405,7 +391,7 @@ static int i2c_atr_bus_notifier_call(struct notifier_block *nb,
>   
>   	switch (event) {
>   	case BUS_NOTIFY_ADD_DEVICE:
> -		ret = i2c_atr_attach_client(client->adapter, client);
> +		ret = i2c_atr_attach_addr(client->adapter, client->addr);
>   		if (ret)
>   			dev_err(atr->dev,
>   				"Failed to attach remote client '%s': %d\n",
> @@ -413,7 +399,7 @@ static int i2c_atr_bus_notifier_call(struct notifier_block *nb,
>   		break;
>   
>   	case BUS_NOTIFY_DEL_DEVICE:
> -		i2c_atr_detach_client(client->adapter, client);
> +		i2c_atr_detach_addr(client->adapter, client->addr);
>   		break;
>   
>   	default:
> @@ -506,7 +492,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
>   	if (max_adapters > ATR_MAX_ADAPTERS)
>   		return ERR_PTR(-EINVAL);
>   
> -	if (!ops || !ops->attach_client || !ops->detach_client)
> +	if (!ops || !ops->attach_addr || !ops->detach_addr)
>   		return ERR_PTR(-EINVAL);
>   
>   	atr = kzalloc(struct_size(atr, adapter, max_adapters), GFP_KERNEL);
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 0510427ac4e9214132bcdf3fa18873ec78c48a5e..52d6879986ed4fcbe8ce3d75e04018b336beabf9 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -1025,8 +1025,8 @@ static int ub960_ind_update_bits(struct ub960_data *priv, u8 block, u8 reg,
>    * I2C-ATR (address translator)
>    */
>   
> -static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
> -				   const struct i2c_client *client, u16 alias)
> +static int ub960_atr_attach_addr(struct i2c_atr *atr, u32 chan_id,
> +				 u16 addr, u16 alias)
>   {
>   	struct ub960_data *priv = i2c_atr_get_driver_data(atr);
>   	struct ub960_rxport *rxport = priv->rxports[chan_id];
> @@ -1047,23 +1047,23 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
>   		goto out_unlock;
>   	}
>   
> -	rxport->aliased_addrs[reg_idx] = client->addr;
> +	rxport->aliased_addrs[reg_idx] = addr;
>   
>   	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ID(reg_idx),
> -			   client->addr << 1);
> +			   addr << 1);
>   	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx),
>   			   alias << 1);
>   
>   	dev_dbg(dev, "rx%u: client 0x%02x assigned alias 0x%02x at slot %u\n",
> -		rxport->nport, client->addr, alias, reg_idx);
> +		rxport->nport, addr, alias, reg_idx);
>   
>   out_unlock:
>   	mutex_unlock(&rxport->aliased_addrs_lock);
>   	return ret;
>   }
>   
> -static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
> -				    const struct i2c_client *client)
> +static void ub960_atr_detach_addr(struct i2c_atr *atr, u32 chan_id,
> +				  u16 addr)
>   {
>   	struct ub960_data *priv = i2c_atr_get_driver_data(atr);
>   	struct ub960_rxport *rxport = priv->rxports[chan_id];
> @@ -1073,13 +1073,13 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
>   	mutex_lock(&rxport->aliased_addrs_lock);
>   
>   	for (reg_idx = 0; reg_idx < UB960_MAX_PORT_ALIASES; reg_idx++) {
> -		if (rxport->aliased_addrs[reg_idx] == client->addr)
> +		if (rxport->aliased_addrs[reg_idx] == addr)
>   			break;
>   	}
>   
>   	if (reg_idx == UB960_MAX_PORT_ALIASES) {
>   		dev_err(dev, "rx%u: client 0x%02x is not mapped!\n",
> -			rxport->nport, client->addr);
> +			rxport->nport, addr);
>   		goto out_unlock;
>   	}
>   
> @@ -1088,15 +1088,15 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
>   	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx), 0);
>   
>   	dev_dbg(dev, "rx%u: client 0x%02x released at slot %u\n", rxport->nport,
> -		client->addr, reg_idx);
> +		addr, reg_idx);
>   
>   out_unlock:
>   	mutex_unlock(&rxport->aliased_addrs_lock);
>   }
>   
>   static const struct i2c_atr_ops ub960_atr_ops = {
> -	.attach_client = ub960_atr_attach_client,
> -	.detach_client = ub960_atr_detach_client,
> +	.attach_addr = ub960_atr_attach_addr,
> +	.detach_addr = ub960_atr_detach_addr,
>   };
>   
>   static int ub960_init_atr(struct ub960_data *priv)
> diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
> index 4d5da161c22516b3294e73702ace7a4546cdd588..14c1f9175c0db6a8a9c6ef5d771ae68361132a76 100644
> --- a/include/linux/i2c-atr.h
> +++ b/include/linux/i2c-atr.h
> @@ -20,20 +20,20 @@ struct i2c_atr;
>   
>   /**
>    * struct i2c_atr_ops - Callbacks from ATR to the device driver.
> - * @attach_client: Notify the driver of a new device connected on a child
> - *                 bus, with the alias assigned to it. The driver must
> - *                 configure the hardware to use the alias.
> - * @detach_client: Notify the driver of a device getting disconnected. The
> - *                 driver must configure the hardware to stop using the
> - *                 alias.
> + * @attach_addr: Notify the driver of a new device connected on a child
> + *               bus, with the alias assigned to it. The driver must
> + *               configure the hardware to use the alias.
> + * @detach_addr: Notify the driver of a device getting disconnected. The
> + *               driver must configure the hardware to stop using the
> + *               alias.
>    *
>    * All these functions return 0 on success, a negative error code otherwise.
>    */
>   struct i2c_atr_ops {
> -	int (*attach_client)(struct i2c_atr *atr, u32 chan_id,
> -			     const struct i2c_client *client, u16 alias);
> -	void (*detach_client)(struct i2c_atr *atr, u32 chan_id,
> -			      const struct i2c_client *client);
> +	int (*attach_addr)(struct i2c_atr *atr, u32 chan_id,
> +			   u16 addr, u16 alias);
> +	void (*detach_addr)(struct i2c_atr *atr, u32 chan_id,
> +			    u16 addr);
>   };
>   
>   /**
> 


