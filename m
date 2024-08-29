Return-Path: <linux-i2c+bounces-5922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E10964242
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 12:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C709C284D80
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 10:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5967318FC61;
	Thu, 29 Aug 2024 10:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="BVq34KqR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B6315C14D;
	Thu, 29 Aug 2024 10:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724928769; cv=none; b=jxV0S+2VfbCO3YoxPRfCalGyoeeUS33UHZKNlCq9Teq00Dt71imlBk59RxjJQpy0f2YISy73CUafiA5R/OgfW3n9UKUuZzR762eDXgkvYbiDYJALsXKWbVbYLTpCOLkL/LlwMnixoqK/zcz11QWgoayx2UVrJCOE1ij6OaxnVZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724928769; c=relaxed/simple;
	bh=xAzqLxI6n/neokgAKtZlAm5+BHpR/kvIzF4uIImqQ50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NzZdomIjnQHo86qFOgh3IxMuN7Xy2jl2Ye/1FuICzhgX9QeHxB7WDADzv9mu7vZXOHp6qiXZAFhtSHLhv4ImWotMTljD6iszNgYckgRAu5MIBtibAZbJprOvsZzpNgiKEyuMs0vL16lhK27kc+CPYdBG8+1ViVDYcJZpI47Tzus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=BVq34KqR; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724928754; x=1725533554; i=wahrenst@gmx.net;
	bh=eWqW6seTZyYAYsQq0Fh/3f/9N2mYgSw5y1XLcuEmmhQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BVq34KqRLO8lxwDlyQtUtUvplgx8XBVkFbeT68q2h3B3H3TS7ybORafQJ/ddZ7Vh
	 Qzzb58JAUH2Pr3HZleI6iBDLHdIcUVGUBDH2BuUtq697TN/ed5EY/MMPZbpDpH4Hs
	 HdsocHXQY9J7MSFyCxDZLj97zu3fhOaOVxwcA1CBaXcCnxwi1PMbJLEJP/74FFcoo
	 eAFnjgyG0J6S3TXKeLc9c3abUbfki6nJglL3N09Q00PslPVpS7W8QNJUEsLevhU1Z
	 X6C4FUcNDa427XE97UtjGgYhlRaOPpByw62/GoLV2+/pDmvQaKNhno7iIKIc3kWht
	 jEKtYW+4dtE5qOaF6g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfYLQ-1s8M4P3F1s-00eKEn; Thu, 29
 Aug 2024 12:52:33 +0200
Message-ID: <6bc3f830-13dc-4df1-ad41-6228976c0dcd@gmx.net>
Date: Thu, 29 Aug 2024 12:52:32 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] i2c: imx-lpi2c: add IRQF_NO_SUSPEND IRQ flag
To: carlos.song@nxp.com, aisheng.dong@nxp.com, andi.shyti@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240829093722.2714921-1-carlos.song@nxp.com>
 <20240829093722.2714921-2-carlos.song@nxp.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240829093722.2714921-2-carlos.song@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IZF4z6LFDGWBDTHQmU1hyulDnSwdCxDIpXwFGk+40pRSrd3vRqc
 X0Qi6w/NOf+ij/skXAg0ZPK3IVfNSLxwIfy5ZWBDifBH4HBLBgeq3/bjsIaSTdQgRfiPuDY
 /+w8Hl4pOmA1cPvDZ+L2RTBrJpynuRpaxlj6fC2u9MHGRUG0xwTpAL0dVB5yHHHewaj7TQ3
 qsXnDv2fqD5SX5VKIgN3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1a903cghFHM=;KssrqL7utNOx45/jKKQCup5EE2l
 SbWB1W/15VQhe6couMaXIXZmtO5mAf0H7zi09yIqHnU7GAOIejXLFL8r2ayWfHdsACBACk3Z+
 9KqVFN2qVhfzjPWkb9AMPL8y2wNQMh/nSe4KecXMUqDZyeFldXEE7G10XzcNI++2XX0alRa/B
 lkMz+82+RhWvVjuRYGlKBDmqXo5/QsGlxd0n3JP7YvcOtWggON+zm/mAFgLDycFssfrNRSJUH
 coIAb/Qu3BWrDcQjKL21eR6WjjOkmI+krFizDYy/zEGGab5x2bp42AU4gE+ve9Shm4jRWVDbu
 Sl8BZUldcN+GhBqDvkdh9FTldQ2I2zuntt3kvpLiDFAVHMotJwigfW472MoAHumBUaoeXEHzV
 hBU94dzFtk06OgXh7DO8Doii86k1LasDIa+LErMudK7W34TPNhkhZlHBTzaowpfImTbrjITKo
 lxRcQ+kz+H9j8+9ywmWnG0X0lwZwiaSXApS0HE0jFCkkBW1zLofPd0XpTk9443xmAQasWvfGI
 de9e5fscWs6x7wqRsQw0FGLMiECNvoUcaaL783ChoFV+/yENspoBne9KAkI5DaETCGeMaNA8c
 ycniuvRw+9UkwOIqfTC2mjnP5amGQmx6zWwJBofn64mFcXWgu2CvBJ5mGMuqhG2ZahUwGnCNe
 N2KVTBfxzwMJ/mIbwRDsWRKhCYDwiAdIrHvlcmte6O3hpMHCoZLbZ+EEJ38tQx/d5pJUSQfb3
 xu+jgx0AkHlHrOh0oFsQe5HvvcYwb7T0tsFHuHek44Mt/f0psfFXLeQX/idtbvEQcjoICEaX3
 3pbKL+vkUZlsMpCL9A9k69oA==

Hi Carlos,

Am 29.08.24 um 11:37 schrieb carlos.song@nxp.com:
> From: Carlos Song <carlos.song@nxp.com>
>
> Set IRQF_NO_SUSPEND flag when request_irq(). Some devices such
> as extend GPIO will need i2c transfer during the entire system
> suspend and resume period so keep it enabled.
do you mean GPIO expander which are connected to I2C?

Do the mentioned expander have a dedicated IRQ line or does the host
needs to poll I2C?

Best regards

>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/i2c/busses/i2c-imx-lpi2c.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c=
-imx-lpi2c.c
> index c8f3dadfb36e..23f83f10d5f6 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -1309,7 +1309,7 @@ static int lpi2c_imx_probe(struct platform_device =
*pdev)
>   	if (ret)
>   		lpi2c_imx->bitrate =3D I2C_MAX_STANDARD_MODE_FREQ;
>
> -	ret =3D devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
> +	ret =3D devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, IRQF_NO_SUSPE=
ND,
>   			       pdev->name, lpi2c_imx);
>   	if (ret)
>   		return dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", irq);


