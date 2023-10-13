Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5E7A7C8839
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Oct 2023 17:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbjJMPDG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Oct 2023 11:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbjJMPDF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Oct 2023 11:03:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341F6CF
        for <linux-i2c@vger.kernel.org>; Fri, 13 Oct 2023 08:03:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C152CC433C8;
        Fri, 13 Oct 2023 15:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697209383;
        bh=6DmWN740bZEDU0dI3GA4xdxUBA8MIf6dFn8OKFggBBw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AkLvd9zGybsSqGZ4a+JjVN5Ez1JZvTl9Ybu72oyxMbqqN/iwrFqctRY7uROegLQyC
         yTT2mGIL/wCN1QWEbLppvBItKaypUZ9nDkJYdwIiNwWJyfjI0MQVCpDSAInsKQmQX7
         94v3QQbt/h7E68ijEklFHofsB1SQk+XxOrBeIqKM86zD1uRQemQZd8pRhWDWe2kL2k
         wx82VKIbMcTII9OImMv3ZVvY4k6NUaRHPWC2Ny3HGn7pDIRpNI5E1Mc8MlvmZT10wL
         CznqD7Qp3QUrSzG+rnazQvsR2sNR+rgdGGTXjDPiAHIft8yLouCEdskg/hN/EnC5oV
         od4395Hx6J8SQ==
Date:   Fri, 13 Oct 2023 16:02:59 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: at24: add ST M24C64-D Additional Write
 lockable page
Message-ID: <20231013-frayed-strongly-c8664be51ca4@spud>
References: <20231013063008.2879314-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uh8o1iaaFSBoYyMk"
Content-Disposition: inline
In-Reply-To: <20231013063008.2879314-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uh8o1iaaFSBoYyMk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 08:30:07AM +0200, Alexander Stein wrote:
> The ST M24C64-D behaves as a regular M24C64, except for the -D variant
> which uses up another I2C address for Additional Write lockable page.
> This page is 32 Bytes long and can contain additional data. Document
> compatible string for it, so users can describe that page in DT. Note
> that users still have to describe the main M24C64 area separately as
> that is on separate I2C address from this page.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
> This is a copy & paste of [1] for ST M24C64-D. I reused the same pattern =
and
> also used Marek's commit message.
>=20
> [1] https://lore.kernel.org/all/20231010190926.57674-1-marex@denx.de/#t
>=20
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documen=
tation/devicetree/bindings/eeprom/at24.yaml
> index 7be127e9b2507..6385b05a1e62f 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -73,6 +73,8 @@ properties:
>                    pattern: cs32$
>                - items:
>                    pattern: c64$
> +              - items:
> +                  pattern: c64d-wl$
>                - items:
>                    pattern: cs64$
>                - items:
> --=20
> 2.34.1
>=20

--uh8o1iaaFSBoYyMk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSlcIwAKCRB4tDGHoIJi
0r1XAQD7ocUFAReBCicUxUSeeiREAa2IZ5Ws7QJ5ZHN5tqL8gwD+OsqzE1FQtTZE
kry38l35nZ2SpRa4L4JG+w5rVgaluA8=
=HtlU
-----END PGP SIGNATURE-----

--uh8o1iaaFSBoYyMk--
