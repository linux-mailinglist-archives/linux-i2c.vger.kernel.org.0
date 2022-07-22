Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 993C557E4A2
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jul 2022 18:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234456AbiGVQqJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jul 2022 12:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiGVQqJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Jul 2022 12:46:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5129913D1A;
        Fri, 22 Jul 2022 09:46:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E205C62205;
        Fri, 22 Jul 2022 16:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6ABC341C6;
        Fri, 22 Jul 2022 16:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658508367;
        bh=HXv9UCF+o9QZ6ULY0LQsO7G0clvbn5zX2Qa/L2xwrY0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GljYDYHOjqC2eeEHmB90vEMfSDs44VRfP6rWdT0owoSaIedhlKJDZ8aMSizXzM584
         SQrbY335PU2UCBKqsJ1OlepQxxS9cofLG6uiQRdDFaINb9DDgpGBjHt2WSzNpH0o15
         ikh4+CyHN+MjFB1Q4G+Dto5hs9JXk4lJJAcptuONrYHjgxezPqR2einyKez/4QjBfv
         cPrTz1QDc3NetQIJRS5usKAqmKH9TB6/4uAgcX/D3qZEiEEFmojrEbFlX4v+w8iLoL
         Aod0IvJPayV0aRscp+5uu2X++Nalfg7I0TjxvRA6/AxCSnMGTGSDtMuzIaLWjYvjPA
         J31vPWgXNPAtA==
Date:   Fri, 22 Jul 2022 18:45:56 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] i2c: Add Renesas RZ/V2M controller
Message-ID: <YtrURCS/7qiI5ump@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20220708100350.12523-1-phil.edworthy@renesas.com>
 <20220708100350.12523-3-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OzXLR+nkf6QnDA0R"
Content-Disposition: inline
In-Reply-To: <20220708100350.12523-3-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OzXLR+nkf6QnDA0R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2022 at 11:03:50AM +0100, Phil Edworthy wrote:
> Yet another i2c controller from Renesas that is found on the RZ/V2M
> (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.
>=20
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Applied to for-next with the minor fixes I mentioned, thanks!

If you want to maintain the driver further, could you send an addition
to the MAINTAINES file, too?


--OzXLR+nkf6QnDA0R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLa1EMACgkQFA3kzBSg
KbbUxBAAhw6lzaWsn2+3rIKBYxzjME9H6jTGB3f0WiZv5TEVkQ8TSKKygH56yiZl
kr3o+cM4RGo+6TqLTkLi+ZWHiKwzi5qIaEWOnFq7qe7t9Ghr2SRN6vwu1S2UlCbc
a1vMhakVoILQdafiDjoZ0O2ckCuQjWrZac56TlD4XpC3Wqs1bFKgWYhQnczRcgqu
PfRKY38YbqHFwFcajcGd8e38ZoH9/5XHJeUJI177NjWxfrIv20p82BucVPFG3ap5
ZyjAJFYyziWI/FCCcyNRzZC0f++6OW/76jFuvceCgbXIPyrRuCweBvFJmSmEW7ay
SbvpMRy2HAujAdZjbEr1PDdUfz1veBdyHXcKXlesFbyg5IYhnl9ycV2TQdK3is/r
Ze+9A3LIlSV127xFuINk0Dc19q8fsEH/eem9TdgSKTUAz6jffiJLDIkF9WaNHPB/
UeR/Djfze82gugikhTbFsqURVkmS9Svhjz2Ig3Tzki+mheY4wMLUWOz4NV1xgl3o
ITXTCztwzCfFiLD62lVeFstwzk3Fkq/CQXN6ESB+iuJX4BLB0XASU+ooF3AgHJaL
HHgAIeT98ryeNl09Bx2SH4doSnu3kd6Q8HRPWML47ChCMUA6LCALe7OAYDGaQYdT
BAQAlrOrQpCyUISWiarN65a2N3ThyAwbf2sQoAL7ezxoGt/p9rE=
=4/V8
-----END PGP SIGNATURE-----

--OzXLR+nkf6QnDA0R--
