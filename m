Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E839F5BB9DE
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Sep 2022 20:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiIQSVe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Sep 2022 14:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiIQSVd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Sep 2022 14:21:33 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE14326560
        for <linux-i2c@vger.kernel.org>; Sat, 17 Sep 2022 11:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=S6/6BLf9DKI8ANRXWkTiyTD1gvgb
        ET81eeUfYSltQCU=; b=LClRXYOWSUjS4AgCGeZ8u19rteT/657uE1G8z3oqu2lJ
        4rbOjSTd8gzWKenJEsaQCZzfIHUd0VvVdcJX59+DRy+3Nac3aD9oPM4vc7XuU1UR
        QEPpDM4LBAMemcUzDmxW7Z56Ma8KH78ESM11c0Yl1MWycT2MytiV/af+SN68Z+Y=
Received: (qmail 3858133 invoked from network); 17 Sep 2022 20:21:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2022 20:21:30 +0200
X-UD-Smtp-Session: l3s3148p1@NuImjOPozJS5aIoe
Date:   Sat, 17 Sep 2022 20:21:29 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v3 2/9] i2c-mlxbf.c: remove IRQF_ONESHOT
Message-ID: <YyYQKY0Hz+Ticg10@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>
References: <20220908173544.32615-1-asmaa@nvidia.com>
 <20220908173544.32615-3-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y3kH6XSmJweGr0vT"
Content-Disposition: inline
In-Reply-To: <20220908173544.32615-3-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Y3kH6XSmJweGr0vT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2022 at 01:35:37PM -0400, Asmaa Mnebhi wrote:
> IRQF_ONESHOT is not needed so remove it.
>=20
> Fixes: b5b5b32081cd206b (i2c: mlxbf: I2C SMBus driver for Mellanox BlueFi=
eld SoC)
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

Fixed the prefix in $subject and applied to for-next, thanks!

--Y3kH6XSmJweGr0vT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMmECkACgkQFA3kzBSg
KbZicA//flMCi/e6eX+JLR0XsvAdjBrY1cISmd2xq4Fx4wjJeSApVEd0ILuMxSA8
Byj61r/bC8uET3yIttT8NrE52Ab/NebxeaaO2kmZWOPXOHfRpSiPuePPCalSP9MD
gqxwJoEsMjG8MSg6RKqWcRR08kYPxOvIRZPuusYpI1IGljrQhmmEdp22GJh+i5YV
geXEHB5lAJnrb5tm3QOYqlfOgE9S5mBhIp/mwXD4rWxvVMJ0uio2DhMYopBUNxej
12e9Tc7rt5tKk7OnneHaN+pkhoqgQ8KHBRVR8uFJjy+rTF9saV/t47OEvP2Q509t
1MDUcIAlVMC+Csbn5tlzPHuBPBg7jTLc68OasaAmcXpguBWg/eEAGVKJ5SXOSUph
SYefwK5ML0qqaRjpIvPOjxAUkrT4VWjncX7ZSxwBxaEUWKeL5qArprTSMQz2J6b4
hU7TdtwBEMZCGF159Gkauing7lvNfjrRgAgn5/OgTHKGw6eNcgJGmFdRcm6geSDm
nw+Cg3qxyCzc7nCVKrjQaWaxlsaxG3yuj8CmW7MgJ0CZt4wbnZ7cxE/+rWsLOHFf
M9kjTLDX6yzuq0f3R/ltJJN0uqigIbbitX45bEgLKG+quTlm8a5Ca+JNxviWZiG2
Zmu9mO9B+wiNfuOsOo0KfIgBkVz476+MEZU83BCcx3M7zNUKoGY=
=y5yf
-----END PGP SIGNATURE-----

--Y3kH6XSmJweGr0vT--
