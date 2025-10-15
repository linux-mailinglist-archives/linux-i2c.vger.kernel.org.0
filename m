Return-Path: <linux-i2c+bounces-13543-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF4BBDE570
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 13:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D332F424C10
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 11:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E8D3233FF;
	Wed, 15 Oct 2025 11:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="e0u+z8tp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB7B3233E3
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 11:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760529091; cv=none; b=gSKwrFgpafU2Fgz7vJKa+TWDBjH808c1iCOai8nJCemzXhUP6jFlR+OFH6lvbeMtlt4Ya+eRMK2K+Z5J7Hjo/x+r0eXY2Ce4EqdluMAzU5BoeHMwO9wKx/2FQsIDa3vtJbpUowg+dk9J9+gZ9qoCqUOBBokNtpPsZGP/U/s8vDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760529091; c=relaxed/simple;
	bh=tv/h5uX6vx9ToHjRtFO+9KQK/oNzycit0ZR5/pciBQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVcrquGDAc5hdIMnfUo8euiSCp6Am1wY1bkT7PzrgpzrNDMHGJV7Mab59OmenQCus3TAv+8r/yyVGH16hxLYyuEnfU3kLFz7kIPHlRdcCHvi+0L8VzCap1wOBOmtExdWQxYNBiqzMj0Wx10mafoDF85G30UzvhE07eCbHIPbQZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=e0u+z8tp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5T/c
	/4l1FOBZm8lNk5nOsZHqjnJj9Nu/TXaxQlfjpvE=; b=e0u+z8tpvjbpmasBY49k
	ktRKQkpfMBruvwF+of1CG/PsLy6RdiUP9DZofeEdeP5oAGoTQ4pb0EHhb5j1SlUb
	dzEa4GFrAB6vL7BeDXxoLgmmP/I3e4HMw5PaPGlG8PHFkjNdXgRMgmG0IPgENtxJ
	kkQNF5pOXBJASNrsCQaaMHvMvHJLKbifYYHTqjdS9TmtAX2PayOwh1urejYyBv8W
	cyTqjuclE6OnEI+Jk67KPzHoeSpiU71xzYSrEJPp/YzMh8ny8JDlmMSdm9I4VBFU
	JwK1XpTucfPAUE2SkQERDFb9CovyoPyLNZ+aYbdbnst+X6lZGLYL4Ij55DsU39cE
	PQ==
Received: (qmail 3387011 invoked from network); 15 Oct 2025 13:51:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Oct 2025 13:51:21 +0200
X-UD-Smtp-Session: l3s3148p1@jyB6HjFBLpYujnsG
Date: Wed, 15 Oct 2025 13:51:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: i2c-designware: not possible to write to different i2c addresses
 in one transfer?
Message-ID: <aO-KuJ_T9cXsNpIh@ninjato>
References: <ee6afdd7-3117-43cd-831f-e0ec5ee46f46@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jJj4TbvErectUh5X"
Content-Disposition: inline
In-Reply-To: <ee6afdd7-3117-43cd-831f-e0ec5ee46f46@kernel.org>


--jJj4TbvErectUh5X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

lucky you, I happen to have a board with that controller on the table
currently :)

> This worked fine for the Raspberry Pi 4B using the broadcom i2c driver, b=
ut for
> the Raspberry Pi 5 using the designware driver it fails with -EINVAL and =
these
> kernel messages:
>=20
> [  272.284689] i2c_designware 1f00074000.i2c: i2c_dw_xfer_msg: invalid ta=
rget address

Confirmed.

> Looking in i2c-designware-master.c it seems it cannot handle consecutive =
messages for
> different addresses.

I agree. I leave the final judgement to the experts (Andy, Mika), but I
already anticipate that I need to extend the existing
I2C_AQ_COMB_SAME_ADDR quirk into a more generic one. And set the quirk
in this driver.

Thanks for the report,

   Wolfram


--jJj4TbvErectUh5X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjvirQACgkQFA3kzBSg
KbbOxg/+OtgXjzhcUpEcpaTXwcP5YRgNsiMvg/d7/EuMpKrTQiazAN+xU67HmF1+
DIqD2UYcvJO+HCTMmJASngYWxtr5mgzQr72WJgTxebMdco8SC3ux7OanQ9HY6ouU
mp3qPbi7t+ADGPpCu9dN0W1qKjL9JtUeuZeJXfHKsmwqTt/UWMjtFc6brvbPp4AC
I6LUdgVVphMqZnMNK+9xjoQphj3B04bP1ejMZA0iTSpTm8iGbH70fgcToAq6Ma0R
iwIR0geLdfxSZQI7W4+T3hbIFp/kjGEqCDsTTUkzzwQ1aGailHqU/1Y70nMHw++I
GEyZcJU5aL43tmz0SEZnr2O6YcCSuTggWAJMgB3O/uxpsKb/YC6G+f1n/Mbx6Cq1
1El2isloQwbLNeRfxte28wG0Pb6aNjxeAIjKEcmiA26lNOakKOjLiL8JGnMVLWTD
4nUT6VR9j6iYmIZ3j7KhM9pyy0UW3zO6Mvrptjlo/NgxoOpj27e0O6QmxmvVsOAQ
nXN6LoGBC279HxiG6bXOCtQ0sJGTe+HIhnrIVUhzl3QvLcSAYxomzfZcKDw1varF
rjmZKJdCbk8/0RH/73rOIo7Fhjtw9q4OqQS8bVJya7rRrjUHuVi8qHJocghQmlRQ
Y2oxzHZJhSpY9g4Vsm5XaCelbInwCEF1g+t8lF21y+0B62kil/c=
=JcSo
-----END PGP SIGNATURE-----

--jJj4TbvErectUh5X--

