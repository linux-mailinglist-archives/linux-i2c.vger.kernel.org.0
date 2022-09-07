Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 104E05B0D91
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 21:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiIGT5n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 15:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiIGT5m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 15:57:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5DDA2204;
        Wed,  7 Sep 2022 12:57:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1BE7B61A43;
        Wed,  7 Sep 2022 19:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27A9C433D6;
        Wed,  7 Sep 2022 19:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662580660;
        bh=TnY+Y3ebzbfWHSwTLQu3Yoal7MoTYcO8OjpkAcZ1PkU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XUUkJb9zVlddJ7b9OoYydbtWSahmi+hxl1X6/K0ymbsu1LPCCyBN2PtuQ3i1rGPWW
         H9QF4Xsfwe56KjMs1k5cDcR1y0hCWbOWBC8GfT66unf7ZhVGvKk4D13F8DwNmFGFLV
         l7H6szBuCqqewKB3pyzWUewGg1qJf4ok9QLI4EXHymp/8pWTQbu3SKBTIfxpTBm0FV
         30m7cbKOuOsAt3g8UfgKweda/L7aO3R8PVkE25t4aLIqDaDYlUzUGEFkh5TtMqChau
         2fMaeClwvVSV07Ohq0ljRGhRMup8Ye5glz3AWNlphsy+FTEPAXxTPr49VHC6nDDGIb
         GFJwCzSl2R6wg==
Date:   Wed, 7 Sep 2022 21:57:36 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH] dt-bindings: i2c: qcom,i2c-cci: specify SM8450 CCI clocks
Message-ID: <Yxj3sP6xi7RyCKvP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20220901074218.21108-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0/dDp7V2egPoGTKs"
Content-Disposition: inline
In-Reply-To: <20220901074218.21108-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0/dDp7V2egPoGTKs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 01, 2022 at 10:42:18AM +0300, Krzysztof Kozlowski wrote:
> Document clocks for SM8450 Camera Control Interface I2C controller.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20

Applied to for-next, thanks!


--0/dDp7V2egPoGTKs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMY96oACgkQFA3kzBSg
KbYuGg//YX0JNOT1kilO+XDej6NJxgxJ/yjygJv+iFgDfJLgxVms8jf8WrJc75/B
ckI3XOmV2fVXay0pzs+Kp4zuYGMkXOvHaHnfdhcjWN9DR7k2ZClc3aosh+fhh5qC
bRELl7lRgzJnuYH4SkSWFhJZNMQaxqlq9AmxSqo1ajg7bkc9wMg0q/9KIv5ZXeAU
atw6QDhv5+JJo1v3gWqhkrSqWGxZG0pdLc5Uddd5ENLYCDPQgfAb8ySWjc7TcohR
s7X7tw5/jJARgcjZE99+a5zsFbZlaw/d9vXGV5HJLWTEtwSeVR33zhYAKoQFJlwQ
A02yy86QY6pj8jiCBq6jpdX1puEKnKRjuEQe3Pdr23G+fE3KCSUvl8wCdDCtFTGa
foKO4GHIE8yQBEyCzYdik8P13/8XeCfyw95dvVOQeJEZV79Q0lYX4aEppeaMYLUV
0HNvWVUJ1VZ1Wn0ibzTDBcJVPbGxyTPNM8CK81xRENGvgU/eesZgoevJmCsFtd6K
4vNL3Uz7S/NWnyQRtQeGszPKunqrgahZNl4kXSR9s3b/TfPOlcYYafn1d8vqTrwR
IieGsX91cKv0xKplG6T4f26tltoG/w7m5SvUByv9/1V1xSmXlhaXdcF7fJmwOknn
x6Uy7OxPhH7yHp/c/y0Zc23tPVzIh/Ks+GTFmHlULMJhaTk4/jI=
=3pQC
-----END PGP SIGNATURE-----

--0/dDp7V2egPoGTKs--
