Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2120A729E5A
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 17:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbjFIP0L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Jun 2023 11:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241793AbjFIPZo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Jun 2023 11:25:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BAF3C02;
        Fri,  9 Jun 2023 08:25:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C13DD65905;
        Fri,  9 Jun 2023 15:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961B6C433D2;
        Fri,  9 Jun 2023 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686324325;
        bh=H+RjYlQ9IogOiSxuaYPWwdXkgGWvdLr1GmlbLc8+ABQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ni8pyn4A6wWmU5QVmf3w7r5A9AkcqSzrztARCT4gbmhokUBs7mtVXaWfsidvS/oN9
         R9Pqnz+BiGaZaUbEiI3OzCG6MTot0GioqXmws26whj4lROxBPFUrB5jPEVVJzqTQqv
         aIJjF8LM5+J+rigmSoS4QecAe9KoOVSNWa3xZ6zEB7KENO5Iag1fluNNjSQloQ3DWd
         N7RoJx5c0tduY8OKbyPdCKbdCk+wpR9p+vF5zTtNhtfKG/7v9ppza+ctsK/++8jAJG
         lr+wVO5psWPeVdjHKPV6UOmhgaXozVVyU78sPsi7N7lXSLPk5pNHilPYF7P+1LsdEo
         LNmXSLSHiHffw==
Date:   Fri, 9 Jun 2023 17:25:21 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-i2c@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4] i2c: Add i2c_get_match_data()
Message-ID: <ZINEYYxGBSQ0mKyV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-i2c@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20230607165738.138357-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BeCIW51DZBAp3j3G"
Content-Disposition: inline
In-Reply-To: <20230607165738.138357-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BeCIW51DZBAp3j3G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2023 at 05:57:38PM +0100, Biju Das wrote:
> Add i2c_get_match_data() to get match data for I2C, ACPI and
> DT-based matching, so that we can optimize the driver code.
>=20
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

No further comments, yet I like it, so:

Applied to for-next, thanks!

With one minor change, I hope you are okay with it:

> +	struct device_driver *drv =3D client->dev.driver;
> +	struct i2c_driver *driver =3D to_i2c_driver(drv);

Variables 'drv' and 'driver' sounds like it could cause confusion later.
I merged the two and eliminated 'drv' that way.


--BeCIW51DZBAp3j3G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSDRGEACgkQFA3kzBSg
KbbD0Q//Ucg3S+0nPWZ1b4uWj2Ipf5+COZOq6sFciDSyu4NfHds4xc7S6hwlek9a
PUILR95a6mwAlC3yw8shMDTBhXPl7U48xtMqWXHp7B4JWS04imoKp491D/yO6apb
6HqKkhLYp5hZuj8Lhn/Vv+BORSxHTSS4/meUiZ18it8PXamgtVxtUXVajHlUg+z1
fyaaEaU2ssR0qo33fktVdn3/frew0GymbbM88gXNf7M46pf/cJQc/JwT0FkW5WTX
6k5w4XO6Rl7q69+kbfi3awDIFvm9YnZqQHF3JiXhT3HtUw3bB2GYA+zdD8etHWCN
cf5Kyxpt/lReNmCfJ+biAov4muZ3B9DpQglIVGeIqvcJsJkzAcrTwmzO1+valHcd
SXUYRK47vLwtZ6dWEHLsazmeln/J468cimfknf5TuKVg4Yq0Tg+gLX5ANiF9jeU7
zAy8TF88pBe68TqY35uGb8+f0WEOkQToB7querqceJxCXdEprZ3XJn2j9uo/Fvbn
UNI1y6Yi0WWCn+4JztTqo79Zaj6OuwjTE2IBRRgLXa9JYz0BqZkyucD3S7cgJ0Uy
1wLagGdTMJ1KGvnUiycU5wDaRV75mWw/vPO29z62mQwBaRp1o2/i9ibDVp7hNKpP
mv+ZiSrlXx0pqKgPVC0Q9AMgR7MAjll9T9mOj3MnqdAbd2FIVzk=
=Vu/3
-----END PGP SIGNATURE-----

--BeCIW51DZBAp3j3G--
