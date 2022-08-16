Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5189F5959F6
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 13:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbiHPLYv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 07:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234467AbiHPLYQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 07:24:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9B5BC24
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 03:38:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 38693B8169C
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 10:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CCAC433D6;
        Tue, 16 Aug 2022 10:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660646314;
        bh=hVVo79bdH3PWMsmW/FhidohKdga5J3xHO28BZaYm3yo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L2/L9Gg67SquxnduKQFt9j1jybk37bTj6P09q6kVZ0LkhspO2/8gkjON11K4SaE/8
         zU6KDrEZWWVz/+mQCUweezZwFA3ljVUKLFub2Ezorl82zOJScwDPKDI0Ofupsr5E38
         O1XK1EDQ0xaI5BaK9oGP9mDxL1Vzgs3C2XbKudCyrattgmqOk41az707e//xHsNMIg
         mNFwHWVdBx5c4Z3P2PcmVclngIK3fxsSjRIs93hjl4J3SyFD5dmU/TWo0uTH1y+z/G
         q1Ufznx5dZEkY4a3RsDkb+w4At+GxqPegReqCHH9K9hi69uC0muC5EjEOMHIUjpiJ1
         rtVNQq3k0OFyg==
Date:   Tue, 16 Aug 2022 12:38:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sekhar Nori <nsekhar@ti.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 5/6] gpio: pca953x: Make platform teardown callback
 return void
Message-ID: <Yvtzp3eU+sNt120k@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
 <20220815080230.37408-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qLG+rWbDhQ9AhcSL"
Content-Disposition: inline
In-Reply-To: <20220815080230.37408-6-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qLG+rWbDhQ9AhcSL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 10:02:29AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> All platforms that provide a teardown callback return 0. New users are
> supposed to not make use of platform support, so there is no
> functionality lost.
>=20
> This patch is a preparation for making i2c remove callbacks return void.
>=20
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to an immutable branch, thanks!

--qLG+rWbDhQ9AhcSL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL7c6cACgkQFA3kzBSg
KbaMOhAAiycrBAdUDJFoDQHxoe3yKOCW1R8OuJLkDeqTWsDBAPHcsY8FDOscFC/P
WoL1rIImMr0AKjF2UmZvmed7CVy2/ePkgDzk87ZTuO6En3fKtcjDH6zqQwNkv92V
TccmGSGF56R0An1aCyUc9k29+VI9ObDvEZrgmhuP6Q2tlGWuV3SYvMV5dnPKiXUj
GLtIs5Cg8+UONk4ee+d/KOb8GAPKJwgs1wGtiso7UorDlDFEm2RgwDM32TIEpKG2
8kMV+foQGb9KgSlTmhfwR86zJwOHLztEzXdXCjjX9WiIMn1tDOT/7JCB4S2FZrb4
xQIoxmiADvb5pezmXlTPqhbCiBFri+ggFIGbYG9en/3uYub4YXX8VA9QUWNF7Ifx
cS5KGbsEdnIwKGrVZEN1uJQPFwfwifWZWPg3R9T2iX+6UW6rD611BzP+ohvkL+1Q
MEgZHhXhYaciGDmIvyx1E0VgUe08IDfbO9/rwxWEi45qacvfixW0HTzQkP334SCp
kL7qq4v4z4QYzQ2QWNa+BAzVSALfA5r9tWHwKE0Y2IYJIkHn6YhCIYTxDFVFFp5x
7tRCfhLy+VuzAeRTYNc+HSjyInwowj7ESyl/PQZFB4i4MN4NUM7QjFjRektVKyqQ
j2IjSr15P/0JlqpxtIckWJvI2RSoMaHKJwADzEnwu6rY7Py/5/M=
=RO1j
-----END PGP SIGNATURE-----

--qLG+rWbDhQ9AhcSL--
