Return-Path: <linux-i2c+bounces-5919-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 347DB964128
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 12:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E58F0285690
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 10:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCEC1190661;
	Thu, 29 Aug 2024 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="CFScTE9Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CE5190485;
	Thu, 29 Aug 2024 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926592; cv=none; b=QRclQo5FKtJSQBu/LNbouAnHpMweIHywzPOIYVeRAcECMGdbDakGRU7VENUEtaoMRiyXATcaQG3vwmhVxF7vRf8sxtDdH3zFV6TW/4Se318SkhHfUTgk5QWnDWdQ9bHKIqA/F+x3r6MQIkxe18hoNJaBb4nU3IMavc+yooUkIl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926592; c=relaxed/simple;
	bh=/LU6fryYn2sVSl/rTPdmvhFTh+vk4wxWRyKtICXy3mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mb2rjI5OOmnVFTzlDvYlXDvZTjkifqMWZXRIPaiPW4p8v42faHJcf3a25QeNTtXkiw1M+SwBQXYn6U8V1o5Ea3siOVVc5rmApxpzo7ktPHC34DusUbXoC0EYhcS5Qg9xIzAL+HtzgcQ7Nxngu4uuqLIWNLHpXG7JPWJSh7NW5WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=CFScTE9Q; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724926574; x=1725531374; i=wahrenst@gmx.net;
	bh=H+7yYy6PjlWDok5bWZPfuzjYnyw163BFGochPgRoawE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CFScTE9Q/bwa9rkMNxUwVgPo4bmEfKTOyqORUtCaCQa+lDNScrTq1wkTiJMvYNil
	 zQLJDp+WePijIjOnqhEAngS0ZS9E1F/GIj5PjFXQ27ilCY8jFmEdCjh/l4ab812up
	 lz9Cm68oG28qi4kCIlfi585tLGzM8QBsQn8Zaw/NU2pbrsNZefG8YKlydgxXZNHp2
	 m3zNy4baAdyFg3HNuUFkzXiOysR59nX5XHucwidWg/6RjGZ+voUr6ZWfZbug8AvHl
	 3eGH+9SmGw2tajVdp8XeJ9ifa38sSSHjabuS6gnEW6Yuo6wunk4NIcA9NdXQmSVL7
	 C4SmADy+bwwOp+1Bow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mv2xU-1rst5S1wG0-00tofn; Thu, 29
 Aug 2024 12:16:14 +0200
Message-ID: <fce999af-3613-4704-81a8-048159288b59@gmx.net>
Date: Thu, 29 Aug 2024 12:16:13 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] i2c: imx-lpi2c: improve i2c driver probe priority
To: carlos.song@nxp.com, aisheng.dong@nxp.com, andi.shyti@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240829093722.2714921-1-carlos.song@nxp.com>
 <20240829093722.2714921-4-carlos.song@nxp.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240829093722.2714921-4-carlos.song@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SRnNv4qabiDdwcVkDlCU2V8o6ns6tVenwj4ys2jeomh9FZF5x0T
 ei1sPoIylr0SxOMpGM3etirdEIMZ4BhM8MxW/EmkvbqHLzfga5cBaJvIgIEF5MYFFnfYSbJ
 twN5P9qvqyINQxRsweJ7r3mWH2BhFG57jyENImO88XZSI284Ubqfix7Ceag5zfC4eJ2iL9d
 U7/taYniSg/luTvhqttpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gFLkRigh9WI=;lOYWjUXUOCsaf3gLRTYolEcp7vj
 uM59YuGB9kBH3IJ2PmChVm9L3YhYurzzk2u1/8kRNYsyNi2vA8/mE3VN9aRB0tw7Hh6Fl8G6O
 GHDI45V+TVtuoi1sFqlsdRGC42iWyQKHJXfvHVtjQ8i3c1IumVZic6oqI80DHxYfisbOtiVxC
 kRFobdwGiz2N/2BsED4rbSbrdU8tRFrd7/VBB0UQL2pXaruRAoWRbGt6QJXF7r0nA6h70FMwR
 cNhlZF1t9US7KN6yUZW0PyTVMs/oFcN2wOtSpC1Y1dpZb+uKeXHZKz3656PbwF8J/UKeb44Xx
 bPEQSwCrCKswavi+kOGLJAhQnxtMmfV11JXYd0HPdHt+twD//uhnh2q8moDZ8AjkiU2TXNr3A
 AeBxqGlGFoBhjF4eesV/ZUw+FRoMGQUFzNDwZ/XM+HVKtB9uGKB4KqM9TjZD9f2yzBKmzoYLb
 TkDeJTdouyi16G964WIUTsMbORX5+QtplfP+QhHtT25iEAuLHhvqcxruH2H85BiXJ+cBQnrp0
 bGsNqtYNHEU/YXFeTvtZEnjZSikON49+CzySG9lusQ5yPIDDi2+Cdi1F2ZFkfXrSl9ARxOa9n
 6Gw+mJGySXKcUTnzH/R6ZexqohvjHhOoj7aApqATjgjfR3UZ8RabJokmCjxN171Lun3aNWEol
 cj7Rnf+zz4dzOFjWXazpcZLpy4IIVjG44wiC1ejkbc6KQ03kR6qUz61s3Gid66Py4asj9SaJL
 wE3yDOX6wE4LEbwvinN8Zbj4pEb0aRSA7wfXxYmXZgYpHuKZphvNxf47jYUmT0ab6GzN1jfWh
 W6TT/NXMDmJKGUaVXEhGocyQ==

Hi Carlos,

Am 29.08.24 um 11:37 schrieb carlos.song@nxp.com:
> From: Carlos Song <carlos.song@nxp.com>
>
> Some i2c devices such as PMICs need i2c bus available early.
> Use subsys_initcall to improve i2c driver probe priority.
thanks for providing this patch.

Please try to be more specific, which devices/platform has been effected
by this issue. It would be nice to provide to kind of
link/reference/discussion.

Best regards
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/i2c/busses/i2c-imx-lpi2c.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c=
-imx-lpi2c.c
> index 0159ade235ef..210d505db76d 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -1487,7 +1487,17 @@ static struct platform_driver lpi2c_imx_driver =
=3D {
>   	},
>   };
>
> -module_platform_driver(lpi2c_imx_driver);
> +static int __init lpi2c_imx_init(void)
> +{
> +	return platform_driver_register(&lpi2c_imx_driver);
> +}
> +subsys_initcall(lpi2c_imx_init);
> +
> +static void __exit lpi2c_imx_exit(void)
> +{
> +	platform_driver_unregister(&lpi2c_imx_driver);
> +}
> +module_exit(lpi2c_imx_exit);
>
>   MODULE_AUTHOR("Gao Pan <pandy.gao@nxp.com>");
>   MODULE_DESCRIPTION("I2C adapter driver for LPI2C bus");


