Return-Path: <linux-i2c+bounces-13275-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5374BA8DD9
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Sep 2025 12:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4F2A174F59
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Sep 2025 10:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5E72FB0BE;
	Mon, 29 Sep 2025 10:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GyiWhITq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE0C2F0C74
	for <linux-i2c@vger.kernel.org>; Mon, 29 Sep 2025 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759141165; cv=none; b=OhoTXW0PR8U/I0FzD/kkDovUhOMoo4m1OJTnCbeCnOy1j3oKEFjF3x4OqwBrFX5UoSbxFrlJyyEYMNX5tIQ4vndawrx4kWKFdEuMHY52k5wUYzYWKxWtH/o0AKuyvgiA+OPi/3odGg1P2V5PmUi8pjGirGFXbiyqrIGUcZb2Ha8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759141165; c=relaxed/simple;
	bh=uM45QtBn2WkfbUnPuyU78VZp3d+wVITSNdBrjE11qNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MlmkBlTj1nROBXOzntMScqY6/vuwH/+FMRkLSCIG7oqRxwFogvAnh3GtAV3uv9hbMN0kdHgM05Ihcc2ckZTKvRJAOiw3NHWZdxQhPhPNqZSdTB4hJdlP6H7tL/0SEn37kPowmG2RFMwb5LoTc+x+w/J7qkH5iLwLEkjwv7opjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GyiWhITq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759141161;
	bh=uM45QtBn2WkfbUnPuyU78VZp3d+wVITSNdBrjE11qNY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GyiWhITq98tH44d7S5usBLHJen2tc/eXRgP5Yjq+Gq35KcSMyD2JpvcN7ADRc4KDM
	 NxsGK4H6NFnr6PAhKQFNhgjcq7RIM+ahuFu7sFEonc3bwrE8C13pw4wXz42PBPbqAx
	 Uk6/KtciEcZGhtvkKIsTnDWQ/DRKgTnrrf7VNfD/pnFeCtvJG/mEXrI2iGnumcBP/n
	 /IsSuokA7tN2EFHaK+PAFom4Sn6nIp5K7/wjh/rC1CrRL5SlRHUtNP0oRePtLUhuYa
	 EOZZy1g45ehwTH2RRAXOBoR31/5ja4GevqgqlQ306qK5lQHDi4TXyiIslNpkkwLyb8
	 P5zw+0o7QfzMQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7080417E0125;
	Mon, 29 Sep 2025 12:19:21 +0200 (CEST)
Message-ID: <0b4d16a1-e125-4d99-babc-a08aa6fb9cbf@collabora.com>
Date: Mon, 29 Sep 2025 12:19:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: mt65xx: convert set_speed function to void
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250925210517.9873-2-wsa+renesas@sang-engineering.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250925210517.9873-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 25/09/25 23:05, Wolfram Sang ha scritto:
> cppcheck rightfully reports:
> drivers/i2c/busses/i2c-mt65xx.c:1464:6: warning: Condition 'ret' is always false [knownConditionTrueFalse]
> 
> Make the function void and simplify the code.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index dee40704825c..aefdbee1f03c 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -868,7 +868,7 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
>   	return 0;
>   }
>   
> -static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
> +static void mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>   {
>   	unsigned int clk_src;
>   	unsigned int step_cnt;
> @@ -938,9 +938,6 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>   
>   		break;
>   	}
> -
> -
> -	return 0;
>   }
>   
>   static void i2c_dump_register(struct mtk_i2c *i2c)
> @@ -1460,11 +1457,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   
>   	strscpy(i2c->adap.name, I2C_DRV_NAME, sizeof(i2c->adap.name));
>   
> -	ret = mtk_i2c_set_speed(i2c, clk_get_rate(i2c->clocks[speed_clk].clk));
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to set the speed.\n");
> -		return -EINVAL;
> -	}
> +	mtk_i2c_set_speed(i2c, clk_get_rate(i2c->clocks[speed_clk].clk));
>   
>   	if (i2c->dev_comp->max_dma_support > 32) {
>   		ret = dma_set_mask(&pdev->dev,


