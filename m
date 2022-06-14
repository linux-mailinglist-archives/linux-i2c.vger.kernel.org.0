Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A10954BB47
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 22:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357679AbiFNUUj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 16:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358064AbiFNUUe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 16:20:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D7BB485;
        Tue, 14 Jun 2022 13:20:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 46B3761560;
        Tue, 14 Jun 2022 20:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9B1C3411E;
        Tue, 14 Jun 2022 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655238031;
        bh=/YZ/vfdY+LpkLwFedw1kInlGS37UJrgkhllxkJRhf6Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c72bZ+oCNYTvdU0AwQSmlyiTkpM10TAEYMAsZ3JElFrOEGXaMiEWfqn/XXVHWRX9B
         YiEkV1PUhV8d1tOvMOXuBtfqR78WZH5HWVIP38H13X52lc8LJzFI8nyYd0bv4ZKyw8
         E0ReS0tedlRIKuTWEHcbnQpXhMhOms9jwRWHDNUXkYrBMez5+akYdBkmrdj0zTbeVm
         5IeMUNZKH19mqoaRSPVCDm46iUlL7+/SiZMl9Gc5DaOhxs+QKvFgj5HX9FczzshjKg
         D0HKkHk6FZIA29okuu+DtStfoWifXSKs56G26KXH4aqU4PHWJvBKFS3l6muGeWHt58
         T+Xe7OO7Rxa7A==
Date:   Tue, 14 Jun 2022 22:20:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com
Subject: Re: [RFC PATCH 10/14] i2c: qcom-cci: add msm8974 compatible
Message-ID: <Yqjti8s06LIfTE52@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com
References: <20220522162802.208275-1-luca@z3ntu.xyz>
 <20220522162802.208275-11-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QLG4RjiqBen7yn3N"
Content-Disposition: inline
In-Reply-To: <20220522162802.208275-11-luca@z3ntu.xyz>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QLG4RjiqBen7yn3N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 22, 2022 at 06:27:58PM +0200, Luca Weiss wrote:
> From: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
>=20
> MSM8974 CCI is the same as MSM8916 except it has two masters.
>=20
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> To note, the cci_v1_5_data variable name is just a bit arbitrary and
> isn't meant to reflect IP version "1.5". I'd be happy to change the
> variable name to something else.

Loic, Robert: I know this series is marked RFC, but the I2C patches
adding a new SoC to the driver are maybe interesting already?


--QLG4RjiqBen7yn3N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKo7YsACgkQFA3kzBSg
KbbqbRAAoyyAxbFsgQBm8I5Vx+0UoHw0pUnptb52g5CjmSpFUz3rhcc7nFtAGTRq
4c++op/pMcUHuN53keum60Y0530+cM25HAhvvVY9ggDXuK8Mn2bSHEmC23dHCAX/
whRjzsH9W2BlOukKhiJyg/EGZgGfeDC2HTcddnzr5WSlZksOcxItocYO4d6rl3xf
uQLT6cAzCaNtLP1C5KBd2dQb39kdXrrRcNNeWETL8krJHBQjkCWg2guXJDvPnLjE
b9MvaiZUZ6EMIR+KezE4PFYw6BtlLhH/AeCEgLruK6KlV4muzOIvstnAGGfRgm3u
+EcGebvT3FgFHlqrNF7exFG3ACWJolAaM8ZyehkOKoyA+J+7AINmoKDrpwa33qIE
YygWfUbH1tUBxMfxJ4tU/ranCmr5ZnJCCoVY2Pt64M/yOCldnkN55BUKiL1Gg/Uq
po7+6rbLpWJIlSWeyQWRi9RYDGhA1tc0NI+ptSvrA9e7ewyj9ggVIY7KnnYjXrhE
7YMDeWyowe925c8BW5+E8vsMfgRA6NyHavPiGr0B+aa5eGYjPvBpCxs95F5Tppom
MONwVTNhmCxEqVWQTQt3Zil8AikUFUa5dYVSFt2pUuXMfmYU6kkvZ8kSH7tL7ASQ
uWjlcz4x/fjQZ2Oova/E8UOLv/3eOCu6Zxj/grCDPITArk5ftJA=
=9e2S
-----END PGP SIGNATURE-----

--QLG4RjiqBen7yn3N--
