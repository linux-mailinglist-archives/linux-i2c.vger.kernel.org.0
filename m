Return-Path: <linux-i2c+bounces-12903-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF77B545BE
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 10:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FF69A05FE4
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 08:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5742D7DCE;
	Fri, 12 Sep 2025 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ia27wWNQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289A92D77F6
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 08:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757666564; cv=none; b=tssE37Srvs25CQ/AXiDNob7ud4+2nwhtDFJXZGHTVGEHHWliAc7GIKVYOtg2IEquv1BMHfArUF22PHMCaqb387C6Hy65rTZRId9V1HUSgmHBxufEjqvsdyiZ89kiohDnolUqS+GTaZ7FxPdKIqIxO2n+E5qNeDXZGNCV7xJlqLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757666564; c=relaxed/simple;
	bh=ZjcbsHINbeqRb7tnZxQS5By1Nqquu8qnZzaE5dGbDoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpLX8iPfQfuO8ahpX63T8LLHNqSg6bnRrOUPacBfwffZOG/9Bm21LI/jPWqDjq2eltBDj0JDPUD3qx76XearwZ0beI2nwyivsh/OaDs5wxBxKcg9qXzqVWfx7hugAXOxFDtH6ToqshYQEBW+GL8fFWmXOjPK3havhWi1gSsqRBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ia27wWNQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Zjcb
	sHINbeqRb7tnZxQS5By1Nqquu8qnZzaE5dGbDoY=; b=ia27wWNQOh3QkMqv5XnK
	uMES3STcJ0D8CGSgfSvasloiSxZaimgMZZ5YeJ4ofrffU20XJl90eR2LfYlBD/2j
	vMljA6FkZSqZzEp19jFzHNkpUaonmUNwmTqmOvqZ/rgxgj7SVLsKzrUdQbuybIAr
	0AQPaZjNWMxnigwaaqc90vvpFKUrPwMfcdV0MPy0Ou9KPzulBI//cvpluzydm2E3
	0UgORQsjPvZICGWcf6Vyz5ojDjhfFvkPsfUV0dCYV0AjhiXGlFw7Hh0aiV6Ymlz8
	Mv0MhkLeEf9C1gQq/LdyTUizKLdQHQRSFUb/2HEiVk41MWlSLuwjmdlGuHxmCijt
	vQ==
Received: (qmail 1294164 invoked from network); 12 Sep 2025 10:42:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Sep 2025 10:42:38 +0200
X-UD-Smtp-Session: l3s3148p1@EtnYopY+Wokujnuf
Date: Fri, 12 Sep 2025 10:42:38 +0200
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
Subject: Re: [PATCH v6 3/3] i2c: Add Intel USBIO I2C driver
Message-ID: <aMPc_jHmlMsVtJKG@ninjato>
References: <20250911181343.77398-1-hansg@kernel.org>
 <20250911181343.77398-4-hansg@kernel.org>
 <aMMVKsbDIIFzaWdu@ninjato>
 <18011d86-6f9e-4a0d-9514-fcc69cec1fc2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xPBYDTKgFZu115vD"
Content-Disposition: inline
In-Reply-To: <18011d86-6f9e-4a0d-9514-fcc69cec1fc2@kernel.org>


--xPBYDTKgFZu115vD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Thank you.
>=20
> Is it ok if Greg picks this up together with the rest of
> the series?

Yes.


--xPBYDTKgFZu115vD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjD3P4ACgkQFA3kzBSg
KbamZQ//QV4U+zccAUQVYPeurKkz+yc+US8AXSSdz7x40/KRz60fNNThK/RK5MqP
ZjpwhANaM/ikZ+XKpXpOc9OH2yq96c7fVDiMVkSR1+jaqREkIV8JlshHtndL/o4A
NIZ+7W0Cxj4wpzR/RqQET1mdxOLyz44GD+rBDZPK6e/5aVfS8rQ8Ckli1et3DS4l
RNwXXypHCoeea+cT1Ne5gKCQEmKNbF2VLnZCxJp7QIG+k8u+roitSo4GA8U4tXwZ
FrdZfBpeeUFwUvdnmnbGNlm1Ve7WusCENFS339MYJRvlxzcqyRUWOUT8rTZWMyaL
1q+s1O4gFyEKrzOO7vpyPqp0xt8A+tymngEQBZn/Gxo8XcCvP5WkiORSFUpZ6uvF
CWsoQT0upMOHB9j10NC7DDtiR/oxv3v+0Nw3GdvmaGxzfP6Ow0005W0Oi4njRG3Z
FbxGfa1FYN+Ghx3g+UWaAlaTWahglDCud2TucVAtzyIsMzj1afLV7DI6BPSlLOv9
jXTbhPwVROOqdRhUvB1vqoYW0Wz5ZCM4wcBYy++ybJUbdlC0maW74sOJhEu6OAUE
HUPCytcS1vzMxoVexCgl6ADzw/FI+uGHZxXQOb2m3QHo+ghNHqFSp2MKSt0huIIi
MFfnR+kxWqsUaOFBnzK7CHqk05qMT6/FRRCE7T4ipuaf90uh7DM=
=5gb1
-----END PGP SIGNATURE-----

--xPBYDTKgFZu115vD--

