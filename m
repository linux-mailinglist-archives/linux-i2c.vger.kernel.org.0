Return-Path: <linux-i2c+bounces-7071-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C0D98909F
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2024 18:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ADD51F21C39
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2024 16:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C6D60B8A;
	Sat, 28 Sep 2024 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="t4PMW2ej"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C2A2FB6;
	Sat, 28 Sep 2024 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727542614; cv=none; b=VfGShnBJ3SYG2FXiiResp77/2RHPJ5eq/8C/QucYyAt8HrXRMcdzNp4/BgZN3MX7pflb+t3IxpWtuuMh6arMOx9wGQfj4zHCCNmVDnQOFIfRcObh61Mck45NVl6/uqH2iAyWp7O33icMwswWUPEZFWDqES+61Wiv3HcQgO+2dyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727542614; c=relaxed/simple;
	bh=hDEDo1CY2ZBlEnw5/mfDoYtZhnnoKIunrLRxqClcQ+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eps2lSSaf9xIROpw3OA880SCEd3KokQAsWCIzsOq0RL7qtqnS+iRHr9sozOlK1l6MXEAG4Rv7KpjO5XzPOucVf4bF6N3HkD//e4hJA8JW0F30HLuCiRKvb92rIQRcIEWfPskyC2Eul8NDL8hoDUH09ZvGPFZC/0fK51oyNWeXvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=t4PMW2ej; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id uakKsBRjHT91vuakLsLYa4; Sat, 28 Sep 2024 18:56:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1727542604;
	bh=D17AO7QyPuDKKFRH61kWXKbKb/GArvuHEWhNy8FM3EE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=t4PMW2ejOdf3Utn5gyjxWlicRjcyEDC71qACKFBO65IAgXq7KDik7qSLT11wsCewx
	 vlXL5IXK9goQksZvMQX+JnF7TywieQsHYLEYdN23BuIkoVQXWgC3+aClxGfxWqRnnn
	 thpnIGEX0zSjjj/G8IIL9G7SvQrbDiuioqscLf5IO/84P1Q35J42mdx1QFMiUeQsB3
	 3s4hORAiz98P7/PQz015ABRI9kRcU3w95Y2i7/9Dvf/+B2NS8e4kwjX/foHZi7Slin
	 9f2nbu90RSDfWQ3Qah+y/t+iUsQ4IB+ejnj1SnOCQEFHcvQMBafRAsjmUtnnx9lYQ5
	 shGrBX8iVBSMA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 28 Sep 2024 18:56:44 +0200
X-ME-IP: 90.11.132.44
Message-ID: <316e200d-74b6-4d03-952e-e8612276f0e8@wanadoo.fr>
Date: Sat, 28 Sep 2024 18:56:40 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
To: Farouk Bouabid <farouk.bouabid@cherry.de>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>,
 Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
 <20240906-dev-mule-i2c-mux-v8-2-dbd28a150e41@cherry.de>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240906-dev-mule-i2c-mux-v8-2-dbd28a150e41@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 06/09/2024 à 17:54, Farouk Bouabid a écrit :
> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
> among which an amc6821 and devices that are reachable through an I2C-mux.
> The devices on the mux can be selected by writing the appropriate device
> number to an I2C config register (amc6821 reg 0xff).
> 
> This driver is expected to be probed as a platform device with amc6821
> as its parent i2c device.
> 
> Add support for the mule-i2c-mux platform driver. The amc6821 driver
> support for the mux will be added in a later commit.
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> ---

Hi,

> +static const struct of_device_id mule_i2c_mux_of_match[] = {
> +	{ .compatible = "tsd,mule-i2c-mux", },
> +	{},

Nitpick (in case of v9): usually, a comma is not added after a terminator.

> +};

...

