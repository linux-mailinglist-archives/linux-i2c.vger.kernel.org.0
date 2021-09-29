Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBC8941CCB9
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 21:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343826AbhI2Tkf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 15:40:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:59624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343703AbhI2Tke (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Sep 2021 15:40:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8469F6142A;
        Wed, 29 Sep 2021 19:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632944333;
        bh=5WN4TWBpxPCl1NB4+XwLbz9t9OUYmHiCBa6Yt4sYBgw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QxPO9mNwtf+BVUkYip8ZOFxiWQVy2H5BHnGMm+58WkFUfQWap4MSLmT2y78Ue6Pq3
         ItWMfxLFfbrtAkLfHszo54rDvtAqDr1G/ngjD8MqeKZ8NG1Nq5qr5L6h/nOuItk1Sw
         H4zoTSBTAf57NRnxkjrURgbfS3ggV64OdLlR/REjVpvNtPkdsn6o+qL2+DaDHhAsI5
         82KZSz8TdpH0IcWzjYPwNhZCVTeOW6f5xZp1fOkqqtnjpdd92R8KIWS59C20CWGQ2S
         oy1tly9LAjMWQEOsrdjD6FtAZ6IYKW27WOnLuVWrr9Q9jB54XcFRIcW3fSgFwa2N3O
         oOCjjzEwZHtFA==
Date:   Wed, 29 Sep 2021 21:38:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 7/9] i2c: i801: Improve i801_add_mux
Message-ID: <YVTAyjoeBHT//R7U@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <aa447a75-9913-fcd5-476d-e593a5ea4f2d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1KKocvDr1UcUn54A"
Content-Disposition: inline
In-Reply-To: <aa447a75-9913-fcd5-476d-e593a5ea4f2d@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1KKocvDr1UcUn54A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 11:17:10PM +0200, Heiner Kallweit wrote:
> The return value of i801_add_mux() isn't used, so let's change it to void.
> In addition remove the not needed cast to struct gpiod_lookup.
> GPIO_LOOKUP() uses GPIO_LOOKUP_IDX() that includes this cast.
>=20
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Tested-by: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--1KKocvDr1UcUn54A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFUwMoACgkQFA3kzBSg
KbY+/w//enTr5TuHlWUtLzpg6N2ceJ8gCPlwCFPPdgonsuybnzXgNnNcoXa5f+8g
b3DjGYyfuTb2OFOPyf8lGIj8vRHQ6MsfzdQ59t104rJhDJsK4+k95p6m4YLJjszH
Hh4TFetSDinS6d2D5n5129hdMuMCr9bLCi5fkk4ujkyM3cn6hIQc15ovb0PypJ4d
bx17pgaaJvpjy8TQqr7X4DFAM5010HBz5GQTAShHm3mJgMVgU6jEkUVGG3uLGDXw
S6UKQwCJtO/asuJaZ+eaiNCNhUjREL1WXGUDG91yuZ9M6SOQcEf00zax6/QOfVcb
91B78E7GMOzWhhZm8Mf5msJgDRqyDnOb8c3xMYw79mk0wvUbJnk7NCov/fbiDVzJ
GSL0gmrYJtQmWbJgWjfQsfcSOtOKfhVkXGlce+YAiCzsmWMSfNonsUssPDF11Lt7
maikl8EVzrBT889yci07emxlY6rQfJHhqcX6VdGYPmCcu6uJ64OtcryD0IzpXD9u
l57d/ebkY72v7DoGzjLVdj6WKAYxEPNZnIITig79rvf/wC5HP8YSdKbfkpGCyPqD
mChb5VBzWuX8IqVIWC2/83YlAjA7I1/K6j2PfqshO1H2wbBi6P9I7irUAWXC3Uy+
WMkSAO+IMzJCR/nxCMN51SS7HfvUEseGScWXbemy/Be3AS2K0m0=
=mN5d
-----END PGP SIGNATURE-----

--1KKocvDr1UcUn54A--
