Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10E527B079D
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 17:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbjI0PFf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 11:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbjI0PFe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 11:05:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF18196;
        Wed, 27 Sep 2023 08:05:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA17CC433CB;
        Wed, 27 Sep 2023 15:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695827132;
        bh=3DNgn9Pn+10uv+Th5OTDqc8kfv8Y/NmLhg9ZrOr/5ow=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jbH0OCrR4ic5XiA0klM7mHBZ3BFHbZRhRWZzNqd0TwKJMaoo/m75k4goJX2XRCqQb
         iI7C1whDKeD9Nj2hR3gIGJJ45yxPweCXkUdozQDnEF51QTuyoQ8ScQ5UQG0Q/fV0ij
         7ek6S/w+zSBjFMwIO+Vxbsd4FF/3YhIH2UxQ9Omitvq2zYs2XWA8PeT6eUh3RO76wD
         RM/ow2nxNdcPTZSEeLwjahN9cLaT/ALxzFwvhMdIWiWG+0hwpxQbMvrUzNljic0h4m
         0SQ47iy4m+xYTwG/b6IFJfA0JAzb2QZ5tZFJxzJHz2NMKgO+sxnaLNbDrzAhyoolNT
         kRcTZn7y0qFHA==
Date:   Wed, 27 Sep 2023 16:05:28 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, pierre.gondois@arm.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: mv64xxx: update bindings for
 unstuck register
Message-ID: <20230927-proofread-spoken-79f13b074a5f@spud>
References: <20230926234801.4078042-1-chris.packham@alliedtelesis.co.nz>
 <20230926234801.4078042-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yq9mmXrPR6AquKUP"
Content-Disposition: inline
In-Reply-To: <20230926234801.4078042-2-chris.packham@alliedtelesis.co.nz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yq9mmXrPR6AquKUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 12:47:59PM +1300, Chris Packham wrote:
> Some newer Marvell SoCs support an "unstuck" function for I2C bus
> recovery. This is an alternative to the generic GPIO based recovery that
> the older SoCs use. The unstuck register falls outside of the usual
> address block for the I2C controller so requires an additional cell in
> the register property. This is optional and does not need to be
> supplied.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.
> ---
>  .../devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml         | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> index 984fc1ed3ec6..461d1c9ee3f7 100644
> --- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> @@ -45,7 +45,10 @@ properties:
>        auto-detects this and sets it appropriately.
> =20
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: I2C controller registers
> +      - description: I2C unstuck register
> =20
>    interrupts:
>      maxItems: 1
> --=20
> 2.42.0
>=20
>=20

--yq9mmXrPR6AquKUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRREuAAKCRB4tDGHoIJi
0gxrAQDudRH16IrOwLcJ40jJ6+oVn83qQFAbNADL2jPpDF3zQgEA6EaOYiY23CgO
ByhQiTrlF0KOZ1MgEjN6VP5mUwafoQI=
=sW4g
-----END PGP SIGNATURE-----

--yq9mmXrPR6AquKUP--
