Return-Path: <linux-i2c+bounces-10061-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4EAA74DFC
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 16:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2213188981E
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 15:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74451D5CD1;
	Fri, 28 Mar 2025 15:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Eiqstg6v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F418F1BE86E
	for <linux-i2c@vger.kernel.org>; Fri, 28 Mar 2025 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743176714; cv=none; b=UeZfAlgAfnYRkfeMuGaOjx811UcPmntFmyeA1dAa2psVrLKl3McbCmVejFhV8g0+TjiD4O30tupsLYqpXcBK37xdQpISbA6x/3uagpubEVDv4FgspU+nEZD7ASrR7pQ+Ap1O2pSQlOo6BSx7VglYb+IUKRV2Gmgq2PYYpyndTmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743176714; c=relaxed/simple;
	bh=fsccxvc2CO216BDas58fshSHd5D2DY+u3elYkO9qAuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKuiuceHwfbUQ4HIrEW55jGzjjbjmSzcdOr0LLg4XHmQbMUQmkpWgT1jeKHnZxiLEMWbzJ4Dl9asHDFcbgBFb12VQ7Qx335A9qptRDgCZUN79iugz3zJ4OIXH+AmkeNNnKvT0+uHtWqI3b5FqAR1rZ1d3bB69mAzch4JzL1cYAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Eiqstg6v; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=E9D0
	HzcoEr0ASyZDtatURO/x15EsSKq8dN4oe9A23WU=; b=Eiqstg6vXLTFp3LdNVLo
	wTfh//O4lNDenJbZXjr56jpbRqtw4Rt8b3La/+7/IX3YDBtvsks1yZktjqbIo6QD
	S2qjFcdOsmXhlp08f/WNYDlpY/xsLTxe4wkS+vUmJK0x1S1aKJ7O3IGjVIT5qe0I
	WRyA69KrJ6cfiOLBzsFwyp2kWY8Nuu1sI5BpWE2MzoVkWvRebfhWt2w6pjUGLNv/
	yxnVufpGDtFghOjSCmqYtn45lfPKvy+BHgzHqxHC0scIN4SWAP3JDI65qzv44oy/
	L08Tx9IJ7exi4Qdvyklsi+KwTOwyrhBnBDUg0bgifMYUhEHMHZxov5yyoL7gyTzg
	8w==
Received: (qmail 302468 invoked from network); 28 Mar 2025 16:45:10 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Mar 2025 16:45:10 +0100
X-UD-Smtp-Session: l3s3148p1@ojSb9GgxeBZtKjE8
Date: Fri, 28 Mar 2025 16:45:10 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2 resend] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <Z-bEBk68dh918vy9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
References: <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
 <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
 <Z-MKiV0Ei5lmWik6@shikoro>
 <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
 <Z-MrfICsY06DZV-2@shikoro>
 <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>
 <Z-QjIRoOWpoWaL6l@shikoro>
 <c6bed13c-38df-43a6-ba5f-0da03b91f3df@rowland.harvard.edu>
 <Z-RyiI1X9BN43feQ@shikoro>
 <c7f67d3b-f1e6-4d68-99aa-e462fdcb315f@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vj98NpFvxv0JuQ3d"
Content-Disposition: inline
In-Reply-To: <c7f67d3b-f1e6-4d68-99aa-e462fdcb315f@rowland.harvard.edu>


--vj98NpFvxv0JuQ3d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Alan,

> Fix the problem by adding the I2C_AQ_NO_ZERO_LEN_READ adapter quirk
> flag to all the USB I2C adapter devices managed by dvb-usb-i2c.c,
> following Wolfram Sang's suggestion.  This tells the I2C core not to
> allow length-0 read messages.

Thank you again for fixing this issue. There are some USB-I2C bridges in
drivers/i2c/busses which also do not prevent zero len reads. Would it
make sense to put a protection into the I2C core? Can we reliably detect
that an adapter sits on a USB (maybe via the parent device), so that we
can then check if I2C_AQ_NO_ZERO_LEN_READ is set, and take action if
not?

Appreciating your input,

   Wolfram


--vj98NpFvxv0JuQ3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfmxAIACgkQFA3kzBSg
KbZ2wg/+MWPAMFrgfO5rUhpaVAfirucD6Lz/bqZj2DsCFuLAEGnP1oPbK14rlpNx
I4pZuVSUxbr7MU0TssEQOiV1Y/39kNEoSbmu7N8azcRvT3QcKOQjFo2rGOYRLVy6
qF0FdNFh6SLinvE/0oKLrio7W1YOmxP+3r1UV+VKOD5jHa5l2E7mK48zwrN9vT0w
dKCCtTBgRpxPX3VSEN3U/Md7whp5gx43vOWo7hJ1tudM3OYYw51iKQ8NHGd8pcmb
2VMTHyA8nhKXaHN5yyWfRZtPdgayD80yVOs1w4Y46stieUV1B6xCk4DpH4EjVNCH
8oTAOgJ7mGfSMiNQQPAF81mZGPLm1SaV7n8/P9sZFYrOjUGEceU3zAs30KpRLzgh
WRtMzU/7M2Hl1UUKlTXWDXbzwYBK216ph/iLnzOVPDra0mbukgaRNSzuS+chf4i6
mTFtKeV5ODOXtQUqitjXoSQF6hb1v1wO/ZfGScN0tn+I4PJaclA7/1/dHj06ZbFO
PkN4X++EI0eiObdgvr3eMV8zYrcJyYlUJ+dEHsgw+pkka48z6CSk2doBwvFtzsoj
dnv0C6hZL7kg94OVTEHUK68qDVjbB+hSQLNq43zPi/LltEMfgQD2HqmNeVQhIOGH
cN2y/Q4X1GOsjSOzAusm+N1WQxfPdVARBChbz14zBsUpskZfcLw=
=PSUI
-----END PGP SIGNATURE-----

--vj98NpFvxv0JuQ3d--

