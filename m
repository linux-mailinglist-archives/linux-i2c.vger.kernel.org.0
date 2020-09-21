Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238452732EA
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 21:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728161AbgIUTeE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 15:34:04 -0400
Received: from www.zeus03.de ([194.117.254.33]:59596 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728136AbgIUTeE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 15:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=RPDvREaVGBVRDQNnkNBRtClldLzh
        Eg4giiTckA/jMEA=; b=WTOvmQSBnP9jNDHmmkyQ50vi+Odm5P/HusY5jhiPx5xw
        /Wbg/EZ66KulnbQ2rEmDPNcVBQnIV4cMZYEzZcRCJRF3Y8Zq1+4HZAv2bBVFoke1
        Ctbe6fULeK3OaepAwlKEI3UraqOl5yW9CxHfuDP0u3yAtlr1RhHGH2+r2iEtRRo=
Received: (qmail 288227 invoked from network); 21 Sep 2020 21:34:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2020 21:34:00 +0200
X-UD-Smtp-Session: l3s3148p1@2hWq7tevZLkgAwDPXwWzANnLaz0lJiia
Date:   Mon, 21 Sep 2020 21:34:00 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: Re: [PATCH v10 1/2] i2c: i2c-mlxbf: I2C SMBus driver for Mellanox
 BlueField SoC
Message-ID: <20200921193400.GB18032@ninjato>
References: <cover.1600702555.git.kblaiech@mellanox.com>
 <1f31d4c4ef0c65f75b6077c77fd24c2c404f2a98.1600702555.git.kblaiech@mellanox.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline
In-Reply-To: <1f31d4c4ef0c65f75b6077c77fd24c2c404f2a98.1600702555.git.kblaiech@mellanox.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 11:50:14AM -0400, Khalil Blaiech wrote:
> From: Khalil Blaiech <kblaiech@mellanox.com>
>=20
> Add BlueField I2C driver to offer master and slave support for
> Mellanox BlueField SoCs. The driver implements an SMBus adapter
> and interfaces to multiple busses that can be probed using both
> ACPI and Device Tree infrastructures.
>=20
> The driver supports several SMBus operations to transfer data
> back and forth from/to various I2C devices. It is mainly intended
> to be consumed by userspace tools and utilities, such as i2c-tools
> and decode-dimms to collect memory module information.
>=20
> On the other hand, the driver has a slave function to support,
> among others, an IPMB interface that requires both master and
> slave functions to handle transfers between the BlueField SoC
> and a board management controllers (e.g., BMC).
>=20
> Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
> Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>

It still seems nobody has time for even a high level review of this huge
driver. From a visual glimpse, the driver looks mostly OK to me. It
probably makes sense to fix issues incrementally from here on.

So, let's just fix these static analyzer warnings and I'll apply it for
v5.10.

    CHECKPATCH
CHECK: struct mutex definition without comment
#462: FILE: drivers/i2c/busses/i2c-mlxbf.c:372:
+	struct mutex *lock;

WARNING: Prefer 'fallthrough;' over fallthrough comment
#1330: FILE: drivers/i2c/busses/i2c-mlxbf.c:1240:
+		/* Fall-through. */

WARNING: Prefer 'fallthrough;' over fallthrough comment
#2000: FILE: drivers/i2c/busses/i2c-mlxbf.c:1910:
+			/* Fall-through. */


    SPARSE
drivers/i2c/busses/i2c-mlxbf.c:513:16: warning: cast to restricted __be32
drivers/i2c/busses/i2c-mlxbf.c:513:16: warning: cast to restricted __be32
drivers/i2c/busses/i2c-mlxbf.c:513:16: warning: cast to restricted __be32
drivers/i2c/busses/i2c-mlxbf.c:513:16: warning: cast to restricted __be32
drivers/i2c/busses/i2c-mlxbf.c:513:16: warning: cast to restricted __be32
drivers/i2c/busses/i2c-mlxbf.c:513:16: warning: cast to restricted __be32
drivers/i2c/busses/i2c-mlxbf.c:527:34: warning: incorrect type in argument =
3 (different base types)
drivers/i2c/busses/i2c-mlxbf.c:527:34:    expected unsigned int [usertype] =
val
drivers/i2c/busses/i2c-mlxbf.c:527:34:    got restricted __be32 [usertype]

Thanks for your patience!

   Wolfram


--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9pACQACgkQFA3kzBSg
KbauSw//S6qRcMVGr2AQr5s2TZoMqdNuSTFnrCVDUo/H2fIvc7UvTmNLgz0A1ywd
fqLXSFBYCUYHbRsCAr71Mu06RGwICnGx1zFXb50Bc6cQjCUe+g8k+65niFA5Mtxi
QXZfMkNu4dFTmdhATPmzAqXesEkz5zDpmlwLPMwhuSHrsq83vqJ3sSm0k3Wui2/1
l57tDebATJDOer9Y3HC10tQ1JTcvl7Whj5X/1eXIBdwelz6Bv3q5BaKWY0R7ge/Y
fNTr6ikwfB/VV7Kxq1Xk7okIpToJYF98LdAtzaplgpqceCy/hg/wT38rEWjgChqs
NAWVew+pjWNsQ03vgvuF4PoH6El518H7YGRiGqgb3S84pUrE9n5RWHJidkm7amxW
Jg+OrVW38BilLwShlnRNeLPKcd0CShfvIPNGq/tMMnbKxuMeIBDBrWR8yM0aqIgJ
miho9WjdApB6W1saCTsEJ5fCpz40hTgUJ1WW8MNoJ7KAi4Em2/ZNQzv2lG21Rh+Y
Mo5soSujFvcLTiVtKG5XMmY8tkldeHwQhkUPHIFWfvF3Vl6+EXej/5fSebSIaei/
LpT3ALTehBEJZnZuFpje0HyR8LB/pbncr8m3J139el1/ejJ+65Zc/Ul1cSJwvJ2e
bn43WDCwRCPqAOV9xFGp9pvlJ6TqDbFbHThHAFG3pXocF86cDf4=
=yyBh
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
