Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 270CD7C56E0
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 16:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbjJKOcN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 10:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbjJKOcM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 10:32:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175BF90
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 07:32:11 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39E0C433C7;
        Wed, 11 Oct 2023 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697034730;
        bh=959YLbKVdRZWX0atfQOeGwAb7Qp7+p08uS07ajzWqRI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kvtu2dOBZC4Ln4wf+bTK3uN19P4Xucp6ZKnFriqVY1l6m7ErdbvFgr62MhbBLiinQ
         Uax3gJLwWRnzMKvvC7szXKuSgd4P05wW3v5M3qWqEdpwBvv/wEhqUrXmkUO1OFXMjt
         u5Rnu89badvKaYu7+gk3VhDUc1Zn4tvQwaGCURtdXB06h2V/KtzkTQhFFH9TQl4l22
         U1OSCndLZdy5ghmeWGYxMGhtc/duyTP5slTDRpsUyEVaPCD7h8TLgZ+GIJ3bDm3tgd
         K+fTYlgdIQjgqSrwGK5iEt3/NVRCu6odxl4og8pWDRG81WC1izmv4tm+dPFliNK4DI
         PzagcRSoU0a9w==
Date:   Wed, 11 Oct 2023 15:32:06 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: at24: add ST M24C32-D Additional Write
 lockable page
Message-ID: <20231011-buffer-safely-2d121d4ae8b8@spud>
References: <20231010190926.57674-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wog0/5TbcFHH/Bj5"
Content-Disposition: inline
In-Reply-To: <20231010190926.57674-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wog0/5TbcFHH/Bj5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 09:09:25PM +0200, Marek Vasut wrote:
> The ST M24C32-D behaves as a regular M24C32, except for the -D variant
> which uses up another I2C address for Additional Write lockable page.
> This page is 32 Bytes long and can contain additional data. Document
> compatible string for it, so users can describe that page in DT. Note
> that users still have to describe the main M24C32 area separately as
> that is on separate I2C address from this page.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Oh and Bartosz, this binding seems to have a baylibre email address for
you in it. I'm sure it's mailmap'ed to the right place, but just FYI.

Thanks,
Conor.

> ---
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documen=
tation/devicetree/bindings/eeprom/at24.yaml
> index 98139489d4b5c..7be127e9b2507 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -67,6 +67,8 @@ properties:
>                    pattern: cs16$
>                - items:
>                    pattern: c32$
> +              - items:
> +                  pattern: c32d-wl$
>                - items:
>                    pattern: cs32$
>                - items:
> --=20
> 2.40.1
>=20

--wog0/5TbcFHH/Bj5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSax5gAKCRB4tDGHoIJi
0uDqAQDrrqm5xF6kSughP/zgQ9kHzDoc9nYqWllbxlSYkSmgygD/bRkPAKlAbY9N
fgB9ZF7AOlPHILAUtsGHH3I/JL3mIgY=
=Qeyv
-----END PGP SIGNATURE-----

--wog0/5TbcFHH/Bj5--
