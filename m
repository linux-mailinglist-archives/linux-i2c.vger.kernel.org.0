Return-Path: <linux-i2c+bounces-10022-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD66A70CB2
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 23:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C82218924AF
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 22:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24C819CC2E;
	Tue, 25 Mar 2025 22:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WBGMIDEi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616D1183CA6
	for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 22:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742941060; cv=none; b=TwT2zfD10DnXVsqQ1Y73K7QczJj2aWMXdOQXojRd9wssNo5oR6XZAyd3aTsTQ61e2JHjxbUz9IA4Wr7BPNEhcI3wIgP0/AQXpww/8tdQ71TY6vDGcRa/vrtkUqfsPyL7gbDoBVnC/Ms0Uma2S2QA1uZCROKQZUzFfP4yXJc917s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742941060; c=relaxed/simple;
	bh=1UV2rZVmB0/CIyPMfCR+mlReHLl03xvenKKyv7M3/pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pf3UFR6X1JJ//cwJ4GhqRsrdexL2gYQB9Lk4yrE9uSIT4Lw9o3mct1e5vL7E7VPAm+q8H/MY9fKfpvY8IM5vkHK0JXnSqpZg4dmfGED2P8nnCh97Sb9JOz4HnyQxyZATIIKoNAGOHrxGqu4qkoQIAxvuDis4u2wDKhUR/1kdo5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WBGMIDEi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Tr7g
	aQg6UzJbHbDAcDCQLiy0DQOB9MXlClKRMUC2x+M=; b=WBGMIDEiYQpapAhshyPG
	esG+zvrH2sxU27mbQ7+vn0tlDs1D/hWlUgeS6oMIA4+NHLsJC/pydqq2JqfBR/nh
	z3sBWmwxvop46UqyJxEy7jkPJWXmXCvyqW7AFRI2xzMBvl516cf5/sBJ1C39m22a
	x6oRP5WIiE96SgkQ38me+QzXEU9Mw8JW4BATqqrEfBLIrmjtt5tXlyJ/TRiJI9Ag
	3yGANsaYXlC6esP9/nT5b6kZvuQcC/JJ9bJDcQSg4czxgOGyjyltESZSk5TBTGIW
	7nxcgziG5ygPWXREY6LGpMfsj3VEF6bwxMgh2DvBJjw6qTsvqH3xZlHn+FYz+YGF
	6g==
Received: (qmail 3289556 invoked from network); 25 Mar 2025 23:17:33 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2025 23:17:33 +0100
X-UD-Smtp-Session: l3s3148p1@nANaFjIxYuUujnsv
Date: Tue, 25 Mar 2025 23:17:32 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <Z-MrfICsY06DZV-2@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
References: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
 <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
 <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
 <Z-MKiV0Ei5lmWik6@shikoro>
 <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ptUPvfCjRk92+jO"
Content-Disposition: inline
In-Reply-To: <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>


--6ptUPvfCjRk92+jO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 05:47:53PM -0400, Alan Stern wrote:
> On Tue, Mar 25, 2025 at 08:56:57PM +0100, Wolfram Sang wrote:
> >=20
> > > +	static const struct i2c_adapter_quirks i2c_usb_quirks =3D {
> > > +		.flags =3D I2C_AQ_NO_ZERO_LEN_READ,
> > > +	};
> >=20
> > Why didn't you create the static struct outside of probe?
>=20
> Because it's used only in that one function.  But if you prefer, I will=
=20
> move the definition outside of the function.  It doesn't make any real=20
> difference.

Then, for consistency reasons, I'd really prefer it outside probe. I
also think it doesn't really make a difference, it just looks unusual to
me.

Thanks and happy hacking!


--6ptUPvfCjRk92+jO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfjK3kACgkQFA3kzBSg
KbZHVA/7Bp5i1ouvo7Hmf6ovhTvrc8OHu91n9fvTIhYsYxXZ/hwThoCkIWE9KRRd
dPYxa/0JNQSQN3dMwdROceygUYQCkvpB2as1rJUp3PoTMHP2PG+0617QdWNBNaui
TOSXf+UAou62g2NVeVdHpKAevFH7fZ3d6rSf0sjxEzk3xSJaxfrfo+6Zo+JctcHE
rRuMZVKLE4u0pJbemqLaU9A1p8AVqe8S2ew9/ikgAJvC0X4lHlGjeY2YD2pR6zOv
001vP+DwbC8twVZrCABZf9jKBR1MZJb7d5rZ4iQTIoUpFEYwnr7oZDhfzxZzKk4k
1iZo699e2W9S664nFnXJbF5Ud8yRwf6JAcWAGOAVk3sV+SpFW0QTUeo7BohOOr2H
pOZKTURY07bZA0J+65XnDb01Qeam/ru4Xrt5ZOeYKrE+imnbER3ov4zlbF3opjQK
FSSb2vJBI17T9RLaEcWYog4YAomEjyXfbZIgjzWug5S3u4WbK9c9KZswNxt9XzjA
S6LBbPzH9OZKSXUcxJo5pzSOGbXycmpspF4PkNc1VCUvpPfLPdSvTMC2Q+07c1Ke
WABGIvBGNNo6+yfJ6tDrY1SP1gAr5+JLrWogh8T4NpX261DiLBJMH27DuCaVNFfz
7pPUo21QKe2jK6vQ73i7ZgjprRZ0eMMmnQHip+XNAUTAhsFKjiI=
=zLCi
-----END PGP SIGNATURE-----

--6ptUPvfCjRk92+jO--

