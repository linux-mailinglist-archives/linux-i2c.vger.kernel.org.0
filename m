Return-Path: <linux-i2c+bounces-10064-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E87A75474
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Mar 2025 07:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28E9E17334A
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Mar 2025 06:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A78188915;
	Sat, 29 Mar 2025 06:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="maWwVjF/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A810529A5
	for <linux-i2c@vger.kernel.org>; Sat, 29 Mar 2025 06:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743228356; cv=none; b=QTwO3R8xeT9BnBitcHsJeRv/y+8R6SAGKTUsqJ1BlqErDNyFhqXqZGAPjXB5SvpRyxyXWA6SOe9j3EORRPlmLSRtP1RXfPMcyFeT8jXAg6vEpwBOU1IPqnL0ISat0qNP3l6xpusVlB2P5x44ozXRKaKtc4y1dLJHCto7ZkNQ1tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743228356; c=relaxed/simple;
	bh=RBYdqELAGGITN3bER6Ed3RfAT6r2IaUZX4eTf8LknqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxKItC/JhrVnLjZ6hV8pSmM5FM2cvHP+3lsQKMAXLwiFU/mm/83oc++0rPykX5TXJteC+Eyu+y6BN3iB2LQY1zasvI7vDystgbPJIfKDrK18fqj8dQ8Di5HPcZ6+njuwwh5a83L5mJbCnlXy9MFh1VOmu2kpeVpiy38ot1pqo60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=maWwVjF/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ngfJ
	rWFFQGzaVIiK7KuboErMRj/fe1cnJfB3LZ7PSjU=; b=maWwVjF/JGHBb+zL6K+w
	uT9DyLA+GyeTqgvBKtbSnpDwo6MBM98N8+ukp+XsWV+YQNbhJ+VGQMXWB4yEb7OI
	OP2Ljbef1zUx8Z2E+gWzcOsAnEUlgpPoJRgOOcP1PAIQR0yReglAWObrx0jP7RrO
	G/2Efbs/ks7iD7TzX3aA1Yf2UThSP8c4pcE6EAFxuWBORQ5EzllqfYerohXwRX+3
	+mmcxYeRu+3PXrugYFIEErK4GYkvEWchNbd4hOpSsJaKvdl8Jqfb0mX9Vy52lTws
	2fQNGvNtjIgIxJBaIWi9+lcjPs3OyeqmSMP4j2sfuBNSCG5h9IiLYwrxc2dJgkCb
	2w==
Received: (qmail 486515 invoked from network); 29 Mar 2025 07:05:46 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Mar 2025 07:05:46 +0100
X-UD-Smtp-Session: l3s3148p1@OWdS+nQxUuYgAwD6PzqDAV8182DI+BaV
Date: Sat, 29 Mar 2025 07:05:49 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2 resend] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <Z-eNvcrFu0VSY23U@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
References: <Z-MKiV0Ei5lmWik6@shikoro>
 <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
 <Z-MrfICsY06DZV-2@shikoro>
 <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>
 <Z-QjIRoOWpoWaL6l@shikoro>
 <c6bed13c-38df-43a6-ba5f-0da03b91f3df@rowland.harvard.edu>
 <Z-RyiI1X9BN43feQ@shikoro>
 <c7f67d3b-f1e6-4d68-99aa-e462fdcb315f@rowland.harvard.edu>
 <Z-bEBk68dh918vy9@shikoro>
 <24798648-c5a3-4e31-9897-4610053007f3@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/524CC2BhVTInLpO"
Content-Disposition: inline
In-Reply-To: <24798648-c5a3-4e31-9897-4610053007f3@rowland.harvard.edu>


--/524CC2BhVTInLpO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> In the case of dib0700, it was clear from the source code that the=20
> driver uses USB Control transfers to tell the hardware about I2C=20
> messages.  I don't know if other bridges work in the same way.  In=20
> theory a bridge could use USB Bulk transfers instead; they aren't=20
> subject to this restriction on length-0 reads.  Or a bridge could use a=
=20
> Control read transfer but include extra header material along with the=20
> actual data, so that a length-0 message wouldn't end up generating a=20
> length-0 read.

Fully understood, thanks for your explanation.

> So the short answer is that you would need to find someone who really=20
> understands what's going on here -- which I don't.  Sorry.

No worries. There are only 5 drivers or so, I will manually check if
they use a control_read and have no own header. Doesn't sound hard.


--/524CC2BhVTInLpO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfnjb0ACgkQFA3kzBSg
KbYu9g//bQdOPKVCxAkPgX+ushrjFLpZnByCs0WHTQfKHYaNVlF+bNRfR9VUvRgH
IQXKFYE7ShGb4zMqEm61525u04J+/lmp+sxM7JdBtOXnnptjYZ7prH5r0bKinHku
dyMlVhtZIIEzqahpD2E1tKyGuvnRDeAY0L2SqveNz5JTO60Bece8XaKmI4bOKqF9
/UrvmPvw81OXxh4o/fhVqFaDJzw//e7yRzrOeGZu+6D4OSNpHowxofDEAAjfE/7K
8DjCAg1mMc1XLYVEC1vMgkEY7BbJdHens+W5VnLEFolqJrmX67ziquQ02jWqnKhm
Q2rI/3UAeXZnLsg0me12fFjG76DDhiipP/fu4wrCgcwy+Dpk3FkkBXwv4svmcPXn
RUx8SopRASSjkUn9GAsmPP0stpBuLt4PS0DK2qwHvo2eLVYEfnAeQ8w6xHCbvLu5
8RgbHqlxwy8+sgfGVBIObtn9G+XWRG9u4+nhhHY89kcUlwVVPkpIDYAP0uWaxW49
D0j9WCL/KA88U+QoIj0Wq1KAi/gfjWrBy/kMuASHScahtInni/T3pNDDluZ4e5xe
uR90+/Lx/FL2Ax0S3FschTbxXoRKkKLcBs+DYjNEJZUfU22kRGh+FHraNAuy8aom
nuIZKK+0Vf57uReWBN3UwPfUgdzLYqarhtWc+BlZn/D3GQ0ckpM=
=Mjv2
-----END PGP SIGNATURE-----

--/524CC2BhVTInLpO--

