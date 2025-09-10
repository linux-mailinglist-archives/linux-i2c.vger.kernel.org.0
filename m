Return-Path: <linux-i2c+bounces-12841-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00749B523E3
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 23:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94A45562346
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 21:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB4831076C;
	Wed, 10 Sep 2025 21:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WFnOPSWO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96E530F927
	for <linux-i2c@vger.kernel.org>; Wed, 10 Sep 2025 21:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757541282; cv=none; b=evL+Jx934tyiCJdsDwdjDIY1S3c7BH663jNmqwQXL8V/Ju0F3GvScGsEeLb0y3NyU1Z7ZIhLO1IzmMkA9vhYh1+kUB+8jPbWCn0z4+pwGFLhDj5BHNvwzzd8HXQufbFTvzMjRXogEgsoe/xJPS0/MC/YRMNodQE1oFpm/1ISqN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757541282; c=relaxed/simple;
	bh=1HCvhd3VQGy5PvNhZFTJLOJnc634aHZegGeRdIBZzUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArqMSI3qze5eH9FYfUGCzyfbnromqwStjUL/Crkll2Ymx5ipkIMN0ERwGZEOsqfe5ObjGwPviyjFTs71pSqfyarLEccbBBORc2sE2kruewoWvug+fn+vsSjDl5E7E9jfrSu2Qmd/5O3NdoVDMDYdy9Q3Nt+Io/WDwXxp5xx4CK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WFnOPSWO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VeZk
	NDxYDFAIVO0EYji6v7iRjsKhPDhDyOrk4uRvel0=; b=WFnOPSWOPSKHbU+tl649
	Q271Ayd8soypdTfKjUP2fQmAvH8Ooofkpp+DFE9tc+AbLH+RZraDKDIaWLYtqtsT
	QihwFY2yzsLK7CnEgLtxATHTdlzaL5fKv2SIERieMVQ2JmuYkMeeik/GE7yc5YAB
	GczumHBfYoaIteT3JqSFz3q0zP44xozV9faH5qTavXwSqTjQSqaeafpxzNIjD3Jj
	3nDpNd7xQTa6aLLJRynEXnhmNMQxdajyvi4m71WYpGLu7htFqFC1FYhcWanol1GU
	1lvYFbX6SCKL0cXh84GU8I7xXIpf1G+Jrz06vHF+FalLsfrZw+REsjb+vF/DumTu
	SQ==
Received: (qmail 750343 invoked from network); 10 Sep 2025 23:54:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Sep 2025 23:54:37 +0200
X-UD-Smtp-Session: l3s3148p1@03qAd3k+hoEujnuV
Date: Wed, 10 Sep 2025 23:54:36 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 3/3] i2c: Add Intel USBIO I2C driver
Message-ID: <aMHznOCa_9vtW6_1@shikoro>
References: <20250910133958.224921-1-hansg@kernel.org>
 <20250910133958.224921-4-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="65RaCaNE39VXsE2H"
Content-Disposition: inline
In-Reply-To: <20250910133958.224921-4-hansg@kernel.org>


--65RaCaNE39VXsE2H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

> +out_log:
> +	dev_dbg(adap->dev.parent, "RD[%d]:%*phN\n", msg->len, msg->len, msg->buf);

I think this...

> +
> +	return 0;
> +}
> +
> +static int usbio_i2c_write(struct i2c_adapter *adap, struct i2c_msg *msg)
> +{
> +	struct usbio_i2c *i2c = i2c_get_adapdata(adap);
> +	u16 txchunk = i2c->txbuf_len - I2C_RW_OVERHEAD;
> +	struct usbio_i2c_rw *wbuf = i2c->rwbuf;
> +	int ret;
> +
> +	dev_dbg(adap->dev.parent, "WR[%d]:%*phN\n", msg->len, msg->len, msg->buf);

... and this dbg can go. The tracepoints we have should do?

> +static u32 usbio_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR | I2C_FUNC_SMBUS_EMUL;
> +}

How did you test 10 bit addresses? I have never seen them in the wild?

Did you also check SMBUS_QUICK? 'i2cdetect' uses it by default.

Does the underlying USBIO driver use usb_control_msg? If so, we need to
disable zero length read messages. See [1] for a reference.

Rest looks good to me!

[1] https://lore.kernel.org/all/20250522064234.3721-2-wsa+renesas@sang-engineering.com/


--65RaCaNE39VXsE2H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjB85QACgkQFA3kzBSg
KbaLCA/6A6PtxlNN/+ZxKkBXiwdOerYgaoYdNRoshHS0dhwcNLPaQ2gmTiQg+Zi3
VM8CGXssak1ZeoyE6F2pY+Y+RrriCucVsr53TSBuBlr8GTFLe/aARDvL0u8C/5P8
iK71Mc/wqfrOPjDey7LNzuyqQy9MVrTEIWnz52OZc2skF7lqTWM1ROdgIXuYjl2s
xjiCbIIbJSqAEqVjUwy8sDUjhJhSBKBAtHROp/xCQpk8uykYORctPxaafmRxK39q
QFDyqIkOkk1HrfsOdCC9IbiGTpes7/rDnW7nrJumSrddnEEKA0wbhUUzvWEtNONk
xcdbEs97Owj+VlazG5xblFbxF7BFBjqGnLY/vOiZhQmjcBJLJJ3z13WoAjxyTJm6
Csdn1nA+7NNpALTr/RZyEQN4ssbWhZ0J3Sy0IuE+k/npf30Y/NYP+dmiBs52ZCOF
fqFdTubyQD1H5swJEJlbDFaoIZDHAegs7WjcXczJ+od9ZGWbvaO/F8jcC0qmf2w8
fTuiYQZbSrjJZ4Y/vUjdIn2Au7RX02ckvqoUcCmADzcsEgmILELgWvci2UWJv+3Y
iZ+KZMywwwWzE8aQPPvQFKDhQVkPVOe934mi7lRUwS968riLUremgLCbgm5N0Uz3
EM9yIoF9bV36crzxe7b4A/Mb2p5QdKQZuEir0/urdN87fhbYJnA=
=zfEe
-----END PGP SIGNATURE-----

--65RaCaNE39VXsE2H--

