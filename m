Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB1632F3614
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 17:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405377AbhALQpR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 11:45:17 -0500
Received: from www.zeus03.de ([194.117.254.33]:38202 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403796AbhALQpQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 11:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=wnKCSjcDuaBu5Dw3faPAZNWGPVwG
        m9aVO5eOWICBkSc=; b=JLwMTQGghUyIuBEKpFDnFVE0JIuoyLc2+kZX4E91mLXM
        31oyshuzxzU5EzUSOG7LXcIjcoARcZUOtiTePM+RJ/kzje/CEQYUiP6S9yjmTUT1
        XcYJzoZVy3rLQr8ZypTYHVPrpIK+DN6H5ly5oJQa6PW8/6OYaElVURHGrV4HX8A=
Received: (qmail 2813548 invoked from network); 12 Jan 2021 17:44:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jan 2021 17:44:35 +0100
X-UD-Smtp-Session: l3s3148p1@HqLPvLa4vtEgAwDPXwxzAHrEwO71dOp2
Date:   Tue, 12 Jan 2021 17:44:34 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] media: i2c: adv7842: remove open coded version
 of SMBus block read
Message-ID: <20210112164434.GA47645@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
 <20210112164130.47895-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <20210112164130.47895-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 05:41:28PM +0100, Wolfram Sang wrote:
> The open coded version differs from the one in the core in one way: the
> buffer will be always copied back, even when the transfer failed. It
> looks like it is expected that the sanity check for a correct CRC and
> header will bail out later.
>=20
> Use the block read from the I2C core and propagate a potential errno
> further to the sanity check.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

$subject should say "adv7511", sorry!


--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/90e4ACgkQFA3kzBSg
KbbBMg/+JZzUyWKwElld60MIkYxKvRuq3e/me60lsKJVz/BBfuu7TVxXuF7SRLug
B++WrDe2gRbePRy7u3Z6ww2xQ9KchGsJ4im39wFDVm+HhFAGqIkbsEndzbyr+12g
pnvJ+eNaH0mW8I3iNF1xaIsC3QToVYzMkjS7g55ba4yR0rcUN0ufyZZoUNHYrYN+
NUsFAeyQ/L4EItyCR86oa7Y7liKEMoQOQgVztbXUO8U9+6MBuhbwktTeHuR3KgQs
FXNLWpDxKHCZPo92LLtYQ0q3b3SKqPFYUBTKoYe0gJUKPIdJQlKsUVDWxxa/JN+G
wJ45f6VdvDtoIS5/aAj857MJYzgmF13HN0OoM1sxg25TCN3tJQ8QKWR31055lcZ6
U/8Xu4af9FKOZl3U3VcUajRAK5fyr7N1HAwBRYBQMRGcVlG8vL+xEhMBzJuq1lnW
6Yi1Tx79H8hR6Fdt3bu8AJoR6y26PpvYsVBbK7sxvkAI+7QCR9CXjOjizBQUReM9
oq8uGKduuJJRoSjEUMv9Lh6j08bBLi4Pgs6VS0Mkd5EQdVHoIi1MMf5rkCBQzFAa
PdzkWtSIIJb3v0ySe8Qlr6SBhazhfB2FSdYodgqSjfPa018OmTS6UZowVjeQNJPE
8U1hm6hrWBdsjEpRWZscQxTnPwO89QgP/h5OfjFYXng/h25Srww=
=00Lt
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
