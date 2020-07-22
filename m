Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E2A229A3D
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 16:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729642AbgGVOiS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 10:38:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:48210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728837AbgGVOiR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 10:38:17 -0400
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F86A207CD;
        Wed, 22 Jul 2020 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595428697;
        bh=idEkpAMMZBwiCeangEyoDdphVWEdNgUOLz0mNNXReck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pkn9PuKTS1nPVtIcsTx9McjCdJ31CIn6t6cIrOC0JL/8fBcpzJi87CeVBcETd1Nov
         DZpWI2ymx/aix0LfrbzlOVvc5grnogRCkMaKXHJB2MBYt5aQ2QV4f8mZbcr55O88Ps
         eL4hL7BV3eGssz8t+7eDxR4icjvc+i+aFFL32sRs=
Date:   Wed, 22 Jul 2020 16:38:14 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] i2c: designware: Use fallthrough pseudo-keyword
Message-ID: <20200722143814.GS1030@ninjato>
References: <20200721233814.GA3058@embeddedor>
 <CAHp75VcinO2QrQfk-GqfFic=Ktah5s-ndLigmVNdfvfo5cS_Pw@mail.gmail.com>
 <20200722143713.GB22267@embeddedor>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nccO0ldXW0cuDU6a"
Content-Disposition: inline
In-Reply-To: <20200722143713.GB22267@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nccO0ldXW0cuDU6a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > [1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?high=
light=3Dfallthrough#implicit-switch-case-fall-through
> >=20
> > Perhaps you may do it as Link: tag?
> >=20
>=20
> mmh... that's a good suggestion; thanks, Andy.

If you want to resend, please only one patch for all I2C drivers. The
change is "cosmetic" enough to do that IMO.


--nccO0ldXW0cuDU6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8YT1IACgkQFA3kzBSg
KbabdBAAiusBUYP33MI0KJgpcnEi9WsIK4IIhQhKNz+jw9k1TARFM0ysgRPs3b93
oZb/hbMeO+Qu7c3HfqmbXgCiCPCazhbREuMWKwR4hpv8Bnt34URsuz6biBPnVJAh
XCMVPt35EMyz85FFScjopjOy3mECYnQlESK2VZnqDXGKOVSgHULo30FdLx3yMo/t
LImH9MF3ArMAVMO6V4XEz/J8HgWtDyH8yD73Z6JAq4kkIYLTlrVipyCUMvq5pA8n
bV85kNU+aOsIOoun9QsDJre7MDVkZ1lTMRNcUiko7WOeU8VqHkRSleYORX5TwyE8
gB2TGOmt+BvXI0KgYa5IqiUUmXsI304Vp/ffHEelcpgKTbfIDnrxSX1VdRpBN7uy
2cYYsjiQd7MyEPonCc+lY9y0H3aaWyhdfuFJatQXBbM0oKTFv1uDQOh0s7b/gUlv
QTHLCn3WRVRv75Rl5VLNQyvqhzK0iXZIhR8qdfLoY9Og0lhta1yvm1cbw47Ybmv/
tbMHzf/1pCpKLdma188atp0oVkO15TGaPLOhCtIlj867h3fwAOoXHfOk3SL6eB2P
HdgQvJRc+UhFUI2/JEqsodbj10GjEwxnUV8FBPQL8jbIo4H+EYpATsI8rQgdBXm2
BDRCLDgvFcGqPNbnxH9O3eVQ0pAKdUCpmiVKTfLtxo+IqsZDdbM=
=ju1N
-----END PGP SIGNATURE-----

--nccO0ldXW0cuDU6a--
