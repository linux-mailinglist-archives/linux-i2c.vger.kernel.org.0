Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5945C678AAB
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jan 2023 23:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233013AbjAWWVq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Jan 2023 17:21:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbjAWWVp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Jan 2023 17:21:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2F6EFA8;
        Mon, 23 Jan 2023 14:21:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AD37C610A3;
        Mon, 23 Jan 2023 22:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9876DC433D2;
        Mon, 23 Jan 2023 22:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674512504;
        bh=5pNowrepl2Bk3buosCjxux1jEQssWQZ3moduo0N2YcQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=anwJLJwOMFPB9n1nAjV+3+UF+piqtQ06TgwUhQJWuwq4vpshYJ+ZtTh6AoZInTNeZ
         L7dtOfftMaiz68yjgOEnzOcPazzND3D4yyjMMAbhimnIYDP5HlAS6tWC4U9cFogTSq
         FqQZwYY5qRte8CjohmwnMfAbcBcux7dmtJ5o5+yk10o6XjKDfYFXPMtB2DufLWBUd1
         Siel2WTc0tLs0P3KGLP+Cs7A8EKJdXh2RvFBBoC00u2KKhQS4QPf2xggUt4SQ4DvuY
         NfinuWWoCT99vrnMV/+HQBrQbVhriEZ2pUKFtpxme105c5jvU5dU5O9iCFqslS2WNP
         tVUayPvC8lYbA==
Date:   Mon, 23 Jan 2023 23:21:40 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 3/3] i2c: gpio: support write-only sda/scl w/o pull-up
Message-ID: <Y88IdIeNKa6UiCFc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <6f4b54d9-ab6d-a4d4-5142-27c89e03c6d2@gmail.com>
 <7eea145d-d5a7-052c-e458-18f3b842c2ec@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LQJfnu/JnbPQR1bP"
Content-Disposition: inline
In-Reply-To: <7eea145d-d5a7-052c-e458-18f3b842c2ec@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LQJfnu/JnbPQR1bP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2023 at 10:55:12PM +0100, Heiner Kallweit wrote:
> There are slave devices that understand I2C but have read-only SDA and
> SCL. Examples are FD650 7-segment LED controller and its derivatives.
> Typical board designs don't even have a pull-up for both pins.
> Handle the new attributes for write-only SDA and missing pull-up on
> SDA/SCL.
>=20
> For either pin the open-drain and has-no-pullup properties are
> mutually-exclusive, what is documented in the DT property documentation.
> We don't add an extra warning here because the open-drain properties
> are marked deprecated anyway.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!

> +	pdata->sda_is_output_only =3D
> +		of_property_read_bool(np, "i2c-gpio,sda-output-only");
> +	pdata->sda_has_no_pullup =3D
> +		of_property_read_bool(np, "i2c-gpio,sda-has-no-pullup");
> +	pdata->scl_has_no_pullup =3D
> +		of_property_read_bool(np, "i2c-gpio,scl-has-no-pullup");

I converted these to device_property_read_bool() because of 7b6e9dc7e42d
("i2c: gpio: Add support on ACPI-based system") which is in my for-next.


--LQJfnu/JnbPQR1bP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPPCHQACgkQFA3kzBSg
KbYFIA/+MWdSqmFYPu9rjNdJmjoyr4o4NTmo9opV4SMu39hF3iLTVNqpVeLC0/vF
ajHzyRzjVVAbCj9nVqexTqIhAzy7kps4+MLU0zvQZHI7k4c1ywL1n3QLCWTrNhXv
VjfvuB25pqR5Pfetjnl63LEmn6m8tjHls3ckjMSPWImkmSvg4Tqpm5QmMEpb77tz
PhojsJO2eKwqA2/a3ze9t5PPojKi/4o6d9WEYwN/3fMsQPCXrADvlsSJv1LNQbap
myn8xshCRiJ/yNnLIyOW1vOeJbKqPhpNW33C0UHVH8NfielbNJd89egY3VCdDigr
a4+CnE0TvRwEx2LnThCdlnu0yS3pv1h8CBwdyWJn6OVSgDUv39vGTgCeiyQQs8c6
c3fReEo3KnHiX3Rq1ZfWQ5CX3TytNOrjUXWfLE1Ggt2RNL1N3dZTDiFM+DY42fNh
9wo7pYmMjC9IzRENolKofAKljrqYtOMB8Z8+W7MyABqvFV5aS62SN1e+MMNnUlJ2
wdILnQKN8KDjdfY+Wo0OrOnv2OXuEPeVfY3mQXI5PLdhJVhjZkscWh3LmqYqMO/v
tttGC4dJ4lm/6t5rluY2Bp4UAnxxfmVBj6PGiEjw5I2TdtecoIfTorQJZf8acdY+
sNUwe3I68Z8Q4l8hJG0l19fboM5B68i/AooiJpYnStAd3TOLrsE=
=/h1z
-----END PGP SIGNATURE-----

--LQJfnu/JnbPQR1bP--
