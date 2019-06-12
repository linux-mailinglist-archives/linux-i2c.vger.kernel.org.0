Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E568422CB
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 12:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405151AbfFLKlJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 06:41:09 -0400
Received: from sauhun.de ([88.99.104.3]:58374 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403978AbfFLKlJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jun 2019 06:41:09 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id A55412C54BC;
        Wed, 12 Jun 2019 12:41:07 +0200 (CEST)
Date:   Wed, 12 Jun 2019 12:41:07 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Annaliese McDermond <nh6z@nh6z.net>
Cc:     eric@anholt.net, stefan.wahren@i2se.com, f.fainelli@gmail.com,
        swarren@wwwdotorg.org, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, team@nwdigitalradio.com
Subject: Re: [PATCH v4] i2c: bcm2835: Model Divider in CCF
Message-ID: <20190612104107.ndbo55ii2w3ahtzr@ninjato>
References: <20190529042912.12956-1-nh6z@nh6z.net>
 <20190608171443.14484-1-nh6z@nh6z.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="c6c35ryx46u6myid"
Content-Disposition: inline
In-Reply-To: <20190608171443.14484-1-nh6z@nh6z.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--c6c35ryx46u6myid
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 08, 2019 at 10:14:43AM -0700, Annaliese McDermond wrote:
> Model the I2C bus clock divider as a part of the Core Clock Framework.
> Primarily this removes the clk_get_rate() call from each transfer.
> This call causes problems for slave drivers that themselves have
> internal clock components that are controlled by an I2C interface.
> When the slave's internal clock component is prepared, the prepare
> lock is obtained, and it makes calls to the I2C subsystem to
> command the hardware to activate the clock.  In order to perform
> the I2C transfer, this driver sets the divider, which requires
> it to get the parent clock rate, which it does with clk_get_rate().
> Unfortunately, this function will try to take the clock prepare
> lock, which is already held by the slave's internal clock calls
> creating a deadlock.
>=20
> Modeling the divider in the CCF natively removes this dependency
> and the divider value is only set upon changing the bus clock
> frequency or changes in the parent clock that cascade down to this
> divisor.  This obviates the need to set the divider with every
> transfer and avoids the deadlock described above.  It also should
> provide better clock debugging and save a few cycles on each
> transfer due to not having to recalcuate the divider value.
>=20
> Signed-off-by: Annaliese McDermond <nh6z@nh6z.net>
> Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
> Reviewed-by: Eric Anholt <eric@anholt.net>

Applied to for-next, thanks for keeping at this! And thanks to all
reviewers, too.

(One minor thing: next time, please start a new thread when sending a
new patch. This makes applying patches easier.)


--c6c35ryx46u6myid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A1sMACgkQFA3kzBSg
KbasXBAAses+qCt/n9a2IXid6+QUuQ1nhIn/M5YcKTklfilWQ8izcToLQQeSAhDf
9k7JxvejL6Soq9oj3aR+RTvcH3G2l7yaYHZzUIkq76ux4LN0ZdFymlkhAPQoN6Ar
bBSiP4EH03os2jiUBSxSqnHlJE5y0WVSZdvLin2sOj8Y7FC6AztHkFWaYkcm0gBc
kbHZdFu+FDmO51hv+jv0RQYefigjJfCNsh5dMZbCPxVvTt2EPn5vks+49dsXlqWE
YaZCH0qKMB0KqIzpg7AXlH2htqNORVcJ3wYrdrKC30rvexgyp9h/CNwnxZEYAtUR
C/Sft+FJWzVagqC5K/rZcwB10FNj4yItJZ1+JOg9AkxHo7CTlo51zwSBAajblaLi
VQnf1PlZHkSy3CGGJZOFyOOHLmEX/Mzs/Nq+lhSEM2sQoYBxd8XZYHtITMumodoy
38fSFJlon7aDl28zM3t72h7MTUsQvsujaqMpQa67vn3FjySqXDk7qS71Als9RPxS
RcXwm097rMS+OQRjOPH0dOur5dm14iOLtChA3OrZpBe9zEjjIWa8Q565BurTsqW7
+uQ/MqzYVfkkW4EHSt308mALe5yYJBdS4Nb8Ws2ua8qp8pUrCjWewxDZg0yMff+p
zGFHmwOm+Jl9vu2SCpTVBtBLtU4+b6sN/AyZCVnh/tTKd90AwWQ=
=UHqb
-----END PGP SIGNATURE-----

--c6c35ryx46u6myid--
