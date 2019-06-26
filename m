Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12EF956ADA
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 15:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbfFZNjo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 09:39:44 -0400
Received: from sauhun.de ([88.99.104.3]:56332 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727858AbfFZNjo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 09:39:44 -0400
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
        by pokefinder.org (Postfix) with ESMTPSA id 1C93B2C0114;
        Wed, 26 Jun 2019 15:39:42 +0200 (CEST)
Date:   Wed, 26 Jun 2019 15:39:41 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, matthias.bgg@gmail.com, robh+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: Add MediaTek i2c AC timing binding
Message-ID: <20190626133941.GL801@ninjato>
References: <1560240715-22595-1-git-send-email-qii.wang@mediatek.com>
 <1560240715-22595-2-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VBq/nvTu32OVLBUP"
Content-Disposition: inline
In-Reply-To: <1560240715-22595-2-git-send-email-qii.wang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VBq/nvTu32OVLBUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 11, 2019 at 04:11:54PM +0800, Qii Wang wrote:
> Add i2c AC timing binding to binding file. It can give the AC
> timing parameters to meet I2C specification at different speed.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

I think this is a too specific 1:1 mapping of your register set into DT
world. We already have these generic parameters:

- clock-frequency
        frequency of bus clock in Hz.

- i2c-scl-falling-time-ns
        Number of nanoseconds the SCL signal takes to fall; t(f) in the I2C
        specification.

- i2c-scl-internal-delay-ns
        Number of nanoseconds the IP core additionally needs to setup SCL.

- i2c-scl-rising-time-ns
        Number of nanoseconds the SCL signal takes to rise; t(r) in the I2C
        specification.

- i2c-sda-falling-time-ns
        Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
        specification.

(check Documentation/devicetree/bindings/i2c/i2c.txt)

Can't you use those to derive your values from that? Which ones are you mis=
sing
if not?

Regards,

   Wolfram

--VBq/nvTu32OVLBUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0TdZ0ACgkQFA3kzBSg
KbYdwg//dQgqHhmthL0M3JNNdA09iWqGwQ9bMoPtMtoM/+hklFt9CRstWC+xJM/Z
R0urToI6NYfU6uUHLyk/Rm+qLRpxjdm49flzF/e0MbEEwW1xXifpbQJOK5Dcwb1w
qRI46Nb8IjHa3+P6az+WgHlKg/1xURj5oPnVgbl/vNsxXbdubtpYUlOm10WROnNE
vx+ge9+OzERZ2KhNkOWbvx3szlBE5KF183VZVfXYvYnR4X0Uz8LJt1H90o9ointF
5dXC/UzCOBOkyp5lL4KqbDTcoSeaTEWkAnt3tKnyXig+vgK1O/aeOdAENd4m2xsh
1kfdlwXrACKg5zUN5jUPF4KF9r0+YI2GJZHgyxqmzuWabRd9F1o+rXvKwintgJ0L
Ffb9SOLW7fqDVJKBCOkFOglJZUOWxeU6TfsQWYwNhYorI0HcJ+EcQR4195ZyhtD3
zEEpeh6Qpxk+maQyvO9NzBd7+HLLEUqHQZWTsOctYucIyLbpolJ2Iq6V9LasLiwO
U5N29cEdhN/YLXC+aAzBu9iJlPc2C+blG99j80l3D/uDY42G0cHXkThzgDSSTEmx
lIz41aICZKF/3RHgbSz7yEKH5ulFOvd8qFz5Yn2nQQEHKzm/sN1XU0o3VgWIEnbN
byFUoWjaiu3xM0xFmKf5WtZ0qpRM0y5VIUO27JwSkBREDVJ7QV4=
=h1Pk
-----END PGP SIGNATURE-----

--VBq/nvTu32OVLBUP--
