Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAEC3271F3A
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 11:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgIUJrh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 05:47:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:33640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbgIUJrh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 05:47:37 -0400
Received: from localhost (p5486cf2a.dip0.t-ipconnect.de [84.134.207.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0816C21789;
        Mon, 21 Sep 2020 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600681656;
        bh=3udGCuL60P/kt+hc4EB4VVbXcYsB1pStWU1GQC/3gNs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jzEykqAa1/s/w5Ys142zoq1YMnG7u5pN9VlXsAZbgHj/hLh4g0/GimhKtPBQzpX16
         6PisLAPOUQ4bsYptMXH7Ln0JJic2xU5ukzEsK509QeYulXFyLA2Qltpp+eZklovaFg
         5j9EiCddVCgGkmDi1gQXQuQvNI1rc+t2e2q6z6LI=
Date:   Mon, 21 Sep 2020 11:47:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>, od@zcrc.me,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: jz4780: Add compatible string for JZ4770 SoC
Message-ID: <20200921094733.GM1840@ninjato>
References: <20200904131152.17390-1-paul@crapouillou.net>
 <20200904131152.17390-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x38akuY2VS0PywU3"
Content-Disposition: inline
In-Reply-To: <20200904131152.17390-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--x38akuY2VS0PywU3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2020 at 03:11:51PM +0200, Paul Cercueil wrote:
> The I2C controller in the JZ4770 SoC seems to work the exact same as in
> the JZ4780 SoC.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to for-next, thanks!


--x38akuY2VS0PywU3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9odrUACgkQFA3kzBSg
KbY/BRAAlBh93d9rJa+Qi1QwY/zERZt9cLd/bPFlRW+6wJXSYofSseZA0ffpLJI8
1Z2DFXvJUGDlWfKCpey8rED3DCf+3WAJFsDeweZi/+D0ej1z1CEuTZWuHWiRKgIs
AfSnE2BZAt/SWka5MO73j64VYfXwBsxAAML7MAHwmtySYE/9FDmaTSQc6oLwYiTj
5mYxSgYQR6cEzMJ1jiNRqxeDjtj9uAfIaFmCZ+RfUM4x83Ylu9oaYPI6edVQFMuR
hWxcM4Kkq9fA3oMVoHDvmVDIP/pKu8kVW51pieLYOXRDcmQbZZi/QbIjkguHyypq
QOSU9OUOb5uggXa0wEWiAg2jQJ2C/mxsjQeo0laS/uqOOZSvBURpIFXykEKK5+0F
TLX+lGene+mtr1vMP2MjqTrpIOXyRpkfldI/0y/COotKU0rDFNoRrG6bgHF1CGwE
mn/jQWYTKbQ8cXg5BKfAsd7Yc8kIinOhUpoJimTZeP5mcfDyXEFkb9W9hWfwSGNu
62Mb/g5nGuoEmkKYkhVy6wFk/AIIYOLRmsAXCRHGSRIJ1hb+rIqmRPgBMY86Us2T
MhBff360Lm3b5+cvvj4ixSJ4O4C+y1ITTSl/No2jpJu6+y3HtbcH4qpPq0uOApzS
946oy/10WQjneuDX6raHGG2p2GvezIsL+pYFzuSmXKeNPkLvzts=
=BdK1
-----END PGP SIGNATURE-----

--x38akuY2VS0PywU3--
