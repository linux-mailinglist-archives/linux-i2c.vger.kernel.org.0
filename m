Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2809E4F3540
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Apr 2022 15:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbiDEKcQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 06:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349268AbiDEJtc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 05:49:32 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDFCBE0
        for <linux-i2c@vger.kernel.org>; Tue,  5 Apr 2022 02:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Bfwz8y1D94kMO0NGJwC/qIDtqe69
        /v7hVn9ltcVOOLk=; b=3fz/f6TTSAA6ubzJLmWhDyPH0xB/bI6vdo5YRouQJ0e0
        u0sKeWDz4AE4jjfGDw6X6E2939FpSF5FuGHyHvsoARv0i8aI8TmCXReeZiE6wBAf
        yTHBNTpSWyObbHHGo33bzFH5xT3Y3XHhVPHnoWr+kIF0+Ix2DqgcQyxf+G+4m40=
Received: (qmail 2236509 invoked from network); 5 Apr 2022 11:43:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Apr 2022 11:43:29 +0200
X-UD-Smtp-Session: l3s3148p1@W1XIE+XbQLggAQnoAHlrADXnfPIF6sP/
Date:   Tue, 5 Apr 2022 11:43:29 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2] i2c: rcar: add SMBus block read support
Message-ID: <YkwPQSPed18iyHox@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
References: <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>
 <000001d7badd$a8512d30$f8f38790$@mentor.com>
 <20211006182314.10585-1-andrew_gabbasov@mentor.com>
 <Yg6ls0zyTDe7LQbK@kunai>
 <20220323215229.GA9403@lxhi-065>
 <YkQ31VMqj1MXqBd3@shikoro>
 <YkQ6XRITOFZ7hLXV@shikoro>
 <20220331160207.GA27757@lxhi-065>
 <YkcqoIMF2uw4FSZh@ninjato>
 <20220405093048.GA7151@lxhi-065>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RrYwz9n59qpjVHlS"
Content-Disposition: inline
In-Reply-To: <20220405093048.GA7151@lxhi-065>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RrYwz9n59qpjVHlS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eugeniu,

> The idea was to push it to LKML, once/after you are happy with it.

I see.

> Thanks for the precious feedback. We've requested Renesas to revert the
> obsolete BSP commit, based on your recommendation.

Thank you!

> In general, the Renesas kernel always carries a set of patches with
> non-mainlined changes, Fortunately, for i2c specifically (as opposed
> to other subsystems), it is narrow enough to not raise major concerns:

Well, yes, that shows that I am mostly successful with reporting back to
the BSP team :D But some are still missing, as you can see.

> $ git log --oneline v5.10.41..rcar-5.1.2 -- drivers/i2c/busses/i2c-rcar.c
> 6745303b2bfa i2c: rcar: Add support for r8a77961 (R-Car M3-W+)

Can be dropped: "Driver matches against family-specific compatible
value, which has always been present in upstream DTS"

> 3422d3131700 i2c: rcar: Support the suspend/resume

Already upstream: "18569fa89a4db9ed6b5181624788a1574a9b6ed7 # i2c: rcar:
add suspend/resume support"

> 5680e77f2427 i2c: rcar: Tidy up the register order for hardware specification ver1.00.

Relevant parts upstream: "e7f4264821a4ee07775f3775f8530cfa9a6d4b5d #
i2c: rcar: enable interrupts before starting transfer"

Other parts can be dropped.

> 41394ab7420f i2c: rcar: Fix I2C DMA transmission by setting sequence

Upstream: "94e290b0e9a6c360a5660c480c1ba996d892c650 # i2c: rcar: wait
for data empty before starting DMA"

> Thank you for the review comments. We are still working on a cleaner
> solution. In case it comes from you first, we are very much keen to
> give it a try on the target and report the results.

I have a cleaner solution quite ready. Give me another hour for testing
before I send it out.

All the best,

   Wolfram


--RrYwz9n59qpjVHlS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJMDz0ACgkQFA3kzBSg
KbaOhxAAoI0omHSuhycLfshFJ6BI5W7Ur+QhwOpvdww1A0/conrlyXCee3HawtyP
MPA3WP8MFSis50yXz07zMkGvhvrHpqFaEMlxSikXCYn08yf4lBK0WwiGh82FdrJs
Ar6DeylyG+NRBQpd/l3YZ3YJPVlqXfqUOsKPfmeHR3oUrnrEfzw4uk8P9E4oUvsT
Ntz66NY9uEdcP+c2/RM/8aRhI2/ZLBH+HfZJb62WswsH/w8pQceuVRvzXEG0F1jy
U39QWRL2wFz1NS+Bs3Nf/oMhZzBqLtY5p0ByzAOY+sxfr7nmCQDeXZtEHXWJ80uS
vF89pAGvlMDZD8RUBISIihjsEqcADoad8qj3MSBG+Ln4RGOf+vr65D92CquOA5W0
zgEUZ3UBt1x38F/3ka6O6LgpLpna4goJ5A7vVvAXxLUEh/7F4y9hmiUDU5oHlyT8
dnnPZR8yFiE8MxOU7Zj6WETYRopEe2JCvLWHlUwb6pC+tFPfRPCYjI5u6ilgos/w
EMgpPR6YL+9ujpmF1Ep057yrTcxMyiYmal91TD3CWzpCPXl3yJU9TdA/Q8XFsRyB
QVjgdDX0cHyeMAn5wLw4ECYkl9yl7ZcIrTI/ZuZF5YN/8ZHaSYxbGrAMbtrH9Uve
cTIcee5hrXjceaJdMSnz1ObT3/VBABHHzZdt3crgpi8R9TkJts8=
=lfpu
-----END PGP SIGNATURE-----

--RrYwz9n59qpjVHlS--
