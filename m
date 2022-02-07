Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E759E4ABE6F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 13:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240699AbiBGMJv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 07:09:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387801AbiBGLlf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 06:41:35 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9211AC03C194;
        Mon,  7 Feb 2022 03:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644234020;
        bh=VSv2u+I+oB924UlWdrYGhS6fsABGuiCfVHkd3ZwibQw=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=Cg911AvVmolEdxSxTT3f0j5J1bB99RJfEmZFTJaA33bTPDV7KnPQqoM1tUm43QgO3
         UV/3i0kzuphEl70IPsJmZveHTsf0xYuwGqiRq8aw+fWSkfhV7Dch0FMkwXYsyQs0jj
         oKv3u9VfZxmIg6/o2lDAtj4f7Jx0p6ZjMdQxgEq0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNswE-1nfKZA0ADA-00OK7g; Mon, 07
 Feb 2022 12:40:20 +0100
Date:   Mon, 7 Feb 2022 12:40:16 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, devicetree@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/6] i2c: npcm: Handle spurious interrupts
Message-ID: <YgEFIOdlp/t9ezR5@latitude>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-5-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="e2RRzsMIMw1MmmXk"
Content-Disposition: inline
In-Reply-To: <20220207063338.6570-5-warp5tw@gmail.com>
X-Provags-ID: V03:K1:mbwhkvxGjOKH8QiCKiN54XanExGH7P9UUniCkjdV8BuJcxf8z9y
 nN2gMck16BlQD2DSscc+9UpiMU2GstdfdqIvwGZgHObFTxSD3+ejqW++YhAPCzFxjuPW/mt
 pUXwn93D1x+3gamrS5kXCWFwoj+TEycrq9Ev5SmtfVttIRFtZ34cGZ1Nkaae7HPArPw373B
 iIVO1CHBIHxLIpDZDcg5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dU3k+wTHxbs=:SK33cCV1pLr1c8y1PtR3/f
 dqGhnFp+y0qiQp5YoZcKzawHm0cgAp+UN6DOG0+qQGBTgSnCTGZUoYyzl9CxrpJjRe6QKkHIc
 gAvcjsAAHgvIv0pXKCBiLHHCs/YHOKtRLq1ipxleTtAM5uueVpYRZtgpPASgxUquqq34TvCch
 yFbQDNxr3Ll1toIFIcdnwlgU4Umrtve/NR8WoOew9OExG2Krm4SU0GyC2sXVTJ5gm1bCTqrfH
 UrNv8ncVySnTBCgQiZnPe6+qGSqSqVSmzUNFPrccwfL/fWmawufQVkZimn3cwUWyyJH59AAAS
 dQ1gJ21/VHJFheItCsQp726Weq+zHshODRGkeumPWCQNMrB/2a3lQju2ucLTXzuU8P/X/U06A
 UqPR9sRW9+mwUqW6O+lu6HwynDTKcHukgBb35qbXgUhOmZKf8HQY2ZR95MSLXGPYBgZA6CmE9
 +yn90E0K9RigGgyr8XAZ592j6k3jKtlMqlm9c5cvzQ+BBBfSTC+6KYpq2IpTNE0P7GJKRaGW3
 66mH/ikXWsq5qZ9F55qXjZtfRAn8D/+pt5TRAiPvq6EmpoBe1lCe8+70Sw/uD8cCXcuWvNl/a
 Bfx0efG03WdZYiTjuJjzZchQlho26nNH/lkJY8uvzO3qXTpc3OtsFc1cDSronR1wk7D1rNhtL
 8PCAZjV0AWaKXWrgxvJajBg/lRgPcsaei+f2YpWMqQoFpgR+/CKCC56bkCLSC5xoGxxtLlD2U
 Hmf6hBNMWdMgmbXRj3QPkjSZZ23cKGFEb13KODjq36dXiBpkbGa6991iuzq1JZYuS7Ic16Dkt
 VFlzODB8nXb9yj3Mquc+o5gqfzIlY+3DZDcyUa9dSjSIFk8Bzbyo6CgeqYadFDWfefEPPakVt
 ZpC0Etu1mMZ8L4e/BAWatpG2p9e50PTXl+juU6e9iS4bawcUdE9rlORfT+JNxQYgt12x+TZsN
 FAU1SSFZHInND5zn6ouOQQqtXJMJvt2IrqvB/PPBJqIZ5YR4yLaQefyAZZgb/JJwk0z2HB8KZ
 yq0HHjerzY/iFv9+znB/bUcuJUcTT6zAsvxUJEzyv3pmezdaHBSHPjbj0CILqeTLw4zlXu2w4
 HivzUnhQ1Gk77g=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--e2RRzsMIMw1MmmXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,
some comments below.

On Mon, Feb 07, 2022 at 02:33:36PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
>=20
> In order to better handle spurious interrupts:
> 1. Disable incoming interrupts in master only mode.
> 2. Clear EOB after every interrupt.

For those who rarely deal with this particular I2C controller, please
add the meaning of EOB, e.g.: "2. Clear end of busy (EOB) after every inter=
rupt"

> 3. Return correct status during interrupt.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 96 +++++++++++++++++++++-----------
>  1 file changed, 65 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index 5c22e69afe34..1ddf309b91a3 100644
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

This change seems unrelated and isn't mentioned in the commit message.
Please remove it or put it into a separate commit, or document the
motivation in the commit message.


> =20
>  static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)
> @@ -564,6 +564,15 @@ static inline void npcm_i2c_nack(struct npcm_i2c *bu=
s)
>  	iowrite8(val, bus->reg + NPCM_I2CCTL1);
>  }
> =20
> +static inline void npcm_i2c_clear_master_status(struct npcm_i2c *bus)
> +{
> +	u8 val;
> +
> +	/* Clear NEGACK, STASTR and BER bits */
> +	val =3D NPCM_I2CST_BER | NPCM_I2CST_NEGACK | NPCM_I2CST_STASTR;
> +	iowrite8(val, bus->reg + NPCM_I2CST);

Small nitpick: Please keep the order the same between comment and code,
e.g.:

	/* Clear BER, NEGACK and STASTR bits */
	val =3D NPCM_I2CST_BER | NPCM_I2CST_NEGACK | NPCM_I2CST_STASTR;



Best regards,
Jonathan

--e2RRzsMIMw1MmmXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIBBP8ACgkQCDBEmo7z
X9srLw/9Fk0Dwv3OutJWngQjBucW7KWzadrpxsMsesyKne0BvaZUN7Dcw5Zsa9lz
vx9/xR8G/+KQNxcPFETqhHzCp9D2DLW/qTniAvocA+mACXPXRK7yA9+L2m8U58PS
QuKD1NVCtXXFziLr+4tT63xI13i28D8H9Jo1fTd+nPZgmnMeIFfNcDOeVOdNBV57
ovfJGZzFGSGR7RosMtknhf/vxIzLuu4lRqECrORFlGUVWi2pOghcElrdgY3g89CO
Fr7urdqkb7OHmGY+J9tvbIXC+fpA5W+LOlLq2C+x+qJf22T2MK9JwB9muY7DJov+
6ywzqUqQDbPVW5R7iXoN0VGXSvVdzwRV7xQm0L3gdQeiUNAkC6UkiCPtSgT9KAlm
sQCkTvSVUhP1Vo3u6jnp2kqnz8r7v8EgEdPQ0QkN2XS8lup1xlBnmXU95flzgJAj
asd1j5yB5sMkIomwugnMVZLpQaUVHEpls5ACaJXk5nmGWb3ymASO486n6d1U+BiW
EdaTohnLRD5NMXuJvtGIuCb6yZV2ggc5l1cHR/6deWp8Zre2CiJ7RELiIr5Blr1k
BfDLoS8ICOrADAfPaoVYVfhtHdjw+dicO67JA8XMIXG179Lzg7CY9yymvtk/HeA8
/hIA6sMn1M+PQLAn0HgKfo/fTaJ01CuljQYz7ud4JdKxkf+LTYY=
=/37B
-----END PGP SIGNATURE-----

--e2RRzsMIMw1MmmXk--
