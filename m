Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42E8C51936
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2019 19:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfFXRCb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jun 2019 13:02:31 -0400
Received: from sauhun.de ([88.99.104.3]:35436 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727839AbfFXRCb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jun 2019 13:02:31 -0400
Received: from localhost (p54B33083.dip0.t-ipconnect.de [84.179.48.131])
        by pokefinder.org (Postfix) with ESMTPSA id EFD452C0398;
        Mon, 24 Jun 2019 19:02:28 +0200 (CEST)
Date:   Mon, 24 Jun 2019 19:02:28 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Jonas Mark (BT-FIR/ENG1)" <Mark.Jonas@de.bosch.com>
Cc:     "kjetilaamodt@gmail.com" <kjetilaamodt@gmail.com>,
        "WANG Xin (BT-FIR/ENG1-Zhu)" <Xin.Wang7@cn.bosch.com>,
        linux-i2c@vger.kernel.org
Subject: Re: Bug present in at24.c in 4.14 kernel
Message-ID: <20190624170228.GB6164@kunai>
References: <12a06d759e3d44a89ae41f65631c16c5@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Content-Disposition: inline
In-Reply-To: <12a06d759e3d44a89ae41f65631c16c5@de.bosch.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2019 at 04:48:17PM +0000, Jonas Mark (BT-FIR/ENG1) wrote:
> Hi Kjetil,
>=20
> > I have been investigating an issue with eeprom that turned out to be an
> > error present in 4.14, but fixed in master.
> >=20
> > The fix is
> > commit 9a9e295e7c5c0409c020088b0ae017e6c2b7df6e
> > Author: Wang Xin <xin.wang7@cn.bosch.com>
> > Date:   Thu Aug 16 19:45:34 2018 +0200
> >=20
> >     eeprom: at24: fix unexpected timeout under high load
> >=20
> > A lot of stuff has changed in at24.c so a simple cherry-pick is not pos=
sible
> > to do. I am not fully sure how to fix this in the actual version of at2=
4.c, or
> > if some other patches should be reverted instead, hence I have not
> > written any patch myself usable for upstreaming.
> >=20
> > I am writing this to let you know that the 4.14 has an error, and maybe
> > other branches as well, I have not checked. I am not sure what is the
> > best way of handling it.
>=20
> Thank you for bringing this to our attention. We are actually using
> Linux 4.14 and the original patch was developed on 4.14. So we are
> covered.
>=20
> For getting the patch on mainline we ported it to 4.19 and sent it to
> linux-i2c.
>=20
> I do not know what is the right way to get the patch into the 4.14 LTS
> maintenance branch. I propose you ask that question on the linux-i2c

You (or Kjetil) could send the v4.14-patch to the stable@vger.kernel.org
with a line added to the commit message:

=3D=3D=3D
commit <sha1_id of the v4.19 patch> upstream.
=3D=3D=3D

Would be great if the i2c list would be added when this gets submitted,
too.

I added the i2c list now, because there is much value in this
conversation.

> mailing list. If needed I can then supply a patch which applies to 4.14.
> Please keep mark.jonas@de.bosch.com and xin.wang7@cn.bosch.com in CC so
> Xin and I will notice your post.
>=20
> Greetings,
> Mark

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0RAiAACgkQFA3kzBSg
KbY/vQ//TIrKwqDPrMCr0xcxBpkHH7v5+YEwWWcoIoiJ6dOjHWsBuXOHQXEQ7yrF
PXdmZ1nc8nE3CksXCoZzUnfOopCerbpCE57ynpf+/Gl8T/lKQ18/BPOtqfc1Va+O
owXFWPWQViB71fhNmyoa92Sac1PxA5FQ64QdluHO0FLuGnsZuqYVXJTpD44W/2G9
YItxNkbbd4B0jW5o52Zlabx3D8JzeAM0VXoPp3grp97nJFtQms/v6yBSbcA7MXzn
Ok+XCKEHsJdR25YMsH14P/aefgns1bR9Y+UYgBiOL1mLqEKE0OloqqO2H7wLA7sD
8OtmScynqlL0Xp+lOV1hp5Rkqv0hDn3tBVVKPLA2CnjXKVc0zthuWPrvbeQP9+xQ
yqx7qptqcEWhefdSjA6/y+uja2f+5H23pMo9E4uYBIcBo3qLGMY0KyJw3IIs9EET
UUEH9dloKVRwVBjEDwOenHPG7R1fuIp+7Gfym5JJbeCR/7sJxE1RN7q50FkdIck4
/5GPyH/L2a2b/PTYZXlUFu/85HYu67cWJAIgFF0a3MFeMeqcgnY8PFoAAMp8/a7l
t8XkySObhp/Cfk3SG2379x/7POXos9qWbo9VIOaxbt/Z2Lm6GoP5kKpezYwn8QOb
nWss6gmO+c1dedF81z7vzj9cxoNlIwE244OcdgoYcPbrm9XVnhs=
=BaV9
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
