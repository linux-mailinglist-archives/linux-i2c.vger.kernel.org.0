Return-Path: <linux-i2c+bounces-10015-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAD6A7077F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 17:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97C917A39C2
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 16:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C99F25EFBD;
	Tue, 25 Mar 2025 16:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="i09JYRoF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C236F1A3AB8
	for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742921955; cv=none; b=cLwBlIyttHRyugJRCBP9Iw8tDB+0Ds9x4YpGFz4OOOl4GEb/c5Yw2xF28UcDu9yUlj6+pTPWBQF9XbnlirkGEyVYB8Rofe1vSKysDd21Clk1vASyBzrQOLZkagBtABhfRI32fIdVPD4uoqAQxGr2HClal8+mI4ocdtieJBbAlNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742921955; c=relaxed/simple;
	bh=vkNJWJsTLSjN+rOXaXydvJVJsNPlOwmRDfKob5pJKFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjLijG19jYzkdTgbaBcTuc70bzCamEdj5IhT3GHbVncOZTq5GiJnmp0gUo8+QGHAtEhg9IO1evJpEb/MspOTnjXbaD2IbXBd+Kw2maL4gVDh/Fyc9PIWh++4HJCXCnGs2ziWC0I8be9zXG+bNsvHq/6B4ai6wT3A/h+JE05c3iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=i09JYRoF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=MBT0
	LGmlL9a0J3zmjU+Ml0HH9fmGYp5hfHo95B20wOM=; b=i09JYRoFkh3JhioWrcka
	iNMvIKQm5RkPNmqK+d2VhzUn03TwD58Yaxd6YfISWu2ZJ15+vvm77q7JxG3Vu97H
	RJztKANQ3AFCRikMDuTU0QcNUhGq6XxJeQ0Au7K90afWmciJvyQAC6wR7j0gj7sC
	FdkFrjRZ1FX3NyKQjNi0RbhG3qW/e3ZzejAVN1ZaLuq2jRXpBno2MAZyvPt1S5ZZ
	zKd5/ZdJlzeH8UjozxQVJt8xX+wL+GZUMKzyVJsRDhHxBcV/cFmRjZF9ANPsUCKh
	SYGiarpvJs61fc5vHHRlcTX1fkOIdHRWhnkTPqMpqqiDLQQzphNaJzV/vi82Gw9D
	Ng==
Received: (qmail 3164825 invoked from network); 25 Mar 2025 17:59:10 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2025 17:59:10 +0100
X-UD-Smtp-Session: l3s3148p1@Rf25oy0xAL8ujnsv
Date: Tue, 25 Mar 2025 17:59:10 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-i2c@vger.kernel.org
Subject: Re: [syzbot] [usb?] WARNING in dib0700_i2c_xfer/usb_submit_urb
Message-ID: <Z-Lg3glmnzA44R_H@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-i2c@vger.kernel.org
References: <67e1a1f5.050a0220.a7ebc.0029.GAE@google.com>
 <acfa19a7-9d24-4cd6-9d1d-580a9ac7473c@rowland.harvard.edu>
 <Z-GwRNe8NIigXYtS@shikoro>
 <ecdc37c4-b178-4e43-bfbf-45bd3ed29ff2@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vo6+XZQybXqMsLuJ"
Content-Disposition: inline
In-Reply-To: <ecdc37c4-b178-4e43-bfbf-45bd3ed29ff2@rowland.harvard.edu>


--vo6+XZQybXqMsLuJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > As far as I can tell from the source code, the dib0700 simply isn't a=
ble=20
> > > to handle 0-length reads.  Should the dib0700_ctrl_rd() routine be=20
> > > changed simply to return 0 in such cases?
> >=20
> > The adapter (I assume the one in dvb-usb-i2c.c) should populate an
> > i2c_adapter_quirks struct with I2C_AQ_NO_ZERO_LEN and then the core will
> > bail out for you.
>=20
> Or the I2C_AQ_NO_ZERO_LEN_READ flag bit.

Yes, that would be more convervative. Does USB allow zero-length writes?

> What about all the other fields in the i2c_adapter_quirks structure? =20
> How should they be set?  (Note: I don't know anything about this driver=
=20
> or these devices; I'm just chasing down the syzbot bug report.)

As I also don't know the hardware, I suggest to leave them empty. 0
means "no quirk".


--vo6+XZQybXqMsLuJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfi4NoACgkQFA3kzBSg
Kbb0ExAAk/zS+lp1X/U1Lj+/FYo2r/Ux5bOOtxIOQg/+xO4cW77Tyd3FCMWlDoIE
3F4xXi8lqEtoFXNmCgfX2iOx6SRECLr7LQ8H+geS8P7IPFuawCM8XhOS0M+ULg/D
+YuzueR0eniblxbahS2GHctFxjwhSGvdwBXqE8xKIhsklmry95lv7lsx2qijLCo2
NtVVHFpprX0oqT29s/Di3tQqgi0f/3apejPqXI2tYSVgRIqrxlKg4RTMjJNFo8Ac
7dYYMdriR9qhvHhN2g9zVMPNiXA6US2RtLYh1FdZm6iH6F1WpnVwtf6WqXaixehe
HDBi8DvrrDavFfFFIaKWpgSYTtKt1GtPt8dsyVRvIy3WLjMskUKln5MldF+MkOLK
iP370UeEtxJhvFkgGK8egTDL7KBr/lyXm1m9SfOnymCn8nAepS4vHsb6Ym58TDuh
uPLaKBEHlhx6iBCAWSSwFutijxPPRoNefGQbZyFd1Q3fr45UskqXxA5h4ddX9m8w
KM8TqVhUGmLKPa29kQ9XNg/gW67gneTlXhUdLn6P6vDmNheRmqoXTcBNuM3YdWqE
aQgObHgTJlrxHQyZUMcspR1+1k1v1DjgGJ4JwahKY4NU+EyyRxJMeDfq80Ol8goE
ZJAiiglvAQtUir0U4L+CZj+sVPZsiaWRq41tiHGOKE1ztzk8Jd4=
=NXPX
-----END PGP SIGNATURE-----

--vo6+XZQybXqMsLuJ--

