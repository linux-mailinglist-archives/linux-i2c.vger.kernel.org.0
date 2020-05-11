Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDE51CE465
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 21:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731422AbgEKT0W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 15:26:22 -0400
Received: from sauhun.de ([88.99.104.3]:50040 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731334AbgEKT0V (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 May 2020 15:26:21 -0400
Received: from localhost (p54B33735.dip0.t-ipconnect.de [84.179.55.53])
        by pokefinder.org (Postfix) with ESMTPSA id 9CD632C1F6D;
        Mon, 11 May 2020 21:26:19 +0200 (CEST)
Date:   Mon, 11 May 2020 21:26:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/4] i2c: mux: pca954x: Refactor pca954x_irq_handler()
Message-ID: <20200511192616.GA8724@ninjato>
References: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
 <20200506124242.GH185537@smile.fi.intel.com>
 <5f4f3714-e37c-d2ec-51eb-8cc3c9dd57de@axentia.se>
 <20200506160609.GN185537@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <20200506160609.GN185537@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Reviewed-by: Peter Rosin <peda@axentia.se>
>=20
> Thank you, Peter!
>=20
> I hope this applies to the entire series?

I interpreted it this way; anyhow, for me it would be easiest if every
patch gets tagged individually because then 'patchwork' picks them all
up correctly. So, if it is not too much work...

For this series:

Applied to for-next, thanks!


--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl65ptQACgkQFA3kzBSg
Kba7cQ/9E/PB7KzLBFhJbJuspm+YT6IyQLW2FBDCFemhpkH2LTAziIvxdp6GX7wa
+n/jAv/CILCDs8xmpEMsvbwisCFYdwTg8zeDgoAlXQbtnc6Kc9MROewpK4tFaA0Q
HnE8e2icgq5jdXvvvoxPNjGm7XktlwpZfcAbxKVjB6NnOGLhe8Xqt2L/DYeZFcwC
RLKh154RERxUugD4fm5rcNeesCRk/8UxRGXbEPp0cs1/igbTvS+3u4itSz9BOsnr
KCXbGbTrnDHH9AkV8uQjyJYokYvUqDMmiAnXlefKN7yE8DFWeE1NoVswVKTQDqGn
wqBl2XcbKLZ4cnwC2S7F9Xpt6bBIWhY8TyXqXBaHSVXbp85xFmjom76zeOMrraaj
II3KYM/5RhxUEgvcWo9eMk8o5gBNSNj/kNuH/yCi0pxnI6SEjUw/X8S49EDUCnea
E/vNACUIGBeaURXis5X/pK9JU0Xr15LFOIGbw0NZSzaZfrAWzKgEfOnU3MrDa2F0
+CZ/Fx5uFd9qMLCjrltwXSnVDchqJEezZcoLCaO04DGOcdSF7tpazs4KJ0a/3+KI
044O7Tdgt2bodebLt4qinGORmckSMpM4W0iv5c/A/eDQZGmIKuydDlacFuEnt70L
wxlmYpbLr6YxY9CwaEalut72Zj4uKO1ju0XitszjdrWNDzDDuBU=
=KgG2
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
