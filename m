Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2722330B295
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 23:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhBAWIR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Feb 2021 17:08:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:57214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230055AbhBAWH6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Feb 2021 17:07:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E37D64E2C;
        Mon,  1 Feb 2021 22:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612217238;
        bh=x41kuEjrEv0ynrAHUk/wntD0PwGw1d5iRindrjKXweI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Do88UeT05QFpRq9a8z686c0FrzNUKsxGLNKXgmyIm/x6Y3jAzX7ltKFUvWYG0N5qK
         e6H+U9tB2EvJPbbGWtduDrmD+HqwYMX35ss9eHtnJAQTfNtbm5iAAbRM9AO41iw7wf
         POeNLOSu4IwKYw+SYuCTVy8Q8rLjeegyTf0Lvx1EBySmqOeDQSv2+o5m2ddLjEoCM8
         /E1bkxFZRR3IetxaEZne2F6kvaWxXLFliedW418y/fR0ITsrtI7f9jcPOOLkueS9IC
         9oojUXsy/SK+OW724s7DhBvnfBXGxWu2htTFVhePWVyI+12M6N8jkNJhxOIx5mOyC6
         goH+nJfBoGiiw==
Date:   Mon, 1 Feb 2021 23:07:14 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ondrej Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH] i2c: mv64xxx: Add runtime PM support
Message-ID: <20210201220714.GF24315@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ondrej Jirman <megous@megous.com>, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
References: <20210103105146.33835-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Content-Disposition: inline
In-Reply-To: <20210103105146.33835-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2021 at 04:51:46AM -0600, Samuel Holland wrote:
> To save power, gate the clock when the bus is inactive, during system
> sleep, and during shutdown. On some platforms, specifically Allwinner
> A13/A20, gating the clock implicitly resets the module as well. Since
> the module already needs to be reset after some suspend/resume cycles,
> it is simple enough to reset it during every runtime suspend/resume.
>=20
> Because the bus may be used by wakeup source IRQ threads, it needs to
> be functional as soon as IRQs are enabled. Thus, its system PM hooks
> need to run in the noirq phase.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied to for-next with Gregory's ack, thanks!


--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAYe5IACgkQFA3kzBSg
Kbb84w//fMp6ks/Ehg2LSMYiABFF2vGZ4Zmqmu7pP6h7vs66KtM2TxBXLbUq9ZW/
csd7S8p4QnoxCAwmP6i11d/yWP8gttKhq/TZTZUz5ENIayhIpDl8o6ST6NCcvFsR
S/b8zsIGx+H4Ez92AEf9a5NpaUsZ4HU1eerR8hIrzXeUT8deCLo97KRKwa/iQrNL
t4q4m/WAkrt+THlfYdU1LZN8L4u46QdxsWIhhmdJnGM+6Ah2n+WgMMfskTvE7oTI
GtGldyMIk8sgIYe/36GE08d36Uccw5KkqIkl8pVqivGq3R+B9BdH+D/jtuBRDa/r
Uv14bTu7zfjDtxvLUxfiUUaolWw+ojjp8YfZZ0Nhl4IZuJH9DVQ0z6lAl1OZ0eiJ
d7ZKuHo0zwgxzZ6RjDrbBXQJsbqZwx2aIbdI0RRzLNJoZhFVINdmvKdzwBwGY3Y4
kVUFGncRNO5RGnRNOlbG/06FScpThaQy3UvX5kyq0ua++khc4lB1qysEa+UDBd9Q
x9QBqkhyv1+fOI/WY4vbTBxtYIMf0p54AqIsTEveKJ09v0POBltkmuLPKrYMt+Sa
2hB4q5JyI3V/aMFF7N3qWUPhyYGDTrFu9lHC/FAYpX/mzcMDU2Wq8dLcydfEiLmE
SwK0C1sRIdf9So8vuzyGjOND+X/cHO7Z4kCGpzseZtskUNfjMhc=
=N8RG
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--
