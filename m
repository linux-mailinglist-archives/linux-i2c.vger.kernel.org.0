Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E75F47D9323
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 11:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbjJ0JKG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Oct 2023 05:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjJ0JKF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Oct 2023 05:10:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39AF893;
        Fri, 27 Oct 2023 02:10:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CB0C433C8;
        Fri, 27 Oct 2023 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698397801;
        bh=UlnJ7ybGRiYreh3nfZGSzzF+l2lR/9JOQF1TpzUa/ds=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VafXryuBonCNfDfOwpSgK59Lcnu5KPZux97nafwBkvjz9FhzmOj7Pv1xN7LdnujyD
         z3FGK3jCrOfhOba8q1pc203WyhUjFZFCmnHbYtJGjUwS95Aebq1wpQm++d3k5IRifh
         ki7fmSasShS/q68V0i0GmeH/JaxawXkxv2DLqyhyajznIkDJSNAkMEMSBO8GPUYt7N
         L9K2Tm0/1npVrjDJCw/J8wdx4bnIxd6Eo1IWEVBHz4dbMwJ9kLjHpdOAgO47LW/EKq
         BvqdA1pt8gWardtk8NVoe3Vwl+p4mTNpTc2/PXmRBGYdBWQFSCy+lhkoRXZx1iPfdW
         C8QqAJnjY3bGw==
Date:   Fri, 27 Oct 2023 11:09:58 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: mv64xxx: add bus-reset-gpios
 property
Message-ID: <ZTt+ZgNe5Y35E/C2@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        krzysztof.kozlowski+dt@linaro.org, gregory.clement@bootlin.com,
        andi.shyti@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz>
 <20231027033104.1348921-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MC18m8lzniOpRcOB"
Content-Disposition: inline
In-Reply-To: <20231027033104.1348921-2-chris.packham@alliedtelesis.co.nz>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MC18m8lzniOpRcOB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 04:31:03PM +1300, Chris Packham wrote:
> Add bus-reset-gpios and bus-reset-duration-us properties to the
> marvell,mv64xxx-i2c binding. These can be used to describe hardware
> where a common reset GPIO is connected to all downstream devices on and
> I2C bus. This reset will be asserted then released before the downstream
> devices on the bus are probed.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Krzysztof, are you fine with this change?

> ---
>=20
> Notes:
>     Changes in v5:
>     - Rename reset-gpios and reset-duration-us to bus-reset-gpios and
>       bus-reset-duration-us as requested by Wolfram
>     Changes in v4:
>     - Add r-by from Krzysztof
>     Changes in v3:
>     - Rename reset-delay-us to reset-duration-us to better reflect its
>       purpose
>     - Add default: for reset-duration-us
>     - Add description: for reset-gpios
>     Changes in v2:
>     - Update commit message
>     - Add reset-delay-us property
>=20
>  .../devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> index 461d1c9ee3f7..b165d1c4f0b1 100644
> --- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> @@ -70,6 +70,16 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  bus-reset-gpios:
> +    description:
> +      GPIO pin providing a common reset for all downstream devices. This=
 GPIO
> +      will be asserted then released before the downstream devices are p=
robed.
> +    maxItems: 1
> +
> +  bus-reset-duration-us:
> +    description: Reset duration in us.
> +    default: 1
> +
>    dmas:
>      items:
>        - description: RX DMA Channel
> --=20
> 2.42.0
>=20

--MC18m8lzniOpRcOB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU7fmEACgkQFA3kzBSg
Kbb6ow//Uv8Eg3AFUhPmr2ffnMT2OIGd31B8REfzNbJrn9mS+HcXjLqMzy5eiViS
2P4amlnhQ+bRE+8hZ6gQCWOpB5fr+7/16w6H7TsLQ97HIhFIewdgM4WYvPmyOkyd
L1tLEO6DeVPdu2m9xwvq3zR41LFNUFn44fiN3d5xUbQDuhsUkBI4QMhQM3NbhnUb
tNE74ilZou7QV4uXRd9VdVYSp0NQEccY+nN2T7hA1YIFUN2vDRtfzrtIO8S+wLZA
lKpgBArCcYHWjkdRpDoXH3n1z14toiB2/LPpbbiS4OAxJU4V+D0sUTm+TkhuIuTR
1TBP9GNoSgWERk4WshVEArmekKuUEdbFCHglZu2/bfPUow23Ds2yqlUd4OS3+Gsu
1qtGnITopQJkeIGJ8pXwlBCO0bA92otJSHcAju3vGePnn671R3xHMqiX08aJj/aY
W9++xZKIa7mDluq7kO05sjXx0DmJs9sdFsD/7fOAygF2wa/awuMp88WbFDB+5gg9
VAGxU489H1fvc+1udm1pbKt4aXE38CsEFQE9uJ438ou85zTaMtdLJasuILcjq8QB
LO8eHpYDC9Q7MSToOLBWGQLMpp7yYVg9r4MLMvVxifVPF81NdQT4//joF38wjTai
jBKADM+Vq8uqojAUvqyGZ6HhM8wiMpBwxTihEskqzHPscxhAeEw=
=V58g
-----END PGP SIGNATURE-----

--MC18m8lzniOpRcOB--
