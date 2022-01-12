Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BEE48C101
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 10:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238400AbiALJbj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 04:31:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238137AbiALJbh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jan 2022 04:31:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920A0C06173F;
        Wed, 12 Jan 2022 01:31:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 30C6FB81DD1;
        Wed, 12 Jan 2022 09:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E41C36AEA;
        Wed, 12 Jan 2022 09:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641979894;
        bh=Mh/2+WXB5ShO+JhMMxkwdXRi1bd36pvpZv4jB+KEgEA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XYA9CaHRINaO18uGbAPIs0nDIpo2IHUg6Sy09zfW6MmBDCiowGkNMTaUJNqFdYJQr
         i3/9Y453Pmg29yNGA/8x13b0DtzAmu3tlBti86BW3Wc+XuRIAq4bH6QNBPTjvlmRr8
         l+Cxb1JumdrETY5FzykyI0Mw19f4lqUheeAoCnGXZY9kU+1+TON7f5rSwpuDgsnoXT
         HZ0u2aToMJX6xRwCV3SbE4VaNqhpk6jOIhV3dg69jfszj/EFsvqJBa6ppH0jaHZW5y
         j0e4CZYmI3P5tYxAEjrpk59EGM/8WhNhv4DZBpd0ngaUuDN6zoEDeMFMsFhO+4YIJh
         qMjedARERsItQ==
Date:   Wed, 12 Jan 2022 10:31:30 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] i2c: muxes: pca954x: Add regulator support
Message-ID: <Yd6f8kQ59kcY7JH6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220108185759.2086347-1-patrick.rudolph@9elements.com>
 <20220108185759.2086347-5-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DT9t5y8TwJribVlU"
Content-Disposition: inline
In-Reply-To: <20220108185759.2086347-5-patrick.rudolph@9elements.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DT9t5y8TwJribVlU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 08, 2022 at 07:57:58PM +0100, Patrick Rudolph wrote:
> Add an optional vdd regulator and enable it when found for devices
> that are powered off by default.
>=20
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

regulator support was recently added to the I2C core but had to be
reverted because of side effects [1]. I think you could make use of it
if it gets readded?

[1] a19f75de73c2 ("Revert "i2c: core: support bus regulator controlling in =
adapter"")


--DT9t5y8TwJribVlU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHen+4ACgkQFA3kzBSg
Kbavbg/8CxSqoWdjD/EojnoLeSsp7qZAskQakdIQtNSkpquMbrdlMXVhvgIoinUQ
SMjDlCKTviBjSBPM2Lkfs/mc76QguQRyEGivJcdvQ32OoU4DwRiVfpuE0CqcB8Ot
JBYPZpNplHkT5HuBEHTiqxfOYjbZj9UxVeLrppcWgXhBpbbjKbJBbsAYPpndEsy3
gJid3jjxAayP6LL/XBM4msjKtKr86YdH2nHmQgOJwnOJvNMPxt9Pbhg37e2BGz5V
mJMs9361wi3qENNPg7XzbNQYrsDs6/kvWyV643VhEjMwgH0Vqm+ADvfS0RjEfQpp
qEvX6rTxNSUDmZG5vNyvCZZdBPvhQtrceL5vp1SnLyL2AjH0ThnjxoYkLUjnLdj7
cf1uOuDZ5brUzICJkwlINAUmHaX7aWK1PRBrX91PurUfy9MBURmX3d4+cXncpXjt
BjNMsHtx2K7Zz0pCLFxGr+sWhDcVLOPTsOjIZVluZ3zDqF/F4lB6qcaHY+i3o+ej
6tnuSm89mYaP/BZ9jxzykvjz8wJ29Avr6sGW21jj6EKNQ5O1PIC4QLpLOFU5kDP5
hTHTu4o9U4/rdzgE6nNQG8H/k1a1DhZ6hwWJXWgNII8FYkp5w461b+FXmzZcN8iB
5Byv10MndRk2dJXzxB7JVRqaSgpLvEUR9SkWw158wL1QO7A5g30=
=G5DN
-----END PGP SIGNATURE-----

--DT9t5y8TwJribVlU--
