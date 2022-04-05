Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE2D14F30CC
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Apr 2022 14:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235070AbiDEJBF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 05:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237435AbiDEImT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 04:42:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B296DFD8;
        Tue,  5 Apr 2022 01:34:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 05FB7B81C69;
        Tue,  5 Apr 2022 08:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF981C385A2;
        Tue,  5 Apr 2022 08:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649147688;
        bh=4XsjaIc65o36nenn0M0g05jKOtk3s8zw5Dx3i80XzDo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nIMkJh4F1Ru2uHOWTdk3Ub7ZnC8ciPaZrykmVJ1I2q2sP0X3j9CXFus3/DK0ps8os
         XAZxRHDV+f6AJF64ebXoyE+zjeT2GRp4y1XwpohWsUCkwryWwUG4Okv+RKQOrzQhwT
         V0rA/NVSwMhYlnZpb7u8/DxImyVTJuNwvWOleJFuySCn7OiZcxKpLIN24EQWoReB5A
         INzwg/wDG7ZIP8de6D4V1oht/N4bofoYtIbc424bu83hDPOM9n4Mpdwoo/W13/Kt3l
         SI+opvrXRPgTXGyEDyLybZBV9ZlF9Z9VfXikE4dDNBb2NM4C2gQ8izOWd6Esl5VgOR
         g9J1xHFBWt3UA==
Date:   Tue, 5 Apr 2022 09:34:42 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 6/9] spi: dt-bindings: qcom,spi-qup: convert to
 dtschema
Message-ID: <Ykv/Ij0vfa522U1F@sirena.org.uk>
References: <20220405063451.12011-1-krzysztof.kozlowski@linaro.org>
 <20220405063451.12011-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="31zrrUV1FaGH1h1x"
Content-Disposition: inline
In-Reply-To: <20220405063451.12011-7-krzysztof.kozlowski@linaro.org>
X-Cookie: diplomacy, n:
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--31zrrUV1FaGH1h1x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 05, 2022 at 08:34:48AM +0200, Krzysztof Kozlowski wrote:
> Convert the Qualcomm Universal Peripheral (QUP) Serial Peripheral
> Interface (SPI) bindings to DT Schema.

Acked-by: Mark Brown <broonie@kernel.org>

--31zrrUV1FaGH1h1x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJL/yEACgkQJNaLcl1U
h9A/MQf/dR244fROGWKBmRdYoln9hA1KEb35uCYhV3HjDJrtwjBsM66RevDfdbvW
6uTpWmRQCr0pbF4p6p2f+aMGqITTilSymfiEqaKEX5aqdM0ZBKdbEUYBW/mem7h5
b/U0H2fHPKtn0nsUvT/BrRM6UFwryGxhncAbPROve+vMJSK61FcgqsnNXpFvvIAj
BA+gDo0v8fhh3aehenqkcu0Utwnb0cgxejKtpzQI3sR8WfQVBMHiVVMBzkFt1wsl
lipVXiYscO5DA3iVJ1J5rIJVqRR4Ht/9NwmP51OO61l7UODTzOlqt57jhrNZEdxk
+DqWMnawtWvfQdhAUgw/RolGENMqfA==
=T9IF
-----END PGP SIGNATURE-----

--31zrrUV1FaGH1h1x--
