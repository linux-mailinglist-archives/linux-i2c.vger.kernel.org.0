Return-Path: <linux-i2c+bounces-3984-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8287E9043B7
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 20:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BA0F28B861
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 18:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9F684D12;
	Tue, 11 Jun 2024 18:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Oa55rfjK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90F778C8E;
	Tue, 11 Jun 2024 18:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718130631; cv=none; b=Ff+AWN9ppIIP/9HT2mMxjocdTHrc3s9+i6kGWNCmY8vKO3ld3AK6szn9h4DlS+PDrXP0eRMHlvd/nEWpdB+wTDvfIrjfneOmRCnuGQ0KPuazJZKp2YeBkHPMuDXfB7WPYBBDarONFVvRTxQM96IF1X8upBXtB5hoDHOJh/bdP/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718130631; c=relaxed/simple;
	bh=Fl1Bcjival52kq6amEO6cSuii7o+jtaAL8znvOQExXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BX5CQm0i7FBpVi9MJQNDaj5fUoQYUwYf1YrB2dXR+cW9BgrCTGMYAfLqHo9UM42iQn7ATyLDHOqQGZka+okJWQah0XFxiOm9DSlRTjzjjJOtTKPZLQEQZDuPd7pRsY9V+D9U283UdYzlFZHUFZpsHj+aUCn5/nKzB16Dtsoqnk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Oa55rfjK; arc=none smtp.client-ip=80.12.242.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id H5j3s2zS3qyvbH5j3s7g8y; Tue, 11 Jun 2024 19:56:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718128569;
	bh=sDXIAi2hNDOjYRm7+B25GTwEHeQQES9Jm3k/yIIxD4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Oa55rfjKoOk2jGUDVGAj5k36U9b7ZTh+42+oRIKJ/OVI2zf3WKcNTuNITbMX8Je3b
	 WNgoWgLt/cLU/AIMmpIt667NNkS+h5NJn3MMRFjnliyMEVrOHo0lLp5fzfV76muosn
	 4fqIkmfTv8GYicR6tK8JYfU7QrA+n6pdX08VYsKLB2U2TmMWCoH7tJ33AiPzYWKNcB
	 5EA3wrgZtW5oE3lQ6yAHtmVZggHv+9D913iG9iBGMCxFnVj2q6uyZPoDGPY0APgSrv
	 Jq7lrNzkwrFjJV5slDP6UM+FKgIi7SkAjNQOr1Vt6PbiiG/t92VI9QUh71yY74wQzV
	 4NymB7lVfIobA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 11 Jun 2024 19:56:09 +0200
X-ME-IP: 86.243.222.230
Message-ID: <71609986-9b97-44ee-86a1-b8a8b9d2829b@wanadoo.fr>
Date: Tue, 11 Jun 2024 19:56:03 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] i2c: muxes: add support for mule i2c multiplexer
To: Farouk Bouabid <farouk.bouabid@cherry.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Quentin Schulz
 <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
 <20240611-dev-mule-i2c-mux-v3-3-08d26a28e001@cherry.de>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240611-dev-mule-i2c-mux-v3-3-08d26a28e001@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 11/06/2024 à 13:43, Farouk Bouabid a écrit :
> Mule is an MCU that emulates a set of I2C devices which are reachable
> through an I2C-mux.
> 
> The emulated devices share a single I2C address with the mux itself
> where the requested register is what determines which logic is executed
> (mux logic or device logic):
> 
> 1- The devices on the mux can be selected (mux function) by writing the
> appropriate device number to an I2C config register (0xff) that is not
> used by any device logic.
> 
> 2- Any access to a register other than the config register will be
> handled by the previously selected device.
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> ---

Hi,

...

> +static int mule_i2c_mux_probe(struct i2c_client *client)
> +{
> +	struct i2c_adapter *adap = client->adapter;
> +	struct mule_i2c_reg_mux *priv;
> +	struct i2c_mux_core *muxc;
> +	struct device_node *dev;
> +	unsigned int readback;
> +	int ndev, ret;
> +	bool old_fw;
> +
> +	/* Count devices on the mux */
> +	ndev = of_get_child_count(client->dev.of_node);
> +	dev_dbg(&client->dev, "%u devices on the mux\n", ndev);

Should this be %d?

> +
> +	muxc = i2c_mux_alloc(adap, &client->dev,
> +			     ndev, sizeof(*priv),
> +			     I2C_MUX_LOCKED,
> +			     mux_select, mux_deselect);

Nitpick: this could be written with less lines.

> +	if (!muxc)
> +		return -ENOMEM;
> +
> +	muxc->share_addr_with_children = 1;
> +	priv = i2c_mux_priv(muxc);
> +
> +	priv->regmap = devm_regmap_init_i2c(client, &mule_regmap_config);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(priv->regmap),
> +				     "Failed to allocate i2c register map\n");
> +
> +	i2c_set_clientdata(client, muxc);
> +
> +	/*
> +	 * Mux 0 is guaranteed to exist on all old and new mule fw.
> +	 * mule fw without mux support will accept write ops to the
> +	 * config register, but readback returns 0xff (register not updated).
> +	 */
> +	ret = mux_select(muxc, 0);

Should this 0 be MUX_DEFAULT_DEV (for consistency)?

> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(priv->regmap, MUX_CONFIG_REG, &readback);
> +	if (ret)
> +		return ret;
> +
> +	old_fw = (readback != 0);
> +
> +	ret = devm_add_action_or_reset(&client->dev, mux_remove, muxc);
> +	if (ret)
> +		return ret;
> +
> +	/* Create device adapters */
> +	for_each_child_of_node(client->dev.of_node, dev) {
> +		u32 reg;
> +
> +		ret = of_property_read_u32(dev, "reg", &reg);
> +		if (ret) {
> +			dev_err(&client->dev, "No reg property found for %s: %d\n",
> +				of_node_full_name(dev), ret);

return dev_err_probe() as above?

> +			return ret;
> +		}
> +
> +		if (old_fw && reg != 0) {
> +			dev_warn(&client->dev,
> +				 "Mux %d not supported, please update Mule FW\n", reg);
> +			continue;
> +		}
> +
> +		ret = mux_select(muxc, reg);
> +		if (ret) {
> +			dev_warn(&client->dev,
> +				 "Mux %d not supported, please update Mule FW\n", reg);
> +			continue;
> +		}
> +
> +		ret = i2c_mux_add_adapter(muxc, 0, reg, 0);
> +		if (ret) {
> +			dev_err(&client->dev, "Failed to add i2c mux adapter %d: %d\n", reg, ret);

return dev_err_probe() as above?

> +			return ret;
> +		}
> +	}
> +
> +	mux_deselect(muxc, MUX_DEFAULT_DEV);
> +
> +	return 0;
> +}

...

