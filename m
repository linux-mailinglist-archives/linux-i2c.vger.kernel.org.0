Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6103F50307D
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Apr 2022 01:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353187AbiDOVNL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 17:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352683AbiDOVNJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 17:13:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7D95F4C3;
        Fri, 15 Apr 2022 14:10:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D0D5C62062;
        Fri, 15 Apr 2022 21:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7711BC385A5;
        Fri, 15 Apr 2022 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650057031;
        bh=hTD0B/ky7f7FMFyiSVk17MG8LBketxa+tXJ+WwagC1g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V+FxkMidGJVAMy8I8ZjU6W8unLIAGmCTvYPYwvI+pK4/rM0YNTJW1TKzvt6ORzSWa
         mQpvM9soZMhCKWU1pOvZ42qHdtKCNBui65twYoY8Ttu9T3j6CTq2iodxZVaCd5fCVD
         lVD+UL20Kn5WWZznDmjOGrvyFXRUcH+/OzhwB+OrIJHzobJ8ADZuvdNt/b5kW1He2Q
         LwhYAhGCxk8hXsRxWuCLoSG9IHlgDmdyLVsvZp3NT/GSBtqZHT1LUlGMam5hj8oT0V
         RNWkLSMYcMn0MvixDbRz92U/EYpvfYTraWaY3UHAVubjOE0Yj8jP6Ek5DP2XbmWHrF
         NyaLjonPuHaEQ==
Date:   Fri, 15 Apr 2022 23:10:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 8/9] dt-bindings: i2c: qcom,i2c-qup: convert to
 dtschema
Message-ID: <YlnfQZHLW8WiL6ck@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Rob Herring <robh@kernel.org>
References: <20220405063451.12011-1-krzysztof.kozlowski@linaro.org>
 <20220405063451.12011-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jS4lqlkeTSJ92k82"
Content-Disposition: inline
In-Reply-To: <20220405063451.12011-9-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jS4lqlkeTSJ92k82
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 05, 2022 at 08:34:50AM +0200, Krzysztof Kozlowski wrote:
> Convert the Qualcomm Universal Peripheral (QUP) I2C controller to DT
> Schema.
>=20
> Add missing properties: dma and dma-names, pinctrl states (to indicate
> support for sleep pinctrl).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--jS4lqlkeTSJ92k82
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJZ3z0ACgkQFA3kzBSg
KbYVrxAAonu+vXUa438r37KHxJshUk6l4hKBEmIN1TRXQcNGgQarW4PerP6LTuMy
m5uxa+qeLb5qC3ZmyKCmnH/Taqwqf/cE/BhVRWj4rIVwD9UcKRu/d3T4RguiaRDb
x4Kmzh/GlYHVMDois2VTMldHNlbbXyy742Yy+mEC3DxlG0Q6gN1RMmpl6idgXCRy
QTfS2+RWeqgC1wszBVSESN/sc0lygLP6u4gXwhtgXeoJSlvHkQ+PbcX1FpAPfxQQ
8NJBbSJ/5m2jv/+2/8oI6yk3FnwzR55z0Gvw5UtyRxKFg1XbVrvTxqWULQgQsW6A
Qh4aQyfSE2XTAkSrdr/LW5OBkPyIH3E4Cdul0g162oKmq8uzm1c/ULqRCdboW6vS
NP1MpqZq+Oi5AzecxZCldN0/KpoGHRSQ5tfkaoMyBTxbhYc3xaTRk0HpTVmsTO36
tESXEBbJ7m/+37KKa3rE36rV1lvKVuEdy0+pq9xlhRORgkeLe5xnYcHGyG+uK81a
+aoPYdbH0yAfUPfrfnK3XVEnkzz22OnSySf7hiR6Pmx5UBxPaDwLtmUGbLbXti3y
lG45x3HrVOScvZT9fUmpa7CN8rUSIj/3VazkefX8nqD3t7bwaY+qSFgAbnWlI/iM
RlaqsxsXhbeD1ddus3rSAQXCGuPwZ2a+5bKmr4EJmz2Mr3Oh7HE=
=BQnm
-----END PGP SIGNATURE-----

--jS4lqlkeTSJ92k82--
