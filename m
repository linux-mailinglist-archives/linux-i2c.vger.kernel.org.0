Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C61E1A2681
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 17:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729808AbgDHP4H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 11:56:07 -0400
Received: from sauhun.de ([88.99.104.3]:44862 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729804AbgDHP4H (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Apr 2020 11:56:07 -0400
Received: from localhost (p54B334FE.dip0.t-ipconnect.de [84.179.52.254])
        by pokefinder.org (Postfix) with ESMTPSA id AFFBF2C1F39;
        Wed,  8 Apr 2020 17:56:04 +0200 (CEST)
Date:   Wed, 8 Apr 2020 17:56:04 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 33/35] docs: i2c: rename i2c.svg to i2c_bus.svg
Message-ID: <20200408155604.GA22619@ninjato>
References: <cover.1586359676.git.mchehab+huawei@kernel.org>
 <bb72db28b4b7d867555b345a49703fdca484957e.1586359676.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <bb72db28b4b7d867555b345a49703fdca484957e.1586359676.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2020 at 05:46:25PM +0200, Mauro Carvalho Chehab wrote:
> When generating the PDF output, the Documentation/i2c dir
> will generate an i2c.pdf. The same happens with i2c.svg:
> it will also produce a file with the same name, at the same dir.
>=20
> This causes errors when building the PDF output. So, rename the
> image to i2c_bus.svg.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Wolfram Sang <wsa@the-dreams.de>

I assume the series goes in via the doc-tree, let me know if I should
pick it.


--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6N9BAACgkQFA3kzBSg
KbZYFg//bgvPW9JkTSq9PUWDwF0mccgCgpSWBxG7ZGN3XnfeAXbrEbEx1/PyDsco
ypFw/I6F1jOJayec54haf42fBJZIcK1jwk82lwCXt1rKLnxU9PasfDeDR4YfSnxY
mPw3At6F7tuzQD2vbz/XBPpXviRvEA4Omimk42XZCtTt+dcrYaTgw5M+88euu8T5
6SprM3EzpZ5eEcbTD31FV+ok0MrlkLSOhft5qxa8od4lKhes3Zhq2aIFV3qg9JIt
UAfdBbr9IIJeZbidvZu/dp/LFibHR6FaqiyPqFrURKbiBrU01TdIJ05T/q6pjz27
i/88c9YeMjuPg7jSXIYYNlN505iM0oNSOw1Y2V53qyyaiFq9wu/pwnKyU0Cw+g7m
xN0TKT8ZMKLAh5gusPVfY0Z4dvYjTTx/Wi4jI/Yq6PXepHL7gxK+7tcRhQxOkQV2
2oE/UpYNKdHDDDxUhKQGjrE0tuZGUViiVOAvTvG7n5ycY27YFs/C/ANRh0trrNi0
/3hocl4c6CcUSwcI+9OpCN6ihmRjrgMYoaFVPevXx0ECE5WodwYBiI4Eh36k+bDr
NjYBm+WPJ+bZc6uZc+/9l4s1buC65/K+X9OEK1pxGhAAEYMPxl5pzeMmxav9CmUM
mP6PRsLQr6Pl9EfLJEZJI7dOddd/WTHzbbTNVL9WDYhpphFdg+U=
=aRzN
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
