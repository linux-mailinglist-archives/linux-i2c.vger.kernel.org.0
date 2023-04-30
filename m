Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25726F27E2
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Apr 2023 08:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjD3Gzq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Apr 2023 02:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjD3Gzq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Apr 2023 02:55:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819821FC7;
        Sat, 29 Apr 2023 23:55:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 143476108C;
        Sun, 30 Apr 2023 06:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2ECC4339B;
        Sun, 30 Apr 2023 06:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682837743;
        bh=oD/ecVtv4keU/72Jqxflut5H6NRV4uVmo5+HzUXgrgM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hx+1UwLI+e6ArnnzuOXShKG8eb/QaDxBAdVikOOxRsPthrDdzLo9ISXS2df0afwnF
         gR34M9jjxCBBxqu4UUK42ZJotLA1GQ4GxrOj9b14/9i5SDt8yvIxb34T1PkqY0Dtiz
         8944pj8bxS7bQlZGgu71axmX+ZXBqn5Mck2SF9dbHmnFugwCKVGdLVOINLkjF+cLoU
         PNIs698twO0uhfwSQl5wWJ9m9vB+hvUOhkaBosMmQHdu+MVBPstFwq+iNQHaaMGVzv
         1FGAp9mnwqhjZJ7OBXqG2hUxVqisu52uPSSBR4o49U6yECKoj6HozwONtx/OO2A+yw
         Sb3pj0a5flF9g==
Date:   Sun, 30 Apr 2023 08:55:38 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Stanislav Jakubek <stano.jakubek@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: brcm,kona-i2c: convert to YAML
Message-ID: <ZE4Q6p1tAiIoZo/M@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zDHwp52T3Ba2FuLI"
Content-Disposition: inline
In-Reply-To: <20230426172354.GB2506@standask-GA-A55M-S2HP>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zDHwp52T3Ba2FuLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > i2c@1c000: compatible: ['brcm,kona-i2c'] is too short
> > 	arch/arm/boot/dts/bcm23550-sparrow.dtb
> >=20
>=20
> These warnings are fixed by the first patch in the series.
> Maybe it didn't apply?

So, this depends on patch 1 but I2C doesn't pick up DT changes. So,
shall this go via arm-soc, then? Or DT? Anyway, for any route:

Acked-by: Wolfram Sang <wsa@kernel.org>


--zDHwp52T3Ba2FuLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmROEOYACgkQFA3kzBSg
KbY94RAAorwF1etHBf64uBK/GiYuKJDeq8Go82Bq8J7POjrcJ1VD7iHHECYKf0XP
P203xiHhl4Q4ljGg4UuRaz3LiX1kMJoi/Nj2wiHmVT9HwDXXGQqovyEi4iuLMIFY
19wOKUr43YVTbWt0zNcnUdvd01xJwSKlC85rmhKUvhyq99fE575iPLHYZZ/J+Mdi
QRYu8csXhrqWvv/pKSOI39k4MV1Mwupte+BjsxuzeCavm3+CKMCeg3n7ZFRxN4fY
+pE3eXOwoCCu0kh3P1Y/qEeU4LrkOY7gJ8odBLBOHXM3Sxg4n1x17SaRDcwgHSJR
9c7hOQqapwzjVvkQVE4QYUbIU7A+CfQzc+Cgn/k+u2WhXT4mDlCpWDDBvxgnAg+N
FW0BEFJSPd9n3r4vu5159Pnu2nsElw2S843ack4uOk9v+NJuknZckc2Q48PHGC4U
oQsR6IsEdCjdrcI9EzucRrBEQwTs6l7uR/88IN1yAOQOBwRs26lhUbA79nU18h8C
yPmqp653Y4suGs1nK4uIon3dKOhNPSffjKhEVHHxzrgyZZWDSAQKho7agzWh2S67
GYkthDtmWzTZiSg5t64gpf+4I1/RGmYBEUSgdobLD/nBlTBglgha8hIPmolPWdrY
Ej30aXURBjt/WSxGFBwrAh0o04yUD6vyC/pjFErKt49UZROGkjo=
=q1yz
-----END PGP SIGNATURE-----

--zDHwp52T3Ba2FuLI--
