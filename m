Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B29D36A0B85
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Feb 2023 15:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233405AbjBWOHj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Feb 2023 09:07:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbjBWOHi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Feb 2023 09:07:38 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7020E5651B
        for <linux-i2c@vger.kernel.org>; Thu, 23 Feb 2023 06:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=/czhvN3aIoOP3S+xp4E84APTBHZL
        xNK+Hk2d1QrbTrE=; b=XsygqNqoQpBUWRSCjxZ6h3a2yNXXpzeaASHsbySQwCPq
        7gK0qdohDH5p/t4Fvsddq/rAuy0xCwD7Gdwr1tWSfPhdZ9mwshnyPo5dl2oRQ4Ri
        XNfRxwh3z/UYjpQLUzo3TWheI3vwrhmb049UuoMQb3xgn88VKuXIzY1uh0+KNCA=
Received: (qmail 955098 invoked from network); 23 Feb 2023 15:07:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Feb 2023 15:07:31 +0100
X-UD-Smtp-Session: l3s3148p1@+l6YiF712LRehh92
Date:   Thu, 23 Feb 2023 15:07:30 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>,
        "Poeche, Uwe" <uwe.poeche@siemens.com>
Subject: Re: [PATCH i2c-tools] i2cdetect: only use "newer" I2C_FUNC_* flags
 if they exist
Message-ID: <Y/dzIhhik+veP1dq@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
        "Poeche, Uwe" <uwe.poeche@siemens.com>
References: <20230220140830.74180-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BatJ3m17lGxhyYjB"
Content-Disposition: inline
In-Reply-To: <20230220140830.74180-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BatJ3m17lGxhyYjB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2023 at 03:08:29PM +0100, Wolfram Sang wrote:
> This allows i2cdetect to be compiled for older kernels.
>=20
> Reported-by: "Poeche, Uwe" <uwe.poeche@siemens.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

And applied to master! Thank you, everyone.


--BatJ3m17lGxhyYjB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmP3cx8ACgkQFA3kzBSg
KbY5nQ/7B8UnrfUhkNXDKq7nzNSPzN3BLnHJY9YNu9dbmPyMw+y+Agcxlb6CBPqk
iL5fx7NH4NypIJ7nMvrns94amld81gXpxRGbDAtDEfoaImsDY1vuRoVVDWXF9kDW
eYCe7MJ98fEw4q1S0uy8oLo95oL9XO3fS/ZoQyHJKQtZDb9UdvEC8dbnxAJSFo5O
feicWEdBiA6L0COnk6dX2yfpnmzluQsYAdnhlbTJvgd41l8xGRKIzhKJwL13POH8
mikU+vjGpaeawQzCFmTfQjF/8mfqYYjErAc+dviGoGEznSvEE+uBWrfHI/m8OASp
KytiNq+Ielcwi33Ee+h6csH/K/8VyGbRn7zboZfO5ZD/EUWxVTooT5yBpi+EoIpT
p5/Q4tWyxBQiJMRoM/Yu7WU/bqSLhmLWpZnScY5+J9ryywEhJoZpRQoxmD1MGfVz
eq1tHEn0ppBmuYZqvwx0cyFSgR1lw6254NlmArZosxdjZ3y/VPUl9fsarWxMZslJ
npYXP6G1pDCi67OLxquIVjvuJTZhA6hNHp/T6v4b5cHTHzfYVrMwgFVDmkj23cpf
K4n2wGrHZZU6nT9OGIE4AaprocfEpsZ08xap3QQNjEWyfkoq6DgmBSJL5wwZT7OX
p0/dlMZMixVy1onSPrWwBCBHo1epQUlYGv03vtcgLmRhhJfZpSI=
=ywm2
-----END PGP SIGNATURE-----

--BatJ3m17lGxhyYjB--
