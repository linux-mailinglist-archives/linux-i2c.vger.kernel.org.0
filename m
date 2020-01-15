Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B24613CB17
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 18:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgAOReB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 12:34:01 -0500
Received: from sauhun.de ([88.99.104.3]:38860 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbgAOReA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 12:34:00 -0500
Received: from localhost (p54B33239.dip0.t-ipconnect.de [84.179.50.57])
        by pokefinder.org (Postfix) with ESMTPSA id 907FF2C0742;
        Wed, 15 Jan 2020 18:33:58 +0100 (CET)
Date:   Wed, 15 Jan 2020 18:33:58 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/8] i2c: tegra: Fix suspending in active runtime PM
 state
Message-ID: <20200115173358.GD1239@ninjato>
References: <20200114013442.28448-1-digetx@gmail.com>
 <20200114013442.28448-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Content-Disposition: inline
In-Reply-To: <20200114013442.28448-2-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2020 at 04:34:35AM +0300, Dmitry Osipenko wrote:
> I noticed that sometime I2C clock is kept enabled during suspend-resume.
> This happens because runtime PM defers dynamic suspension and thus it may
> happen that runtime PM is in active state when system enters into suspend.
> In particular I2C controller that is used for CPU's DVFS is often kept ON
> during suspend because CPU's voltage scaling happens quite often.
>=20
> Fixes: 8ebf15e9c869 ("i2c: tegra: Move suspend handling to NOIRQ phase")
> Cc: <stable@vger.kernel.org> # v5.4+
> Tested-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied to for-current, thanks!


--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fTQUACgkQFA3kzBSg
KbZRQQ//X0M2uETYY4ocrCKvkYWSCrKJoUsfcN6Kfkw/EfgXBWXsL7pB0v8HZtdM
A6aLwrsMQgtmTDrEVkit9y8m4VHm6hRxgY85R/GJZO1QPWXK88M1R2QUbzNmZDcm
owqVD5oCJnWgj6fyvQcDCkt5ke+anW3GnYUnMuP7kT6OPBbKNxQ2xzaPLO962zA4
sBGsHTnyvyMDh8Y529FxwuD3txYVt17UCEjnIp2iN4YRdMR68tLZnIFaREQrSbSo
8okn2VEJ7VZl2seQHTOBmmxBUy8GXoTGCnfOJo12dFzN2pS3EvuyCeEuF3etouem
UJRZ5vYjwungQMHXsTcoN37GJwyyow4o81BgoFgRd2S69KpFPLkEQxXIQRqf+poI
DugedIUViEOS+mipoM3Xd+0qsIubFz2pYNqrW29TAHD48xvi3iCAsY2emFxsCynq
Hox3mLqyHzcsP6yWdNd6xiwoyuux7q5O0Qkm4Wvn0WF9h4LxkOVWYQr0RUjG1OnI
0I6IEdj+CtkuOK9JyFfpDk9mJHdt93CBpX1Y0dG6bRVNbLCyIUzwxXaYMOd+F7ZK
tA1B55Kdp5cPkRYA2XARyL7LaBSBucZUzBDnU64cCTio9r0AZLmb4p3yuVY5qQU5
TD2Hz6tL/YLuS44kjqkqkQnMj6iaT4JnMdUYBo9Ew4CK0CphCHo=
=bdEc
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
