Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 470C25446F6
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 11:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239963AbiFIJK3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 05:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbiFIJK2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 05:10:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B2AB15A2C
        for <linux-i2c@vger.kernel.org>; Thu,  9 Jun 2022 02:10:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nzEBM-0007Ut-Dh; Thu, 09 Jun 2022 11:10:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nzEBK-007M1g-DL; Thu, 09 Jun 2022 11:10:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nzEBI-00F9XL-C3; Thu, 09 Jun 2022 11:10:20 +0200
Date:   Thu, 9 Jun 2022 11:10:18 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: i2c: Make remove callback return void
Message-ID: <20220609091018.q52fhowlsdbdkct5@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xxp5jgk6n2knhrka"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xxp5jgk6n2knhrka
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I intend to send a patch that does=20

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fbda5ada2afc..066b541a0d5d 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -273,7 +273,7 @@ struct i2c_driver {
=20
 	/* Standard driver model interfaces */
 	int (*probe)(struct i2c_client *client, const struct i2c_device_id *id);
-	int (*remove)(struct i2c_client *client);
+	void (*remove)(struct i2c_client *client);
=20
 	/* New driver model interface to aid the seamless removal of the
 	 * current probe()'s, more commonly unused than used second parameter.

and adapts all users accordingly once 5.20-rc1 (assuming Linus will be
able to count to 20 for 5.x :-) is out. The rationale is that returning
an error code doesn't make a relevant difference. The only effect is
that the i2c core emits a generic error message and still removes the
device.

To make this adaption of drivers easily reviewable, I created quite a
few patches to make all drivers always return zero in their remove
callback---so the adaption just drops "return 0" (or replaces them by
"return").
Most of them are already in Linus's tree, but some others (currently 18
as of next-20220608) are still in next and another bunch wasn't
processed by the respective maintainers yet (in a public way at least;
currently 15).

The tree with my current work-in-progress is available at

	https://git.pengutronix.de/git/ukl/linux i2c-remove-void

I intend to rebase that to the following -rc releases and adapt to
relevant changes there. Currently this tree is successfully build-tested
using allmodconfig on arm64, m68k, powerpc, riscv, s390, sparc64 and
x86_64. The current shortstat is:

	 633 files changed, 732 insertions(+), 1803 deletions(-)

Assuming you agree to this quest, it would be great if you accepted the
change (+ the then maybe still non-accepted driver changes) in the i2c
tree exposing them early after 5.20-rc1 in next. Maybe it will be
sensible to then create a signed tag for these changes to allow other
affected maintainers to pull this change into their trees.

For now this is just a note to let you know in advance of my plans. If
you have concerns or alternative suggestions for the next steps or their
timing, please let me know.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xxp5jgk6n2knhrka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKhuPcACgkQwfwUeK3K
7AkJxwf9H+X81CYXUNzZ37CRg45xrjg6KupESqvRlVbBJjPL+cl0RjV9fC4gXbPc
gdQDeYxuIWW6EKq9Ie4oxvLlRvhhu+cRSLKm3upoHhPvdOLFDPKm9MgyXSdza3ok
EkCgZjAwokO0g2zX/YCFi/QEpvYjhGzU+QbaYMomKw5B04QqJWc9OvnESnPTShHy
2uM5OxS79l3Wa0wVjxzxWEIhBzE9TWyM0g4cclnuFhe7SklAwZbO4fQ5LZNgXec4
XxqG1VNvo+vtB4cfdTtrpKcocxG1JDozCF/GSyzPS81T/uT7PyQ/8VuC9X9oxFmX
erCrAogQ5x48Csd/Bnaa8+OY0AiOXw==
=VCDl
-----END PGP SIGNATURE-----

--xxp5jgk6n2knhrka--
