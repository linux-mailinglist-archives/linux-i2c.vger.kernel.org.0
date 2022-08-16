Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7C15595A1C
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 13:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbiHPL3c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 07:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234013AbiHPL3P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 07:29:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078CE27B0A;
        Tue, 16 Aug 2022 03:46:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3DA3360F9D;
        Tue, 16 Aug 2022 10:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BA5C433D6;
        Tue, 16 Aug 2022 10:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660646277;
        bh=wpYi5pDRiQCdE8efj5ruAv3hVpNToekjxnrynO23AOc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K7/hRsyMVCTnqx9m2rihin79CkCmnS/vzWti5yESwhsjavhkqZq/KyWspDCX2eWDN
         7Posq4v38UzvuZjgNnOS9i8c3kL/15UymUkDPTmTq2j/5lvpJDbcHmX/1mW6iVOrwM
         xobGBP0JxQC8N2rRKfyydRbKZiWOceL9FFqtHrEy36TjvAmcuACSwoBIaWEoZPpwOD
         5tmqzmENOCNRafk2TORWiUtFL+q5VDs6Pbr1RoOH2/WTuRYOQz+/cpAZVI7iHzM+K2
         1KHzAcpGvJD/fiFdYIqxZSl1GAXdkmnmuPw5M0/H6WwMJFYbjRKGe8Lw+hb8hrY7mi
         P81UgjwnZhZNA==
Date:   Tue, 16 Aug 2022 12:37:53 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 2/6] leds: lm3697: Remove duplicated error reporting
 in .remove()
Message-ID: <Yvtzge4/7fGHAwKc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
 <20220815080230.37408-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5SG9bP+z7o7IZTy1"
Content-Disposition: inline
In-Reply-To: <20220815080230.37408-3-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5SG9bP+z7o7IZTy1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 10:02:26AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Returning an error value from an i2c remove callback results in an error
> message being emitted by the i2c core, but otherwise it doesn't make a
> difference. The device goes away anyhow and the devm cleanups are
> called.
>=20
> As lm3697_remove() already emits an error message on failure and the
> additional error message by the i2c core doesn't add any useful
> information, don't pass the error value up the stack. Instead continue
> to clean up and return 0.
>=20
> This patch is a preparation for making i2c remove callbacks return void.
>=20
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to an immutable branch, thanks!

--5SG9bP+z7o7IZTy1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL7c4EACgkQFA3kzBSg
KbYDQQ/8D7P5RUvEdfwi6/WF1Ladvrty0+GzItTq4lbCj6/IBTVdy4TtvfYyf3XO
YiG1CwzqOwE/uRMwxvGT2kRIsVRyt+eF4Gy35hnak/t+4WmE+5kBe+jhBTKziEKB
wLso2ZgC3SHcyVc46EET5IOBbGh59obqUxsvcYiD0XCSJTY7Kv8C39TH6bihZYjx
Ha4mmBzsWu7MMEIrY9BwoXqWcELhJmKGSUZZjDfqrVPZXAuT34cEAvB6GblkwPlW
ZwG+186wmFgKkm4G4LH6P1CYoyEY5pfRa80aWitufzhNpst9j6TVUQ7CZHsZjdfM
pEu6wQxxN6qiRrZSDPx6O31qCrP/aOOtQSo5UXBhIbbIWeFnL92vxfuJi1+BkdDK
tkUVe1D4B+a/SvKQ/YeX8Zk4Axan/E4JvCFJNGJgq+PK71QyqCpE4+9Ewr8+IyvB
s8qTiUOvEAaEi9wKdZyBfIiOoisuxrUy24JF8Q9ZA9zWSRhQptbHXi+vJ5kj+XIt
ZSzx0kg380UMsmSTVCOfiJvAEXGXixWiuNGq/YHlYRaUt76J+0alR3ymS2ZtseLd
u2hfC8x2PXDwAGX6AE+JHjlq5z+eOznrs43ziaSO7zar/FSK+aFK6KPWfIrUKuxC
b9OC0dAyJAcgbM5wS0Gwv0kwezcV3YtUX6Wde3ZIonsL6EHmqpU=
=36ZB
-----END PGP SIGNATURE-----

--5SG9bP+z7o7IZTy1--
