Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 794045E53EB
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 21:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiIUTor (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 15:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiIUTor (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 15:44:47 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23E9205D9
        for <linux-i2c@vger.kernel.org>; Wed, 21 Sep 2022 12:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=w7Jz7/VDSsr+SsQrXK7cOIx370sW
        OKMeCPTSlhrhFlw=; b=3Ar+4IImnhbXjhqG3o0toAna9ImYlBOzXHgVm2SgPnIc
        4u46S/lZLx4iaLI+ClNhhePAnNbVxh+iuy4CRTKYl/3P3dO6LVOuA79dKzUyN32o
        FHmpUFt7qaI0SVJPoYdCQFonBAa1ActmizNlnAXr225rfM7rUruohrWFk7R+/18=
Received: (qmail 1343371 invoked from network); 21 Sep 2022 21:44:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2022 21:44:39 +0200
X-UD-Smtp-Session: l3s3148p1@wAXnLDXpHu0gAwDtxwncAPgJb5TsabMI
Date:   Wed, 21 Sep 2022 21:44:39 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v5 1/8] i2c: i2c-mlxbf.c: Fix frequency calculation
Message-ID: <Yytpp4c9Brcnx5s3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>
References: <20220920174736.9766-1-asmaa@nvidia.com>
 <20220920174736.9766-2-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kEdobICLCmpuclNb"
Content-Disposition: inline
In-Reply-To: <20220920174736.9766-2-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kEdobICLCmpuclNb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2022 at 01:47:29PM -0400, Asmaa Mnebhi wrote:
> The i2c-mlxbf.c driver is currently broken because there is a bug
> in the calculation of the frequency. core_f, core_r and core_od
> are components read from hardware registers and are used to
> compute the frequency used to compute different timing parameters.
> The shifting mechanism used to get core_f, core_r and core_od is
> wrong. Use FIELD_GET to mask and shift the bitfields properly.
>=20
> Fixes: b5b5b32081cd206b (i2c: mlxbf: I2C SMBus driver for Mellanox BlueFi=
eld SoC)
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

Applied to for-current, thanks!


--kEdobICLCmpuclNb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMraaMACgkQFA3kzBSg
KbaDyxAArpwpuUrb/wfiY+JkxPCflO3ZZlFXlWe5Uw0RjM6gYUcE/xyZ3ulYi7sE
Gm0dcxcvB70a4PJod3w3/z0ELyUbS7pbnvIDpO7FUeJeG7bodeXbnLSFpN4rwOLv
ftNrs1KZMxJXr4/fzYUz5Kg7kCXr1GLstUwEbAfUoWmAyL7skW+FITPvY0mg7F+0
PmAOwUkRABB1WWGeioAK/ryHjOvyI0zmT0/8MV3K+1EHfTQVGIW8Nlr+BqOjhQqs
eQmgkbLuNaN4vUHVDfxXQ5Beuf/fP1HgdOqlL4ZhRWi2DG6Snx03GEoBgGMVgQda
sCx/QuhardNmBjCqhQA/GChxapHTpGf4y54o7t1kNUhIyUJwlSfPmbYLWxdFFK5j
hPo3/dXsrVRjM3YfJbbL3YA9TzGHO+9fRDFSQ/998wz5hvIRHgZOS6gGs9Wf8KWM
8vIxY5V6GDTMZ0gtalmHV6vFSB+lDkyJIoB5UBwQa5BzUBj405r4yh5sJUdFFx1C
5d08fLfn8VFxTgtJhP5VcCfgc1ND96lZ8dPWHIZN4DT5l2XxWzndHPTDoHE6m7tT
iEm6yRvjGI3k4/ra8nceCUSHlnslHaFmAA7HErQBCW05YP146bzM6eW8JrP49oAa
2CozuN86wKvK776hszp5z1w53xLCfyQ/VNj2N3DmSQb5M84J3Wc=
=UQHf
-----END PGP SIGNATURE-----

--kEdobICLCmpuclNb--
