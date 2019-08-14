Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7018D482
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 15:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfHNNUl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 09:20:41 -0400
Received: from sauhun.de ([88.99.104.3]:48958 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbfHNNUl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 09:20:41 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id 2B4A32C311C;
        Wed, 14 Aug 2019 15:20:40 +0200 (CEST)
Date:   Wed, 14 Aug 2019 15:20:39 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c-cht-wc: Fix lockdep warning
Message-ID: <20190814132039.GG9716@ninjato>
References: <20190813100301.79915-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E69HUUNAyIJqGpVn"
Content-Disposition: inline
In-Reply-To: <20190813100301.79915-1-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--E69HUUNAyIJqGpVn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 12:03:01PM +0200, Hans de Goede wrote:
> When the kernel is build with lockdep support and the i2c-cht-wc driver is
> used, the following warning is shown:
>=20
> [   66.674334] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   66.674337] WARNING: possible circular locking dependency detected
> [   66.674340] 5.3.0-rc4+ #83 Not tainted

Applied to for-next, thanks!


--E69HUUNAyIJqGpVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1UCqcACgkQFA3kzBSg
Kbb9yA//UpGMfphnXfvwjW85zY532mpPl4nUvOSx2i2VpR+lXLl0pQVkeUbasjkm
ycUK1B1oVZ+5SbrV7uPnnF86SBMFxoWRVZj7IP7u1WoGoPFRPHByoKdIbl2symyT
By2ATVIct7H6zMIVpAas6Ow40GwdTPw+4XD/gcD5o3qLdxS0OWvI5TM4TUeTkk3S
QCLICIxgMvd35tn6trggvjpEBdou0/BQpDPBylYYNj9O5SHMatRa+Q7ISylkPnhM
HLAiBS2Iy3qgV9VvOq1l0Xpv9frMMNYOKpdoa1MHuzigNp/4aTjtq8pvMVBKNYer
HBzcch/Zcg0gLhvF1jvt3QPp42BozqZ3rxq50j14xPdPbcBCS2pU4ReOfZnsSveA
CjQZnIYpgtOYGVAPKlTc3ETZF6PCnZGwj/8I3t8M1/vdgoZBXf1vCppv1rYmxfNu
N1LNbr3E4UNlIEAx5DJWPuo3KLT0ZeHNsdEqJd5XcxohSkDdVjrZ7P9+1jB41J6k
yu0/IZSKWHVke3gJ7+3txCv4MMGee7oVVcWXNVoj6KQ1W1vTZj8prNVqamhepSx7
KGDQZN6XddnmQeeCV2Fv64UjTv9DP/6yVxKVmfWA0l3A9m8B4djIRtsdi6Lcao41
/j0bTMDoa3QIYKsQyP5fA1lJ/yE7TwEkkHDYKkggHfY9IQzKRt8=
=hnAw
-----END PGP SIGNATURE-----

--E69HUUNAyIJqGpVn--
