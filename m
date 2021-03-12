Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9060B33888B
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Mar 2021 10:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbhCLJYG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Mar 2021 04:24:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:46184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232818AbhCLJXl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Mar 2021 04:23:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B66964F09;
        Fri, 12 Mar 2021 09:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615540446;
        bh=AJdZGmDhGxx5TmaTmC4ylxcirQVAw3oTrq1wVYQkWIc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tIzgn2RzuDUqFs6JA8jPyB1rKqAlw0BdycnN723xfNMkojnk98D47MLvUsxzpM9FZ
         bvXz4KAh4qTRTj7gs6mi1rTb++iAieW4yVVmrW6p8O3qSghoTf3wz2hKWLASqXee6m
         ktqMWPjTUi1O3XLUbHBs3zyQUhqGbtOtAtNUo3cAxnS2WKFcHd/8rqF7QjQeQvJIXC
         CywVmBYGkJV2BkmSjyom3nYbsxUNUsNE2ALKrrS1iiQdmrPoRsOxYFZqalqny0qqAY
         4p0BP3NS3B+m89goRXqgPpfbJhr6/lqTKLRJMWm05e+kI/hCY/jGYKPk/4s8SS0th9
         z3E+Iyp7GfIrQ==
Date:   Fri, 12 Mar 2021 10:13:55 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     syzbot <syzbot+ffb0b3ffa6cfbc7d7b3f@syzkaller.appspotmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in __i2c_transfer
Message-ID: <20210312091345.GA5294@ninjato>
References: <000000000000f564d305bd521b83@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline
In-Reply-To: <000000000000f564d305bd521b83@google.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 11:47:17PM -0800, syzbot wrote:
> Hello,
>=20
> syzbot found the following issue on:
>=20
> HEAD commit:    28806e4d Merge tag 'media/v5.12-2' of git://git.kernel.or=
g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D11192342d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D6bcf96204c1b8=
e77
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dffb0b3ffa6cfbc7=
d7b3f
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1083223ad00=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D14345f0ad00000
>=20
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+ffb0b3ffa6cfbc7d7b3f@syzkaller.appspotmail.com
>=20
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 8406 at drivers/i2c/i2c-core-base.c:2021 __i2c_trans=
fer+0xa87/0x17d0 drivers/i2c/i2c-core-base.c:2021

Yes, it can be argued that userspace should not be able to trigger a
WARNING. For in-kernel users, the WARN is really helpful, though. I will
add sanity checks much earlier to i2c-dev.c which will not be that
noisy.


--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBLMNMACgkQFA3kzBSg
KbY81RAAphTsoj9bYx4Q9CcF+BaB/bjhrPBYMe0/7FklyN2+QHzmJJw003YSMihi
Nwv9MvnJzoCSKNkkq9gwNA7DTcyNJ3z9ahepRdrRjlzsPbSfCrlMPilL6uIV1AKJ
NSC3r4+u+nIop+aaC8lYKydsYWrl/sjsgVRb204Ywv68BnESUGrGSYsWAsqdljpG
B6ReFpkygBzsRu4EMGRMD5z/nwt00h1sXCmgj/lsTkVxj/u3Lr+7PlQnNPlDxJVU
gX1n2JPKOX50ALnay1crEvCkGbe1mkXmTdGHf6Y+8+d+vhAdORNnTosKPxWQVZ+H
pWxcajhH2z1/dr/B79pZ/hZhTiIbkM6o3pGH3X7y5rSmB3RdPWUp15hHGCllAbJ3
cUAICT8coc8kIgQfkidbNDaDuVnaXDlkeqbH+o/7eDXrfmPJXHxiCf4H6nSDFRL4
G+D3u8IGExEDGQ7iMJh1tHNuuwIJcKNy2I4YejnzmZLZnGsRXFJU2YDYJewfaktJ
49HhEPYoNhUbFTkfXYbMtcP959H5nGXPsb5S5Rll6DodDabtMNbjNiV3NjAGgM5z
cjCtYcRE3RGzoDyI23MJcintgbHTIlNWWLGT6iaRBmNJKSXYiiQBB1pr8BASIWku
AbPJ8rCLDHPG1KqVv3BouN4k7H79Ey80XYg2tMYa4nYLVDh9wTc=
=pZs9
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
