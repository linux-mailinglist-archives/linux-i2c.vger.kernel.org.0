Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD681313B9
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 15:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgAFOfa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 09:35:30 -0500
Received: from sauhun.de ([88.99.104.3]:39324 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726510AbgAFOfa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Jan 2020 09:35:30 -0500
Received: from localhost (p54B338AC.dip0.t-ipconnect.de [84.179.56.172])
        by pokefinder.org (Postfix) with ESMTPSA id 4B6672C393D;
        Mon,  6 Jan 2020 15:35:29 +0100 (CET)
Date:   Mon, 6 Jan 2020 15:35:28 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugen.Hristev@microchip.com
Cc:     robh@kernel.org, Ludovic.Desroches@microchip.com, peda@axentia.se,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Codrin.Ciubotariu@microchip.com
Subject: Re: [PATCH v3 4/4] dt-bindings: i2c: at91: fix i2c-sda-hold-time-ns
 documentation for sam9x60
Message-ID: <20200106143528.GF1290@ninjato>
References: <1575886763-19089-1-git-send-email-eugen.hristev@microchip.com>
 <1575886763-19089-4-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E69HUUNAyIJqGpVn"
Content-Disposition: inline
In-Reply-To: <1575886763-19089-4-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--E69HUUNAyIJqGpVn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2019 at 10:20:07AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
>=20
> SAM9X60 also supports i2c-sda-hold-time-ns. Fix the documentation accordi=
ngly.
>=20
> Fixes: 2034e3f4c9a5 ("dt-bindings: i2c: at91: add new compatible")
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Applied to for-current, thanks!


--E69HUUNAyIJqGpVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4TRbAACgkQFA3kzBSg
KbZimBAAl9QQJ8QhFYzsII9px4gfhT0yrmh+cV811coXSMa4w9CLYmL5vgm3y0Rj
eDNkXGJrk6YQ4xr8R8LE1AOQS3WDj84cwKG2H+BvmWxaR6hPtYUe+9rpUBqSbOjj
ToQ4B9qzxAKQioPtRIIIngQVJULmGYDOoHc4o5lECZGCQkNlmztIGsCdn1stuSUB
y/wqbaVvhUAbzaVh4z2dh2AI4FXMBZ35fkRmPxvE3ekZVuGax3aFmrFPi1PPexqP
VE9W5bUl4MJjvXE0QSB8fWrdCtrP6tp7y95X8DVYdTTi4TgLN/UkG9rf+2FHp5eE
M3Xy+aNjXajR0fs16se1OACue5gSIAcAX09AqgH9UvyLC16G4WgB+RFqLfuIbeLU
nbLc5QGNrpInPN0swe1FBw13kD5RN42cwkX3OIl7GxJ9QMMbv6YJFg2Ve7HZzTbS
tymTP6m5AnyAR/S/1uJoLkLV3I85JzwvOmAU8axt/ZFYXv5J/NOl4/pQZtXBjRdJ
Pb6C9ZKW8fUk3qKT99tRawa2uUeXKqqB1gk9VgVrWR7z0xQN9+7hProm3avOMWE0
MLFlstRff4E3jgRSB2zW+oWD6OxuKNYbZm8uFnTSrS9Im2nr3mxEWNAc/RF8bQ3x
1Q2FkbhLVeXweNsgLMfKtoIOoDY1enxpdt+y96DUcFc9/IZ/7NU=
=c8KO
-----END PGP SIGNATURE-----

--E69HUUNAyIJqGpVn--
