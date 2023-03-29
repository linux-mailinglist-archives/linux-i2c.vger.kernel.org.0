Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2C96CF300
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 21:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjC2TT5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 15:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjC2TT4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 15:19:56 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBF8F0;
        Wed, 29 Mar 2023 12:19:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id BD886CE24E3;
        Wed, 29 Mar 2023 19:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B78C433EF;
        Wed, 29 Mar 2023 19:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680117592;
        bh=zI4wMGnEHifW8tK4iuH0uigdKi27uiHqXAYHuquhttk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cYHNoavpr/rNm+CjdfudO+n7vmIkpO2WS66ybk+LBJBVkz7Gi8sfmQdokOdgx78KY
         /njuPMiJa1miaZqgcpFtzMSmd0lwi87O8ACqasak6AazlGAnCwUvSX7fwFwhJqU2rr
         lio8kWctGmSVqi36YIOLuM/dXQJvOJpRiaEuALNfU4lm0R/BJldaCAlDot6/L+MptB
         /NLgrKg6oNQlBB/GZ5wva4RNIMGVkcGd2cvpSrmH5iK3S/dIMiawhBp764YOYFKUvo
         vaZAZN7zwsFujzGiu7ieAqPjxEsOvluzUWqUDp9ulrz+H8/3ikCbBqeCoKNUkdqJ32
         i2NGFqbislW/w==
Date:   Wed, 29 Mar 2023 21:19:49 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: cadence: Allow to specify the FIFO depth
Message-ID: <ZCSPVQCwFEkFD0tI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230317145441.156880-1-lars@metafoo.de>
 <20230317145441.156880-2-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2ClZTxtKAjwCuDIk"
Content-Disposition: inline
In-Reply-To: <20230317145441.156880-2-lars@metafoo.de>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2ClZTxtKAjwCuDIk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 07:54:40AM -0700, Lars-Peter Clausen wrote:
> The FIFO depth is a synthesis configuration parameters of the Cadence I2C
> IP. Different SoCs might use different values for these parameters.
>=20
> Currently the driver has the FIFO depth hardcoded to 16. Trying to use the
> driver with an IP instance that uses smaller values for these will work f=
or
> short transfers. But longer transfers will fail.
>=20
> Introduce a new devicetree property that allows to describe the FIFO depth
> of the I2C controller.
>=20
> These changes have been tested with
> 1) The Xilinx MPSoC for which this driver was originally written which has
>    the previous hardcoded settings of 16 and 255.
> 2) Another instance of the Cadence I2C IP with FIFO depth of 8 and maximum
>    transfer length of 16.
>=20
> Without these changes the latter would fail for I2C transfers longer than
> 8. With the updated driver both work fine even for longer transfers.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied to for-next, thanks!


--2ClZTxtKAjwCuDIk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkj1QACgkQFA3kzBSg
KbZuxg/+KVFeBAVDd9oLKkPfBhQ68CRwlRevwNBl9xZqYslNkuLFQPjTRUjdw+Py
1UgWgoyBZLn3Gip1HpmPTa1Ec4vnFeolFV6LMRAw8tZgE2MtahQVpAQAKO2ErDlJ
LyfC5Ph+wslEMC3nfxdNQwdXPwcDL+RklnBnbrQEMZKXomZ01Ak2AUTM+fOnrD90
pxVNAimmMqjPJM+9tbyZ2WaRev2KtQMYIs45StUhkCOOXG4P5a8xoYUasukPC3cL
gK/rCyCubyaSTFxm96pOVgUf58SlEXHvFCXlo0K8bJ1kuovWaQLyEgDLLg1bLg7c
JUwuMT9b6lDKKRkAJz9QvaTpStNztJs4paZHFziyRDLyxLgxAuKK9Rjcw7WBHJ/S
pZ2fbx5FZNxJ3yMZ7y6oNNRfjbReQmaAX7Kc4E1EnfxuSiuc/hOLZkRYn2gw+A03
i3nOAGA8FvoLBcXm9+Jzl/IkzUHX7s+yW+1fhhiqhQxBEpfflL1++OoL4fhdVmY5
huhTZmpv8qQMxqLt368JOr2NRn+p/LkDdGO4rwgjpwuvI8HPouMTCdJ1N2Uwy4Wd
SgYM9HN385redWMwCVEu2OYCz5G8Aq0iLuRDRn0Ghpt75i6WSGakHKntSVHhXvMZ
sfSIw4ZIKK46BVI37IwkpjFqgXW/Xrjmuc4Oc7HOlD0Lde4gHho=
=j80c
-----END PGP SIGNATURE-----

--2ClZTxtKAjwCuDIk--
