Return-Path: <linux-i2c+bounces-3983-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F7690430C
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 20:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AFB4B23262
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 18:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FF75915A;
	Tue, 11 Jun 2024 18:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="DTqnmkq3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-211.smtpout.orange.fr [193.252.23.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4A9482D7;
	Tue, 11 Jun 2024 18:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128933; cv=none; b=b7QCWdEYTbrrnvJvV4+K3kKIvl5CnYgODNP/GYFmKJxZNI3rPcAYMzNbu5rysRTQfk++2VkNqAjRuJZOiNXFGRsPw/+wZIB4u0rXenS3v98DsLjKDoQapB0Yw7uHTM5eeGyhHm6eg4E5QIBCDGFF44XsE1/K8Pfjq+b7tNwXdSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128933; c=relaxed/simple;
	bh=YUHiodGpp73sqvczyecHAhYKXtDOOc3TzympJjSgnQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YcFS7PYTkX74Mp/Zv7B/p3MIvymXtODK72p9nZTH5wOcZ+UMgjv6uyC0j1ASqprY6SFO/kEzdXu30gZ1fDnNm/4wMwIBjOJJs7V/iuVv1oDPeTY9cqPV0NeEVT0NIBC/XeS8Mu/NtJ/coU6YFKwrZ1GqsW5J/ZTO7Y8DVY5bjH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=DTqnmkq3; arc=none smtp.client-ip=193.252.23.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id H5olsL40AaOgCH5olse2pO; Tue, 11 Jun 2024 20:02:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718128922;
	bh=LfOZxncwwf6XREq5b9IL5FbGRIjBFwt+UfYI2IfGiqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=DTqnmkq3oHxGUc3HJf1P3fO9wTa2aXnPdpyzGtzCVR9euIO0UUlxZiUGHlVPrkHHs
	 LH+hO+FaXddLE5a+/V/o/UuBlmC1a06k54T83/GOyqjzcTQDuC5zAiQlncL6uI/PDq
	 1YqRAFY9S9fTFL+LL3RmQSGZRMlBfsg9Axu3DhlyjLNxtlzhchB4zD0RHEcS319iLE
	 PgIgfm+T0mrDH//O4rcTjenuUXRtkAo8LvliZlpSFFgdLc/ljIfU1vBWkffCrIpXvO
	 icOl4YqmCTiY+/Xpjy3wnKXh68fSeiwEw+JquSPdOyieb9uNR5zO2AfSER3Zx7315j
	 XC+F/pXTEycpA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 11 Jun 2024 20:02:02 +0200
X-ME-IP: 86.243.222.230
Message-ID: <81006407-cfbd-47b7-8050-3a455f9654dd@wanadoo.fr>
Date: Tue, 11 Jun 2024 20:01:59 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] i2c: mux: add the ability to share mux address
 with child nodes
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
 <20240611-dev-mule-i2c-mux-v3-1-08d26a28e001@cherry.de>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240611-dev-mule-i2c-mux-v3-1-08d26a28e001@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 11/06/2024 à 13:43, Farouk Bouabid a écrit :
> Allow the mux (if it's an I2C device) to have the same address as a child
> device. This is useful when the mux can only use an I2C address that is
> used by a child device because no other addresses are free to use.
> eg. the mux can only use address 0x18 which is used by amc6821 connected
> to the mux.
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> ---

Hi,

2 nitpicks below.

> --- a/drivers/i2c/i2c-mux.c
> +++ b/drivers/i2c/i2c-mux.c
> @@ -334,7 +334,53 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>   	priv->adap.dev.parent = &parent->dev;
>   	priv->adap.retries = parent->retries;
>   	priv->adap.timeout = parent->timeout;
> -	priv->adap.quirks = parent->quirks;
> +
> +	struct i2c_adapter_quirks *quirks;

Should this be at the beginning of the function?

> +	/*
> +	 * When creating the adapter, the node devices are checked for I2C address
> +	 * match with other devices on the parent adapter, among which is the mux itself.
> +	 * If a match is found the node device is not probed successfully.
> +	 * Allow the mux to have the same address as a child device by skipping this check.
> +	 */
> +	if (muxc->share_addr_with_children) {
> +		struct i2c_client *client = to_i2c_client(muxc->dev);
> +
> +		if (muxc->dev->type != &i2c_client_type)
> +			dev_warn_once(muxc->dev, "Mux is not an I2C device\n");
> +
> +		quirks = devm_kzalloc(muxc->dev, sizeof(*quirks), GFP_KERNEL);
> +		if (!quirks)
> +			return -ENOMEM;
> +
> +		if (parent->quirks)
> +			memcpy(quirks, parent->quirks, sizeof(*quirks));
> +
> +		quirks->flags |= I2C_AQ_SKIP_ADDR_CHECK;
> +		quirks->skip_addr_in_parent = client->addr;
> +		priv->adap.quirks = quirks;
> +
> +	} else if (parent->quirks &&
> +		   parent->quirks->flags & I2C_AQ_SKIP_ADDR_CHECK) {
> +		/*
> +		 * Another I2C mux device can be a child of the Mule I2C mux.
> +		 * The former could probably not allow address conflict between
> +		 * its address and its own children addresses.
> +		 *
> +		 * For this purpose, do not propagate this flag unless
> +		 * share_addr_with_children is set.
> +		 */
> +		quirks = devm_kzalloc(muxc->dev, sizeof(*quirks), GFP_KERNEL);

devm_kmemdup()? (not sure it is a win)

> +		if (!quirks)
> +			return -ENOMEM;
> +
> +		memcpy(quirks, parent->quirks, sizeof(*quirks));
> +		quirks->flags &= ~I2C_AQ_SKIP_ADDR_CHECK;
> +		priv->adap.quirks = quirks;
> +
> +	} else {
> +		priv->adap.quirks = parent->quirks;
> +	}
> +
>   	if (muxc->mux_locked)
>   		priv->adap.lock_ops = &i2c_mux_lock_ops;
>   	else

...

CJ

