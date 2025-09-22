Return-Path: <linux-i2c+bounces-13076-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43AB8F589
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 09:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EDF5189743F
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 07:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91C22F7AC2;
	Mon, 22 Sep 2025 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pUe2aln1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777CE2F7AB4;
	Mon, 22 Sep 2025 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758527672; cv=none; b=rfcnmXz+fcxH8JxH9c3WVQ64FIHAvvGF3Nh6KNCIj7ALrIfM135xTw5PVOHjbdHXFegRsjbJlZOYRIh4kP3q+EdirWtjNIxbEpdKVykqfSo1R7CDa1808Al46eMMupnE1yuuV68I2+WV93Ozf7wwnXk1SqXngxcX6829//CV5PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758527672; c=relaxed/simple;
	bh=0iFWjWmm10I7s3tjgXzkqF+axpO0XqIWYpCg5ZNToRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PjAKt145RsaSH0eLkx/0EyIGAvZggv2Sytk0l2f7hxsPtiBLQFbpMWCNOhq2rISL+psVCfwqt9JTvTV3uKi23VIQZuFSenOgvmN6mqUZQ9pofwdv4OrBJG3DSb3yE1hCLy5aUn2TiNLUUGY3b1cQtLYca5/foaEJUARDzI9UQf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pUe2aln1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758527662;
	bh=0iFWjWmm10I7s3tjgXzkqF+axpO0XqIWYpCg5ZNToRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pUe2aln1kgbInn1sd3eipvoHMhd3Z61caAUAtGbUsMVpb/G+Rhr8WRtZXEd4nsRwp
	 sceyvOL0BMqYhIegw0zZZ/LImHjo2xtrEDYa9kluRrwLQmJ0x4GyuBfMTBLEd5duq2
	 G/5REOOvTKYwy43PQMTuokW1xK2EenrIbxto34dgIYJ7uT23DY+JBEo31sruBLSQZy
	 R2+GxbD0CsBE33nbQt68CjzurcK+Jp1VReEmhDmtRgBhXZagjvAdinNxrxsSioklOQ
	 27TUx/zUQsifEPfUSgfosvlrBE9FuUT+vtztS0lo8sZuz/93eZsqZ6cqnT6kijqgme
	 l1QcGfOHSO4yw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FC6917E10B7;
	Mon, 22 Sep 2025 09:54:22 +0200 (CEST)
Message-ID: <8e9947ba-c37c-41e3-9e0e-c802aae0d833@collabora.com>
Date: Mon, 22 Sep 2025 09:54:21 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: mediatek: add support for MT6878 SoC
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
 <20250920-mt6878-i2c-bringup-v1-2-d1527ffd3cd7@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250920-mt6878-i2c-bringup-v1-2-d1527ffd3cd7@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/09/25 17:31, Igor Belwon ha scritto:
> Add support for the I2C units found in the MediaTek MT6878 SoC.
> Just like other recent MediaTek SoCs, it uses the v3 register offsets
> (which differ from v2 only by OFFSET_SLAVE_ADDR being
> 0x94 instead of 0x4).
> 

That's exactly the same as mt8188_compat, so you don't need to add new
platform data for this SoC.

This means that this patch is not needed.

Cheers,
Angelo

> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index ab456c3717db18eef74226de0ee88c49228796f5..085702aee006a6dd0ac89d1382a12fbac2d91c55 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -402,6 +402,19 @@ static const struct mtk_i2c_compatible mt6589_compat = {
>   	.max_dma_support = 32,
>   };
>   
> +static const struct mtk_i2c_compatible mt6878_compat = {
> +	.regs = mt_i2c_regs_v3,
> +	.pmic_i2c = 0,
> +	.dcm = 0,
> +	.auto_restart = 1,
> +	.aux_len_reg = 1,
> +	.timing_adjust = 1,
> +	.dma_sync = 0,
> +	.ltiming_adjust = 1,
> +	.apdma_sync = 1,
> +	.max_dma_support = 36,
> +};
> +
>   static const struct mtk_i2c_compatible mt7622_compat = {
>   	.quirks = &mt7622_i2c_quirks,
>   	.regs = mt_i2c_regs_v1,
> @@ -525,6 +538,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
>   	{ .compatible = "mediatek,mt2712-i2c", .data = &mt2712_compat },
>   	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
>   	{ .compatible = "mediatek,mt6589-i2c", .data = &mt6589_compat },
> +	{ .compatible = "mediatek,mt6878-i2c", .data = &mt6878_compat },
>   	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat },
>   	{ .compatible = "mediatek,mt7981-i2c", .data = &mt7981_compat },
>   	{ .compatible = "mediatek,mt7986-i2c", .data = &mt7986_compat },
> 


