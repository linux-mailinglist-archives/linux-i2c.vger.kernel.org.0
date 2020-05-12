Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE181CF29B
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 12:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729405AbgELKfS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 06:35:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:39844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729419AbgELKfS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 06:35:18 -0400
Received: from localhost (p54B332DE.dip0.t-ipconnect.de [84.179.50.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05FB6206DD;
        Tue, 12 May 2020 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589279717;
        bh=aaFdPVlndJ3Is6ZBtB65c62r3O05Cr4Fwe8iTjvEH0k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p8j/npC1XjlwpqJgy1XRk4/8QWFLvQwJBMI/UtZNCrkUEh4uphgEdmdhl1azOK3Yw
         x0awg3phvnKIcTtNbeVP04laxGJlYzgbp6Hx3RCIKqIs4kpG2mtkF0TQghhzPyrccx
         PDHnFyPIETgl0jbIRkrZrx8pjbBbFAfPrTe1+2Tg=
Date:   Tue, 12 May 2020 12:35:14 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/4] i2c: pxa: avoid complaints with non-responsive
 slaves
Message-ID: <20200512103514.GC1393@ninjato>
References: <20200511210948.GY1551@shell.armlinux.org.uk>
 <E1jYFh2-0007K5-ET@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Content-Disposition: inline
In-Reply-To: <E1jYFh2-0007K5-ET@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 10:10:32PM +0100, Russell King wrote:
> Running i2cdetect on a PXA I2C adapter is very noisy; it complains
> whenever a slave fails to respond to the address cycle.  Since it is
> normal to probe for slaves in this way, we should not fill the kernel
> log.  This is especially true with SFP modules that take a while to
> respond on the I2C bus, and probing via the I2C bus is the only way to
> detect that they are ready.
>=20
> Fix this by changing the internal transfer return code from I2C_RETRY
> to a new NO_SLAVE code (mapped to -ENXIO, as per the I2C documentation
> for this condition, but we still return -EREMOTEIO to the I2C stack to
> maintain long established driver behaviour.)
>=20
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied to for-next, thanks!


--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66e+IACgkQFA3kzBSg
KbamIBAArJZEXylY/KGAO5yy2o4oXUbM3S4RKqO42FESNrCGJoGezxpQsfLhNgLE
sC+NdGAjbx+fVwJNFIDiYK7rLdXrKHviA+kNbJzIN3EET7VcHpFzIjDytBDywmNL
HQCQAAAORrgsdfkRzr1P84PKrSIh614a7EwKI/ycNmdD5I13Tnc2ZYPMNBf9vXNL
b97E9z9PyWKwidQ/xiCybuv9ekj8A9CYu+DceMyD6ivRFUGOFsR2rs+Mhm/P4mXZ
oin+B8gE/Oks+hJgDwJWBczQOYRzSRInTcv/ks+8XIwbe/exKwFahHln/JUiG/ni
UG5TvmXWCwIi7zrLQIKtB5gM2PgVIeCkd6SEn3qryn7wPN4AYG5IK8y422j4Izky
XD3pzI35U16gfd7pe9XCscF3ZpFg/dHVg9TXSPy7o8deeG7eaAzNQUYM7VtUVGz+
rwbRlz753cjo4BW6pqIpgLz/zWxDvANhKkjhz4VzGKeilrc0br2/6Usp26qWCT3F
y2XRjiNDHYjqyPziXqoR0kVSnzDx6h7o6sNB950/AuL8iSHjJYyaRm2iYzqNz0ty
ssHXiNBRvLC44IQvGc393beQTa4h8g7c+tmWpXIBATCtlBah2f+0slXIOs0y7Vgr
sKGHTGqz8Q6AXdWQg0okE+PBt4M4CO52INcmoZAJu0+MoWQUvSQ=
=Z3yW
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--
