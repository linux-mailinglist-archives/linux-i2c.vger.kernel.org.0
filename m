Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF8879E298
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 10:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239096AbjIMIuu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 04:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235107AbjIMIut (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 04:50:49 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D0CE73
        for <linux-i2c@vger.kernel.org>; Wed, 13 Sep 2023 01:50:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CB8C433CA;
        Wed, 13 Sep 2023 08:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694595045;
        bh=zuK1TxAUYoOGDgayx1pxSR3TTOlhzR4RjBq4g276ouA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gL+GFih/DUChlOnVddo3V+vj++B9ANDZ9SWlQhK3da7uMV3yzo6LmSzmbrkkOt+Ze
         UgoJs15o13PGb9zaNHe9yNTggkjz7/fVKuOHmXOOn0gxVNDATuYWou2GIjwmpO/2wo
         8F10gd/f9kQiTdHVaGchYXgthIaWby7xKzLJjfG+8/bcYlLd44VRSeg3maosozI/AK
         PYntoBOIDwS/fnm9Qv9JWI/7p0vxvqnwcgPjgfiC6wnAe5yyMQMwYqwTjcfdwpEfnJ
         k2JNsCEVUEZPop3JYVOKtvXVRK9gJ3hbUWwFA8dfGyMN3EUtYZouVoMNess7EFd/Qc
         Pq/GtfAGqEwDg==
Date:   Wed, 13 Sep 2023 10:50:41 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Lee Jones <lee@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 2/2] i2c: Drop legacy callback .probe_new()
Message-ID: <ZQF34dwupVtsIr3K@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Lee Jones <lee@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>
References: <20230905194253.256054-1-u.kleine-koenig@pengutronix.de>
 <20230905194253.256054-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bfmKtN2bIHL9MU74"
Content-Disposition: inline
In-Reply-To: <20230905194253.256054-3-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bfmKtN2bIHL9MU74
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 09:42:53PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Now that all drivers are converted to the (new) .probe() callback, the
> temporary .probe_new() can go away. \o/
>=20
> Link: https://lore.kernel.org/linux-i2c/20230626094548.559542-1-u.kleine-=
koenig@pengutronix.de
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Aaaaaand applied to for-current, thanks! Hooray \o/ Thank you, Uwe!


--bfmKtN2bIHL9MU74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUBd+EACgkQFA3kzBSg
KbYUBA//XdEW6/zWcj7LVFfoJI8a6BLg3kLlbKfHdNIG3wxUxlfA8f1ASlgH5D6l
qLovIMBWWSZ7GLeLWtXiBmrAED5s3aG2p1rshkE8hXZvzLWXvWM6HQbVsQ3RX0pU
zKlB+d63JQMyeuAzTSJ07/wy57EbvUhqjlwSwYnb0kQnZuJkYEUTBhMlvJRrbIsD
xfQY3ODYshlClNOKhjiidt/nsB/qvoQDJlVmnwyZ3sbgNk6lI8YkS8VxWZv2DU3F
LOx1PpZVZX7MDlzULWHm0F8agnL/2ZtsFeTb2xieOSm0816TRNRSJbIG8p/iv6/x
ArntVvaH1zPvsyLoNc9pVzK7Zz036NO0gdqhlHVISTMR2X0PhlSt/+85visvhTcA
nMskX509vitpaJowyxx31lXGE6CjaNgs1TZVh/rzidHpRJfSK80Xd3QbNpbsuZOq
TYK5vHH7nDxJsZLkh1OwCNfrLGZLk5q6ByQrNAtS943JUbPoeyNn203HQs6qNnEl
g9U73qKUx+/xtrmi6ObVb87da905H4XDA5fmxouUd5GNw22k/WED3xJmwTHXvtDF
m4B4ZI4VArpkl8rhfBUmLCnV5er1vbRRzuiBEKHIal8Qi1jFYoS4OB2EX8lmTsqO
6+tmXymSetI5mmLxuL91xn9LvwTsJDeVSEfpofAs3pBXquLM1ug=
=Phr7
-----END PGP SIGNATURE-----

--bfmKtN2bIHL9MU74--
