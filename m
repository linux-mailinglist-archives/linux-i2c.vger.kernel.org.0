Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61D3210CCA8
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Nov 2019 17:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbfK1QSt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Nov 2019 11:18:49 -0500
Received: from sauhun.de ([88.99.104.3]:43896 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726446AbfK1QSt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Nov 2019 11:18:49 -0500
Received: from localhost (p54B33127.dip0.t-ipconnect.de [84.179.49.39])
        by pokefinder.org (Postfix) with ESMTPSA id 2D4102C039E;
        Thu, 28 Nov 2019 17:18:47 +0100 (CET)
Date:   Thu, 28 Nov 2019 17:18:46 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [RFC PATCH 05/12] video: fbdev: matrox: convert to
 i2c_new_scanned_device
Message-ID: <20191128161846.GE5412@kunai>
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-6-wsa+renesas@sang-engineering.com>
 <20191107083354.GK23790@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Content-Disposition: inline
In-Reply-To: <20191107083354.GK23790@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2019 at 09:33:54AM +0100, Daniel Vetter wrote:
> On Wed, Nov 06, 2019 at 10:50:23AM +0100, Wolfram Sang wrote:
> > Move from the deprecated i2c_new_probed_device() to the new
> > i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Ack for merging through whatever tree you think this should best land
> through.

Ok, because it is a single and simple patch, I'll apply it simply via
I2C. Thanks!


--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3f82YACgkQFA3kzBSg
KbbX9g//Z+RQyFWAciAMonU5b6yZmQUfvTRQinqsoRSkTXH8iOP1iPhwBpoLil2P
ARc4NUfH65Y0HhbFPF9pmctbUghoRgf3ebw6PheU/n8ei64T+p3Vwp5N1RvXOd1s
/v5gDP8QA4qlSjAKZejHER8oFxFxEhEVFHhYzFuPBgwTO982YQZDG1xkP1/eCH7d
jtaucmntbd/U8fWk43EBByoU48eRtPHcNGvaby0UfHfixidGI9NwiXKkDATbLQ2C
tgPEIiIvtDPzliXTgP17/LJv8eK8llfF8G2M4Rz/0Siw39usj1QKxVSt4YPjiZuT
2GWgPEG7EnozPNyUKuH3V3Acy/F0WwRTlD5ML/PglSda7KJuI92ZwMlEZsrH3WMR
D1Mn/QwxmqS8DVqoVjsiyyR6jkYm5rlOdV53dFETTptG8IsIkxlT/69E1+CHl9PM
6bcjaJfOpRZdtr9g78qqo/amISrFXqiMyM2p/lMaKo1W9ifo7vLXoi6lVIBgQcB0
Ug/sQRizEsZLyRaVDdKPwCx6dOE3suu/h/WJ3kh56/bxTU8kr0aeWV5ohyp1oFiX
5v1dyL3yiE9ayd38/OVeGKI+tSJszTy/S+teCmcK2uO2w9ooe4rBnMu2i6ek49FT
+Y5ZAB/1fULkJmSlGKYCn0bWSXwXaUF7B2eRqHkKQ5a67kRxm3s=
=mZJx
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--
