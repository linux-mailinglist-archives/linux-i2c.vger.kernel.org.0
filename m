Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99325A2681
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 20:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbfH2SxB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 14:53:01 -0400
Received: from sauhun.de ([88.99.104.3]:42172 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727798AbfH2SxB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 14:53:01 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id 764D32C001C;
        Thu, 29 Aug 2019 20:52:59 +0200 (CEST)
Date:   Thu, 29 Aug 2019 20:52:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] i2c: bcm2835: Add full name of devicetree node to
 adapter name
Message-ID: <20190829185258.GF3740@ninjato>
References: <1566925456-5928-1-git-send-email-wahrenst@gmx.net>
 <1566925456-5928-4-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iBwuxWUsK/REspAd"
Content-Disposition: inline
In-Reply-To: <1566925456-5928-4-git-send-email-wahrenst@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iBwuxWUsK/REspAd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2019 at 07:04:16PM +0200, Stefan Wahren wrote:
> Inspired by Lori Hikichi's patch for iproc, this adds the full name of
> the devicetree node to the adapter name. With the introduction of
> BCM2711 it's very difficult to distinguish between the multiple instances.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied to for-next, thanks!


--iBwuxWUsK/REspAd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oHwoACgkQFA3kzBSg
KbaAlhAAn9G0ZUGQTYXFyYIW4w3nIISRT1DCe/hw6DNo3JK7fLdbwHiecrA29Vnx
mgsA5gp2kSreMJlkM6TZRt90QdhCbpswa7MS7r2VH7p+WWtRyBsSD3Uerrkw1vSs
dZJcB/8r/RN9XIo1h3sOChGcS4EoEc9U3aPls3XpUloPhY5lF+XPB/suZnp47tGI
OHCPESXRhFzabYbhr0O16X794BSrLFSe4YIYG7zzuc1hErW5qNTWYGSyOl5t6bar
2vYjvZSf1yyBhsXNDKV+/hwy88Gc0K/VHPU8qcfbIPlnpxYV0l6jYev6ArFEkKN7
st1+LZ7+RPyloqf7ZMkEngYf30cmrLG2AbpRViNjKT5ja+augDMs6vPMh5Uac0Ci
mkc3Xt/YIiVEvE6msBplWGQ7FLIhxAWMmUlZxUVzRg9lSJ35ew3j5UH3pcP1gOcI
XpIFMK73nAx3H83CjFvufIxo4XUkcpJIwaJIsqBC1WN9ygEOp+gJMWNnjYzu8f47
ctklX2fcOSkP1Dy1rTY9qrfsHJeDakD1uYA+eQvYZzLN0wS98kpe2fxEgPYL6+Qj
B4kx98BFaadQIXG3Ae1L8ziOGEWQlSZS/3Rbv1Q3m72Fz9VRNKXmCbJOUdUsfAZi
XFD0Ulkuy16WZYA8gCMe7SU4Ntzm/fGERw+4717jqBRVSxv7utg=
=b2WE
-----END PGP SIGNATURE-----

--iBwuxWUsK/REspAd--
