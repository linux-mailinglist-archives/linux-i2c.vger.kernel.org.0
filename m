Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E574589FA
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Nov 2021 08:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238830AbhKVHoj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Nov 2021 02:44:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:35090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232870AbhKVHoe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Nov 2021 02:44:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E74860E96;
        Mon, 22 Nov 2021 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637566877;
        bh=LvPHFzOeLqsay8wVm6ou1s6YcS6M7oKO3oa1ezBZ9Hw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BpPhTRNJGw5EhiVUs0VvbvRSCr6LAzptLuoEGjdmAtJjcGLERdZGV4lEFc9233pO+
         jaQh8df6wlqSU4A0CL30h6VXZ5sD4HujS12DGol7cnqXaeDHPerKQvUAvhg/tq7IKo
         0j9pIS4VX3iSPWi3Y3kJZr9BPJ28CQ328MRnvPwMl6k7QPW24NbjtQ9FHcm8dzGcMn
         vSVkHLwo+VCUTayw5kfMIejTwtWma+95RjQSkyo8ohI65MsxsxxpzBLWgXnDLs1iZI
         RAqxWQyYEb8Ji62l68y9/pT+ki9o3r2f38n+eS2pnJv8VhxmLPAHbvXUsjo8ntXkd2
         s5bygdWGABXwA==
Date:   Mon, 22 Nov 2021 08:41:13 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        George Cherian <gcherian@marvell.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove Netlogic bindings
Message-ID: <YZtJme/3TEOxBVl3@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        George Cherian <gcherian@marvell.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org
References: <20211109161707.2209170-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XZBCKHgU11ItvwWY"
Content-Disposition: inline
In-Reply-To: <20211109161707.2209170-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XZBCKHgU11ItvwWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 09, 2021 at 10:17:07AM -0600, Rob Herring wrote:
> Support for Netlogic was removed in commit 95b8a5e0111a ("MIPS: Remove
> NETLOGIC support"). Remove the now unused bindings.
>=20
> The GPIO binding also includes "brcm,vulcan-gpio", but it appears to be
> unused as well as Broadcom Vulkan became Cavium ThunderX2 which is ACPI
> based.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: George Cherian <gcherian@marvell.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C

--XZBCKHgU11ItvwWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGbSZkACgkQFA3kzBSg
KbbFTQ//WZUp3eYt6NdLKHHEYSr3OSZTJUWKoTi9oPPq2qjKowqcKE8I3bNPqdq+
OEXvxEQKCe008GcFByplZitwmV/zGJSJBgjUgnnEfwo+QTPcYEzb7waEJgEur4wu
xUni8WlOkzxpfq7c6pgQN5h2VgzOz+Fe1uLVcoyZzlm4Jdwo7HlOsNLpysuQaeyg
xp5LYHGHTjlCgt6XCtJnpGTpsiITQMY7aH+lU+yFDUdhIpsEq95kIbR4+OsTlodS
BQvz/q5bl4GS6g/SalnAkWNrz+dr0VVT9M0J18o7LNsJTXb2cByYBWuLDmHyfi1i
X2vB2mdn865u/3GAi67wpGXxZ1ZVS79UesPsfvzVBWPrp2hUp7cztV3PQhFGPfGw
EzfbzldiUyS43IRdhUwbScz5DentHg5UnPwHtcEU/Usvojy8D5O2h7Pai8heI5F/
9Jig2zKzHRQsaOItyea2eVQZlSAUxSIm0YY8B91LPCcrGF5fvNbx6tT4JDf+1W5I
q3cY1dUTIBbrCCu1to/UAqsDRMwUEdoJanfILL2r9pLThKr9xS5nSF2qQmDx5gwB
DgLg9R9AQ/zKTV9HW9MbNA6hKM8ECiiNdGEbH2eQlSLN84dAEJj1SO7jCJqc62DG
nn5fNwuw1veaFttwNuvhfJFSRHrGfAlyQTZhQmcx9ofaWOFXm38=
=Rl8m
-----END PGP SIGNATURE-----

--XZBCKHgU11ItvwWY--
