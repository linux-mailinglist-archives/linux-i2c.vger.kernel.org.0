Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 522F54B2C2B
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 18:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352404AbiBKRxq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 12:53:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352400AbiBKRxp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 12:53:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80600CE9;
        Fri, 11 Feb 2022 09:53:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1AC6361DA3;
        Fri, 11 Feb 2022 17:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25105C340E9;
        Fri, 11 Feb 2022 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644602023;
        bh=j9io4CjQGVmdKTFgkV+LOFNgAGw4pDMvV9VClqq4hNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ImbAKQ08m0iW6t5yD2Mda3NMteEnVLoMuQgQ9UKKJBNvanJ3/fCwzKuSQpoxUEkQa
         ktg9R1F0JLd6e+rr8mc7dTEn04rO2kXUN2uRdwMHVAJE3yMr43XizMt7NuK5G7VH+9
         8GfrijmzRv8mfDxeW6/TihWh+owSsDtaaDV9sW328/dhe9p1Q/pfHcgL30pWCUn5eR
         eyY68igzE9qcTQ7gkMtwDz5X0gIvSqFpdcYiDi2we5kkwIcat9jzx2tyMNniWMKx5P
         kRi8O7OKyWyHl3FkQeV0DdLyBqT0EORI3+MFh3iAGR74ZkAWEOSPYaaDcesD4bdla2
         vY29d+PAfi+/Q==
Date:   Fri, 11 Feb 2022 18:53:38 +0100
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
Message-ID: <YgaiorHf7/Za5vib@kunai>
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
        protocol="application/pgp-signature"; boundary="jVl1itNwmbBofVyK"
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


--jVl1itNwmbBofVyK
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

Applied to for-next, thanks!


--jVl1itNwmbBofVyK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIGoqIACgkQFA3kzBSg
KbY5zBAAky+SkyXA2LOT59kq0mn8oO/pzp+w/OnfTlN/Dn3GgC5ljGVYLc8MECQ/
Q2KKs+hINDGYIlDYCWxrDTQqNtaK+j35bY4m5uXiWFZWA7p4kMkOeaHfRVrbyg6S
b7XaVq7myEkDrO+Xfw2MGxyJTLksSq0o7Ql7g4mSZkPyDYNycT/JUTyb5ac+D/pD
yN/GK6kgiUvWeYrRCueJCTzYzpgwEdGex0wVQaOXDGVwSPZbM/j9RlBrmw4IBEIH
1gToRHIKoLmbVx+MvyRACu2aRXUXhS7nPg9Yuq3Ftfge4RWzYhlzIITdcpSs+U74
iuQkSCkKr0J3DvMwDKURl4g1BiPsKODTgvvYp4Fkw1LUad4hNEPrnLbxgZP6HYB6
svl6Jy9aQoqQx5UeH1WHIBeRqzJlCKrr4HOCwuC+HIQ9//sqwd9OEIah32F1B+AZ
wl0VhHqHDBUOimTbhr5QrvrTNEn4U5f5+eLToJbaGKEcplkJXlOFQg3xqaYN8hdB
o/MAbfRWOPDYm/nXM+gK6LbXxCmhEBWgsqOeiOuC13RBOdiLyRNhl/tH0wd+e24K
IHvmbZwmDhaKQ7U6Al0aeCQDzwULEpRtIhqHR1c+z18q9tA33GDfg0ukH6URjaLa
PnbVeIhZNqyNmsa4P0nbDSjxqVhzZPiiPyEmAA/t0cFAaad37CA=
=9qL3
-----END PGP SIGNATURE-----

--jVl1itNwmbBofVyK--
