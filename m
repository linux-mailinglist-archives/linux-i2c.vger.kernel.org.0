Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1BF74BE3D1
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Feb 2022 18:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357015AbiBUL4T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Feb 2022 06:56:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241057AbiBUL4S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Feb 2022 06:56:18 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB461EEE8;
        Mon, 21 Feb 2022 03:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645444519;
        bh=vB9e0s/XLYK57e1m4pHossv3dKKvG9cVckBgccyxB/4=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=Z3vaRQu6Yete4we3x+kcNxmQdKplN8XwYcCaQzAqcj4X53OHCv9jQ+utUrhUj5wDR
         d66uuI6zlW7tx74gCqPpAk3pbQjRwqaflIbDC7BwVEMz/xE5OoikYALNZSidaJmsJx
         zxdrhDcD7HO24pJLR+3zbHnfpIQnUU7T2nGyh1Ag=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1no3US3ydW-00TCnw; Mon, 21
 Feb 2022 12:55:19 +0100
Date:   Mon, 21 Feb 2022 12:55:15 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, christophe.leroy@csgroup.eu,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        digetx@gmail.com, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, devicetree@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/11] i2c: npcm: Correct register access width
Message-ID: <YhN9o7IKl7M974Db@latitude>
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-9-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="atvLe0wtstfQwleA"
Content-Disposition: inline
In-Reply-To: <20220220035321.3870-9-warp5tw@gmail.com>
X-Provags-ID: V03:K1:3zCblU8IFjRoGL3Lqw6q+AUxItgEZUawI+DgaSGPnD+rb191X8q
 7XgtAPeYJttwuVdwgIrVeNNQjN4kPGVP3f1+9lj3dWZo8KMYgyY4oGbZHJ+9Zr85mED7XPk
 je3/BQn6jgwnL9dm03xyxyNGocjmwC8+1MwJahQ9RiggSMRws2e0XXibcMr/4JlmtO1coem
 SP2mASSZkA5Vhp0uUjZXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dEnf+Vyi2s4=:xZBSf2e4fR3ckdR3q+Tqzc
 G3vBuBeZvqIOK7xA3gEWg14IO22q732Wk8656RU8ElYK5qVYuiHSDsaDh6rjI6DrponbcT5sQ
 kOGyNIdOwFtyplEBuR7lYwhZgmKfDkM6FQAnZNhAJPgTaAsdn7iq0RNvDXocEn2Je+CFmXZPg
 P9Aa/svea1DUHf7pOXweBQK03O5EePIZfyYct5e47n0WxJBFt5wlU+HzIXFScykqJlc3B1t7E
 9b2SI6Uv9/o5Yb8jieO3NaYU4rfdqvLrcZxpWxretuKfR9Z3bmV5COW5wlWDKdiQXGlptoN5V
 RDUHv6A6dLQLXLJqtLoveidWFJbiPFu4+8cLYBJbOYuhNlbo+dSyl5Y4uBoeaP83M5mxvI4VS
 UVxVkx8bWQo8DiteowWVjst0C7J3TRvMml0UhCUevfgKLe3od1dxrBuS1xS6HMcXEF56dsF6E
 ei/NenKMQhnuCaRU4MPFBsNg28kr+4ACDMkND/2lk6TKIauSRvWS0CQeAMOnvtptsTtb2jQc5
 280AilNBRFDnBbhtipkFzsMXanPZwnILqhyUX6H6qasGGRm3na6WEb/BRULsrRYAI2IOGmbTK
 xb0V8gGUqsDCsbuUZkxJv5osne2jneR20vZjp9iGf+MyaABavxamI8PZrgh2cbrcgak8d/iSQ
 Zbt2x4XvY2rRf1OjeOq4gMDgYyXvR0diJhH8HTz+F+ylGrusiGaQq7OGVjRSqRipi5AELArgl
 e3WA4RpQm0Gn8RQQZq8Ss54UYhXiIwEGE2881sFXnCAkkbxFZVZP65+FXlbCMqt8tOUzM7P0Q
 XsvmcnI/IB+s/StbVqZBj1HHQU0Zh1LnZ0t8zFeEuhUd5KxD5aF/JDF583NCwRQtsgL/G6LeO
 IQrqT4w6FEOtWxw81hsPLtRVlHlfbsZ8rWAUSgnTwztZIRDrSLMXG1beDXyLluDqUgcdEofC8
 7jzs2c2/AyIfJynX9O9HDCP4oQueUFtAg1b7ppkb8meUzWCGxlejxcCutC8nztEsmUKO2mQGF
 ASTdJY9ST6Pa85EyXZ8IZahb2nZzMoJ03/qCS1A+ie2uMk0H+9UmYW7E1a+z5tYPiNZyau/mr
 lNZTC0d1DKdlUc=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--atvLe0wtstfQwleA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 20, 2022 at 11:53:18AM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Use ioread8 instead of ioread32 to access the SMBnCTL3 register since
> the register is only 8-bit wide.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index ee4757eff4b3..4715afcf9ac4 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -360,14 +360,14 @@ static int npcm_i2c_get_SCL(struct i2c_adapter *_ad=
ap)
>  {
>  	struct npcm_i2c *bus =3D container_of(_adap, struct npcm_i2c, adap);
> =20
> -	return !!(I2CCTL3_SCL_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
> +	return !!(I2CCTL3_SCL_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
>  }
> =20
>  static int npcm_i2c_get_SDA(struct i2c_adapter *_adap)
>  {
>  	struct npcm_i2c *bus =3D container_of(_adap, struct npcm_i2c, adap);
> =20
> -	return !!(I2CCTL3_SDA_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
> +	return !!(I2CCTL3_SDA_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
>  }
> =20
>  static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)


Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


Thanks,
Jonathan

--atvLe0wtstfQwleA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmITfaMACgkQCDBEmo7z
X9u9dg//QF1S0S3Sayv/Y5POeRg7pV8i8t2OEfH9zCVaR+vr1PoolReqj3k2Ej9d
gYEjSbp+xbmuChkgWTj06BPc0LR319rmq26SUjHUNJJEEKFjFSzzMzPkNNau3+/O
47dyiOmGPMAlGDBM7JQwbk5Iry+rAiSSO+C0B4KDCkLitGsYXWzEIzyKQiAAwnpp
E5VX32do5W2wj0gUGQE2ccvPMf4bxFOmrRDgZ5TaVD9W+FSnZOX2aks9RNCub/FA
mucJMKSuTeC7TWQZplf3OitMVV/mcc14vZEq8gz8V+oR9LC+Z6jqyR7VTnvYao6S
Umc4BO0hNVt4otrcUfMfpveIUn7Hl9rCOzu3TkGH347urAX06UqLvPrGR/OZ+eN9
OLL6/idFdnpjZGeJuZKhF1cpOg3EXBtKLJLVIH0Q2S01Xime8JE/7tsfjDbTgEi0
e9A0lQgsr+gH5Fg1ch0/HSvB9JQkMJLPX9IRZmnzLBDTR/wgpk9wj+xHQ4eu+DaI
i45J9mdU5SpKJUenOxUT6OEqMLo7BZYNC0TiNJAj9Z9o80+0D+grf3PQGAbkRrXd
ANHC36MNKQoaVL9UepM/MApMjCbdGexFolHO+x1OAj+wc5ByBEx02761DbY3tGTy
+uoLcZbn3xZJBgEh9ItMeq6thuErcvsUgTKtiCYMSJcYu+whDLU=
=4Mfv
-----END PGP SIGNATURE-----

--atvLe0wtstfQwleA--
