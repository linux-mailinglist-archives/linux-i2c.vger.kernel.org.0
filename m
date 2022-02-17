Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 960D24BAA4F
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Feb 2022 20:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245548AbiBQTvs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Feb 2022 14:51:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245557AbiBQTvo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Feb 2022 14:51:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B08F2654;
        Thu, 17 Feb 2022 11:51:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EE285B8248F;
        Thu, 17 Feb 2022 19:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA79C340ED;
        Thu, 17 Feb 2022 19:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645127486;
        bh=/NFtdyrs3BJgpD2REyVQg/DN9thDV5F68ByXwMqbQK4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fAol09cx2V5HD/NOwK0NoT07qqSHZ0DiCSCeC8Qah+ZlPoop2O7GvoM+bw3toKZ7f
         QyqPrVr7tVq/t2KHv7+K7dRMbt031yzAh37mV6JN+P66GkQJkTe9AkdTypCrK/2N5u
         EfMt7OiE1v2TB/9K/IMPnWJAyQWjg5gL8Dv3/HqjYUjPtrpAlNNXsTPWkYYUvFXiBj
         rPy5i16hDDfHAxxbj9GDZ1e6B7NcfP/PBo+BD4hqLeuc+g+Q/0eJ6XMmeA57Nn6K7j
         LnzcH+FHz/BOH8bz6cGIwXTNi5t74PQ2rPKnQAGCHsph8wSVwoklJ0jLeJ5zRdiWWS
         2k/ifJvd/2Wgg==
Date:   Thu, 17 Feb 2022 20:51:22 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] i2c: riic: Simplify reset handling
Message-ID: <Yg6nOnzDrBfYQ/J6@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220209232232.18461-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NlfEvZBT2OGmyrz4"
Content-Disposition: inline
In-Reply-To: <20220209232232.18461-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NlfEvZBT2OGmyrz4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 09, 2022 at 11:22:32PM +0000, Lad Prabhakar wrote:
> Read reset phandle as optional instead of exclusive so that all the DT's
> passing the reset phandle can be used to assert/deassert the reset line.
> With this change we don't have to differentiate the RZ/G2L SoC.
>=20
> With the above changes we no longer need the "renesas,riic-r9a07g044"
> compatible string, so drop it from riic_i2c_dt_ids[]. No changes are
> required to the r9a07g044.dtsi as we already have "renesas,riic-rz" as a
> fallback compatible string.
>=20
> While at it, check the return code of reset_control_deassert() as it might
> fail and also add a devres action to assert the reset line.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Looks good to me. Chris, Philipp what do you think?

> ---
>  drivers/i2c/busses/i2c-riic.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> index 8dfd27dc6149..cded77e06670 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -88,11 +88,6 @@
> =20
>  #define RIIC_INIT_MSG	-1
> =20
> -enum riic_type {
> -	RIIC_RZ_A,
> -	RIIC_RZ_G2L,
> -};
> -
>  struct riic_dev {
>  	void __iomem *base;
>  	u8 *buf;
> @@ -396,6 +391,11 @@ static struct riic_irq_desc riic_irqs[] =3D {
>  	{ .res_num =3D 5, .isr =3D riic_tend_isr, .name =3D "riic-nack" },
>  };
> =20
> +static void riic_reset_control_assert(void *data)
> +{
> +	reset_control_assert(data);
> +}
> +
>  static int riic_i2c_probe(struct platform_device *pdev)
>  {
>  	struct riic_dev *riic;
> @@ -404,7 +404,6 @@ static int riic_i2c_probe(struct platform_device *pde=
v)
>  	struct i2c_timings i2c_t;
>  	struct reset_control *rstc;
>  	int i, ret;
> -	enum riic_type type;
> =20
>  	riic =3D devm_kzalloc(&pdev->dev, sizeof(*riic), GFP_KERNEL);
>  	if (!riic)
> @@ -421,16 +420,18 @@ static int riic_i2c_probe(struct platform_device *p=
dev)
>  		return PTR_ERR(riic->clk);
>  	}
> =20
> -	type =3D (enum riic_type)of_device_get_match_data(&pdev->dev);
> -	if (type =3D=3D RIIC_RZ_G2L) {
> -		rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> -		if (IS_ERR(rstc)) {
> -			dev_err(&pdev->dev, "Error: missing reset ctrl\n");
> -			return PTR_ERR(rstc);
> -		}
> +	rstc =3D devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
> +				     "Error: missing reset ctrl\n");
> =20
> -		reset_control_deassert(rstc);
> -	}
> +	ret =3D reset_control_deassert(rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(&pdev->dev, riic_reset_control_assert,=
 rstc);
> +	if (ret)
> +		return ret;
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(riic_irqs); i++) {
>  		ret =3D platform_get_irq(pdev, riic_irqs[i].res_num);
> @@ -492,8 +493,7 @@ static int riic_i2c_remove(struct platform_device *pd=
ev)
>  }
> =20
>  static const struct of_device_id riic_i2c_dt_ids[] =3D {
> -	{ .compatible =3D "renesas,riic-r9a07g044", .data =3D (void *)RIIC_RZ_G=
2L },
> -	{ .compatible =3D "renesas,riic-rz", .data =3D (void *)RIIC_RZ_A },
> +	{ .compatible =3D "renesas,riic-rz", },
>  	{ /* Sentinel */ },
>  };
> =20
> --=20
> 2.17.1
>=20

--NlfEvZBT2OGmyrz4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIOpzoACgkQFA3kzBSg
KbZeFBAAlX76TELnyAE9XeU5PGPYHfSg060hOluvc/aD1maXj+ceqDh+jtd1WUjl
VAR+R3/SgbfVnVBYDNAeHD1HlqiByor3T/7PuY3e5I4ZlPfAJi4QhgweWRtC9/EY
tuElUGXHI8Xfz6vAiDAZ9Rp96XodVrlSGUQhou/ymFsooSqhKyJsYEczomhF2LU4
siunHjake88vN13RE5Wg9ugguLMgr29UdGWAqXzgVUlRDXBj+qe644Q9cC5rRFLu
vQEPglSemeGbfA0vRhRvjGYJWLwkqW9qLXc5kBDlHUuolBttvBwA1iFPSBJpK+cU
/H19/jTrCWciqpO/w/O/PBZq4v16q4j77PXTu1gGbp4HQjBCE04hKBgGwfowV7QZ
r/WKIfCTpBhfk+NWJQ7GlFtktyUTTlhhbDwZwjZeuAXLMS4zYpin1xNfJXXNYHHm
2CS1mU2FhqcQJGD6pNRrsEob9aNAV06hLValJpHneJFIVjoKnES6BvBMqzJ8qmQE
uOtwlXkSp7nii42NmB8BRc+vpDbxzR67lAxmN2cQqrpFIyuqpQGIZBti2NO4xFI6
0rFEvxG0ob7lVuusiZ24QQqnQLPJ1jkeFxwDmOoCpLj0dkhL3ZLI0O0W1FaLUqpP
MLVWl+sEnYnee99MHLB5R+uul5kDnNNXcKwCnV4biCw49f4r1Aw=
=1hEL
-----END PGP SIGNATURE-----

--NlfEvZBT2OGmyrz4--
