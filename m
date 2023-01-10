Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F37E663C40
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jan 2023 10:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237863AbjAJJIE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Jan 2023 04:08:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238091AbjAJJHO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Jan 2023 04:07:14 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CF04ECB0
        for <linux-i2c@vger.kernel.org>; Tue, 10 Jan 2023 01:07:12 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pFAax-0003QR-FA; Tue, 10 Jan 2023 10:06:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pFAat-0052H5-LN; Tue, 10 Jan 2023 10:06:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pFAat-00BdOT-0a; Tue, 10 Jan 2023 10:06:55 +0100
Date:   Tue, 10 Jan 2023 10:06:54 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Ajay Gupta <ajayg@nvidia.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 038/606] drm/i2c/ch7006: Convert to i2c's .probe_new()
Message-ID: <20230110090654.ghj6rioikxse33e3@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-39-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qqqxmrosspknf2od"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-39-uwe@kleine-koenig.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qqqxmrosspknf2od
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I fatfingered my git tooling and got the author of this patch wrong. My
intention is that the author is

	Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

and not my other self with my private email address. Tell me if I should
resend to simplify patch application.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qqqxmrosspknf2od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmO9KqwACgkQwfwUeK3K
7Amq9Af/bhERrP2wBTbI0bf/LVvtMXtRXUixJH+ZL6xN83V8+eSRWhuwIFzGsPRi
Mv6VpfiAN5hxmrJEI8Bfuf5rM7T9M5lIyIW2DSFNuP869rHAP55S/jrQBk7MwzbB
G6GhRtrvuayA14YbibdNtSZurkfFXfDgR5JC5YIhU36mapp4TlFrcOUiDaLhiK6N
KudVd5Wz0EhP3ZnCmiGQia58si2AaML6EY9hj+8RITLgYlgnnIx67xS9/5WQHm3D
e8Q7Lr0pSD/JMK9MeuNJiFlbKJ8hl7p7cvULmhQI57B8mzmkAdJ7E/gHqeF/VREM
K255RQnqP2j9/BnvAZJEZJ//wdBIAw==
=tuul
-----END PGP SIGNATURE-----

--qqqxmrosspknf2od--
