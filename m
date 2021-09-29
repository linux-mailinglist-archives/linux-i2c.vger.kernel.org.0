Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B3741CD42
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 22:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346005AbhI2UO7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 16:14:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:50928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346604AbhI2UO7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Sep 2021 16:14:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E37796128C;
        Wed, 29 Sep 2021 20:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632946397;
        bh=kOxZtdv0wBxyRlcBOHpUgstBhEhcwK9T78TtmN4waIU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QmiHMeJVDXWMPAE7Rw0oMV86LEICajW17kk0UoY2KZtFJRhd8yDjHbYL+0zLXrPtx
         iAW0kAFW+JL5z5swdFT4I1tz3FGTkxKfW0z1uoS0oqfgWd10bw6pmfUomTkSvr7taL
         RzgTyoX0EmmJ0c/QaekejA84/1fhnsIL7ecL5Tq06BXhO5nmWBmZzGqF6xTabze/tz
         q6uiarAKlYglmkieJEOTbzc6waXv5x+zbcoV8DrL7Sc+5JiV/vRSO4CPornRXMfeV6
         Mpf5NnX/M5zFBvlfLGH/CRUAIP23VqKVCvK7kDnFCahV/zfpIimW+SJZ1WxI/7+xPa
         OIFAwIJsYL2Ow==
Date:   Wed, 29 Sep 2021 22:13:14 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH] i2c: i801: Use PCI bus rescan mutex to protect P2SB
 access
Message-ID: <YVTI2i6n6Gv0zGv3@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
References: <7521c130-d777-6a26-bd14-1ed784f828cc@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QZwaiTSglb9Ptzub"
Content-Disposition: inline
In-Reply-To: <7521c130-d777-6a26-bd14-1ed784f828cc@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QZwaiTSglb9Ptzub
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 05, 2021 at 05:59:42PM +0200, Heiner Kallweit wrote:
> As pointed out by Andy in [0] using a local mutex here isn't strictly
> wrong but not sufficient. We should hold the PCI rescan lock for P2SB
> operations.
>=20
> [0] https://www.spinics.net/lists/linux-i2c/msg52717.html
>=20
> Fixes: 1a987c69ce2c ("i2c: i801: make p2sb_spinlock a mutex")
> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--QZwaiTSglb9Ptzub
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFUyNoACgkQFA3kzBSg
Kbai1w//QYMYpdGPnYdAmmSIQC20yEp7Ps/w5FOympVnDXNbjWX8CgHw4a0BWKNr
lpCqiv/el2AYNCpOHDms24TiaW2O9oM0Ibxp6OtA0xTqbl0SkPnD+X4EiiJbcVys
wMsbSVRVjPQdvl+oQpGZM2q5hKcgdddpex6PYtlZkzoWwM1yGwI+v8UFmm2/M+cP
wNGysupDr2PkyfbGvfRgWyrxhVCKpgV6QikL1K0sZo6EJANLygfF1TZ6Qhd9BaOX
K65OuZ5/42CAmyC40FuiZ8WtXU6473FvqKj8um5u1Ze1cgFvi0OuVbLeHhCaGWAN
0FDnDoPX4zkEgO0l32p/KN2h+N0BJxf1WAJ2kYJIlhQIM7vnQl2zHntyXHCvLQ4H
eU4IZZGtl+rURAi/fSVNofolfuMZkMymUG+AiR6474s788WbpfapJnLviA5CjuGN
X5uwXSzTVR5nMrQEuTHcZPV7+88nbhmX6u2hJ3sKrSB4+Znk7B5Kvd3Bxeg5s8n8
pHfc2KA+J4835DgWcMAOHPxZehnSInJs1iZhs3nXFnI6fNpLh3+Td7oep4Z0CiZn
LWf8N3zLOaaQaxc4qxLBH7LPxrT2LOyG7UpYhmdXouIEIwA4v2yhQabhoi4X7M2l
nbZhsestSsVMdOs69hYsiGhU+UttJ2jF033R0+qyspj9XksqLtQ=
=zUtV
-----END PGP SIGNATURE-----

--QZwaiTSglb9Ptzub--
