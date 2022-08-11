Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413FD58FC20
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 14:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbiHKMY2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 08:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235026AbiHKMY1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 08:24:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA6E19411D;
        Thu, 11 Aug 2022 05:24:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5654161389;
        Thu, 11 Aug 2022 12:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02690C433C1;
        Thu, 11 Aug 2022 12:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660220665;
        bh=imOzuUIc7EQ+6p3fVe0hZdP5nW1V/MvoWcIAVWreMKI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lX8rAn5p8GWbniVRQNn+fru2dTZniW/TGmfBD32NoOBdDTCoQ8eI7CLy/NJx5fEzj
         JN4ZuwzkBpP7+hg8GVbIkcRTyrXcL/7oxomD7gE2ly8TsOcRGqV6H6WK7Z+ZERU4v+
         qRjkFChxvLxQXxgKx2jInsWBD8/bki2luAISQG/rk+LQk1eL1IvsHnI325BS33iukG
         UfDkjpD8GndNEZ0WphjXerLbmR5gOKANIw3wJj6sZShV6N7cSn82FgC3lhgGV8eOIq
         KSdFZxexnY7QQa+TJcr4ECb3524wRtxvt/EjobL9IrhYuGDPQEy0FoyAkCYWgq4U43
         AsnmGMUgiQalg==
Date:   Thu, 11 Aug 2022 14:24:21 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        corbet@lwn.net
Subject: Re: [PATCH 5/5] dt-bindings: i2c: qcom,i2c-cci: convert to dtschema
Message-ID: <YvT09UvCAabej09i@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        corbet@lwn.net
References: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
 <20220802153947.44457-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0P50Fl9kCVCqrS0k"
Content-Disposition: inline
In-Reply-To: <20220802153947.44457-6-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0P50Fl9kCVCqrS0k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 02, 2022 at 05:39:47PM +0200, Krzysztof Kozlowski wrote:
> Convert the Qualcomm Camera Control Interface (CCI) I2C controller to DT
> schema.  The original bindings were not complete, so this includes
> changes:
> 1. Add address/size-cells.
> 2. Describe the clocks per variant.
> 3. Use more descriptive example based on sdm845.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Northern patch applied to for-current, thanks!


--0P50Fl9kCVCqrS0k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL09PUACgkQFA3kzBSg
Kbbumw//TC38BvIbLl40+ATY33sH9w9guDGNk3QerypHH3FnlvT0pCY7XaxYPEr9
qx4/39g3kr2BxwNdnZIQoxbaJKsyQ399plHlzCXXquniJlGuHulX8T1CE4faTKwo
4vkzZPCMFMZorCNosW9YpCpgO0VOucipzLnvycK4DFJ32e4DE9M0ozIV6nRpE5kw
0xDTIzjTcZmgzj+up2Zux7x5EmStwnFBSR8/U3izFVonBJYiXdfTAdCA5hJInzDi
myArCjy2bRqAp0C7ikKtoRpPyr1vDK2B883Ad7Rxe556H20jDVq9m5UkdLqmybcJ
bGBKpfOk0RQLRpPzMnK+D54f6tcu2k7Qhgnkx9nF/HaSgpR3EtKEy/f3svMJZkAK
ZuTD52VisOXORd5kMb6uYLc8/6Dnq2IX2IxGsS9h19r5crtKUN0JkojFubk0x3EV
AkV+69sDO4Gfdy1G8plQZdth7KZmUxcT7xQFjqKAsZdpl3dtEmDrT8yoQEc2RGI2
L8hUZh8syTIp1Iy6tQObRqJznpnF/aRQd2LzkraaJvGJgLom3E4HFFLgaW8X5Qd0
nPpx8EAFwj7nxtPvxzNmWv9hEXc8QOVKyAY25SpFmaKIeRO3ILzgNtUJwSqSAMuN
fvd6VTgN6iTuKIMFvLLhQzSgGjyzgGojEFsWKMV8I1vYU8FHgLA=
=/CAh
-----END PGP SIGNATURE-----

--0P50Fl9kCVCqrS0k--
