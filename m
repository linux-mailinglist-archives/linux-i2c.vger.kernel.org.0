Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C61575AA56
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2019 13:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfF2LME (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jun 2019 07:12:04 -0400
Received: from sauhun.de ([88.99.104.3]:60856 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfF2LMD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Jun 2019 07:12:03 -0400
Received: from localhost (p5486CA23.dip0.t-ipconnect.de [84.134.202.35])
        by pokefinder.org (Postfix) with ESMTPSA id D04C52C047A;
        Sat, 29 Jun 2019 13:12:01 +0200 (CEST)
Date:   Sat, 29 Jun 2019 13:12:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Fuqian Huang <huangfq.daxian@gmail.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/27] i2c: busses: remove memset after
 dmam_alloc_coherent
Message-ID: <20190629111201.GD1685@kunai>
References: <20190628024711.15203-1-huangfq.daxian@gmail.com>
 <f97d130f-0906-05cb-6f08-bb84bf32ff02@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Content-Disposition: inline
In-Reply-To: <f97d130f-0906-05cb-6f08-bb84bf32ff02@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 09:22:31AM +0300, Jarkko Nikula wrote:
> Hi
>=20
> On 6/28/19 5:47 AM, Fuqian Huang wrote:
> > In commit af7ddd8a627c
> > ("Merge tag 'dma-mapping-4.21' of git://git.infradead.org/users/hch/dma=
-mapping"),
> > dmam_alloc_coherent has already zeroed the memory.
> > So memset is not needed.
> >=20
> > Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> > ---
> >   drivers/i2c/busses/i2c-ismt.c | 2 --
> >   1 file changed, 2 deletions(-)
> >=20
> It would be better to refer actual commit or commits that implement that
> zeroing rather than merge point in commit log if possible.
>=20
> At quick look commit 518a2f1925c3 ("dma-mapping: zero memory returned from
> dma_alloc_*") is the one but I'm not really an expert here to say is that
> alone enough.

Fuqian, can you clarify if the commit pointed by Jarkko is enough as a
reference or if it really needs the merge tag?

Also, please include the tags you collected in v1 when sending v2 (and
there was no significant code change).


--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0XR4EACgkQFA3kzBSg
KbbyKxAAo8H1xdyo+DJXLvoGJaIJwtZtFYMYbqV/4kbepBwkTC2JdQo7WJtHzHFJ
hE6Yolc+goA0hmOfgEYVICD3LZ80qDMDbrCl6MVckY66Y6DfPSp2UFngP/EthnE8
rbvlaNaNilx/vf3uUVWV0dNnX7XLJb05p+lRl4a4lHqTHI3oyo+9ZWDzZeMTZ4I4
Aal6G2XT4HM0B43eEvhSPEB41dmFzY0NsbADS8tS7sDWMfQKDWfY1lagrj6oO9P7
3UzXR0aSzXq7BpSiltHRUhxtBq+xyGU6zPudCS3RGUOi89ynEn2hwkwXegFoBvmt
UBlROiXFuCObQzZZlqrrDgsC4dNvYKYTzZobH79c6NQ0nvsM5j5526A4sRM9c6QM
88x09WQBLvohloLPlMfMa3ikXf9F03tD0Qr1pzgwh4BrdVhkAWslZyZDNyYK1j4d
xcXOVjY/zj452mH7snhwbydcAdAMd4JWKiOUsOh44UHEJASekz0HcDIrhvJF9wKP
kOXzRbbPrg2x3f26NZ88Eo3aSWkvKJ74Ly0YTk9aHvBucbHTyg3cR/r0dN2HWRXH
Nwmz+IMSWbLyLckhE4LsVTunuCAGawf07u5uaAMFUA9WnrOOUlW1onksS/aatL93
xqXY7MOqYzNsgf0FFi6EBul6aqq7U9FMWKKRazAC1op2aFRRVSE=
=18LR
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
