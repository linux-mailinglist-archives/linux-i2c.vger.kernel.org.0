Return-Path: <linux-i2c+bounces-9440-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 324FDA348CE
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 17:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C04C618885B2
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 16:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36101E0087;
	Thu, 13 Feb 2025 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NVYbwMYE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14301547F5;
	Thu, 13 Feb 2025 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462485; cv=none; b=SbM/gkzw9R0xsWWxpmAewVEDcMdbjKxDL2meCEhbPqOaM8Zxxqc0/F8f9vO3Y6d7IZOiaaVwYx/fUIubiftBOtxsNlqyUEKyLh8d3oycDxEpv1EJipxGEg1G2r0aGOcqWSrzHbDE+eVTPvjrSTl1oMUHGhm0XsbQFYyL8NvfNK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462485; c=relaxed/simple;
	bh=AELVohWuzqv0J7A48Oikubot5SUmdrGfFnK7WLpvZuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEvhDZivl0ymSm32eqomjadaIT6N1wcOxTM1QYzVLDFUCJpoayAC+D+W50OpH8OfijASgPZQQEbdlyoVvJ/n4BbL1FTrHuIoxm9JqyBU/cQDS5oCADZKT2BEhyV3/ppUVekTcAGRzopT3PqCVwAquPPo7WPbS953UWYFQ2SAKp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NVYbwMYE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739462481;
	bh=AELVohWuzqv0J7A48Oikubot5SUmdrGfFnK7WLpvZuU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NVYbwMYEOtW5ofaUzNvBnfgvSIRGa7YKHOH7eS2VboFXzc4V3pIMzNTRkGndYSEg3
	 O6YPH6mxC41x/wZJ+su4EbiJOX1IfNaHFhfzvFwqZ7uFZALiJL9xZEyRwttc1qq8xi
	 0dqubT3pG2Q8Qz8BlblK1IExKD98ZQ337x+cLs+pp0FuNrK9DE8L2S8Z+hOLZnflIj
	 nROJzUaFiUxqBBU4hw2kdZrCpaQ+j/E280RG0cIbENa44XufDhzBAEKzCd8zTCTWr8
	 cseXxf1G5Eh/zCf08awRZDXmha4XpUdFW12IgxOFRf0jX51b8DcP7YN1uT3Vac9UXK
	 ZTWLKXmgys9Bg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BB56C17E153C;
	Thu, 13 Feb 2025 17:01:20 +0100 (CET)
Message-ID: <ceb1cb01-78b8-4ed4-b4fc-23fdac78ab21@collabora.com>
Date: Thu, 13 Feb 2025 17:01:20 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] i2c: mt7621: Use i2c_10bit_addr_*_from_msg()
 helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Kamal Dasu
 <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
 <20250213141045.2716943-8-andriy.shevchenko@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250213141045.2716943-8-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/02/25 15:07, Andy Shevchenko ha scritto:
> Use i2c_10bit_addr_*_from_msg() helpers instead of local copy.
> No functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Can we please do the helper conversion as one commit and the (much needed)
cleanup of assigning len and de-duplicating the call to mtk_i2c_cmd() as
two commits?

One with just the conversion, one with the cleanup (or in inverse order,
as you wish).

Thanks,
Angelo

> ---
>   drivers/i2c/busses/i2c-mt7621.c | 20 ++++++++------------
>   1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 2103f21f9ddd..0a288c998419 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -164,22 +164,18 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   		/* write address */
>   		if (pmsg->flags & I2C_M_TEN) {
>   			/* 10 bits address */
> -			addr = 0xf0 | ((pmsg->addr >> 7) & 0x06);
> -			addr |= (pmsg->addr & 0xff) << 8;
> -			if (pmsg->flags & I2C_M_RD)
> -				addr |= 1;
> -			iowrite32(addr, i2c->base + REG_SM0D0_REG);
> -			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 2);
> -			if (ret)
> -				goto err_timeout;
> +			addr = i2c_10bit_addr_hi_from_msg(pmsg);
> +			addr |= i2c_10bit_addr_lo_from_msg(pmsg) << 8;
> +			len = 2;
>   		} else {
>   			/* 7 bits address */
>   			addr = i2c_8bit_addr_from_msg(pmsg);
> -			iowrite32(addr, i2c->base + REG_SM0D0_REG);
> -			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 1);
> -			if (ret)
> -				goto err_timeout;
> +			len = 1;
>   		}
> +		iowrite32(addr, i2c->base + REG_SM0D0_REG);
> +		ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, len);
> +		if (ret)
> +			goto err_timeout;
>   
>   		/* check address ACK */
>   		if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {


