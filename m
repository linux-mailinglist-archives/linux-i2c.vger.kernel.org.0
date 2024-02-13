Return-Path: <linux-i2c+bounces-1705-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A91853A97
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 20:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C817D1C21895
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 19:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49271CD10;
	Tue, 13 Feb 2024 19:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="nWkVD6yZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wQldVuk4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2D21CAA3;
	Tue, 13 Feb 2024 19:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707851633; cv=none; b=HQS4O4dIGlZooD7dmqNjy4PqYj8Rqxb0hH1AX1shbeWec6Gp1LEW/GiatfjU0TsFVkulwtKJq5OSeAer/3xj/eXcJJa8E4S06XYqki4nLH5EjPyWaSk2t5QR/2HUUZSY5JLU5gR+42nalAdyUEs/A3qD0gMzYACbLG6uwfqhUWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707851633; c=relaxed/simple;
	bh=DShjZopKWiZjPUPLOeHTkta2xg3ko4MDp909dRpqItQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Cc:Date:
	 Message-Id:References:To; b=WbF+sOCNxfWAhiISwil8jviYOmCNV0ja6HuTj5lnP+GRgjn9iK+bQiRknPVyRFPfsGU+q3275o/T8zrR12W62LaIg1/6vnaa3Infg4DLf2r/787pvmitvNlvlct9K/3CA0jd9ntHAAx9AaXRy9cWxNOq3uK3NH6Ub1a4zovNVwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=nWkVD6yZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wQldVuk4; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id 1943A1C000C3;
	Tue, 13 Feb 2024 14:13:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 13 Feb 2024 14:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1707851627; x=1707938027; bh=aytn2t5q3qBY3VpYwP44OHJAU0vpWTVc
	TQYfF06P7ZE=; b=nWkVD6yZKBVHJeUkuz3pOdHRt/YfGoYvWf5fzbFbPag4HL8t
	w+WOBiNObAy2aNsjodlq0TbEhiJwPB8s+RmUVX7VzB4DjU9Tm7Mcip/9XIRO/YQR
	Ar/p3GHJO3ABddjjsJg6/0+K6/FLzhJDon3JZECS7xDBK36f0C8gnGaZGw5OD07R
	ZPCPGAJQP9csitbQvUK4g8NdJm+PlOIfwCCDYux3EekHs+1kMiVXgznKlTyyj7mz
	ZOGiWDz9kxYIToeynSg9EngFgCFCl/AP+ZNAwu0FnTXqGeAKRbROAwCv+wrf5pG8
	8EkjnXdGo3ainLQnb2vmB5NqmNmr9y4hn00s0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1707851627; x=
	1707938027; bh=aytn2t5q3qBY3VpYwP44OHJAU0vpWTVcTQYfF06P7ZE=; b=w
	QldVuk4gZDTWiVo3CkCgrO87kxj1Xi/JPcZwTWPldhesBT3VDOzYpEmoSbBEvRqb
	C/fpOGzXSSOOt0SQLOckT2Hx/g42Qr9R/Q4vaKXhNX9o+92TLPpsfJ3EUQzdlESm
	elnedrOPht2OV+2yQTSl8sdRVtwDMezkBvL4f4m7/PBGBzD4WLNvtjgpsqQmMHTd
	6LZgMA/OFUORl73roh5EmD+T3uIMoPrKvxr7ZMy3xk3fLdOJ9CRuo33XdFPriN8A
	Xhj7B5UUWGca+z0IKX1Wzio93aVxWf7h/3pdSx6FS2g0NOQ5rZcOQGqSfI8tCOoJ
	9285fJd3csE6+NgK7vSSA==
X-ME-Sender: <xms:ar_LZYYKEjzYw_HOqrHJbG0xttmDiBm0E0Z_F-Iqzol4STYOWrzQzw>
    <xme:ar_LZTb7oPiEdNNAGHcuBTjdoX3BmsJPzDUoeJtPjU9luPbDJ4FGOm_shhuNdZVtf
    0r6TDmff1cWJJUAZPM>
X-ME-Received: <xmr:ar_LZS_SZd8TCOD1FYzkQzd9hJbf7wtCyJeBV8akNG93gNn2PWYhZRS2M1-U6KiFwiqMaNW7JyIk4bZPGV_x1Twuy0UmwOTKZTU1hTc_7rX1iH4zNbM-PyO0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehgdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptgfgggfuhfgjveffkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpefuvhgv
    nhcurfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrth
    htvghrnhepveeugefhjeekheekfeeijeduteejhefgheefjedtveelkeekjefgveefffei
    feelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
    hvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:ar_LZSokaGPe5kFD-iZABY1DQfnV6D73EbqPA1sYZCCj3pNV42VGZw>
    <xmx:ar_LZTrm0OJ4Ccmf-Wq1AyRWDTTJn9EKxR6dNhlfK4UlhVLt3DTKOQ>
    <xmx:ar_LZQS_KExk1lLwuutWczhum0it5AS3nKDksc7VVsytw1j069-7Ew>
    <xmx:a7_LZa8f_8WZdJY3DiwBe3lNvc5AFBORkQBAls1o-gDoYpn8dW8QUJQbUsA>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Feb 2024 14:13:46 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] i2c: pasemi: split driver into two separate modules
From: Sven Peter <sven@svenpeter.dev>
In-Reply-To: <20240212111933.963985-1-arnd@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Hector Martin <marcan@marcan.st>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Wolfram Sang <wsa@kernel.org>, Olof Johansson <olof@lixom.net>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Date: Tue, 13 Feb 2024 20:13:34 +0100
Message-Id: <A4AE8C4C-C37E-4026-A3CC-E613754307D6@svenpeter.dev>
References: <20240212111933.963985-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
X-Mailer: iPhone Mail (21D61)


>=20
> On 12. Feb 2024, at 12:19, Arnd Bergmann <arnd@kernel.org> wrote:
>=20
> =EF=BB=BFFrom: Arnd Bergmann <arnd@arndb.de>
>=20
> On powerpc, it is possible to compile test both the new apple (arm) and
> old pasemi (powerpc) drivers for the i2c hardware at the same time,
> which leads to a warning about linking the same object file twice:
>=20
> scripts/Makefile.build:244: drivers/i2c/busses/Makefile: i2c-pasemi-core.o=
 is added to multiple modules: i2c-apple i2c-pasemi
>=20
> Rework the driver to have an explicit helper module, letting Kbuild
> take care of whether this should be built-in or a loadable driver.
>=20
> Fixes: 9bc5f4f660ff ("i2c: pasemi: Split pci driver to its own file")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Sven Peter <sven@svenpeter.dev>

thanks, totally forgot about this!


Sven


> drivers/i2c/busses/Makefile          | 6 ++----
> drivers/i2c/busses/i2c-pasemi-core.c | 6 ++++++
> 2 files changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 3757b9391e60..aa0ee8ecd6f2 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -90,10 +90,8 @@ obj-$(CONFIG_I2C_NPCM)        +=3D i2c-npcm7xx.o
> obj-$(CONFIG_I2C_OCORES)    +=3D i2c-ocores.o
> obj-$(CONFIG_I2C_OMAP)        +=3D i2c-omap.o
> obj-$(CONFIG_I2C_OWL)        +=3D i2c-owl.o
> -i2c-pasemi-objs :=3D i2c-pasemi-core.o i2c-pasemi-pci.o
> -obj-$(CONFIG_I2C_PASEMI)    +=3D i2c-pasemi.o
> -i2c-apple-objs :=3D i2c-pasemi-core.o i2c-pasemi-platform.o
> -obj-$(CONFIG_I2C_APPLE)    +=3D i2c-apple.o
> +obj-$(CONFIG_I2C_PASEMI)    +=3D i2c-pasemi-core.o i2c-pasemi-pci.o
> +obj-$(CONFIG_I2C_APPLE)        +=3D i2c-pasemi-core.o i2c-pasemi-platform=
.o
> obj-$(CONFIG_I2C_PCA_PLATFORM)    +=3D i2c-pca-platform.o
> obj-$(CONFIG_I2C_PNX)        +=3D i2c-pnx.o
> obj-$(CONFIG_I2C_PXA)        +=3D i2c-pxa.o
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c=
-pasemi-core.c
> index 7d54a9f34c74..bd8becbdeeb2 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -369,6 +369,7 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus=
)
>=20
>   return 0;
> }
> +EXPORT_SYMBOL_GPL(pasemi_i2c_common_probe);
>=20
> irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
> {
> @@ -378,3 +379,8 @@ irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
>   complete(&smbus->irq_completion);
>   return IRQ_HANDLED;
> }
> +EXPORT_SYMBOL_GPL(pasemi_irq_handler);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Olof Johansson <olof@lixom.net>");
> +MODULE_DESCRIPTION("PA Semi PWRficient SMBus driver");
> --
> 2.39.2


