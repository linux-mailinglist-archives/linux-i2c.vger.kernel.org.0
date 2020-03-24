Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94917191BBE
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 22:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgCXVJe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 17:09:34 -0400
Received: from sauhun.de ([88.99.104.3]:55122 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727088AbgCXVJe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 17:09:34 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id CEAD52C08EF;
        Tue, 24 Mar 2020 22:09:32 +0100 (CET)
Date:   Tue, 24 Mar 2020 22:09:32 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 2/6] i2c: core: Allow override timing properties with 0
Message-ID: <20200324210932.GC7641@ninjato>
References: <20200324123216.78113-1-andriy.shevchenko@linux.intel.com>
 <20200324123216.78113-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Content-Disposition: inline
In-Reply-To: <20200324123216.78113-2-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 02:32:12PM +0200, Andy Shevchenko wrote:
> Some drivers may allow to override properties with 0 value when defaults
> are not in use, thus, replace memset() with corresponding per property
> update.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl56dwwACgkQFA3kzBSg
KbZaNQ/9Fcs/KPyFQGgWdKzwG5f4UXX4wDN/O/4a2kmZftKP10CqJpluD4WyReVl
mWf6CC/X3fHcAf2lnJx+vBLP8Os2zcE+4/nBHQbl+nU3L9KqDlZlY4KgPvQJA3do
J6E7GOy5VoCr1VUbBAcrInkOeiwJQxlJbdSFpe7k1EcdVv4IqvgSWVmpHFUBT1AE
Rq9tHgp4oSNa5owfi4Ca/s96XYmEBVKmQMiqwOUz2KM4krcpPOEEQU+Nx1dc/Hxh
2rre+0wgGMpGZddflNZCf95VdmHaPlOPwVBmaGhtItbip7zcVAvkLsT9lPG+Q3Oe
Wl62vZ5qgxNbr6JdmfOi4v8sQeJX4FEuuuPb+T88uIiAlCKxQsfbENzzw2MLe2XO
nfFkp+ujwQXXdcdfGcYNCaieTJ1DLLi76MBzGQROmZVRauCJwwN9Qs8oajihsd03
XMeS8nlkvQZkZdZKIB2iJs0prhQbE//Nj56LfvKFEgXk87jS2lpzrY9yYJVggx/+
9vznzG/ap1SrT4VY6oLSLoLfu/QVv1/W4xfQ4emosDCGwcdWDQD+xtQ0/rz55/kC
vPGdcOVqZ3yOU9QKIeSeq3GWukslh/0ZBj/tdg1Fifzd0PeWSBBYnXo0t+j6rW6z
jz0oSyWjgpBNbZkCDXdcq5QqAq4pqV2u146s16rAMPav0pcXJ1A=
=ysnS
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
