Return-Path: <linux-i2c+bounces-14901-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A73CF3F0E
	for <lists+linux-i2c@lfdr.de>; Mon, 05 Jan 2026 14:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3543C30090C8
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jan 2026 13:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77BE29ACF0;
	Mon,  5 Jan 2026 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rZEvYgk9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A340D286D4D;
	Mon,  5 Jan 2026 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767621105; cv=none; b=CCqzGS55SFBX7I2PwqQx2ezVbYKXucheonJHWKDsv9i9LhKlPSvRKyx50YRblqauVlzNwsS4pwHhSqOIbs/NOWa4yH/PErc+WaHhwZb5O6nIUjBDV4McBX5SxG/LK6tajAJ3Ev2eUIt5UlzZc83pfx5jbxHWfiun8OrGg2BpuyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767621105; c=relaxed/simple;
	bh=zXfqqxKGvqLAXvWaOSIWtb83q/F8n+kGmnfoKYdBv3U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QN/4brOrAgeCs9Cl3z0+iDXZUdg/aqV3nP47n5GqD9xcJex4jUF7AwxPNWGvq45VwptADEO5z43xdVe+4v1jgTEfpcL4xmddaDEQpPNFCRiySm/LfyflzGBFi0rfj2nEkn82HHXQ2pJxm3k1+EQsIUm2arTDhr//H57rmFqm1rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rZEvYgk9; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0CFFF1A2662;
	Mon,  5 Jan 2026 13:51:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D379660726;
	Mon,  5 Jan 2026 13:51:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94961103C847C;
	Mon,  5 Jan 2026 14:51:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767621100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y5fucLpk96yKYcdh3/2CBBQtM/ZmD+R9MJ6TiQMXBRI=;
	b=rZEvYgk9R8H4C+utFLF0eWvetmLdZu2vv8mOh2vuvin+fh6NJ1/HYiLi6UhGLSrS5pfdcZ
	e+1LC4oVxlrYtg2v+FwJGtcxTTmZvtvYRRl6Q1O7ts3OhkkRrOUOBhFdd/9kD8hgcC0ZfR
	40KIA0Zh+2ftL+eL6xyKdh86wkg1p33bcXvXyRqLy6/RZpKhrac+bnlBGZFdB+UMpyWoSr
	DM+uN+gy+IhcRFpoMSRzI8XbP28qLp1nZUqPvrGlhF/UZrpPnca6s3fLYwqXjGMxEC4ru/
	VwySPIE5qSJSULG3oiqT14Z5ZYIfQIwuNXGmXlUdmZISfMAqaJYf8siNDhGgUA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Jean Delvare <jdelvare@suse.com>, Andi
 Shyti <andi.shyti@kernel.org>, Shyam Sundar S K
 <shyam-sundar.s-k@amd.com>, Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin
 Du <bin.du@amd.com>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jan Dabros
 <jsd@semihalf.com>, Hans Hu <hanshu@zhaoxin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] i2c: mv64xxx: use i2c_adapter_dev()
In-Reply-To: <20251223-i2c-adapter-dev-wrapper-v1-5-bcf960a48fa9@oss.qualcomm.com>
References: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
 <20251223-i2c-adapter-dev-wrapper-v1-5-bcf960a48fa9@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:51:33 +0100
Message-ID: <87pl7oqiai.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> writes:

> Use i2c_adapter_dev() where applicable in order to avoid direct
> dereferencing of struct device embedded within struct i2c_adapter.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory
> ---
>  drivers/i2c/busses/i2c-mv64xxx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv=
64xxx.c
> index 1acba628e16c3bd1dbf82c777162870cbe3815ef..7892793d2a1cabf3376efcec1=
d031c3d764f7731 100644
> --- a/drivers/i2c/busses/i2c-mv64xxx.c
> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
> @@ -747,7 +747,7 @@ mv64xxx_i2c_xfer_core(struct i2c_adapter *adap, struc=
t i2c_msg msgs[], int num)
>  	struct mv64xxx_i2c_data *drv_data =3D i2c_get_adapdata(adap);
>  	int rc, ret =3D num;
>=20=20
> -	rc =3D pm_runtime_resume_and_get(&adap->dev);
> +	rc =3D pm_runtime_resume_and_get(i2c_adapter_dev(adap));
>  	if (rc)
>  		return rc;
>=20=20
> @@ -766,7 +766,7 @@ mv64xxx_i2c_xfer_core(struct i2c_adapter *adap, struc=
t i2c_msg msgs[], int num)
>  	drv_data->num_msgs =3D 0;
>  	drv_data->msgs =3D NULL;
>=20=20
> -	pm_runtime_put_autosuspend(&adap->dev);
> +	pm_runtime_put_autosuspend(i2c_adapter_dev(adap));
>=20=20
>  	return ret;
>  }
>
> --=20
> 2.47.3
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

