Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54CAE6CF2BD
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 21:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbjC2TIC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 15:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbjC2TIB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 15:08:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B474B1738;
        Wed, 29 Mar 2023 12:07:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5AC47B82420;
        Wed, 29 Mar 2023 19:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9887DC4339B;
        Wed, 29 Mar 2023 19:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680116875;
        bh=JWp+u42qJQLTCyx5frrg1Ootes616VsM1p+nVSOjHLg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nMjky4/jkVuNpMxy+1LAvTgCMdOIiy3sHFX7eFzvtSnTJD5zJYNSH3jg1FZdT9uyy
         TvxhVy9qiORvyLki5+Fv1ueeBNnXk3m3eMtJqe5Xbl8qHRfNt55m0hErUK6K/sXyLR
         FAXQMOiPMXJfo2ZMDMsJZrCFkQ6CCv9kdaziuxTMaWfC9aiuhKRIpiQeHKOBnqoJRE
         C4idY+DYQdUv/84uUEt7FCQJCRafM29AjE/ocEFUBEEeTN++86+VUTrPP1n5a0Beyu
         tPns9lhNYVV5B8tBPoUJV2v9EVjHOxAYA4ESGl3mcv2A6b6DEEEBuR9Fe4InH3Os64
         ezXguASn58IhQ==
Date:   Wed, 29 Mar 2023 21:07:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: i2c: mpc: Mark "fsl,timeout" as
 deprecated
Message-ID: <ZCSMh9fPruUc9asF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <20230317233338.424864-1-andi.shyti@kernel.org>
 <20230317233338.424864-2-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="azQnxdkb07RFamvZ"
Content-Disposition: inline
In-Reply-To: <20230317233338.424864-2-andi.shyti@kernel.org>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--azQnxdkb07RFamvZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 18, 2023 at 12:33:36AM +0100, Andi Shyti wrote:
> Now we have the i2c-scl-clk-low-timeout-us property defined in
> the i2c schema.
>=20
> Mark "fsl,timeout" as deprecated and update the example.
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--azQnxdkb07RFamvZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkjIcACgkQFA3kzBSg
Kbb6Eg//XR+8KBhM/EycKFGeym5+AioFgLfgu7XUw7izhFd2k0o4cFPyNyv8NnTU
YCHPQpIGtUvlnu+TgdZMHwuWWPSYiBuv+UoH6hJdMAN1HGPbiMZSHV57UsfyL/X/
IaCnP+VVw1pH5N51S9xRPv0rg83GmDuSbbzzrLV1C1tcK9632L6zRlxrcr6HFq87
fxg3tj9ZZUXzytO4U1TV91hxsTlgmPwBqdQ4Z5SUppPe4Y7SaGCCqMR1q1Hz312d
PleJ8UUCEYMzyv3w8SFX5WVuWtBRlbmmSTGLkjS+VdqT40O+hZXzciX5B9oUUUnd
bNyjoq+g7csKfcuZkpTFZqsScNQvhnzurmwLRc7LoEWoy0sqk1bktedj+cKbw9ju
d1DrTleSNUjBwaXXOl6PPiwx4SRD/LvrCmkCAP27gx6gSZ0+MvBZ0cUVx0FD6lBq
TYjoVAOEcXy7hTwmnhTcKu0cjE8q0RWMltWlqOL/CajCGfKBfUrGmd09E8lt293N
p9+QDV0jrJxqxL6oPMoXbdIEAeqx8RTBb1OX3gbc1pfpgAi4E6SdVSZcfFo68wk3
5YJoHY8qEIpqiH7IKtNIlPeKf6pY+36zt3r9WY2E1ivQtZXCEeah71g9dkUkQuph
4Pzsj8dFisTjiLV7oQq0ESQPNiK6LZ+nXGIGKcQwtnnMqDb6Y/g=
=Rlxx
-----END PGP SIGNATURE-----

--azQnxdkb07RFamvZ--
