Return-Path: <linux-i2c+bounces-2753-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7C58974E6
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 18:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A409528AD10
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 16:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200F514EC63;
	Wed,  3 Apr 2024 16:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcKjSobB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B588C14E2DC;
	Wed,  3 Apr 2024 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712160590; cv=none; b=tMzNNRwvuL4xKu3ObIZreVIYllJX0VEwnt/9/8A9m83Y6EXAavLbiAO26dJm+dct40OW8b0IrFb4AK5wimx0arKEaeuS2QMi5484j3+J2fe0i2Kw8/+449DDCg2tvvusRqoDxEbwKaO0/n/RWy6vyas726DFXQ1J9mNIuI4cS+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712160590; c=relaxed/simple;
	bh=8hzZGuG3Djlgf0qMwrfrn4bWy2pLWmCCjfypaPd6iaU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=tJaGtwjEjTezCb56WYqyDf0bl03EZxpj8BiJulTlSG/m95BaVKr7XaVQwgkSAHlT7aHjzTF8byu4fD6Lh10WsoKifcpnI1QoMsY5+pBvmZXSO+SCbj7Syb09/5iJK5uSjlrA9cgtNy0UxZxDgh73e+aHoeiV/tx/09miV/2PXc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcKjSobB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D70C433B1;
	Wed,  3 Apr 2024 16:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712160590;
	bh=8hzZGuG3Djlgf0qMwrfrn4bWy2pLWmCCjfypaPd6iaU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=jcKjSobBys2AwDWtHUg+nZNz255hX8YJ8clocbZnVtIj0h52DY808t+gVnLSzkMLC
	 X2jjQFAvUGmd4lb2M/HiK8OYAD4oRg6oM2wRSk/RtDyPOErdicM/kRH7ZmaFffstdd
	 A5uhuABW7lcrvZbj6juYMAQtimJyqGFQZcIGMI0EOpEDTaFtJn8kgeNnGah9Hgz94S
	 IOzUjSSG8Dy1PPZNqM66yJrWCw2X5fzAFrh0GVmZ1l/EQYOliuMJ261ne92VmHIt0M
	 aZaraEfx5h6OpkWv3gkSRGiGucYprWgAnxL9Gst4Y9JBTDvukYB1H1HajHS8VYD79T
	 fVNVTde8ha+Ew==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Apr 2024 19:09:38 +0300
Message-Id: <D0AM9RGC7D65.2V9TFGBOSF3LN@kernel.org>
Subject: Re: [PATCH 33/34] drivers: remove incorrect of_match_ptr/ACPI_PTR
 annotations
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Arnd Bergmann" <arnd@kernel.org>, <linux-kernel@vger.kernel.org>,
 "Corey Minyard" <minyard@acm.org>, "Peter Huewe" <peterhuewe@gmx.de>,
 "Vinod Koul" <vkoul@kernel.org>, "Moritz Fischer" <mdf@kernel.org>, "Wu
 Hao" <hao.wu@intel.com>, "Xu Yilun" <yilun.xu@intel.com>, "Jiri Kosina"
 <jikos@kernel.org>, "Benjamin Tissoires" <benjamin.tissoires@redhat.com>,
 "Michael Hennerich" <michael.hennerich@analog.com>, "Peter Rosin"
 <peda@axentia.se>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Iyappan
 Subramanian" <iyappan@os.amperecomputing.com>, "Keyur Chudgar"
 <keyur@os.amperecomputing.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Yisen Zhuang"
 <yisen.zhuang@huawei.com>, "Salil Mehta" <salil.mehta@huawei.com>, "Tony
 Lindgren" <tony@atomide.com>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Xiang Chen" <chenxiang66@hisilicon.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Russell King" <linux@armlinux.org.uk>, "Jiri
 Slaby" <jirislaby@kernel.org>, "Jacky Huang" <ychuang3@nuvoton.com>,
 "Shan-Chun Hung" <schung@nuvoton.com>
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Jason Gunthorpe" <jgg@ziepe.ca>, "Tom
 Rix" <trix@redhat.com>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, "Randy Dunlap" <rdunlap@infradead.org>,
 "Rob Herring" <robh@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, <openipmi-developer@lists.sourceforge.net>,
 <linux-integrity@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-fpga@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-scsi@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.17.0
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-34-arnd@kernel.org>
In-Reply-To: <20240403080702.3509288-34-arnd@kernel.org>

On Wed Apr 3, 2024 at 11:06 AM EEST, Arnd Bergmann wrote:
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_=
tee.c
> index 2ea4882251cf..0c453f3f928d 100644
> --- a/drivers/char/tpm/tpm_ftpm_tee.c
> +++ b/drivers/char/tpm/tpm_ftpm_tee.c
> @@ -362,7 +362,7 @@ MODULE_DEVICE_TABLE(of, of_ftpm_tee_ids);
>  static struct platform_driver ftpm_tee_plat_driver =3D {
>  	.driver =3D {
>  		.name =3D "ftpm-tee",
> -		.of_match_table =3D of_match_ptr(of_ftpm_tee_ids),
> +		.of_match_table =3D of_ftpm_tee_ids,
>  	},
>  	.shutdown =3D ftpm_plat_tee_shutdown,
>  	.probe =3D ftpm_plat_tee_probe,

For this portion:

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

[can be included to possible new revisions if it stays same]

BR, Jarkko

