Return-Path: <linux-i2c+bounces-5239-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F87394CACA
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 08:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D322A1C20ED4
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 06:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB0116D333;
	Fri,  9 Aug 2024 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="RB1Jo8lo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADBB1B964;
	Fri,  9 Aug 2024 06:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723186226; cv=none; b=sFXMesIn+WFOgLFjWCr84Pfp5au/66mjneQjjYb4QQT/m7tu7L87Zw6GjWMtAZgySR/4IIf6gVsSoMK8YxToFf/551OYIvKSVClDndSEXY85PdK6oDDw86W8/L8GeGucJQ9tq2maR6O6CArDSEeRC637JPKXxBT4PLOkgfCjpTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723186226; c=relaxed/simple;
	bh=72E2jhWy/r/3jnV9mAQzktUSz2JhN8s3C7jiuUmeljY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hvfOvs5BqGXOTkHlectRGOzgfBDHaeAzmQn5LHK0dgIDHMW93eSSkM0nTm6swtIzfWK6NDAMR4+aTiKdOF5pmtgVqNGJePHfDeNhFjMnXLhee8PQKevUZz3yFbR42VG5/At0zf1VOTg4zYjBI4yzqiT8BLsoKVA7+8V8Cvn7jq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=RB1Jo8lo; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1723186214;
	bh=5uYBr/CIFzaQRY37KqeUd1wsgmX/a2UIMBFZNNuBTCQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RB1Jo8loP0WHItilgeXOat+Ciux4bQKTuLpUlFVjD67L82ztZP2C4gy4VIX4qY8Pi
	 x8zFWyXTlYIRDllnrkvf72F1sk7gn6ISfuVgVUIfhCt1QN60otToVUuJ8mTH8Mzyrn
	 Si9deqDZhvDkrMvo8jCN+/PrMuXH4fQ6xX9hMPtht3Qi1EKGzWTAiVnHpzdFxhhNwA
	 KHkoSBuRB0uc0oi2BhE4OCy/Moi9mFvy+bKej5wrqeVEIu9oKCMzehyjNVAlNYtUGe
	 eOxbCg3F2hTE66NDeTDTfCYVxN5JoynTgZ87pWlZFf0i8lmLSqjcVgF6Qhrt1cB8BU
	 ZfiGRI5XkWu4A==
Received: from [192.168.68.112] (203-57-213-111.dyn.iinet.net.au [203.57.213.111])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CF87A656AB;
	Fri,  9 Aug 2024 14:50:11 +0800 (AWST)
Message-ID: <b54d11728eebb5307c1bf8ce290764bb001c725e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 7/7] i2c: npcm: fix checkpatch
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
 tomer.maimon@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com, 
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com, 
 benjaminfair@google.com, andi.shyti@kernel.org,
 wsa+renesas@sang-engineering.com,  rand.sec96@gmail.com, kwliu@nuvoton.com,
 jjliu0@nuvoton.com, kfting@nuvoton.com
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 09 Aug 2024 16:20:11 +0930
In-Reply-To: <20240807100244.16872-8-kfting@nuvoton.com>
References: <20240807100244.16872-1-kfting@nuvoton.com>
	 <20240807100244.16872-8-kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello,

On Wed, 2024-08-07 at 18:02 +0800, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Fix checkpatch warning.
>=20
> Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_sl=
ave")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index 1af6a927b9c1..dbe652d628ee 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -1783,7 +1783,7 @@ static int npcm_i2c_int_master_handler(struct npcm_=
i2c *bus)
>  		/* reenable slave if it was enabled */
>  		if (bus->slave)
>  			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
> -				bus->reg + NPCM_I2CADDR1);
> +				 bus->reg + NPCM_I2CADDR1);
>  #endif
>  		return 0;
>  	}

Fixing checkpatch warnings means you need to modify the commit that
checkpatch identified as having problems, not just add a fix-up patch
on top.

It looks like this change should be squashed into the patch before it.

Andrew


