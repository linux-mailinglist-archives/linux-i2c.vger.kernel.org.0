Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61E2113CB19
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 18:35:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbgAOReF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 12:34:05 -0500
Received: from sauhun.de ([88.99.104.3]:38874 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbgAOReF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 12:34:05 -0500
Received: from localhost (p54B33239.dip0.t-ipconnect.de [84.179.50.57])
        by pokefinder.org (Postfix) with ESMTPSA id 40E5E2C39C2;
        Wed, 15 Jan 2020 18:34:03 +0100 (CET)
Date:   Wed, 15 Jan 2020 18:34:02 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/8] i2c: tegra: Properly disable runtime PM on
 driver's probe error
Message-ID: <20200115173402.GE1239@ninjato>
References: <20200114013442.28448-1-digetx@gmail.com>
 <20200114013442.28448-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Content-Disposition: inline
In-Reply-To: <20200114013442.28448-3-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2020 at 04:34:36AM +0300, Dmitry Osipenko wrote:
> One of the recent Tegra I2C commits made a change that resumes runtime PM
> during driver's probe, but it missed to put the RPM in a case of error.
> Note that it's not correct to use pm_runtime_status_suspended because it
> breaks RPM refcounting.
>=20
> Fixes: 8ebf15e9c869 ("i2c: tegra: Move suspend handling to NOIRQ phase")
> Cc: <stable@vger.kernel.org> # v5.4+
> Tested-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied to for-current, thanks!


--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fTQoACgkQFA3kzBSg
KbbSbA/9EJCPHj4C82FpABEiFRRnAK8KEghBTuxYQU2uusd2t0/d0bueNdMMi/g9
LIbCweewEHesSopTrzftHyBLJh3rs5Q9P6DQ6Pk7fhxgAyARm6FmQVk58DYfI48u
Nb22WLWOsyTatQoMHhEJyDDxxW9w2YzrPQiW/vu/XAFAcOmAJ+p0GohnWaJHMsSk
ivAjhvR3AjMpu7lr4Pm3xnSSyozH/XhdWmg7cpVSJNuCGMj0TIg5omRiHpNHnnCh
uDeVPC3IV8/u/JLH+MWX6feDUNaXAv3d8bceHUiLT3chsTDlzQIPeGEBtcUo5QDT
uEQPn4O+oK4xPO7k1+fWo36EYsfWzW/B2DFWYXOmHGk41ho4gOJnopOoRy6MRRnL
NtlDRYmA+d6OMmol7YVTgy5Nv2z6XyY9HpIJWjUQ1q+m6F1qaQH1dUjYM9lBTcX/
yi+0fCTi36Yhsf4bCNK069e3KzdJ/BruACOtILjyhxgbUMEh8RyGwZ9/LLRW1GpV
15+xHHS0RXaAuwW+4EaIVxT9G5j05F656b0QsVdVJqFVNGGuHrWX0VsXAT6Z2bGu
Ckz7yHx3ULVu112OGgFwVG/xMuaF6YdYWM9z0i7Ty5135l7TCtHeiiXWlawqNJnu
WR+y1mn67V+aJoGKjr9lESIpGvclLtNc+FStySTPn/rXGCoin3Q=
=cN7R
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--
