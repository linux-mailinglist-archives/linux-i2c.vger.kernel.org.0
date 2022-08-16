Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE22F5959EE
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 13:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233905AbiHPLYb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 07:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbiHPLYH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 07:24:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40989102F35
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 03:38:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 702BBB8169C
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 10:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78070C433C1;
        Tue, 16 Aug 2022 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660646302;
        bh=foQus3YlMp1M5+ceoyCrg1GqRGnw6t6zHMSU0sXZpgA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n2TG4BqWLdJAsllDBWX9vKbdrFqPe7N+yNZGL2eEbiNEbYICvXCWKsoQSbrdCNV0D
         XQmxkKL/HCXM7HWc7Xwj4oJKSrGAUar6g2Zj8YHc8sSWs0sefTxXHlrpLmzXU8Lq58
         3oLX6cGJPMsj/sWc7+HKpqwI3A9WNuQnPSpkAu/HYjI+9CX+ioG5t8ynO5vn8i2eM6
         6GC3Oj+S4hI4CKDYsiax8HVkolDC7JN9p4SymXdWYzifhX5tHDaxvuUrENJtOpuu9U
         Hd8Yo6mHT4C8jdQ4Mf9DevoPMPrfBeV2U/oqRJgTLqnnAyDVuzfHfAi5N5DSAiswgg
         sNWGKwgn+LFlQ==
Date:   Tue, 16 Aug 2022 12:38:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 4/6] leds: lm3601x: Improve error reporting for
 problems during .remove()
Message-ID: <YvtzmmICdzHAcz5l@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Pavel Machek <pavel@ucw.cz>
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
 <20220815080230.37408-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="65lk+MHN0x2RHsnI"
Content-Disposition: inline
In-Reply-To: <20220815080230.37408-5-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--65lk+MHN0x2RHsnI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 10:02:28AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Returning an error value in an i2c remove callback results in a generic
> error message being emitted by the i2c core, but otherwise it doesn't
> make a difference. The device goes away anyhow and the devm cleanups are
> called.
>=20
> So instead of triggering the generic i2c error message, emit a more
> helpful message if a problem occurs and return 0 to suppress the generic
> message.
>=20
> This patch is a preparation for making i2c remove callbacks return void.
>=20
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to an immutable branch, thanks!

--65lk+MHN0x2RHsnI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL7c5oACgkQFA3kzBSg
KbatDw//XMji7VWiYsWRX7SmWBFLHLtoV9wzAAZu21OM0IqTRGYU8Mw8bTDu7vGH
8IAB/OTnWcPBW7jxq3760Fqo9pfG7RDK4aTngSyInP/pXqwaTkJYO23ZLjaaqwmO
iLpg8Voz5v1Uqn/BgzAifa8QswdKLJqAbycdGgoGuFHvhBfK1/yOSnih2C8+axnR
5iZJDa2b4oa4bjC6YnkOAvhpGBNQ1xTg9lOZrw4i8thA5are3zhjD3WtdUvUZEOj
zXBR2WeHqbS6orp/DrMh4nBFwzf2eAqeUplMsFrDxL+eKJK7Ebt1Q1VqvkKCTkRb
EJTfBlAs7SaDysgfemxn6EgZo2h9hW84lOol5BYTrt959JBSsUAnLlfIgaRBO/PL
YegZWZwCQyHfJUataesG8zxgVN6QwuX0IpUDfZ1xNev5cAZgRmbnT6sEsbq42wr4
7ymLzUSWxtCWWn2ddxfdaFbcjQiyfylzSDu6zIj1j+kG8YfiM6Z6OAM9hfbvfzyd
Se+MoHGVNMZto7ILqyjt5O5QZGJBJip/FkbruSvUeVAen9OAyICwlhiK5tiFmNUx
EE7ChblRmUVnH8QIb1x8d2wmOsKUCQTI+twc0tJDWUHqe/q2+UnGZPz//CCZ1TTL
O5CFaMDJ8VGj0C+cahOIWhDyCMSNgtOuZ4bEYurJQUjPp43/pgw=
=HLy9
-----END PGP SIGNATURE-----

--65lk+MHN0x2RHsnI--
