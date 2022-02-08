Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1343D4AD8B9
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 14:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245606AbiBHNPj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 08:15:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350409AbiBHMSf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 07:18:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D6D2C03FEC0;
        Tue,  8 Feb 2022 04:18:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B073B61572;
        Tue,  8 Feb 2022 12:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58648C340E9;
        Tue,  8 Feb 2022 12:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644322714;
        bh=+jhBmsQwTJRGwAwlQW6FTGpVyZorlTh6XXyLTNZaKtM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jGFn+QhLelOPYfhz2FlG8XDs13dxBkoE4Sze6DbEgt+XrSfcByVQnWMlOj75yGkhi
         3yPz6zATvF1nsQbiYOJx9JZa2NZ5oH9zkLywt6bbgEiZb+iH3nDH4YfdjnAGdwVNIf
         BbsdjCtUVoGVyuXLer7OHfpeFRRx1A4ktMyRfNKQ8Ru0eEEcLfs5JvY94yhUP4G6Qr
         au2zYAK55xnxMVNnfI/MFnvs5YceUHT17Jq0jB9WZb5gFKtUruw4i8fnZNNWgLPBxp
         6Xo6/B0qhxeh0wgKvEX9chUI+ldjJ1TDtT4wxmeAgjCGuRG+wmItthm/7gIaYe9OpV
         gBy8l5vbATDMA==
Date:   Tue, 8 Feb 2022 13:18:31 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, geert@linux-m68k.org,
        krzysztof.kozlowski@canonical.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
        bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
        atishp@rivosinc.com, Rob Herring <robh@kernel.org>,
        Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v6 03/12] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Message-ID: <YgJfl5CmepRMb5He@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, conor.dooley@microchip.com,
        linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        geert@linux-m68k.org, krzysztof.kozlowski@canonical.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-riscv@lists.infradead.org, bin.meng@windriver.com,
        heiko@sntech.de, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
        atishp@rivosinc.com, Rob Herring <robh@kernel.org>,
        Palmer Dabbelt <palmer@rivosinc.com>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
 <20220207162637.1658677-4-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sdYSIm6VkoPV0MiH"
Content-Disposition: inline
In-Reply-To: <20220207162637.1658677-4-conor.dooley@microchip.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sdYSIm6VkoPV0MiH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 07, 2022 at 04:26:29PM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
>=20
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Shall this go via DT (Rob) or I2C (me) or some riscv tree?


--sdYSIm6VkoPV0MiH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmICX5MACgkQFA3kzBSg
KbZzxhAArSdMKMsyP4zt6H3heN8FNENRNOKYegpVuGgnCzbtLbitNEQvjx0Z9HdF
BUbaytztYIVoDstV1SxiWczUikuOQ7pQ2TB585jhzhF7FATjt0zqIr22/ATEBmN5
nUNlnWMt5s05zgcppQyksrVddYYvgs+HqtTCNXCk6LOz0qC54dxze8766ageQYPz
1gBy5cDmJrUMJ+X8JnveuPgKv4BrZgGKZsrNgHy5dOAdF0B0WyI4i/uv2YTq2y+o
XIOA/B60tgZtIWkWWcFNPIE+TQQIDVY93O2R3i4gAvCfwYVqyRdtG5i5p3eK74RM
LwpTEv6SJE5KJ0pxYmo5SP4AKsMaN7Z6ePga6LQz2tPETjhKNZixntc/KsoIPXQJ
sQ025iG+3stSKxpnpWg/VjqM6ugoDQOX+VvsxFe34KjtmbgRYTROfxHY173+TfVb
hZb+CYNHbDxl7/gGHkXlsbcNC6sSZq7qvu0ZeCXPvq4nzk1V0KwKPGLocQaTrGVo
qNHIjEnA5CeIu8y5fF7r26769safY0B9chLwsxXWujW3WSHY3FYPmRDMtX89sVhr
WxlPZDxBvIv16LQjg4lXWLrTsgkUaVU2xiHe8gd+gulSVMgKeeePSkiU4fKgonRj
+KJRlq7MvI0G5Mdb0F3PNIHoq4R/P8FYBNmGgRmjvIxBNzggd2M=
=TDLj
-----END PGP SIGNATURE-----

--sdYSIm6VkoPV0MiH--
