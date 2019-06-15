Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8EA846E5F
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2019 06:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbfFOEyb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jun 2019 00:54:31 -0400
Received: from sauhun.de ([88.99.104.3]:60832 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbfFOEya (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 15 Jun 2019 00:54:30 -0400
Received: from localhost (p54B33C9A.dip0.t-ipconnect.de [84.179.60.154])
        by pokefinder.org (Postfix) with ESMTPSA id 655822C0114;
        Sat, 15 Jun 2019 06:54:28 +0200 (CEST)
Date:   Sat, 15 Jun 2019 06:54:05 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bitan Biswas <bbiswas@nvidia.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
Subject: Re: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
Message-ID: <20190615045405.GA1023@kunai>
References: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
 <20190614211129.GG17899@ninjato>
 <758d6dc2-f044-6be3-6896-196ef477d393@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <758d6dc2-f044-6be3-6896-196ef477d393@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Without a maintainer ack, this is an exception this time. Should we add
> > Dmitry as another maintainer or reviewer at least?
> >=20
> I shall followup with Maintainer for ACK in future I2C tegra patches.

This comment was not directed at you, sorry if that was not clear. It
was more for Laxman, Thierry, Jonathan, and Dmitry (if he is
interested).


--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0EeekACgkQFA3kzBSg
KbaVmA/+P60cfZFmp0sAAnUoP1zD8BebXSZyahwavyyZYMm/6SN157oGzQiswyXo
OGqXYOnLVTIOW2vF1irRxSyuh2BfOeeewilxqZHkyV8HXNDW3IXdUwmQP2NmH1im
8qo8YS4PcRWn7EfO/o+HrDr8eGP/cYpkAyFJrYl2JDb0J/pd3AQsTGnmXb7swkA8
Eo56+5Tmvba7DSYK6brugQDSSU4uw999QnEfyCNzWleE3Yl+BlL3aAeHt9jnMJ5/
4ZQ7K9U/3VBj2yUJDD3V0KGprgKTWMqfx1Zos8hwgSpSNn3dxB65Qa2FlijvDd/P
mrkIFNGzzVmbaNLkxdtzdkKWckuNIAIhht5Zf+SJftDXjnAfYZjd7ddRDfqOzfz5
3kXUa9eMER/jXTUTzqxUI9sx6/dxQHiAznT7bgT/FDIqUwIvxFx2p0xfrnAWODNY
9pTJMnRPOV/1h41jF2QsFdFw/L2UvNX1KBEElfn+NNl6ywscs44HuzSVTWG0Oyk/
eih/h1g/PdzQI/AyWU2aVGrwUI/x8C7CtYwolMw1WEaIljd/gZ9bpzPfu09QrB3e
NpkILKmP2ET6FCdKhtFUwW5VG8YZl3x2opPEcYY5IaU6osyelDlucx/Lmf2QuVs4
dJBv4ZwbpgGwr2QI0otNIV7qVRAj3e6ul04NLi2pMYw/P7DlQZM=
=VSmd
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
