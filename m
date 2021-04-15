Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE7CB361333
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 21:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235035AbhDOT5k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 15:57:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:58442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234815AbhDOT5i (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 15:57:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97BBB61074;
        Thu, 15 Apr 2021 19:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618516634;
        bh=fvl2J8C1Tb1CVsiiGTCJrirl+LKajjlAOZwUzhfHlJo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PCivh8yO4uwvsUK/SyYxwX7gvX5x+pnrL5Y1mY9oDPgSClJvAhoGlliircvWtEPFA
         f1bnA8yEn1VkapD8ztl4nZsf4y52/cpuCdEV2iIAJfQ8UDQss5ZR82SguV+2x4GjO4
         1fEeEq8s7hFotOklWJKGbIlwkbBw+//pRERvVAjhdkWxNBtp5q5TWAAi4IIduII/nP
         wSWRKkiwcIJbdkjulb3S+StWX96O/HbC8YueY+Nu/hzY5r9G2Mih/sUid9TE19bzzK
         4sLoF40JhJFLkdVC/HPdNpMFjs+JhEkh2VUloMv/lYga4tMDQvhu10whjAzG3LZL9k
         cHqUbdxdXP1rw==
Date:   Thu, 15 Apr 2021 21:57:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omprussia.ru>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 6/6] i2c: sh7760: add IRQ check
Message-ID: <20210415195708.GA2360@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        linux-i2c@vger.kernel.org
References: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
 <4cbffdae-f4c3-04b2-ca9b-387e7721386d@omprussia.ru>
 <58fe3ab6-7b9d-98a4-39a0-98344097f805@omprussia.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline
In-Reply-To: <58fe3ab6-7b9d-98a4-39a0-98344097f805@omprussia.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -	id->irq =3D platform_get_irq(pdev, 0);
> > +	ret =3D platform_get_irq(pdev, 0);
> > +	if (ret < 0)
> > +		return ret;
>=20
>    Should have been *goto* out3. Sorry for my overlook! :-/

Please send an incremental patch. Thanks!


--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB4mpAACgkQFA3kzBSg
KbaWqQ/+LHfDFEqrtxMzrO9858MpkMWANu1Pzy12pF3VWggzOFsELmYKIa6gfK/g
N7a8wCDbaOuOCvZtrjyf9mk64gNTxFAYRCmWTbYoB1kvpB9257nal7bYRAccQFTj
ZcHpHXa7De3i2QuWJ7aFj9GlwhXaCZSSRlqsgzL0jPXEY2MMrjWMTziS3+BoTi/r
v5N94nwx71k3WsDtPrFsTTl2GMDBdfvfU3HJ7ttY45w8DzJODwCKnMttfiGSLuvn
L1jmHqldtMGD38sqlWiCqEqScERJAnmUn/o/eA13zBA0gNYEnW0NtI+0XGx8GhMH
98U21DIlO3arb5dst2Swe+95mUgwYvGcrv30HzqDgGO7OykNPFlYsgQW1XZGoHfY
pcZTKtyKro9Ugrfilc3bhgNnEzXjpHLSKEfYq+hRyS/mH+vRS91V4rsWJCnsEp4/
3Qn6WxshEXWfZYHHL1xxKs5zDsfDZHiMYaMswOJl0FODL4fwHBiLc4uZJY26jWoC
RzqyUbq7MbD373mqiLtpiArE7fIfuQsS6VILWaix+PMb2+HSEnBHU8bj6r3cOmgM
VPuX1yeU5OSz4WPbbwhvC7HQveBm8Y+OCglVkvXgaLkeUHMi1pVmz2IZ1lpuIG0+
inDmkIyVskwvWFpeqh+hX+QqYVFzo13CYQiEGEY/K9CeP3Itzog=
=vGhb
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
