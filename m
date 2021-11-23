Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF853459F7E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 10:48:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbhKWJv1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 04:51:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:34410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231828AbhKWJv1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 04:51:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A0AF61028;
        Tue, 23 Nov 2021 09:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637660899;
        bh=qCWbsIdevNTjWleIf0caag9T/nQnlLtg97GAqJswdyg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fuUYbN5yb+i6YwH5mStH1DhE0ZqUTwo5hhXJkGZC5y8i9x7jLG6Jf4E8FaJKDGFII
         7sFdp7qNk/s/CnBl0Z1zAyPm7laJQ6PHnwV3U6bg/bIgSsgleKif69v69i2xpa5WdH
         2n0wF+KI1M76jkU7FaOs63TNS5toNIvwnw7WNfIVLITR0vfaxy3c+5Kw0c2HMDu4c8
         n0eqjp0WayxEyvp11btHL1cYjvsPceub2/yZzTcdsjYglTuy7lBTs2RhS1nuoI8nyG
         mm+5B5GJ3snB6eqgce9Wg61F0mni6eKU02Vl1lQiNfFmdTPaFTtWbOLGnvNWuN7swN
         8kDVPXtvgea6g==
Date:   Tue, 23 Nov 2021 10:48:15 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Janne Grunau <j@jannau.net>
Cc:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Rob Herring <robh+dt@kernel.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Mark Kettenis <kettenis@openbsd.org>,
        Rob Herring <robh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: i2c: apple,i2c: allow multiple
 compatibles
Message-ID: <YZy4372NenyYXvuj@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>, Mark Kettenis <kettenis@openbsd.org>,
        Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211122222440.21177-1-j@jannau.net>
 <20211122222440.21177-3-j@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JuEtsfkU5Xm8WrQJ"
Content-Disposition: inline
In-Reply-To: <20211122222440.21177-3-j@jannau.net>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JuEtsfkU5Xm8WrQJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 11:24:39PM +0100, Janne Grunau wrote:
> The intention was to have a SoC-specific and base compatible string
> to allow forward compatibility and SoC specific quirks,
>=20
> Fixes: df7c4a8c1b47 ("dt-bindings: i2c: Add Apple I2C controller bindings=
")
> Signed-off-by: Janne Grunau <j@jannau.net>
> Cc: Mark Kettenis <kettenis@openbsd.org>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>

Acked-by: Wolfram Sang <wsa@kernel.org>


--JuEtsfkU5Xm8WrQJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGcuN8ACgkQFA3kzBSg
KbbR5A/5AQ4ZfPeJVcIBLgy7zZKfstlessiJsvQnovjzXTa5Z66cSuaCHo+0rPm9
fXv7uiJ6baytimZHWFlmL2TzI+5f15VbMDcVJDpiya1fqzjb9Kwcefs6PtRuhAzY
doAED/IPR7moXusAEZ3NaJjpAAd+GIjAFSCDxYB/pGqDcy7nnp3nauFm5FiXdO9k
Z+FdJ5+jbNNzvIPeb3cGEpxTvlxtpVCuIml+nv5A1oyu5x97TqYN6llYhg1i3kQZ
5GvV7MWqD8kXKj8Zw7wUIOcT+a3KRHppa0T/+6z6kUQ++ux/hccPaF45ITW4sR0E
7sM6b1Npy9keUfDl1GwgMkrCrUS0KEXkz+xmVri/99F3L/nmc8JtaqQDXXADPQ3Z
R9UpF9pkVDoU2J5Nl+39Zi1+P8YVHeb1CHB5o/HhcLRWYW249j4efL0QTEhScKva
wwVGMC9u0bWKurxk5ecpcN4OIqh4a8Hc69WJwjvW+OclPw7YXlXwbDq+mdHKheyM
XE8Zdp9k7TbVvVxMrpT1BdZsjcVWX7xAyR34SjEHBsAVPGtz2mU71GcX2AhEIBX2
y8KJ/pVpU1E6RRDhP9WDEmtm5OXCuTojeRWQV4Xtc29xxnMSmQOJuqeOfyDKE+Ln
Y+p8+iJsyOg6IMZlhjmhuBFod+rrLOA/FjA1ntVDOFX+qodMJ4Y=
=Ws60
-----END PGP SIGNATURE-----

--JuEtsfkU5Xm8WrQJ--
