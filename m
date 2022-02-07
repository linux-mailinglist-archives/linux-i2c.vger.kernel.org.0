Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 182074ABE77
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 13:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383464AbiBGMJ4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 07:09:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387856AbiBGLlk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 06:41:40 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06893C043189;
        Mon,  7 Feb 2022 03:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644234076;
        bh=bSkEZSwNdnc9xMNGqzoYVpfNSEmdW/ref73MmstW5+I=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=XKNoXJ8ORNpRa6BEg2UDAw6KfggwYuY+odeH6+JiSS27QR0GUg8AgS+5eaBrjozuw
         +1c4pzQbWvamgmRnpQFWcOr2waKP6Yb9ESmVUb2nrm56PgSayacC3TycnQy5x0htxu
         zolaM5fjOYElVDVfpmvgWT6+s/1iYScgLg9U3e6M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEFzr-1nQhMS2D01-00ABLe; Mon, 07
 Feb 2022 12:27:21 +0100
Date:   Mon, 7 Feb 2022 12:27:19 +0100
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
Subject: Re: [PATCH v1 2/6] i2c: npcm: Fix timeout calculation
Message-ID: <YgECF6jZ7wj8TOfl@latitude>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-3-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RZxU18GLaf6NWGkB"
Content-Disposition: inline
In-Reply-To: <20220207063338.6570-3-warp5tw@gmail.com>
X-Provags-ID: V03:K1:b064a7NKHMgEF0K2xAV1J3QyZzhrY5hXbM6HPqaw3wSsioPSz57
 QCtE6C3BEk0+/Sv/aNi4DhaHOSt35BV+Lg+G8nt3n256zXBiDTmeGoFyzzeWnXN8OvjZGNf
 xoLZSJFHBiPf35wndAyrO81+bpEzCRDOzCLgfvk02kWCktIZbv9XoDVsvkpktRF+c1QMKw3
 1cmDHtFr9/kIzgjziTXqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gjR+nIwBzxM=:CqWV+EuoyyGV4esrML38xY
 2DUfnDL8n5RL5jpCp4hQyjR5oq1U9ijVTT9nrYvxLI5qe3WpdxBgf0gKOIRZe2QZZpiHN0Bc6
 u8e8OfPZjmBQMgGnGAjz2hH/1nodbYjdu94Q0YvXfU4UpyxrNEzhZ2V9OC4+Acwp4bCD933Ar
 leVUZhP37v3e6uFhnY/WXN1NSDcKl9b5yos02bYl4ESx2/p2+p1BmiRrpsJ2ClPOpJuUOhiNU
 7XWERVQCvWZM2IjQeGMkx9kSSIwIRklvGv9nXa2R3F8DU7ClUV5RwrPA3qfh+rTL35E6Kc+Mk
 XCf3SsBvt7+3KalHabPljjs7n+9grgDvN/0ufYopYZjI+kKYpXBPuGnsphJr99ZQsWjaETOmn
 KumzzQel3fyVEU2d5RGAfwV6EMsHEGVV62LPopv7kFblE+1xizjRJAAqjezK0R+b/UlZ6Mhn9
 XlGr5zolq7SYvSMh710gI6+0+SIFJTq5hgbDKgbJtuWr08EUhGtf/rSBcKCrLGhKr/Zf05obE
 3DlCkzEHy8IZpfLq1WjM/LuiVSLSa3OVkXoA1aK3Cvw+YSyCY/5BfDu++v6qJOc5jtd5I7ukx
 K6fB1lic2MTekpA/Vv8tgzoZP5/wy1FnA+NSynR8nhjQtj0B1TDu8zeABUqSfmnJOZh4fkHMd
 JKAkv+GnisuloW5/JRK/pDjFk+NiweYd90JlAx/NMzwnwduTiLJwMK7MmSYMsnq9MZSvhDyWd
 spLC4Ke+F32Wg6V7mYKL5GkFjvLcy2Gr7rp0DVSdWE0fq76fM4NB2Z/L0VBjthsFWqaicZ5Af
 4AWv3WFs8megYK6h/cMD4E8AMDVhO2kmeFVNFglDXV1zxvXDxrAVlqgTyk4sSB5UsBIouVz8A
 VPe4l9XprddMJkJrHNSNS32lnxbw6dlUBmHZXPAUuERQwyJ9S8f3lp9cOm6lLEU/y9JAbF/Mg
 sKivnP48dlPrq+Zn1o83z8KPoeaTiz6N75swf5WBzbiubNOIvX9dyfLOCkqB+caTeF++gJxhI
 OMxez616D6Y0G4wJ3cEX7r1ORpxQdZaPgSoY6dU5W7tigS68iilRufSi8wOFtDrFr5a6JAK5k
 b2d1Hfrtfa8P4U=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RZxU18GLaf6NWGkB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 07, 2022 at 02:33:34PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
>=20
> Use adap.timeout for timeout calculation instead of hard-coded
> value of 35ms.


> Use syscon to access gcr, instead of "compatible".

Please put the GCR/syscon change into a separate patch, because it is
not obvious from the commit title that such a change would happen in
this patch.

>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index 2ad166355ec9..ddeee6f53621 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2047,7 +2047,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter =
*adap, struct i2c_msg *msgs,
>  	u16 nwrite, nread;
>  	u8 *write_data, *read_data;
>  	u8 slave_addr;
> -	int timeout;
> +	unsigned long timeout;
>  	int ret =3D 0;
>  	bool read_block =3D false;
>  	bool read_PEC =3D false;
> @@ -2099,13 +2099,13 @@ static int npcm_i2c_master_xfer(struct i2c_adapte=
r *adap, struct i2c_msg *msgs,
>  	 * 9: bits per transaction (including the ack/nack)
>  	 */
>  	timeout_usec =3D (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + =
nwrite);
> -	timeout =3D max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
> +	timeout =3D max(bus->adap.timeout, usecs_to_jiffies(timeout_usec));
>  	if (nwrite >=3D 32 * 1024 || nread >=3D 32 * 1024) {
>  		dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
>  		return -EINVAL;
>  	}
> =20
> -	time_left =3D jiffies + msecs_to_jiffies(DEFAULT_STALL_COUNT) + 1;
> +	time_left =3D jiffies + timeout + 1;
>  	do {
>  		/*
>  		 * we must clear slave address immediately when the bus is not
> @@ -2131,7 +2131,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter =
*adap, struct i2c_msg *msgs,
>  	}
> =20
>  	npcm_i2c_init_params(bus);
> -	bus->dest_addr =3D slave_addr;
> +	bus->dest_addr =3D slave_addr << 1;

This seems unrelated to timeout calculation.

>  	bus->msgs =3D msgs;
>  	bus->msgs_num =3D num;
>  	bus->cmd_err =3D 0;
> @@ -2233,9 +2233,9 @@ static int npcm_i2c_probe_bus(struct platform_devic=
e *pdev)
>  	struct i2c_adapter *adap;
>  	struct clk *i2c_clk;
>  	static struct regmap *gcr_regmap;
> -	static struct regmap *clk_regmap;
>  	int irq;
>  	int ret;
> +	struct device_node *np =3D pdev->dev.of_node;
> =20
>  	bus =3D devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
>  	if (!bus)
> @@ -2250,15 +2250,11 @@ static int npcm_i2c_probe_bus(struct platform_dev=
ice *pdev)
>  		return PTR_ERR(i2c_clk);
>  	bus->apb_clk =3D clk_get_rate(i2c_clk);
> =20
> -	gcr_regmap =3D syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr"=
);
> +	gcr_regmap =3D syscon_regmap_lookup_by_phandle(np, "syscon");
>  	if (IS_ERR(gcr_regmap))
>  		return PTR_ERR(gcr_regmap);
>  	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL);
> =20
> -	clk_regmap =3D syscon_regmap_lookup_by_compatible("nuvoton,npcm750-clk"=
);
> -	if (IS_ERR(clk_regmap))
> -		return PTR_ERR(clk_regmap);

I agree that clk_regmap can be removed, but I'd rather see it in a
separate patch, because it's unrelated to the timeout calculation.

> -
>  	bus->reg =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(bus->reg))
>  		return PTR_ERR(bus->reg);
> @@ -2269,7 +2265,7 @@ static int npcm_i2c_probe_bus(struct platform_devic=
e *pdev)
>  	adap =3D &bus->adap;
>  	adap->owner =3D THIS_MODULE;
>  	adap->retries =3D 3;
> -	adap->timeout =3D HZ;
> +	adap->timeout =3D msecs_to_jiffies(35);
>  	adap->algo =3D &npcm_i2c_algo;
>  	adap->quirks =3D &npcm_i2c_quirks;
>  	adap->algo_data =3D bus;


Best regards,
Jonathan

--RZxU18GLaf6NWGkB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIBAhcACgkQCDBEmo7z
X9uCbA/+NL/rpWypOlFcnBB6ISQecB6S6RoUnN3cnFt2SaNw2nQGu5P/Nrzbx1L4
9fBT0i385RpgaUqTHIV3ldE+75kstoCC4af1nuTXWG03Y6jhEbly/Hs0u6f4TOnJ
2y3DnEigDmCcG7K57OlsucUlhQMpJ4591qgZJV80Jf6ZjkmBR6VXnSPY0ISAwOjB
RH+QZyG91QRDIS7Az8Xw0PnaEhy/YntqCGICaT2D3yXcTWb8qPGJNu0uaBOVP+9o
vNPbJ76zLdsuW351xKFE2uY3cxnqwwznqeU4dzWBKe/wDC77wCq0Irsi+y7dA3S5
dna8ZzSXBPP0wDAltMiMqQKrZp8L21DWZeT/V2/ohg7XhQ9Q2fLIWLhf9XUupTAZ
rEJH+Ebq1GVSJZdEj7lKmxUlL2C1FvMb8g4yMItrs/5+ZpsY6XZbZHonWJGJ32IZ
zS/mCGJyIwb8/K2J/ts9zYCOqXgaybLXmyf5vWwEp3udg5ZicnruqiG4xtZDysSk
KLKQpdLKVaPwqdzHdZaxshXP1P/cgF53BAy0uIadanoBRF0MdgaJdOZuA69jVN5Q
Jr7V27NC2zCWOX+QG9x63hS5MXCnwcwCUn9qgS3WezBZWB1Y7/QPfuOZC8ETgIP0
Le3Ngiv9rt9esIaW9YjoW3/+QBxhulJKMiYerTqGWN/2fVD35CI=
=QKMT
-----END PGP SIGNATURE-----

--RZxU18GLaf6NWGkB--
