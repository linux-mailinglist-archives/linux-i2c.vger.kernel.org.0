Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D29C79E2C5
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 10:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239144AbjIMI5Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 04:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238884AbjIMI5P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 04:57:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BCBE73;
        Wed, 13 Sep 2023 01:57:12 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258B6C433C8;
        Wed, 13 Sep 2023 08:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694595431;
        bh=llGJetdIb1dUjrzIZCcYNGwpbB9eVWan8YT4tpPq6SI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oh68BCdRZubTrl/ZMiuumqN4cN4http1sVkZ8tCPDwNPcNokpVhMfwbnQw1apVu5Z
         fCAYZCnxdAP94Yh2lL0KmWE62tnusTgyVF5nrvSjPPdb3g2FufJh/8D3Jmx/B7C7zA
         knujcquHlKQdnB4YTu1FYcFeTO6Rah1n3/ruwSiBWgyWqXaqvwaXAaYayxHGSF75nS
         AshOQwcmKaDFTb+flzzrKeDwvWJ/7nYOZBOoiqhh+sSezUyUlwQaj+vzZvDcvrDGEp
         eIN7hU6qw/dkaxSLbj8H31xF/Jc4aG84oOUmneEb+bESwvO7kmadt+v/vnMOli+2mr
         UTjYHbI9G76gQ==
Date:   Wed, 13 Sep 2023 10:57:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: I2C_MLXCPLD on ARM64 should depend on ACPI
Message-ID: <ZQF5Y2crg3TuyHOn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andi Shyti <andi.shyti@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1693828363.git.geert+renesas@glider.be>
 <71c8d6d8c2c7ef31040ff5a0266cde0a6b3cd189.1693828363.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SnrQN+jefm+egFHi"
Content-Disposition: inline
In-Reply-To: <71c8d6d8c2c7ef31040ff5a0266cde0a6b3cd189.1693828363.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SnrQN+jefm+egFHi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 04, 2023 at 02:00:36PM +0200, Geert Uytterhoeven wrote:
> The "i2c_mlxcpld" platform device is only instantiated on X86 systems
> (through drivers/platform/x86/mlx-platform.c), or on ARM64 systems with
> ACPI (through drivers/platform/mellanox/nvsw-sn2201.c).  Hence further
> restrict the dependency on ARM64 to ACPI, to prevent asking the user
> about this driver when configuring an ARM64 kernel without ACPI support.
>=20
> While at it, document in the Kconfig help text that the driver supports
> ARM64/ACPI based systems, too.
>=20
> Fixes: d7cf993f832ad2a4 ("i2c: mlxcpld: Allow driver to run on ARM64 arch=
itecture")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Removed Fixes tag and applied to for-current, thanks!


--SnrQN+jefm+egFHi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUBeWMACgkQFA3kzBSg
KbYmIA//eXo9hXtMmtePqnxWOfzUsnh8OGfXlRbKD4prbAY+1ErvPXDbq81hTrWh
koefQSU44ey7uuoYHB9L52esYxoaUiRB437FYd7oItNeQY45QHhpSwEVSw20zRg5
1mOkmRTkQhDnIOy2OqPp07jn81uFHX2TmS0Vd6YQGcT5lpW2R27Rbpn7oPdT1u25
GElK9zHfKJb4/ueQouEOkb6d1alyRSqsOziibiLMqowpEQK3nNTg3gCxJHO3gM3P
hhdqcBRrjgdFnAiVYBuubbosu0ouq7NlvjEzI4QKVtS2s5cZA9QIzrBZb7hTtQaj
Cg+EZhBZs4BXejSM/aMTXEByAwahcFrKjNpuTiNKJoWRXfdor1X5vYCIycm1GaRc
JT/BhUj5C29AuN6fh95lyoxCS/wNAwHo1b/VR77YJxPzwKDH0//1BzwqeUvTR4z6
zDkzfVQSU9dvGyRqKg712ptXwSBQnlPa+qNvyNhoh0b4EG8xPIe6iUCIzGX5XfDC
gE0LZ3cKOQ+HlXsZaKAZA/LyDyIButpfE+l4MGbEd8Rs3s0Ut2Hswb8Pcf8Fies2
EhubuDfveb780Do1rJem0nx+lg1LIuOJu9Zp+/nH8Q2wOfLudb4e4pkkwRrCjEXD
9CGrKwO7QSyHT1gVjkTJrQj4WU6QV0zEGoJEwi9HMknjtF9Qn54=
=LGcb
-----END PGP SIGNATURE-----

--SnrQN+jefm+egFHi--
