Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A647352F902
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 07:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354615AbiEUFwW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 01:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354605AbiEUFwV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 01:52:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA9B5E77A;
        Fri, 20 May 2022 22:52:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 08E66B82E26;
        Sat, 21 May 2022 05:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28E7C385A9;
        Sat, 21 May 2022 05:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653112334;
        bh=gqEk2G2c+0WQ6teafqOuUt9h21Krn5Oy3NvQ+/5GkBI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mx+EfyH416zuLYyavxesotOJIfbYbPbvJjEC0Kcvhj8hxbMUnoaLxbGgjsYBjyUJD
         JcOGwdfbLoMsTzB0e6YMHhDmevmCrum8C4EQJUmF2hInbjP89LhqZFLpjteFhFwP9W
         D0Spw/gYgHYyZ8eyYvWLBfpGtqWhALWU/pJUdyw5z8DdQwcpHEreDnDvfX3CO8r2vQ
         HugOnQgnqE29hd+7AG1+Lj20UXvf8Bj0McRQQHiuvCTORTYc7UenkbM5VOtRPzN1Et
         t50ZSGCJ0nZ/fb8iyAxZ8L7tFwh7IW6+1QMW/yq/qC9GfFyeqZyj+poIY5/KbCM9wW
         a1vd845q35waw==
Date:   Sat, 21 May 2022 07:52:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
        jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/10] i2c: npcm: Fix timeout calculation
Message-ID: <Yoh+CgMPJM/Qp2V+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
        jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-5-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sr7GoX7S9ot2v/dV"
Content-Disposition: inline
In-Reply-To: <20220517101142.28421-5-warp5tw@gmail.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sr7GoX7S9ot2v/dV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 06:11:36PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
>=20
> Use adap.timeout for timeout calculation instead of hard-coded
> value of 35ms.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Applied to for-next, thanks!

I dropped the Reported-by tag, doesn't look like test robot found this
issue.


--sr7GoX7S9ot2v/dV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIfgoACgkQFA3kzBSg
KbauVQ//ZUeQap9aumasQz94DsgHplMl1MEur+0lhsbMJnVScP9toqh9/SKoL4tJ
aMH4pqaRYlEnQYoDF/9POi8/pdjSF7xbyhGQmx00Z/u+YdY0PX2QlFJ32Teaqdus
syi9r4DFk09l2CKjQMKOEG7UdIiuNp/JhQzEGZBblHYVM2f0ph67dKV33i6CRoGt
q5tjKkgiX8UPTjTDTW4OHSH+KogatMjX/xms1ZHN1PTjsZ6ZpTUD0EES62IQxw/N
5a+pnqZ0cpOVLyqA5+wWp3CoSRD4oRCww/Rpn2bzwr/VkQxc8bw3laq60L+nrZM0
53i88MW27DIkHt4SaJ4JSHISOiFJ/1pDW81/CUmHs3anTPQxLyQP5VHcnSWwYvu4
zx5QYAUWrtul/lV1F5ErD+zT3R5kFvV1VjZRFbVm8HKLG0RiDGoLoP44++RscMTw
zHTaSHTpazMCfWJ2JtZNKi/wSUVwqhb0GRN33NV5+lwy8NhENfsS8SxXhSEX3NGu
RIr7SOhcquhv+20ar9zbLx3dX75IzdPe2DicM1/tWYL0wvubVZDj4gr/ofdUtPCj
TwoZtZqf8YplpOMbBoG+8ziGZDSurdtYK8KHdiYIhfZTfbutBb6F/+JR9RoMkh51
G1q/eyBlKc1DmycYOzPKaT0RFNe1dEQlN5oPA7ogwGZiIzmbhqs=
=Un6H
-----END PGP SIGNATURE-----

--sr7GoX7S9ot2v/dV--
