Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E7A48649D
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 13:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239085AbiAFMwQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 07:52:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239084AbiAFMwQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 07:52:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA848C061245;
        Thu,  6 Jan 2022 04:52:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2D873B82106;
        Thu,  6 Jan 2022 12:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3230EC36AE3;
        Thu,  6 Jan 2022 12:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641473532;
        bh=sTUfBBZf5cDmvuCRmSZ5GpkMh+CfVe/MIPQg2YkzmdQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RTBNubVPzHR1b5c3iBRxBTbX1QKb2drLf0TJ25YdTWdDd4+Dh7ypJgXiK/uaKZq1x
         NOtAMh5NVoca7LQN0cb1gaPe7VrPC/ZDkpWt72r9liB8/QqDqUe3KhmOZ2fQ3+2hdB
         NkcKAjdDNd4DuMlMKyILVDC+xct1KQPFMKAO6e5J18mNpTEU0TOLKNygWYGl1fr6X2
         zKrBjMCXS6Z/JbNL3l07LKTUq54mI9tUDyBpoV9vbHYsgYkXP+bFGjwCpkatQGrPor
         c8o25KHygPpELjpCgkXqes3D4vt7NRGGlmmrM5lEGdexPrkjE2hY+Z3gHJHTziry6o
         9Ey/4ff6b8XDQ==
Date:   Thu, 6 Jan 2022 13:52:09 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Miroslav Bendik <miroslav.bendik@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
Message-ID: <Ydbl+QgVWqjho+dl@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Miroslav Bendik <miroslav.bendik@gmail.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jjpJsdYkgFkZLP3a"
Content-Disposition: inline
In-Reply-To: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jjpJsdYkgFkZLP3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Miroslav,

> On Thinkpad P14s gen 2 with AMD (model 21A00003CK, BIOS R1MET43W - 1.13) SMBus
> address detection don't work and trackpoint has slow rate (30 Hz) because can't
> use SMBus. Email is divided to SMBus and trackpoint section, there are issues in
> both modules.

Do you think this is this the same issue as described in
https://bugzilla.kernel.org/show_bug.cgi?id=214597?

Thank you for your detailed analysis!

   Wolfram


--jjpJsdYkgFkZLP3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHW5fQACgkQFA3kzBSg
KbYFwRAAmGRtk6P0NMIKeDoLysnElOhU0PirrkhxHWMB/7kNkLhvpu1eR++wBi+I
P32vvES/be1IwHNJfhRAEjSxdyd9Qunn/inzjz7dE9f+y8wWw16o1mZXQrZGwjpn
VlmSrM2YyckBDjTX+V+9HuYfEIz/rMQ+1joFX7WjoHitizstgsziYXio440xAxxA
RgOrrlXxqvNkn/EKqAZvQXUMCi6D5GT/ANkpUHRKvMDtZYT0uYIhHkSa18gzJKBx
5WcOqHmi6gigCpw3pIE3WgTwUYgfHPzFKanyGmC2j5mQ7H8U0OL5ee5+mSa8MmVU
vlfbDySHAjs+DFpQ0urNwXWVSMOBfeTyRelsDYe3R0iPLKfgrLYIecGBSUzj2Hkt
VGEtgwP1FM4cML5QXYV8VsLhC5entIyy16Z8hD8NNmvW3ADI8DnvM2fxatPofT8B
YOVIK7XHbL2oGgFijTk0N5R8dnbty21qZoj7jLzEi2FEq8p0IZWVqEyAVwgWlNVv
iaQnkh3lBwkMpGu7x4h9IQskdXGS9Q0SU9JQNLcDNjCyo5ESyqKQn4VOvetJ8E0F
SKXJbcZZW3zXpZN395ZQMAVbGrm8hdr4f6n1u+4p1qhNV2zV1OkvCiIRQXE9nyzD
s/dibErk5MNKBPFxtI5o9SvjPzkcEAPuG8F8YPZAiZi4WeDb8ag=
=tf4W
-----END PGP SIGNATURE-----

--jjpJsdYkgFkZLP3a--
