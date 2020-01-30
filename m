Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D90D14D734
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2020 09:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgA3IDN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jan 2020 03:03:13 -0500
Received: from sauhun.de ([88.99.104.3]:46338 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726464AbgA3IDN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 30 Jan 2020 03:03:13 -0500
Received: from localhost (p54B33261.dip0.t-ipconnect.de [84.179.50.97])
        by pokefinder.org (Postfix) with ESMTPSA id 6EABE2C0697;
        Thu, 30 Jan 2020 09:03:11 +0100 (CET)
Date:   Thu, 30 Jan 2020 09:03:07 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     alex.williams@ettus.com
Cc:     mical.simek@xilinx.com, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Williams <alex.williams@ni.com>
Subject: Re: [PATCH] i2c: cadence: Handle transfer_size rollover
Message-ID: <20200130080307.GA2208@ninjato>
References: <20190131213957.11568-1-alex.williams@ettus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <20190131213957.11568-1-alex.williams@ettus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2019 at 01:39:57PM -0800, alex.williams@ettus.com wrote:
> From: Alex Williams <alex.williams@ni.com>
>=20
> Under certain conditions, Cadence's I2C controller's transfer_size
> register will roll over and generate invalid read transactions. Before
> this change, the ISR relied solely on the RXDV bit to determine when to
> write more data to the user's buffer. The invalid read data would cause
> overruns, smashing stacks and worse.
>=20
> This change stops the buffer writes to the requested boundary and
> reports the error. The controller will be reset so normal transactions
> may resume.
>=20
> Signed-off-by: Alex Williams <alex.williams@ni.com>

Applied to for-next with another Rev-by from Michal given in another
thread, thanks!


--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4yjbcACgkQFA3kzBSg
Kbb8RxAAiCoAtge6yROLbqYc4Ruq1gKWnE76UU2AbpwSK1GEFdyKat70l9hN0Edb
7ISc+b+z9X8gYfm8Sx8CjKoqC+B4ldxyZM+hNCOzkMfzbIGUNTllajhZIAb5MEhI
E405O36pd94ogiFGcTALsgtLgfaC2HDzVTqm5xOyJqJRte+W0palPx4UL6+33PbR
QYmMkPhA+6AUlnCXsrtDjM13eg3u6gRn/IG/ZfztOPufyzsE3sHaMgyqLhE1puI/
5N3kjDQQAfespuTspjLm8S7J4cqSxEYpieog6II6NGCRFQTsfiYv6iHCzyywJ5Xk
t5CgEaqnqZBzr8WFWmpgngz33RrYBTEOPbM5WScvVKaMfm3bKAP20Q23yEaDwZAC
SfI0SQJAyJ9EZi/z2NuDRi8QgED5hoqchWN0MT9VYhGsSEfZA4q4LiECkHL8Zg85
VxZMCZcfQHzER3epg0P3imvP5slj6L4LhSzg2mu9JdHUSqcsjIA16E+Di9kZ/eCF
rJkh8Sb4tK1ClVlnTW4/YtmfC7Ru0XrN5ZFeugZxUurByG5Q3NtezkJHAzrVJGFz
L3AbX0Fl7lA3/nX/astrsUgG4sXoOG7bWW/7FiA0jWPrX+WglbEbXZQ64I6MXN5E
TOjyGoxiXCU2zyrlqeiHwf7XDRmzMpxAOLYZjmKgibcX1OcjLBw=
=WTaX
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
