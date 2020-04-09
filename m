Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADC91A354B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Apr 2020 16:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgDIOAx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Apr 2020 10:00:53 -0400
Received: from sauhun.de ([88.99.104.3]:59324 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726895AbgDIOAx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Apr 2020 10:00:53 -0400
Received: from localhost (p54B33209.dip0.t-ipconnect.de [84.179.50.9])
        by pokefinder.org (Postfix) with ESMTPSA id 22EEA2C1F75;
        Thu,  9 Apr 2020 16:00:52 +0200 (CEST)
Date:   Thu, 9 Apr 2020 16:00:51 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Thor Thayer <thor.thayer@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: altera: use proper variable to hold errno
Message-ID: <20200409140051.GF1136@ninjato>
References: <20200327222826.10207-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oFbHfjnMgUMsrGjO"
Content-Disposition: inline
In-Reply-To: <20200327222826.10207-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oFbHfjnMgUMsrGjO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2020 at 11:28:26PM +0100, Wolfram Sang wrote:
> device_property_read_u32() returns errno or 0, so we should use the
> integer variable 'ret' and not the u32 'val' to hold the retval.
>=20
> Fixes: 0560ad576268 ("i2c: altera: Add Altera I2C Controller driver")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--oFbHfjnMgUMsrGjO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6PKpMACgkQFA3kzBSg
KbZDwxAAtUXB4m+2rwNj8INqowMF83AiJs8D3PrWWmI1arBO4U7RhrBzxSVffZ+d
jVZQjILEUskt5zCJ7RaVdZqB0je/OSLQ1qkuNXAA5VemORFii33GPVPP7Eaa4DyO
wFsFP24eccHD71gF9wNEiS+eryxB5khnRGank+v4ymKXBcmOPC8gPp+yzS2mzT2i
BddZShkEKX3ewPV06dMPk4zfvhS/la73skU8Md0teARaxlcz0RDwIOtUJEfwdZfA
+Mw2vdLPtHEBvs75u3TLBcgYmTKyJzvck6A5hGoBcGM9tOZi2HBrh9WJ+72tKwop
O0qI59WffMBOi7ol/Ah16zexk4BBGU68xhiS/L0ZD0d8w4gW4mSOm1or03sxx2gG
ZklDYXWmoxDAQ6I8SFPshXRMMZyF4dkHVtK1iW7PbpB4P9CwSInaSYkQUVw+LsZG
Jn9AJqoNJgAiBqFwmASHr4RqMq58klCcqiaI2pRj7ytWMOeOKozeIQEuaZxRhATQ
z5Vu/qoeuA3uI4F6RPy6cieirBIoEvgVIK2fzPLRbrG+Xk6rBmQyJbLWFaPU5Gab
ITKRhjYskxxrLQ8/KA2H7uF25bwP2x3qc8dt3HJi5lrvYrvf1PL0fdcK//gsVbVh
kgLzetWits7znkWWjrj70I362IM/MeyTzZ86IYKJHI2kXAFC9wc=
=Fzc2
-----END PGP SIGNATURE-----

--oFbHfjnMgUMsrGjO--
