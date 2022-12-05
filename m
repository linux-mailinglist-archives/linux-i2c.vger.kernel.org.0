Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D7F64261E
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 10:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbiLEJvp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Dec 2022 04:51:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbiLEJvN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Dec 2022 04:51:13 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DBA192BB;
        Mon,  5 Dec 2022 01:51:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4FE2860F60;
        Mon,  5 Dec 2022 09:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527DFC433D6;
        Mon,  5 Dec 2022 09:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670233871;
        bh=ffapI+LGOzZ7Rcb4+XP7ILKCeRPuTyUmvKy3VD13zZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ozeZlQDUZsfVO7b2d9o/kepxbfCv/ya0tboR80GzkSUja/HRVHwuCIZoXoMbhGTwC
         jHkSph3UlErq1CWREPI9iTlZ6iApdwuxDuc7L+K0hTjmL9lYicteNC7bWU57mdfNJM
         GC3YanVzJQGLEjHXUK2p/Lj6cVDrGJJQg85wKBwNdq3iTbr9BohoFfpNU9ln6zpvu+
         Z8HdQ1M9XFgt/TBTjEvPNRaUr8E5LJdlCjNW12LeIdFGyx/6yyhHdDeADt/Y56HHcB
         famYfAIL6QZRtVcytcllGV15SDblr4J5vzffjAC8usRFGEcJn9bbvz16MmaEZ5G7zo
         o+l1ArgH484wg==
Date:   Mon, 5 Dec 2022 10:51:09 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 045/606] i2c: slave-eeprom: Convert to i2c's .probe_new()
Message-ID: <Y42/DaOqq1yrTxbc@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-46-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4959fioAu7NJK4pi"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-46-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4959fioAu7NJK4pi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 11:36:19PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to for-next, thanks!


--4959fioAu7NJK4pi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmONvw0ACgkQFA3kzBSg
KbZ4XRAAin5cGGMVPByJwseTxzNfA93CQpEtvB1uB2vfpWftxE7p24vISmsG4l3U
pAyyJFLUKCAb3F6B/XU7w+GL8x9kdEILRk69CtzCV5yHAZhix1Xa+7F7uXnsec2Z
RJFFjUQk4BFtQbW4lmQptyTJUHNm7NVGViQBFHhEsW/NjGe3pO9ttuBuuVunhU55
HhLeSCNrrv3A4mNnfP8awIaql2K71TbeGEm2v78Dv4EAVqM+eSNhsrmPPd6l1ZGE
n8S13ZqmxJT++rVXad62uakDCgpHB1bRbxCvR6p6KhHEwqC/1lGq7U8GliA1yCLq
5dX6fvveIq2qejUAXaiosVJIT26WHs046GndRn08xUet+d8luiGuV3oBG5vsin4a
RhlJlQ1hFX3tAMANJCBYTRrA8XMgWJ1wy3sdOjvxkZZ1SH2zyQEPOAujuakCUkWL
x4W4z1dFDAeo7sefUSfa+1qeQZEi5N8uxjwDRkeLIvy/s1F8VcJs7fB/MfSWzadV
vkYXxFn853PtdCE3iiSKybtvz+kJ109JcdgbydG80Rn6HVFsOpHMS7V7J7TwERBW
0VmwhDCLaMo0KXsHF6gFyY0cCeAl+lFzPh113HbDuqurOhACi/nMXWop08XOJF14
UPmuC9mTv3cLXsOdxn433KiBmclDphMmvBbbP1zuuisGENxDagY=
=rKk0
-----END PGP SIGNATURE-----

--4959fioAu7NJK4pi--
