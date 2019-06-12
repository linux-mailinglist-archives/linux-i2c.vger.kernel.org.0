Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74A1E42218
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 12:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfFLKPc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 06:15:32 -0400
Received: from sauhun.de ([88.99.104.3]:58124 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726725AbfFLKPc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jun 2019 06:15:32 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id E8E6C2C54BC;
        Wed, 12 Jun 2019 12:15:30 +0200 (CEST)
Date:   Wed, 12 Jun 2019 12:15:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: acorn: fix i2c warning
Message-ID: <20190612101530.k42zgjzfrxozeynx@ninjato>
References: <E1hajwY-0003Aj-OD@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ujig6z743qexizo2"
Content-Disposition: inline
In-Reply-To: <E1hajwY-0003Aj-OD@rmk-PC.armlinux.org.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ujig6z743qexizo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 05:48:18PM +0100, Russell King wrote:
> The Acorn i2c driver (for RiscPC) triggers the "i2c adapter has no name"
> warning in the I2C core driver, resulting in the RTC being inaccessible.
> Fix this.
>=20
> Fixes: 2236baa75f70 ("i2c: Sanity checks on adapter registration")
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied to for-current, thanks!


--ujig6z743qexizo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A0MIACgkQFA3kzBSg
KbbxABAApo3YraVz4iOF0+J+PKPTnSHZ3u7ed5Qmk8KWZAaCv//9m1z76+Sh7qVL
1U/OaqJvMSfkr/r7zWa4AIkJfmzbXYGVAb1CtJM2aJwjo3rDdUHtWKmQZUx3NyhY
2W0GkABqCVzCRphb8MY3UTexn0d7jg2qGzS/iY5tVfbGEpiFI5wFG5ziuQy8uEP3
iF17F+HfA3sLG99XgBwDHCD/qoV/Q4mxwvPiVXXwUQexUdcn1Bjze5abeZ/BAk4Q
L1sLJilnXDp39/E8e1pk7jw3kIbEDhnAax0yl+zLigShanKj7Qh/ck2klymZniH9
7KGT+fPl7gmSsLv2i5qZUmK0Brc3TCpiSlQVxK3M/uH8oWPr7oPW+54JHyGQsfE3
Hs2XL2fc5e08POZgEiCKcSTtz6dUMKXJGJs8IVbIMpfAp0+Y5abRG+xNHwsidi3x
75b91Z3jbXoqDcmaHNaC3xKaaPBpZbeCHmH8rA86AeSrK7CNNACwE6WfRB7918Am
vMvzvcTPeGLn+8+Uto4meCkO55T5CrBgiQS455mCYlC2r0V1JPyIcrbX6fItmKEO
nCMMztMcJ3PU9b+wP0KfGd0NLWaF23l6PLIvZBfFz9Wu99zl1uJ2I3aHV2/mRjQo
dOzLm0/GZnkmHi0/Dh8jul8b6zRzXW1IWqz0ImzARaDT3GjgzBY=
=UXD5
-----END PGP SIGNATURE-----

--ujig6z743qexizo2--
