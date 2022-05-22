Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04D285305BC
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 22:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347770AbiEVUJq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 16:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiEVUJq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 16:09:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D814C3632D;
        Sun, 22 May 2022 13:09:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 83C34B80B02;
        Sun, 22 May 2022 20:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606B4C385AA;
        Sun, 22 May 2022 20:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653250182;
        bh=5mvMD8PeuzewniacwEHPb6i08ZXSrJgyrbjHN+zLXvo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y9+Jk+4dRba0T68o3Xji13zINRlcHq3We92wtyMOzDynsqze7islOUS3w7w41+ocg
         feDqnn7mM79WHjfXL1IZeQpc1RoWUtZ0s8cwvch4/iqFI9zKtNXUYrqSh2s8jZL9qi
         am3kj3a1b5tbWL5ySclsK7CczRk9unC3YuHtdB8vCX4G7fm3MBwqQv/2xUT2m1/TKK
         E0Em5IrVeShA1fEjlP0GynIf0WXNeWFg13k1K/nWTMjQwiHT1Rs9RhIzwpBRG/TQ0i
         CV1o7q5wPBhp8gwBOvKhYY0dkH5d8hLb4bHclHwqb0XWVTw+KwRqgtgwNLUZXOjN0W
         krLroMeCX6i1g==
Date:   Sun, 22 May 2022 22:09:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
        rafal@milecki.pl, sven@svenpeter.dev, jsd@semihalf.com,
        jie.deng@intel.com, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 08/10] i2c: npcm: Remove own slave addresses 2:10
Message-ID: <YoqYf0KdNEabT7Mu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tali Perry <tali.perry1@gmail.com>, Tyrone Ting <warp5tw@gmail.com>,
        avifishman70@gmail.com, Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
        rafal@milecki.pl, sven@svenpeter.dev, jsd@semihalf.com,
        jie.deng@intel.com, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-9-warp5tw@gmail.com>
 <Yoh/nEYPu++LZSvb@shikoro>
 <CAHb3i=uKwe1RdvzQA=oO6zNmEvyA_awx09+C2w8kbRq_NGi54w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ADMt7ReWlnMJvaGx"
Content-Disposition: inline
In-Reply-To: <CAHb3i=uKwe1RdvzQA=oO6zNmEvyA_awx09+C2w8kbRq_NGi54w@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ADMt7ReWlnMJvaGx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tali,

> So when we encounter a deadlock with this spinlock we decided to get rid of this
> unused feature and get both a stable fix for the issue + performance benefits.
> We work closely with all our customers so we know that this HW
> feature is useless to them.

Okay, fair enough. Thanks for the detailed explanation!

> > Why do we keep this array if we drop the support?
> >
> This array represents the HW so we left it as-is. But I agree it can
> be shortened to one\two.

Would be nice, I think.

> OK, we will move the last two to a separate patch. BTW, this change
> appears in the title as well.

Yes, but I still think it should be a seperate change.

> But now I'm not sure: if you already apply for-next patches [1:7], and
> we change patch [8:10]
> do we need to re-submit [1:7]?

Nope, they are already in linux-next. They seemed like good fixes even
without the support for the new SoC, so I applied them right away. I
hope this was okay.

> Thanks, Wolfram, for your review!
> Much appreciated

You are welcome :)

Happy hacking,

   Wolfram


--ADMt7ReWlnMJvaGx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKKmHsACgkQFA3kzBSg
KbYIFQ//T8e9vEjUkF1e/qapo9hAzPMaLW6dsVuIFb2K9pfQQMmA8ZZsG8Lp2uwP
MdHX2nnZrtHiC9oMo8CshGv5yK2pGsZOqGBdEqyZ2/VobZYqXRzk4iaTYZMXsP0z
NedO8w4D86f09sl9iJXUdAba21fEjsJusZsOSkctsLCOXhCWPO3uPTKAQB6pB14Z
9PKs4E6UVDA9VDLo9FllxLjVOecx/A95l+0qpyjiQxtWKWeFi6gC6zI++LJ9aboi
5qoyXIQleMJvOMjm0uxWRT4LeVog9uVp7+LOTo2C24QIn0LCM//NVcytIOonx7Zb
80fATJ4mrpBBICLdd4Hy3lZV8BnpxhPeh7Iq913fkff6B3H7Y/CleHGPIvzEKgaC
YICyGbtAKHh9rdOQimoqjRnks1E8EesgzmGxSMz+ySNgP984vXURsaJSF4Roz2II
9hJC+FOEeAgPyGbL/zEVhbitI723CqOg3TKyfv5tV4WZVFyRQkFNLS8If+fDziD8
B//2/6LuFiZREGASOKSqpXC8hDVutEZWvHOjjjpivsVZ425QdC09N4BQ+SRgzlMQ
yrzDygQrqSkJILWh+K+MMx/ArQO8FF0O2LVI8b8ANLMAhxfCaDGNesK4R3DR4eLo
+FZ09CL6DcX7nu9XMAu6qammXWDwcPK9dBaRA9oTPPq7+JM7YWw=
=dZim
-----END PGP SIGNATURE-----

--ADMt7ReWlnMJvaGx--
