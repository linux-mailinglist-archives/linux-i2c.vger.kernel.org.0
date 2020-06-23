Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A3C205BD1
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 21:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733311AbgFWTeR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 15:34:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:57592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733309AbgFWTeR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jun 2020 15:34:17 -0400
Received: from localhost (p54b333ad.dip0.t-ipconnect.de [84.179.51.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 74127208C9;
        Tue, 23 Jun 2020 19:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592940856;
        bh=73PD3Bd7UiHZWspwJyBFQMmrAwFc/ewfbdZjGaOIHKA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FoFqdxfQjvw4jERxsLY0Y+CAb49sYNwFpaHAO4zOnudHrv+ybgtFecUQ61VL26RCB
         s4UzDH8n0XPzU99SvAsXwQumMadVGnDlJiCT0QAot/GhwCxugznUk/QZ/0wNCx2ajr
         pvFnNKpZXpIqWs1iBquIjxwG9NQu/n641i1RDlC0=
Date:   Tue, 23 Jun 2020 21:34:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: algo-pca: Add 0x78 as SCL stuck low status
Message-ID: <20200623193413.GB1203@ninjato>
References: <20200621225705.21666-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline
In-Reply-To: <20200621225705.21666-1-chris.packham@alliedtelesis.co.nz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chris,

thanks for the patch!

On Mon, Jun 22, 2020 at 10:57:05AM +1200, Chris Packham wrote:
> The PCA9665 datasheet says that I2CSTA =3D 78h indicates that SCL is stuck
> low, this differs to the PCA9564 which uses 90h for this indication.
> Treat either 0x78 or 0x90 as an indication that the SCL line is stuck.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> Based on looking through the PCA9564 and PCA9665 datasheets this should be
> safe. The PCA9564 should not return 0x78 for any valid state and the PCA9=
665
> should not return 0x90.

On the other hand, we know which type was detected, so we could check
for the correct type?

Kind regards,

   Wolfram


--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7yWTUACgkQFA3kzBSg
Kbapfw//VMzK5yTkNC1+Mb1ImKxTZXRXNGq+PaU8Lt7YFuFmgV+Mhq0rJAmK2TdZ
tFs75wLI3P7J/peHYXbtAFb+4TxymGT+ODtTp/RrRdMMvjuUxTkwnkxzifT/y3Fk
3G4gS9mgtel6Kjs5GVlEUFst/zMUPSRUttEdwgNXiTZjy/pBivYPfw0B/ECC5Zxj
alK1H8FFf880Z8d0pDuC0BpanZK8hBLET3nbgfoWoKIiPwFRClD1f0rjtt2vvKRh
BaEYakClE9w/Nz+UwaKX0XJJQKgxAoBrtW2Uu2dixorEO6IAPkgAwx3e2aqyi6yf
+Nrd2TgB0iEZxIzwf8vvylpN0pscDV2CB2rwBSl72J11fQvwG4lXuHDBBEhCCLM5
M8yd2E24kWGiqePuYI1TzgnFUJ3yiB9y8bvkw192mtCfMP/9zHXk7E/gWAKfJ9P7
9F1hvq7r+vx+MZIc4fd/WWdBW8bHcQMxcl2EpEDBDpZxYqm1DNhiUzPX+/sguKDx
oezSDjdpOfGZJO9cHZTL6ArYPXAsDPSSeQZqbFP/eUsFavL1dMl6PuvSg5kSjwjl
RyHkDwkx7dkK50fNBHbfN3dMwpRGvanCrETEi0abNApASDqj1mcMKW/mR7cF0Z/B
dPAsy9wLm4Z4tnUuvzFy/PRrMllDtVm01jKXEWJa5t/IQKitdvM=
=SEuv
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
