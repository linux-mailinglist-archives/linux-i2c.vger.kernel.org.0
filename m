Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFD56F5B5E
	for <lists+linux-i2c@lfdr.de>; Wed,  3 May 2023 17:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbjECPi1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 May 2023 11:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbjECPi0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 May 2023 11:38:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D67E1FDB;
        Wed,  3 May 2023 08:38:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2756160AB4;
        Wed,  3 May 2023 15:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE110C433EF;
        Wed,  3 May 2023 15:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683128304;
        bh=LyAC9Uzz/+b0JzmwQtT+pFnyz2N1dBXrPdiGGOjCDNg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lp2Wbu726JEDxrXLhsme63CEQx9vUgzOGVcoCc9ADitNWS2ijVUMRLrQ4FP3Awjna
         xgzY/IGaN+vUx5/WQt397KYN7kFr8uphMh1UqJ3T1Kpe5XmgR0iO+kjJASTbVdyM+3
         zBmXKaGNs6b+zZ4q4jqSTC2BVR14b0q7/o1kdeXrCraUp9YvNTEjRbFNUGjsGWd+vn
         114m4PlJXHHHUf2mixib9ROTW3yFDBJo7oXd2z7wpaU9z0pEQcff3UyU2QuOgB3FGP
         8EwytdsAFrmMW942iAIvMqCVl5WzopD2vshY86uJBf21mbbhXQtL4TUf/DpDJX3fCc
         UVORci/k8drOw==
Date:   Wed, 3 May 2023 17:38:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Stanislav Jakubek <stano.jakubek@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: brcm,kona-i2c: convert to YAML
Message-ID: <ZFJ/67UgNRmB44HT@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682252615.git.stano.jakubek@gmail.com>
 <72ba28004afb733224f7294a146fc2a6a5a834a7.1682252615.git.stano.jakubek@gmail.com>
 <168234258850.2489090.5138716439435477956.robh@kernel.org>
 <20230426172354.GB2506@standask-GA-A55M-S2HP>
 <ZE4Q6p1tAiIoZo/M@sai>
 <d10e48cf-3cf8-89b7-8741-260adccfdfed@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="azXWXr9cX0NZ/8VD"
Content-Disposition: inline
In-Reply-To: <d10e48cf-3cf8-89b7-8741-260adccfdfed@linaro.org>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--azXWXr9cX0NZ/8VD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The dtbs warnings - if fixed via any other pactch - can be safely
> ignored. They do not affect bisectability. Please grab this patch via
> I2C. The DTS will go separately via arm-soc.

OK, thanks for the heads up!


--azXWXr9cX0NZ/8VD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRSf+EACgkQFA3kzBSg
KbYnWw/9G1lwulnAIeVChE4f9/tIeNApXcZYGou0kOV8iAAKIoD7rHyI9O1og8JX
CIK77xo6TZFk2aqbuKhZ88g6nf6m2DNuSRoADweRwhWJNEKzctudEEQ6qUM9ijh8
ql0C/SVacOP2CEO7FhGO7dwTjqtxH2VRJNvseoKawtrgFc7A/2VGZccZFJXNnYZJ
K4+jHiI8lGfzBrXtRc3MMa+gtyjn2cFz/j3RwntDwlfi/vtjgs1+MMGJqNAGX2tn
wTV7fE7qUASlBMxQN0Z/VCCoqTzn8dy7lvgoNJ0NqPLfuO16a779FJejS2b3jaeb
m6+NjDFAmyMT5G1KO4AXSBZb63paL+VQE8LeQVxPATYlHS9dyxTYr3t4I6T0Taqg
sIzThlFkrjNuGQ+6uXX2pCTtqWonGeV1U4LUGkiCQzSny+89hdG8ItXOe9clKQhl
n+6TLwG3gpbQnQmFyDlq/fb0GPQcn8dnxVvDru6ojqpnCEbVXWEUsa6WAM0khNXO
PReAyHriVCGnPQAl48oPpe7Qqt8EiiZHs2himY68/YstYe2V5pYvMaIBqFExTHVL
yUSev1ywjXPZT0yrJry1lWqur9+YvKXCJqAg0lM5nmOoV5GNYqlTCHWSC6uM4uMP
JhZQh960Vfyqn4so1DoVSLAhal+Tdd4WngP6tZ2rLEYWie0nddM=
=tfLc
-----END PGP SIGNATURE-----

--azXWXr9cX0NZ/8VD--
