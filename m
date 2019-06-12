Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F52742241
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 12:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbfFLKVk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 06:21:40 -0400
Received: from sauhun.de ([88.99.104.3]:58160 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727404AbfFLKVk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jun 2019 06:21:40 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id 5A19F2C54BC;
        Wed, 12 Jun 2019 12:21:38 +0200 (CEST)
Date:   Wed, 12 Jun 2019 12:21:37 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bitan Biswas <bbiswas@nvidia.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Dmitry Osipenko <digetx@gmail.com>,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
Subject: Re: [PATCH V5 1/7] i2c: tegra: clean up macros
Message-ID: <20190612102137.mc2fwrifmbl2x6dr@ninjato>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="glfpl6iv3trozchb"
Content-Disposition: inline
In-Reply-To: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--glfpl6iv3trozchb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 03:51:08AM -0700, Bitan Biswas wrote:
> Clean up macros by:
> 1) removing unused macros
> 2) replace constants by macro BIT()
>=20
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

Applied to for-next, thanks!


--glfpl6iv3trozchb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A0jEACgkQFA3kzBSg
KbZ4YBAAr3ydA4TVT7tPO956qQjxScFkJ8fFKU/zTKTL9covc5QfQinf4fyTkGbv
WR53r2u4NfAEtq/4wTbOA4bfK6t4FCZG9cH31YeY6ce6MkHTAFo7vKls09c0m8sg
wPgoyPuRnw5GftVK7gwLfhIg3Gh7xDdyDD0XNzFC6/pKFe0OJmDWFR8S43FWsiwP
t5x//BT5N2EjQq3HKYoJwjU8+iUeBisEdAuataWuqLfLiVz2JfxBRGx6/WUr0QqU
RTpZ6Y+kgZ6/9fFIF4C8jgpjg0YOYoScX2NL6D0k/C//maaTVcgzaV5MrkjQZoLL
wHDj0LTCGPcz+UFkCYrtJnogyUOBGWQawLGXOoNWJXD+U5l+DkZP9YSWeq3Um4+o
0Puvn+GHBPjYC0yjP+basLveGfuWjRhTBz/7vlAAP5xT+NKRFw6UZ6ygk8mi4sQx
OcoTLdBgbpUbufiRdP2HLyMZXbf4A5C5HqkvJS3ELq82ZbfjJVn6Wzo418NcJRmX
s1xxElkDi7SsuI8F1d5P8c7cSmpDY7Wv8MX6GIaXiCm/bcsNa1yIOYNi6eVx6liz
nQpcm4P7ngtaRuAh/EbU4fYs1O5sMU0Iuixz/6Es1YQWX1vh+Ehn5IGB5os3V8fr
4upKSK/pFR78pqZE18Kgvv+ejjaIAGANjY6ooD7mGxAvpJXCDTo=
=/aKc
-----END PGP SIGNATURE-----

--glfpl6iv3trozchb--
