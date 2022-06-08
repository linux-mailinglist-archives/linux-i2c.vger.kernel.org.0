Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B48E543DA6
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 22:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbiFHUkV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 16:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232754AbiFHUkR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 16:40:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64447EABA9
        for <linux-i2c@vger.kernel.org>; Wed,  8 Jun 2022 13:40:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 07CA561CD2
        for <linux-i2c@vger.kernel.org>; Wed,  8 Jun 2022 20:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C3CC34116;
        Wed,  8 Jun 2022 20:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654720814;
        bh=VkZIgnLYx/MH8s9TR9OkQwPA/Ss9Att/ItlQMdKDJqw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fj6MBccDe+nQfGqBNrNJQL165NKRTef4LA0ApTI2xBWO6PpL/2VxqwkvIRsPeFi+U
         E1ZHtLH3wC2q1CrIpX8qWNDsbwwbF5Kd15scDsbtpwRLDOjaCY05K+mqXx/43GmPUJ
         g28nPd9Qiw2G5Xm0Tl26tKmstFWSnQitY+cx3B0oEVxfM1VW3e85alWzK8b8wp9oOQ
         Ghs/b+hBPCxupiDaF2SHIs+WZIs0hLLhjAKKQDyuRxXji4BYFzBXAK2ZiHOTbUpGh7
         IFAh5CuAnT5wlSfgGfM6LYUuPT+dXNCT6u7HC/gMtihKZIBwiUncfZUI8YCJL0rrGB
         J6Czs56CSTe0w==
Date:   Wed, 8 Jun 2022 22:40:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] i2c: dummy: Drop no-op remove function
Message-ID: <YqEJKkOiHAfCt1Ze@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de
References: <20220526131213.1591909-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="claGoWtOsiOk8FDb"
Content-Disposition: inline
In-Reply-To: <20220526131213.1591909-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--claGoWtOsiOk8FDb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2022 at 03:12:13PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> A remove callback that just returns 0 is equivalent to no callback at all
> as can be seen in i2c_device_remove(). So simplify accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Nice catch! Applied to for-next, thanks!


--claGoWtOsiOk8FDb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhCSoACgkQFA3kzBSg
KbYx1RAAo7hJJNiO0mEEEGdPE+Ci1AEy28rh/Dh4dQasVWpQhLJ4UN3rXIpDVbFl
I02UHC4VzbZWkl032Olg7WTGyV/LY+lxu36rQrilm3AYJhgoevO50YGrRBVzZyOR
W8kk+icwmBDTF1OqzI5lkyeg3hqf6eRPMQdLaU0o0QQxh/lV3tR3jAgibbUNeKhC
fISmoa0jmU8ZSOl3EqPwHSAzWGpt2YcMzw9xsOUg2o9Pq5lmgz8arH/96haUJMHP
6WOyqNqycJvZ1p9E15CKJwYjti0A2T0kOz0Qxj7zUWDZ0/lWLuaNsamgT3taMQ78
am+CicOjGiYUVkZi+M0goNiqAyS3tbpxvCjnvQDm57hxEuU8vH1BBkUqG6+K5ADX
0VWSWFDpK5I2UZtXB5aX1syEAbrWaYjvVedWvGQiEPzzBRZC1+XiS252n7S2vj30
qsN9PmQ5JZ6Hb1qQQlWK0Y423McxyUxWaF1qa7tVviu7QBAKwPzgngoi9KbJBvbs
5KAeBawXz666wyRsIRXMkqb99/gPhpCW7gcxe86YgC8wstbq34YXqFPQjX6LCScX
zsKVucaKYUm50eJsvphKoyQYh5VW73fCxrqFD2uAJ/A3RHOCsdjls6NjHSnq6NhA
HCfC5bh1C3JlXzuMXMpWi/CRkH6E/VXAs1BCq0tgZft4JZCaDAM=
=JsoM
-----END PGP SIGNATURE-----

--claGoWtOsiOk8FDb--
