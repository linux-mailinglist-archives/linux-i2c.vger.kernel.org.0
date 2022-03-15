Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0654D9587
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Mar 2022 08:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345545AbiCOHp0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Mar 2022 03:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244096AbiCOHp0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Mar 2022 03:45:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E2462BE0;
        Tue, 15 Mar 2022 00:44:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E66C0B81151;
        Tue, 15 Mar 2022 07:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A252DC340E8;
        Tue, 15 Mar 2022 07:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647330252;
        bh=0bFweEuF8OfqRwP501goExaiCdTzj541iER295VFBhM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PYlZj+wunz3LRXUjmyVECWjA1ANviY1Xn/xCvVuYXn4/2VWNriNwD7s4lSkX4kRni
         mD1x3AP4FZOtAvU23yzAWnPm7n7M9mxHarMvVlEQD7A3QUGze22qrm2duVyMgrRRy3
         YTAuotQc5T04XYxA0DufScbOa0FtwnNo5toEolT4Y64ycfVlk/MbUtmzbGSnQWnhOF
         GvrCTYWF8/8TEachYaKKicXR8p54pkxZDDJn1bQcSfNgj6InU5v7IHZsTD3LWV+h4k
         qekBF0vj5aHGFoZd+ij5pkogNyZcRhJMPRaJLJ9ayB3vSJZ9MGdfM1lD4DXtFAOtML
         JSoB1Zdbc5e4Q==
Date:   Tue, 15 Mar 2022 08:44:05 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Ian Dannapel <iansdannapel@gmail.com>, linux@rempel-privat.de,
        Erik.Schumacher@iris-sensing.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
        Michael.Glembotzki@iris-sensing.com, linux-imx@nxp.com,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: remove unnecessary delay at startup
Message-ID: <YjBDxcTgdjGhWr6k@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Ian Dannapel <iansdannapel@gmail.com>, linux@rempel-privat.de,
        Erik.Schumacher@iris-sensing.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
        Michael.Glembotzki@iris-sensing.com, linux-imx@nxp.com,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20220314095918.50014-1-iansdannapel@gmail.com>
 <20220314101337.4x2cu3nvg2vg7ulh@pengutronix.de>
 <20220315055935.GB14588@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bl0XJwSOY8CQGyd+"
Content-Disposition: inline
In-Reply-To: <20220315055935.GB14588@pengutronix.de>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bl0XJwSOY8CQGyd+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Maybe. I do not see what exact problem is this sleep addressing. How
> exact the can get stable? Is it addressing some clock issue or wading
> until something happening on the bus?

Yeah, it is really hard to see why it is there. And given that the
introducing commit is from 2009, we can't really expect an active
userbase reporting breakage. So, although it may be a useless delay, I'd
like to see an opt-in approach for not using it.


--bl0XJwSOY8CQGyd+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIwQ8EACgkQFA3kzBSg
Kba3Zg//cGzkgTkzhGMFXByotIKATzkcHcXPdGr9kMfzqtG/DRZTCfhEFiesqPcL
lho7yftBOSxqPjebs/FAvmVCkg5TErMD3v2QHs8+QYiiypIm2fUYmbisnutqY1WX
SAlN8F2l3R/oD4P/N/K6+Yglxjv7IbCTS33oYf+SLMthFMCsTBmjCW4mgkZTs/gf
AUN5yJzuxzfX5SK0KGw1+jTS7nARyMREEijbHkkFXEykgK1ckuMV5sAB9pc7l60q
cMAxyuDMSl3ltF5Wbxr0LDfkhy0OCnLtBH3d+GDT97jrkH1UQnP9DiHwMs11h1hC
78b7UbtPtigLJ33EyvVxSi11y40KfAJATXcSqP/BO6o9lhei+6dkiqLxr713S7x3
d3MVhR69g0dupUz0SZ5VbNSHwgBnfpNRxmA2InifY+MTcwJUoUKz9PinHbaDjAMi
2IK1R1tuxEz22KAEdwnjnq7ei1JgB+KdRs/EfQITFBcrZ4E8omvjazgEpm0IWy9h
RJpjLfvhroRJ8s/Jhf9pURIHYwCbHRj/+dsWf38EG4ZI9Mn1YSEtQ1L02ku2Ner+
ArKSbyv3BtlnmDfuUx5pLKm+vFA2TkdvGlQ7Z803zoMqQt01yPpF4NojDXY+8Fwo
WTT7nrY5/sRSBDCcXuszwmLSn/zRMlHtchkLurRREcLqm8z9EwM=
=2iXu
-----END PGP SIGNATURE-----

--bl0XJwSOY8CQGyd+--
