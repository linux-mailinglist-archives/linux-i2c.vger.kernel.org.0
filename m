Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09AB969343D
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Feb 2023 23:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbjBKWzM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Feb 2023 17:55:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBKWzL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Feb 2023 17:55:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B9618B3D
        for <linux-i2c@vger.kernel.org>; Sat, 11 Feb 2023 14:55:10 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pQylo-00009P-6y; Sat, 11 Feb 2023 23:55:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pQylk-004Izr-HV; Sat, 11 Feb 2023 23:54:57 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pQyll-002m6z-2t; Sat, 11 Feb 2023 23:54:57 +0100
Date:   Sat, 11 Feb 2023 23:54:46 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 482/606] misc: ad525x_dpot-i2c: Convert to i2c's
 .probe_new()
Message-ID: <20230211225446.lrbswlde6q2fzdxu@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-483-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nagvuqjxwone2657"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-483-uwe@kleine-koenig.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nagvuqjxwone2657
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Greg,

On Fri, Nov 18, 2022 at 11:43:36PM +0100, Uwe Kleine-K=F6nig wrote:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

This is one of the very few patches that I didn't get a feedback for.
Given that I want to change the prototype of .probe after the upcoming
merge window, it would be great to get this patch either applied during
the merge window (my preferred option) or at least get an Ack to get
this patch in via the i2c tree together with the patch changing .probe.

In case you don't have the original any more:

	https://lore.kernel.org/r/20221118224540.619276-483-uwe@kleine-koenig.org

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nagvuqjxwone2657
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPoHLMACgkQwfwUeK3K
7AkbMAf/QmYAdKTHwX9VKRlHz4He6l4qM5YECQwXLHpeLHk5E3UMBoOeZVF+1adT
8UHyDnDan4yLeFC4F4Fc4aZctGe3UqRQ3Yiht4NQbT7DzF2OkQoNtkOLNRnd6O0l
83c4Dq2QBpf039+RLrDLaUezn1JbI6X9XYktj48VTYjVdKO+EI/DduZNqEhdDbX/
NO8UvF3uzcyRR9tuUFlDfL1+gRB8YqJYDux/53ljEtsAbB/am+cSXO0x9g5GuPz3
q201gwB904MPC4H3K8uhZXULWYdiXGpzf/MdVsYNBwntdMvRjwbT6GmEzZ2u62PF
DeP6zW7LJBmwTPyV5l5kMkU61iBnIw==
=npmI
-----END PGP SIGNATURE-----

--nagvuqjxwone2657--
