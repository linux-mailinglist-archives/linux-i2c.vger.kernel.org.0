Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2074A5B565F
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Sep 2022 10:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbiILIhL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Sep 2022 04:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbiILIgr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Sep 2022 04:36:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B7F356CC
        for <linux-i2c@vger.kernel.org>; Mon, 12 Sep 2022 01:36:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oXeuO-0003qU-HH; Mon, 12 Sep 2022 10:35:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oXeuK-000GV0-Lc; Mon, 12 Sep 2022 10:35:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oXeuI-000L6p-Kj; Mon, 12 Sep 2022 10:35:06 +0200
Date:   Mon, 12 Sep 2022 10:35:06 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     kever.yang@rock-chips.com, sjg@chromium.org,
        philipp.tomsich@vrull.eu, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        ulf.hansson@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, kishon@ti.com, vkoul@kernel.org,
        thierry.reding@gmail.com, gregkh@linuxfoundation.org,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        zhangqing@rock-chips.com, jamie@jamieiles.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v1 03/11] dt-bindings: pwm: rockchip: add
 rockchip,rk3128-pwm
Message-ID: <20220912083506.js4zyou7kdphrs7m@pengutronix.de>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <f5dd0ee4-d97e-d878-ffde-c06e9b233e38@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tqnrn4kzd6owce4p"
Content-Disposition: inline
In-Reply-To: <f5dd0ee4-d97e-d878-ffde-c06e9b233e38@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tqnrn4kzd6owce4p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Sep 10, 2022 at 12:02:22AM +0200, Johan Jonker wrote:
> Add rockchip,rk3128-pwm compatible string.
>=20
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Considering the problems pointed out by Rob as orthogonal to this
change:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tqnrn4kzd6owce4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmMe7zcACgkQwfwUeK3K
7AlZYwf/ffseGIKL3qdR1ObyfIb5V+iGVTp/SdYtO08mrURjLUEo+B+syZnhYPKY
WaIox8KDLDXTTzG+l8SOyJN/eVX56XZFaFzqNKpscD60wLFga+ccFaNKGJtk7knG
NvhVkaLBCMShPPlR6KT4mcKOmSBnZcge7q+h4oVQ5fgstpl2uOPQJPrIrZ+B+k8v
36gKyh5sYqGHe+uP6mIyiO8yuPztWwFfCILv5MV99qgCPftl3L8IgyvK2vI6wO50
ymfHbqlS8nxTODgi5iTI0PFMn0YJII1d2xwguOheFXUzRYuU/n3wft1Krdnwcdm2
fMeJle5erwYQ8Z6/F8F+XCMTdI83dA==
=6TOs
-----END PGP SIGNATURE-----

--tqnrn4kzd6owce4p--
