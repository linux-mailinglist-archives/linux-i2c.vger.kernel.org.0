Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEC4C52FAC3
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 12:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbiEUK4y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 06:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232956AbiEUK4x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 06:56:53 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED9355220
        for <linux-i2c@vger.kernel.org>; Sat, 21 May 2022 03:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=XNjMIjslYS0gsqboDqg3xCy6RknD
        qyuCskpYH8PWXAI=; b=DHxoeS/j+XG8hyIp8iAkQfn4usgxNDixtHrrseXNjqNH
        7+BphxM4UF4HQWNMhWLZV2FXEbPNFPobv+4Fij1ErZxHl81o9X5ti6pcsOrlgIjW
        u+E2ybqf7NfG7I8c+KBYVoqqcrIKWfU6zTkkBx+sHACKOGtulpF0B7S3IoTSqIw=
Received: (qmail 4129084 invoked from network); 21 May 2022 12:56:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 May 2022 12:56:48 +0200
X-UD-Smtp-Session: l3s3148p1@UZSvdoPfxrAgAwDtxwyXAGMY7IbT6g6m
Date:   Sat, 21 May 2022 12:56:48 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 3/3] i2c: rcar: use flags instead of atomic_xfer
Message-ID: <YojFcPIIFgagCkS5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20220520202918.17889-1-wsa+renesas@sang-engineering.com>
 <20220520202918.17889-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g/EUe/8R9Jeh62kS"
Content-Disposition: inline
In-Reply-To: <20220520202918.17889-4-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--g/EUe/8R9Jeh62kS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2022 at 10:29:18PM +0200, Wolfram Sang wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> i2c-rcar already has priv->flags. This patch adds a new persistent flag
> ID_P_NOT_ATOMIC and uses it to save the extra variable. The negation of
> the logic was done to make the code more readable.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> [wsa: negated the logic, rebased, updated the commit message]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--g/EUe/8R9Jeh62kS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIxXAACgkQFA3kzBSg
Kbaq0Q/4kUH+FPKRe7K24vaYCZoZzBPxsdv67Vgvp8WUrjEoIXdiUXRlKJBJxULl
v347a156YG9os9VyMWgWmkV/sB3mVQtqFoBWd5X+QGOLn6NgmZXQJfJazo1S1oEZ
HoEjJiaUgkhLNOo0kiR+ltBNGTZCoRGIqjeXpnYGjSXfBvx8xoBIgT1m4EbIoaPH
c/RVLo20xRSRvYatHWc4zASJZoL3/528mrYuVx0asrE6EslHy+tQhk2ltnv3WANQ
cbWIyhhceXATvNYXMr/sMqidrr1GGjLUi29NOoj8RIFxd8ZNnCGwSmabr2ZtX8f0
MeRoaVjKizD6jtqU3RIAc+HX53f65Hp0sff/P8NEb1fo3A9BDnU4HqXosdSvOdIO
eongGdKffBsrDRXQWFAVl2XRP57rZX7sh9WJv8rQjPKd6xlk3N9HqglKyGCeFkAN
DCNxv6A41YrxubXo334jxAtobCuvYIj4rwlqtH5Vcp3dlWQoT50fxzmn/erdlgum
C2/sz5m7ofZuj2Pgu3eNK91Miskawswd+llaUWSioTA6P11lsABKcJRSn/1y8caK
GIto6HiO4DWqm5UZmeGLijfsSDtd6I8BkK7Nlop1l/VyjO5PRpW7rF3gzayOwIQQ
QMpYeCEqDWnivFNd4k69SZQlcNnp8FWOVcglDs8L7vB2yn8e6w==
=eong
-----END PGP SIGNATURE-----

--g/EUe/8R9Jeh62kS--
