Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD7B56ACFB
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 22:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236581AbiGGUwV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 16:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236533AbiGGUwU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 16:52:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA15C2CE06;
        Thu,  7 Jul 2022 13:52:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3AE01B823F8;
        Thu,  7 Jul 2022 20:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24291C3411E;
        Thu,  7 Jul 2022 20:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657227136;
        bh=C5j6BsRufj9BLbgYGWTFLET+b6juH4piBX2x0kDV7/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CW7f4s6N8sTBE7PN2cHRx95/tgRe9oJUJaYXaliWJPEWsu4rFJxhayz9fwhdHQTve
         qwuz7HcRg9Wv/wntzMb2+LF/WF7EI0g4vEulpY7fZYrQULMZgINQaZipwbJmHFQlwp
         sH3uNGIxffJGTuGr49ybp8zPM7AchQ3dE8HxFTqgsyUXJHBCSyLDdVuejfNnMGJTbV
         6VMudIrIrM8COezsWmeIeedBxhCT79dEGeLI17ICfgSlH+V30/gYIecSIqsrweTmfe
         9eWQ0VTfrAMZHpPhvIsyhogvAJa0DMrvxW2c+JG7/gY9boXsGd6GvOBRZkAOd+cnGn
         LwCglif9kezSw==
Date:   Thu, 7 Jul 2022 22:52:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     William Zhang <william.zhang@broadcom.com>,
        Linux ARM List <linux-arm-kernel@lists.infradead.org>,
        Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
        anand.gore@broadcom.com, dan.beygelman@broadcom.com,
        kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jie Deng <jie.deng@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sven Peter <sven@svenpeter.dev>,
        Tyrone Ting <kfting@nuvoton.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 5/8] i2c: brcmstb: bcmbca: Replace ARCH_BCM_63XX
 with ARCH_BCMBCA
Message-ID: <YsdHeR5JexIjgoUk@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        William Zhang <william.zhang@broadcom.com>,
        Linux ARM List <linux-arm-kernel@lists.infradead.org>,
        Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
        anand.gore@broadcom.com, dan.beygelman@broadcom.com,
        kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jie Deng <jie.deng@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sven Peter <sven@svenpeter.dev>, Tyrone Ting <kfting@nuvoton.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707065800.261269-1-william.zhang@broadcom.com>
 <20220707065800.261269-5-william.zhang@broadcom.com>
 <c546adbe-482a-1fe2-039a-b5780a0fdbcf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/pH9AIyaXjkzaF7l"
Content-Disposition: inline
In-Reply-To: <c546adbe-482a-1fe2-039a-b5780a0fdbcf@gmail.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/pH9AIyaXjkzaF7l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Alternatively, we can merge these patches through the Broadcom ARM SoC pull
> request(s) to ensure they all land at the same time.

That's what I assumed (and also prefer), so I acked the I2C patch. Let
me know, guys, if I should pick it instead.


--/pH9AIyaXjkzaF7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLHR3YACgkQFA3kzBSg
Kbaj8g/+LWgKrDdaU+VhuMnNpy+GStDWvwNnnOT2vnY2AdmtpOQoi27GeY2aPPGY
ldPJ+wWwcKWTyNSbwGDxKsEqC4Yik+Lb4v9RmQgX7VSeGJ3JxBYPNGf9nr0Cw+Wz
mlrHo2Qvsj7MiVpNVeSaj6kVeD2O3+8Yq5o0zTf5i/xUECEwwgsQy88sLmKS58dF
fr2J6Vh8Id9H/l7hlimEFhXfBJdVOjaH6R+eniQltzEoLWkbYRQgosNFgs6FJMXm
Q1T4aqriOtuTVqvYCWRuWDkUYVsJDayx78C+GExrKJ7SfTmfsvkk17ypOBGHRZkg
7Wjja7z3kQKeHQAdE7THoFr9P+LTkXRpNEiGFzWT5h7i5LWvxY2nD4qHT/XhEWhN
Lg5TwqQzvDJTgd0PkwxYm5jaBLyiBGVqdB3fWMhsaEd7ribCTDDL6DbDo/ySX/3h
YeJmiXqYBTMDnKqri09Ob9bkgpwX8EDkfZjxRGV/xMWudfzJ+UsbynGMEKnLQGpG
Ue/Q9iKiG7f2D484KviB5ATOVZiIt6Mk9ONqT4nF9Gi6gzL4FboPGaUZlQkJrAGJ
wQGOBasqMkkbawxqfB5l4kHLqReSjGGAJYepjo0XgSX7g5hNBkWDkDkRiazo1CNe
RicROp9uza9pLj8D3+ZO7lt/v5pYIqNr3ijptK7im+JemMAn6dk=
=fp9m
-----END PGP SIGNATURE-----

--/pH9AIyaXjkzaF7l--
