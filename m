Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E99A607065
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 08:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbiJUGsI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 02:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbiJUGrx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 02:47:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25736242CBF;
        Thu, 20 Oct 2022 23:47:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 83822601D2;
        Fri, 21 Oct 2022 06:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4E2C4347C;
        Fri, 21 Oct 2022 06:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666334869;
        bh=r8oU8iN1SGiDyninGJJEWFE66Ye7/JYq//V1dSgNaKY=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=Uf2ILtBPUZ6s7Hugq7rwIzSyv1zmsNdMxu0oC1CHKGY3kWO0TOkUvoWRPaClAZOt4
         TSrPCOaP+m1wtXvXBDB/eriOEnqVWKp1yciPQDmE8M+jZv84fLQQvJsj0cjjASqAx9
         kpTmclYHCnT6S12vMQ8UhNuTqNTlEcNEmx477z9vj6wu3B4+wGqPM6eHiJNvLuPx/c
         Cocow2Xf/kf3T3aBZ+qk1DXTVhjxdu3FDnfc95FjwGdrt9JTjJewQdCKxDyqwPeVFZ
         MHm7wCmPvY1sfWdH0XdrvUpAkw584KvL3TjNNETh0/1UiedNAvB3T0SwM1fPj1SZGC
         TceGjSOMz2rOA==
Date:   Fri, 21 Oct 2022 08:47:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Adam Borowski <kilobyte@angband.pl>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] i2c: mlxbf: depend on ACPI; clean away ifdeffage
Message-ID: <Y1JAkptx2esnE5BB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Adam Borowski <kilobyte@angband.pl>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <S229853AbiJTWkg/20221020224036Z+12888@vger.kernel.org>
 <S229897AbiJTWqk/20221020224640Z+957@vger.kernel.org>
 <Y1I/hRG9XGTFDTr3@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qjmFV6esX/iMIQ4i"
Content-Disposition: inline
In-Reply-To: <Y1I/hRG9XGTFDTr3@shikoro>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qjmFV6esX/iMIQ4i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > Fixes: be18c5ede25da39a0eda541f6de3620a30cf731f

BTW this has to look like:

Fixes: be18c5ede25d ("i2c: mlxbf: remove device tree support")

checkpatch will warn you about it. This time, I fixed it for you.


--qjmFV6esX/iMIQ4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNSQJIACgkQFA3kzBSg
KbbWjRAAjQyHW7RhKonJluwzTyVOjPXrwtB3Yltv/wgrir9XgjTVR4w2b2OVC+3D
8eSGSdxVNCkHNQnR3B9fmw307QGSMwa9q3fF4fJI6wLrJu3ifOdqApzzUTf4KACc
TAo7AsC5tfhBWSHIpOlUfFlVSyLVZIJCj549EZ/EYqz8hdsLgm1iVpSOLNoW1u0r
2LXJJyAc5LTontpw7wLGu7sAKcoj9KDymfTGCGlYe4u442xiPGRmjgzXk5P/Uffx
FBXJXlgHKrPPA2m+hRI+cbD8W1tJASfQhVNIj5NqdEATdrjsGhdpTj6ssLjzkKlm
/ixJqgfP60n3UmYAHEXvyjkMznLcHUXDmSmYsZadnlyRhK4p+/uexWClmHJ0Lqw4
VPkXoawQNeIswxebNZntagLWeoosqaEZd3QyfvyYXRi716uq57blN72WDogw3C8K
uIOnuVicySdXjrZn+QjtHgpngPbCFE1xATEcxeU2YnapF1VF67HKPpdlIP4OiFko
roqVqFAjT8asKsBKLeAlvAIcKqNdM3B5/y11S3eCzlRNyZ4Lq0MOfijgM1KA/Elm
00/Xc3O2X+11Zw05Jq4iWF2Z/30AJwSDOSDo2zbZdbGz4ToJ15BFbJf50+8Uzxyj
C/knEAEVpdlQhyvTbYIbdjE4FDJWHiBoPRKRJJWD6hjausv9oxs=
=Ho5N
-----END PGP SIGNATURE-----

--qjmFV6esX/iMIQ4i--
