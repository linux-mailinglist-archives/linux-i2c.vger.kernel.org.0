Return-Path: <linux-i2c+bounces-4657-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E83928379
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 10:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29E7C1C21EE2
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 08:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C918145B0F;
	Fri,  5 Jul 2024 08:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="z3V/Uwks"
X-Original-To: linux-i2c@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2626145A02
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jul 2024 08:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720167311; cv=none; b=j2By/ZsBDF6y2hAptg2RPKZs14s+3dbtqBKs9Pt6qgDP6r/Id9LxT8BPYjd9o2A8QUMwed58DKJ59Fnab045lbz5cllFN1ME9HP9+lxHtbC+Bgw4VFtc2Fy+suHwpvZvxD6RgA/I0pMKaaxF1m3VNss6D3zO7AZiH7bnsQnvm1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720167311; c=relaxed/simple;
	bh=DiwSS4yikvpV+oKcCFDeiIn47VFoALKnDeJ3RnaTyBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BYsA6LKTpi2qLapTEgUjaTqtGybbY15NUmXehc/G6orFF8HMMPiJTZI52gRMwA/uC5ybQEgM6QOFs7F0ONVyZjd/GQrjej9dBZj2bpovlDMke5ZrjcXZlZ3fFRqsFqyVoTzS6qc4HA3GSYJkT9K4oxLsnvJSoCipa8yyAKoAdXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=z3V/Uwks; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720167308;
	bh=DiwSS4yikvpV+oKcCFDeiIn47VFoALKnDeJ3RnaTyBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=z3V/Uwks/hWpV2Xqj43hnEGdSrVkIMEYacjN6dVuj3nX28wNONmI+5BvSzuSJnHWn
	 eeMemKqU5iHlLUy1FqnsUPQbq1dCvuDXrvwetKIZSGPkYKEifdzbxFyF3ibwCraUNQ
	 jST6WfOfcYTffU9/Se0x/yxperp/4dL2Sddv2YfZgeCSh/22yWIWfH+Ot5vv3/nYYr
	 r363D1aeVZsdo5GWqigju4Q50NkiOnAZOpBoXB5wcKU2V5elIvVQynXjfrFktF07jv
	 +rofkPQXvk4sPKjeBQD15i6e4sPvcnJ6+2KoVckWcx+fIpXUXZziJ4c7XpthmjIEvD
	 pafvg3c9XRggw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8EF7E378219E;
	Fri,  5 Jul 2024 08:15:07 +0000 (UTC)
Message-ID: <b402896c-6b91-4973-9e4f-8d1f7128afdc@collabora.com>
Date: Fri, 5 Jul 2024 10:15:06 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: mt7621: make device_reset optional
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-i2c@vger.kernel.org
Cc: sr@denx.de, andi.shyti@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, upstream@airoha.com,
 benjamin.larsson@genexis.eu
References: <cover.1720130844.git.lorenzo@kernel.org>
 <3ea697be239c450cbc622f3e2e9dff8bf17515c0.1720130844.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <3ea697be239c450cbc622f3e2e9dff8bf17515c0.1720130844.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 05/07/24 00:16, Lorenzo Bianconi ha scritto:
> Rely on device_reset_optional() instead of device_reset() in
> mtk_i2c_reset routine since Airoha EN7581 reset controller does not
> implement the reset callback and device reset is not mandatory on this

Not mandatory means that the reset line for I2C exists, but you don't want
to use it? If so, that's not right.

On the other hand, if there is an issue with using that reset line and you
want to avoid using it for a good reason, please describe it into the commit
description and - in that case, you'll have to add a EN7581 compatible and
code to avoid calling device_reset() on that SoC.

What you're doing here is removing an error log on SoCs that do *need* that
reset line to be in place, so, hiding a problem that could be causing other
issues on peripherals connected to the I2C bus of those other SoCs.

Cheers,
Angelo

> SoC. This will remove the following log:
> 
> i2c-mt7621 1fbf8000.i2c0: I2C reset failed!
> 
> Tested-by: Ray Liu <ray.liu@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   drivers/i2c/busses/i2c-mt7621.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 81d46169bc1f..8cd89a2f59df 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -85,7 +85,7 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
>   {
>   	int ret;
>   
> -	ret = device_reset(i2c->adap.dev.parent);
> +	ret = device_reset_optional(i2c->adap.dev.parent);
>   	if (ret)
>   		dev_err(i2c->dev, "I2C reset failed!\n");
>   



