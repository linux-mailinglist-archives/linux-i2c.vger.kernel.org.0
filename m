Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7602F9CE3
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 11:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389821AbhARK3O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 05:29:14 -0500
Received: from www.zeus03.de ([194.117.254.33]:43264 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388890AbhARJcu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 04:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=jjlIzJbv5AfMOZb8DeeYojqlwPux
        8lrHsYxvp6bLS6M=; b=zYbQ8rzGeBpdP8pj5YCVWlIshwK8NP5pKgMELuji1aV5
        UVz9XA9eA4ETqix0Ie6eKwqFFfydFdwWi5b/yh/36ZDPxhDMwFopIqKJjpIq+m5x
        Dp0vqlqTQT7BqXDrdKgVGgu4tUWtbgPLjQDi757w5M+dY6uGAwukiDnMYLQ+Btg=
Received: (qmail 643050 invoked from network); 18 Jan 2021 10:32:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jan 2021 10:32:01 +0100
X-UD-Smtp-Session: l3s3148p1@JozuZCm5uoYgAwDPXwacAOByz8F9Mgm1
Date:   Mon, 18 Jan 2021 10:32:01 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] media: i2c: adv7842: remove open coded version
 of SMBus block write
Message-ID: <20210118093201.GC1018@ninjato>
References: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
 <20210112164130.47895-2-wsa+renesas@sang-engineering.com>
 <f1c17eaf-1ab8-2665-54bb-6df69ab1f067@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0lnxQi9hkpPO77W3"
Content-Disposition: inline
In-Reply-To: <f1c17eaf-1ab8-2665-54bb-6df69ab1f067@xs4all.nl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0lnxQi9hkpPO77W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +#define adv_smbus_write_i2c_block_data i2c_smbus_write_i2c_block_data
>=20
> I would prefer it if the driver just uses i2c_smbus_write_i2c_block_data
> directly instead of relying on this define. It's used only 5 times, so
> it should be a trivial change.

Okay, will change it!


--0lnxQi9hkpPO77W3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAFVY0ACgkQFA3kzBSg
KbbmFxAAgGh0H3VpFDjIoJkJ89p+HFbHBHoviJp61p/GkaWpQkD8K++fMxEH048H
6vsASnSSkUqHzdhq/4nHbLVe/wvwe/PZkCqRdMnhuXrhzS0Ip9jZ7ljfA6H/rpxC
eg8Tcfr6lBW6hNwO+rlagA26+xMwEFrq+yNIs+hr39pzb4oP1lDZVlh8uR9bFXJN
Onpk/V8tPQY9Y3+SnMWixVcLGRaIeJL9V5EXpv+ZXNmFFqkDcD8Zlwah4qtoz3v8
PVWgvbFpDsMIMa0sj3kwEnf47c1SIw0flK64n8cdTTGSfKk/7VzDVRIDDYO0/wr1
aG2KnkQd4FUcHYorlWdG4TMGaTM9A/3c6XeQHJGIfp+VzSe4XI6fFIoHuJD20iFK
dLKZvnAfe6qLIiaW/0VG8hGo0w98ixJY/W6Y+NlR8eYYDP5mHWU0tDG3JPGsSp93
LTf5FbubZO2EOgGfMvZKX/eict/DDX+dtckssRX7eaa6T9lxZSGc5oGllkgFhchL
Iqclq0fDMffCVmlXFHIfDlxojcmB7JZ5HeS2M3+QCu+84VZzGuRLTc4Jf6cxoPwu
bC3PqeElZHN04RSvUfdVkOkQx8T+jvQuqYkou3duh11d6u7MsIJ0MBbIMPxrYqIR
5Jkf5KZkwxvFhE5NXab3Fej3u/RE8EZN3gRmkHrxn3k9bJjmIdI=
=6du5
-----END PGP SIGNATURE-----

--0lnxQi9hkpPO77W3--
