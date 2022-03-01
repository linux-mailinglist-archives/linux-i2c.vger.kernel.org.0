Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3622C4C94B0
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 20:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbiCATqf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 14:46:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237261AbiCATqe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 14:46:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648096D182;
        Tue,  1 Mar 2022 11:45:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0D3F0B81CB6;
        Tue,  1 Mar 2022 19:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0303C340EE;
        Tue,  1 Mar 2022 19:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646163949;
        bh=TFMpz0Cc6VsyzxJzd5ZFpb3OuNzOkVyn05Sx0dNcIGw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FNr+IE5SdDf1bVYHRNpW2iGCJwTS6U3t1T/Cv+jDQdJzR+IPaauMFsRRf3dhMADh9
         DC/Uj5WTJsPUMXmTvZC3EDLttaXsfz3ScmITAV068+6AC2DmnKaVPzg/TquS4u0m9R
         nzK6CpUe/uPUPsiwytzl1Da+4vEmDtxJFRh/e5LiBHASSxfOd4lmFlL/CKcMQWs6sf
         sarU/6MgR5i62e63aj38JxPVdwhVGCWDs1P5zDvLaz1IBUPBSD5i1V9jXJoANV0Syx
         XifgWSYRrEsN058FteO2k7Oz8V6hhbuhFXbPjgXNFLe5BjJCabxIBOWVoJVh/as34b
         1DZZyF/cXEdQg==
Date:   Tue, 1 Mar 2022 20:45:46 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, semen.protsenko@linaro.org,
        yangyicong@hisilicon.com, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, christophe.leroy@csgroup.eu,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        digetx@gmail.com, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] i2c: npcm: Bug fixes timeout, spurious
 interrupts
Message-ID: <Yh536s/7bm6Xt6o3@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <warp5tw@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, semen.protsenko@linaro.org,
        yangyicong@hisilicon.com, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, christophe.leroy@csgroup.eu,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        digetx@gmail.com, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <5d507fda-525e-4064-3add-0bb0cc23d016@canonical.com>
 <CACD3sJaXeWLu6=oLgxJcU9R+A1J+jB7xKaGcDFwYxof33yj17Q@mail.gmail.com>
 <5ce0f6a6-4a5f-4f25-3cc6-ab0f24bf15cf@canonical.com>
 <CACD3sJaWJMFgwzQgrHFV0KkkbJXzhgFx=umywxSrLszwP+hO2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZzqmmcLTueXK0WfW"
Content-Disposition: inline
In-Reply-To: <CACD3sJaWJMFgwzQgrHFV0KkkbJXzhgFx=umywxSrLszwP+hO2w@mail.gmail.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZzqmmcLTueXK0WfW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'll keep old code as fallback, if getting nuvoton,sys-mgr fails as
> you point out.

Yeah, fallback is much needed. And if you implement it, then you can
also split the series into two. One for the DTS changes and one for the
I2C changes. That would make upstreaming a lot easier.


--ZzqmmcLTueXK0WfW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIed+oACgkQFA3kzBSg
KbYcjRAAstcatZMriO8WYTkR7iql0Ykgsnc04dKlPRr6iwYtoyRTgOApX1Jp31Jr
CbI0tKJgBjEwGrrXzkkVP02QIM9ojCZPXIrdV/ZmQ9dgAB3c0xfZ2uEeHAC+iv2p
bx63ccy6tbX6UfFu2FeuS5qmYctOTNu4G0OghUErbqA3JlqSQHXaNIQEkFoL1iiw
anPSYCvvBFJk0DELigsYqEMMuXVtfA+RrmfkMwmTjM1FDh9Q4EsiwEJTdu9Dajjt
EYsNX0CTIZt/54jiBsgw1Y+9YYPOzk8vCsEn4dWYLYkb5aivX/jiuUupVwOI9Dsm
FPQJB8CMf9kyD4awOGCzmjtUDDIlftz7+egbVr/P7ra1vkWiUWLuVtwLjIOmQ02N
sekEy/RBJpmbPCY+1sMqWVkiz2Jzh0ZVNraPw84W9A/vImdz5eUO9zUiKYAmc5dk
UqH4DNFXSUz1HXiQV0MFvMErR3BvnHo0aW2Yex0g41iEVVbt3NegzgVmCnQbvxWO
8aqTaho3IMK6R9qprp+2m/F81hFYJmaLYG6axoMB6dRfYN0VJf7VY1fqOs4jxZVV
poVwHHWgBvFFi27Oh3H/RZ+IaYwY52BOW+4953toW5pRMpXLj289svrTCIzToyGh
f9P2fQeuCBeyiaplAlyxPbk2TdSjl8q2pcGcXzJdISRO8u4/In4=
=ueuY
-----END PGP SIGNATURE-----

--ZzqmmcLTueXK0WfW--
