Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5850F2002AD
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jun 2020 09:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729548AbgFSHYP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Jun 2020 03:24:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:55288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727096AbgFSHYP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Jun 2020 03:24:15 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A09D20707;
        Fri, 19 Jun 2020 07:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592551454;
        bh=YE+j5Qfxk5WxcdreV4I9oQo6rvcXDtSIUJq8WxrlUiI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HoFn9R1jORmlsIO1dMvXaOueCCbTv+CQGqjVmSQbiX3JnPrGALfjwoNOz0hE2ID4A
         bQPW+ydqKQN16paZ8NgRvFULMjTTHusYxXU2ztp3uBhCLMi1Ndi6CTzuB8QqrgnEL0
         KuDC+hvqRN45lScm9KYhq76RGSEmaRxmZq/KUTNk=
Date:   Fri, 19 Jun 2020 09:24:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     git@danielschaefer.me
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/1] Documentation/i2c: SMBus start signal is S not A
Message-ID: <20200619072412.GC1705@kunai>
References: <20200614182355.19742-1-git@danielschaefer.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Content-Disposition: inline
In-Reply-To: <20200614182355.19742-1-git@danielschaefer.me>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2020 at 08:23:55PM +0200, git@danielschaefer.me wrote:
> From: Daniel Schaefer <git@danielschaefer.me>
>=20
> Just like all other I2C/SMBus commands, the start signal for the SMBus
> Quick Command is S, not P.
>=20
> Cc: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Daniel Schaefer <git@danielschaefer.me>

Applied to for-current, thanks!


--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7saBsACgkQFA3kzBSg
KbbjVQ/+M0cIitxoPQXdXLGHyc0evgfDoUFRxOgp7agAwMrjkktdx1khCz5V700/
0uFIaR+b4/XpkdIiCQvigwuDqG+nQCaYzdGPThbyKyWnXRgtquMelZxvsO1skDzA
hXIZ47JA56arMVqZJcAcA44Uggl+NF1MEnkJfSNqjJXakd1lQXy9Pnrt90zEss0K
I4Wv4NywykB32D6yntkXVccsdqDKpuGilj5Uebm3ToKVq1VRNjPLdXB56ahLoF2A
6Q30t7d8dyXY3YOVtKPqicBih506MVCdKwkRMzrV4CUMI4IjqCHX4zNX+eQ0igYm
99UWvhtALGR2y2JCfnxIw/TbncbvmoEn4EzB2h4A0Wu/7D+g9q+2RCbIZZWKanvh
RTDB2jBiX6Gu7FHDDZlFAQBXhwttYcDee6x2K67IMN+A3vCmq3vUzTU6HErR3HGe
XpYkbcrGxTEIEjuaq+SG/SeStzwEInHqr4vjrKGvM6RhPCeB5GdTgyBbnDT0NkOI
iOapqwkY6Ykj2UQVxtgmZh7Bj32yppl9N+7+JcuGBe2whxEPZLPuq9Duz2MUhFqv
pddY7ZtIPqUoXXmiI9nUCoEAkKQ1njUm+k/G6sRnlGaswsW4UE9JApmm9iR5ptJ2
wRNONV/St5Xmj9ASN3UySoUqt1gcCzIHOPKO9StdCWfuZ8/ahog=
=5g/l
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
