Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5C573B05E
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 07:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbjFWFx3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 01:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjFWFx2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 01:53:28 -0400
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 09AD9A2
        for <linux-i2c@vger.kernel.org>; Thu, 22 Jun 2023 22:53:25 -0700 (PDT)
Received: from localhost (203-123-142-46.pool.kielnet.net [46.142.123.203])
        by pokefinder.org (Postfix) with ESMTPSA id 315DFA427AC;
        Fri, 23 Jun 2023 07:53:24 +0200 (CEST)
Date:   Fri, 23 Jun 2023 07:53:23 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] at24: updates for v6.5
Message-ID: <ZJUzU3tfEz9rjjDi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230619080458.24916-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="e0rVtRzJ7z7UlWdp"
Content-Disposition: inline
In-Reply-To: <20230619080458.24916-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--e0rVtRzJ7z7UlWdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> ----------------------------------------------------------------
> at24 updates for v6.5
>=20
> - use dev_err_probe() where applicable
>=20
> ----------------------------------------------------------------

Merged, thanks!


--e0rVtRzJ7z7UlWdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVM1MACgkQFA3kzBSg
KbYD7Q//R2xb49LcMspd3tef1dQ4UwHKMLIgRHxN9jwXpKjn6cQ9MLdSl8YbIoXv
TXPF04XUwBcKxhvPhOZF7SMG5xP/2GbiPqZQZUSFc35gBJltGdX3RWNJfI6mYfJa
Ab6mox9QnWsAqw2x8mt+XA/WxKBuk5ytU6DOsM4r3vJQ3RxYAMPU9lZ1nCfwlMNQ
yhXcGQSe/efHozzMUvslgia7jJR6NTt8tVGFG60A0HWO2VuMzvaCJfNkCTS2g+1q
AwNZX5fuzN/vt23yIXIU1FDkfOGIPvHq/91/obesY6QUHuywXsHo/u5Mw00IsucP
uYiXBz63CoowfhS5BOgsrUKrwcu/oFLilOkz33L5z+eR92VeKIHfSeX1axw0pkTR
bi3tI5+f3+TBTxVLSGX0RDqVSS42iDjkmri4nWQSDe71b33UOFHIOJGMRb28pa05
TPkvffBwz4xwA4RbOC/0oygCUWUSSXNZq0X4gZndhF521TvOnCnmuDPGbAznNly5
Yu/YdSOHYCUvS7Pi/PhBrxGxJWttVEY40hJwGULKXogpwI2PIfhnVNWhoWDKQHQF
ppL2uOZYp1eYEtC0Q5HCOUpzYtuJp+igjA8F+IIjDoEit+B3oKcCp1B3te6XGpIl
LvVQFosagDTvRJ+Zq/tmlbkPsqjGlwhIpXYkdpVw2mFpe2wFd/Q=
=fMss
-----END PGP SIGNATURE-----

--e0rVtRzJ7z7UlWdp--
