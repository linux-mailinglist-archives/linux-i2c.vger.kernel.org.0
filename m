Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0797D37357A
	for <lists+linux-i2c@lfdr.de>; Wed,  5 May 2021 09:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbhEEHTR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 May 2021 03:19:17 -0400
Received: from www.zeus03.de ([194.117.254.33]:51964 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231836AbhEEHTP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 May 2021 03:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=jf9DD7KF8tyiDE8XdNa+CA16tOZ3
        pKokJ6Rgevw7QHQ=; b=okg4N3b9X38YxaH3UoytAuA2pdqKXvJjYN9SAzHQxFPV
        49r61xnf4ALwyssQydY+snck89XP3ADgNw1cQlZmOEdwVKLGJLugr2tPSXK/pAjc
        xlafqaPwqDSum3vRDxb6Lc/5jv9kB3+iag6CS/VM8xSUhHi5jSLiHmapV7iSjo0=
Received: (qmail 1678570 invoked from network); 5 May 2021 09:18:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 May 2021 09:18:18 +0200
X-UD-Smtp-Session: l3s3148p1@PLm1/4/B5KIgAwDPXwRNAK21Lx9NnZcs
Date:   Wed, 5 May 2021 09:18:18 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/6] i2c: rcar: Drop "renesas,i2c-rcar"
Message-ID: <20210505071818.GD1009@ninjato>
References: <cover.1620138454.git.geert+renesas@glider.be>
 <a847c1866a006b4a4fb24ce4c97131493696c524.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/unnNtmY43mpUSKx"
Content-Disposition: inline
In-Reply-To: <a847c1866a006b4a4fb24ce4c97131493696c524.1620138454.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/unnNtmY43mpUSKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 04:35:53PM +0200, Geert Uytterhoeven wrote:
> The compatible value "renesas,i2c-rcar" was deprecated in commit
> ad4a8dc3fec6485b ("i2c: rcar: Add per-Generation fallback bindings"),
> and never had any users in upstream Linux.  Drop its match entry from
> the driver.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

If there were never upstream users, I also think we can remove it.
Still, I'd feel better with an ack from Rob.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--/unnNtmY43mpUSKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCSRrkACgkQFA3kzBSg
Kba6Mw//aMFETds9XVB7Ms3BFcQts/4SYdOh6lIBATSkyYSKp6QkJgqmlphJdAbJ
Z0RQZq8FGMdflGobaT7qszmEBq9+QGpXAw/JgGmNuV5MamMMkxZ54rnia+PCk6v8
BLnm6UOEigkmD98jDYa12peScA6ZCxdI+VlOQeja9RO2H8rkYJZt9QeEfaXXnV3c
oaosEdqdLexGB1pgmTZrS6FRliOYPY3VgWE2sNLz5goZSxnRMP/Hf+RgVZ3njAK8
oAEOzGruCNOstyRWkw2eBQa+w2h5Rj3n03BZ9ilIKG9O0QFuzisCUJBE55xxFWzT
wkEeMAI06vx4fIKK+iXD/BGk67VBJtN4Iz+WBg3VUoRsHVDm5J25wzU47SMQ9Ey+
hJs0YQnckhvFI1d37fz/oHhXnfB/Cj9LmxixkHwnhsYokzcTnHeTd5aYcppKWTBc
cqyJC2Pm8iZMBPtHWrg3t70y0QraiiZf2Q3+HEvAfy61prBJqjV4WRurgXGt2VL1
nKGF8P7fjswjVtNkyJ0obZoALdx+IKxRaaa25bPYaVgkzhnWZqYxKvRyG/OawZ+M
SBVBXC42y+5J7Co8eoqr4WLGaO6x1RO7VSvmxxiGuJLkAjw153VSeKL7rjZf3uAD
YWQtfqqfJb88LgMHSnQwCEQUJ8WHBotQ0AQ3Rak/F6plDUh7EpU=
=CGmi
-----END PGP SIGNATURE-----

--/unnNtmY43mpUSKx--
