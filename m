Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F5D393E41
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 09:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235481AbhE1H5w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 03:57:52 -0400
Received: from www.zeus03.de ([194.117.254.33]:48706 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234430AbhE1H5w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 03:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=JGDn/0TqOIZS54ablDo3MEqhK0MK
        4DRYNETs52XoVBc=; b=ubsc34QH7aDJ3Zb+m8yjixbgjji+dpJZyUTKrCH+1u4h
        zqPPBP1o24Tl5/uioP8IytNw52R2u+3kyHrFQGPCN0RDJCwvT0yE4Epp7ZV+kkqU
        9w4R2wZae1iomy4lTNGPaFrkZLs2GxdaevFJf0F14cHaw+umOfvAz594n9T3EAA=
Received: (qmail 2272387 invoked from network); 28 May 2021 09:56:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2021 09:56:16 +0200
X-UD-Smtp-Session: l3s3148p1@oTXcNV/DgN4gAwDPXwoXAEGfoBQqamfc
Date:   Fri, 28 May 2021 09:56:16 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 6/6] dt-bindings: i2c: renesas,iic-emev2: Convert to
 json-schema
Message-ID: <YLCiIJWGIVSBqB2A@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1620138454.git.geert+renesas@glider.be>
 <3a72f4353b24c4d790a216bfde1b284800b3029a.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Xnaab/Jz7z/gz+NC"
Content-Disposition: inline
In-Reply-To: <3a72f4353b24c4d790a216bfde1b284800b3029a.1620138454.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Xnaab/Jz7z/gz+NC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 04:35:58PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas EMMA Mobile EV2 IIC Interface (IIC) Device Tree
> binding documentation to json-schema.
>=20
> Document missing properties.
> Update the example to match reality.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--Xnaab/Jz7z/gz+NC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwoiAACgkQFA3kzBSg
Kbbs7A//RbzE/n+BxPv6PbQJnaPwJHDOU5xhvRvMsf1SSslUEjBt8c5EJOQiJ0Yp
Xe0s5Vv3D6nZk7arZrKPBIXpvqE50I0O16n1o5ozbf95xzkdhHQi+8S+Qlk+0dxY
e0Nn1Z2G/6zwREAfoIYwaiMuuM7Dw6POvMiK7carY0yFdOlZRXAW0vIi6/13OsIF
4d7/156vyVsTLvZzaB0XyMkBFelXyRRFZyeVWHrAsph5PPkk3OWTR2hEWYJ5Z1A5
lNAdRiRrhC3fItGTwczQgslNEKKiGbHz0ks9Jvmtxp4fzJ0uVDtyWbTKzYRhvwp6
vC8aXoyyfxFK0R3uHUUi+wgHeIGZaCIT06IihhOchZx4JTdW4wcC0VN+89DVIS7X
zLZvVyb9K26pLjyRFsSuUJSmWRvZGS3ZkDer+bkZkQ4k6EekQ8/Iz3U2T7SaIRGX
UltVOwlaOmYGQiTWjPUI5QY9fNxq0jKUp9gSa5SxypNq+8bIcVD1P6zDSfyIo5G5
SIPIet4+iTfFZHSzxvDtlg3Co9wZLdzMik5ijdsCji2FWlA/3BxZohmPO5hEJFdS
MaxDs/KnVaWr3z/YwIOHv+N5oYC4H3SIvx+/xbz3wWreOHvLTRQeM7ibq4KDR0rq
G6pvePAA3/t59TNHMptXwT1jfCqYugIOL1XDRSI+zbyDmxWBbPY=
=lgpP
-----END PGP SIGNATURE-----

--Xnaab/Jz7z/gz+NC--
