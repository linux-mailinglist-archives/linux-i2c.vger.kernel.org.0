Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55CE2FFEE7
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jan 2021 10:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbhAVJAX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jan 2021 04:00:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:55572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727118AbhAVI57 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 Jan 2021 03:57:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8D42236F9;
        Fri, 22 Jan 2021 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611305838;
        bh=4WN6WZIW13Le34niPrIRUQdbKEyv4ykFjZJuLrSXaiU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JhSYGN0PghLXGESOCeXh2tkF9iNKbHvDaqdFkKDlU/X+fapCtshs5v5qccX3I8ooi
         TWEMQS/2Q/DNYCYSY9rifsjlllcaf+opDTNiHSVvDEdPQbZuINrtfjSJCMWdHjDvYJ
         3PXK6vTAZzilC6pq9sMfmEOuvwQKsHOLq2ouJeTT/4Izo+MCwKI2c1lfb0GudbPrEf
         W1hFxq7jkNvW4hEAuoV4uOKvPr0EpPuFD2/cWjHRNhP8HiucXqEw+w5VxllIxpjc0V
         tYNp8XDRRi19KMweFRNWs5pV6l6nkVvszb46x3GtasG+rt7OKc+7htL1dtZDbg7BYT
         tMrX1uqh7WYAA==
Date:   Fri, 22 Jan 2021 09:57:15 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] i2c: remove u300 bus driver
Message-ID: <20210122085715.GD858@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20210120132834.2375048-1-arnd@kernel.org>
 <20210120132834.2375048-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Xm/fll+QQv+hsKip"
Content-Disposition: inline
In-Reply-To: <20210120132834.2375048-3-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Xm/fll+QQv+hsKip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 02:28:33PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The ST-Ericsson U300 platform is getting removed, so this driver is no
> longer needed.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to for-next, thanks!


--Xm/fll+QQv+hsKip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAKk2sACgkQFA3kzBSg
KbZRvw/+OyljxnUQNMREamklyeMJR02JwAidu/4PEqYdquzIA3hgLXGqi20iyOs0
eV/DBJDZIZekazTWX+kJBChu284tXDhz5pO2Yh7F15RbZJyrvTRWSnpsY4tfBICL
sGglvz/djBnA66li63iOFwJeudxIU23sKVfTSA6v0iq6384mtgu2dJFIPjZV1Yi4
JnaJhPEcO3RPnH5uUUKW9mqTt5Imt4AoVkJLeF4b65+xJWyeDzs7UOgyALvSrd9J
BRc5vRVyZCpzAyk0lr4P9vy9STFdVrt3rB+hP1V9VPLT8luK2JMZn8kgxrVdNI+0
+dUwOhUK2X2gRrsyFceZF7l8WRoLnE3srE5BU9+U3NeQdc096Uh7wqRxdVxa6g4D
PEPqMkhXAiCBmJrs6bDZTg1J7EwK7NNZjElNRw4Npuftz/Ne416Z06qncny1a4hj
pZPQVLOYKVYE1V+oLqHn4hhsE7olTWNWXqFhGvAaYTktIHjjiWTajQATMlyGb3HB
ub6Qv74/yHg29czwHMlzRnOpqpGosdo7zS7vBFqmU8yLs2Ccsmn19KabAl5Md3um
FZ8FY+JB8qP10hlt6e2z3yttUJ061Fr3iY58q48178VHk+s8VEBy51Ne4eoGrr+0
nop5C1q8v3e6jRzF0maSRynlmSv04LSX+222NJRvNohRkXtHQAw=
=nwUW
-----END PGP SIGNATURE-----

--Xm/fll+QQv+hsKip--
