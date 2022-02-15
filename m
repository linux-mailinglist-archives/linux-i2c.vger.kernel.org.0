Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0BA4B673A
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235737AbiBOJO5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:14:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235730AbiBOJO5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:14:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AAF126105
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 01:14:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 55880B817FF
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 09:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B41C340F1;
        Tue, 15 Feb 2022 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644916485;
        bh=Uohf5XrU+YOQKk5cMN2qWJJ0JKZ802JvtdFhFuHbtKs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jTg3vC46X01wz37gSKo9g8Li+SbMtcSPItgfmnm6h/WdENZvIKoEykS5glLdmRdT0
         aNSAklGjbvYzBum9lDwzEMDI/V9ZLw2M8Rv3tjX5Mh5dmfaAwx2JkuWWkx0I1mGeMR
         CT32DSnJHU3zqHGHJPWK42bvjq5fCeGExBRo4t0iQm8m5bKf923EREqb9GO6e0vpNk
         kznoTmLt6p/tcW92Vhm6KUluAXdE5DfO0f0yxaYu3gUlvbR8YchMXLFqlnBmQNIxEJ
         SgMctiZMZsyKODwFnxGC5RcD2CZX/Nr+gPqoPjwW5vT8DstDu6MW1XVdPrUqYjJTwD
         DnjBiFj6IKhqA==
Date:   Tue, 15 Feb 2022 10:14:40 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] i2c: imx: allow COMPILE_TEST
Message-ID: <YgtvAH74GtPWtNt3@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
References: <20220212194657.11203-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="P1gJL4H9UmDD5mVz"
Content-Disposition: inline
In-Reply-To: <20220212194657.11203-1-wsa@kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--P1gJL4H9UmDD5mVz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 12, 2022 at 08:46:57PM +0100, Wolfram Sang wrote:
> Driver builds fine with COMPILE_TEST. Enable it for wider test coverage
> and easier maintenance.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-current, thanks!


--P1gJL4H9UmDD5mVz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmILbwAACgkQFA3kzBSg
Kbao3w/+I51mpnQZSnDtQq7QTnpkx2/okwS+mQL/ab8nbLf7osPr0KdwdvvkrBMO
rfpBFZ8/lr7PeZvOmZlO4uyaDh1U41W/A6DhhjERMtMUwVGFKRH/nhd3UvD3Ba0J
02HN4rPmTQc3MW0VU1gZ3Nt47p2j1rwi5rXL8d13IrJHZ23kZYvAZNO3AZWBVPR/
E3olg3wyhIikK1iJazHP60Wf16CMnvcBorpLlc1LdqHPPjPGVuBGebXGsLyViQ9E
UhSdc3nRCuS3epr4aGlLrjF0wLAxUOyHxCvRAjYPq+kMJO08rLnhQbtHBsE/kd0w
OohN85q9da84G4wxCu5az8AtbkJwL5EdKflmDYvIdnNoAzBmWAFHllM9XbGy5ZId
ht6Y+SYSt75I7Pk3oJDTl/MUJdGkE9TnOaJLacM427/qZtsvxVl8iP10T3v74tdj
JQyUWxp1HVj07RgDOcL+jQgK9E7J7Igbdtsk7c8Pj0diUh9rCa77vEraDGEn3ifk
3gq6JCXU1ABh+bE/lgpFbiWO2b6wQfecURTdHCMO0zKubwdJ3R5755mJRdgZypvp
pTLQBK3KwACr3QyeADNAYqekkZgeOk2LCF6BTHJIkB3JYuptkKeJRJTtMbFjPbbN
f7ckZgqXSPVI0dwQe1jF110O7RLwOKkQ+HPNhvUuBcFwgNt49yg=
=Qj/K
-----END PGP SIGNATURE-----

--P1gJL4H9UmDD5mVz--
