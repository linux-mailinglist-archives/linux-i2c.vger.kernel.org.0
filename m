Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 224D917F2D7
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 10:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgCJJMB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 05:12:01 -0400
Received: from sauhun.de ([88.99.104.3]:46284 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726195AbgCJJMA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 05:12:00 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id 9A0582C1EB6;
        Tue, 10 Mar 2020 10:11:58 +0100 (CET)
Date:   Tue, 10 Mar 2020 10:11:55 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linuxppc-dev@lists.ozlabs.org
Cc:     linux-i2c@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        debian-powerpc@lists.debian.org,
        Mathieu Malaterre <malat@debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH] macintosh: windfarm: fix MODINFO regression
Message-ID: <20200310091155.GA1987@ninjato>
References: <20200303125046.5157-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <20200303125046.5157-1-wsa@the-dreams.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 01:50:46PM +0100, Wolfram Sang wrote:
> Commit af503716ac14 made sure OF devices get an OF style modalias with
> I2C events. It assumed all in-tree users were converted, yet it missed
> some Macintosh drivers.
>=20
> Add an OF module device table for all windfarm drivers to make them
> automatically load again.
>=20
> Fixes: af503716ac14 ("i2c: core: report OF style module alias for devices=
 registered via OF")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D199471
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Tested-by: Erhard Furtner <erhard_f@mailbox.org>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Michael, I can take this via I2C again, if you ack it.

Thanks,

   Wolfram


--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5nWdcACgkQFA3kzBSg
KbbDexAAoT6EkAdzdK+5cS24d9RczslflX/i4KO3FuBZhFXWgQPB++xI9bsVnx1K
lDnpYLkhuIhXBvpb0Mx34aXQmFHnlosUxF9Pgt/cPertcgLlgA2Fx9U6e6AZH7VI
xIzwCmTnaFEQC+3U+x34Ytad+4/v/YT94Mw/7Q4WlQ+f2IZpXZHLaegVwTaULv45
4+cuAY8YCAW0dPRjbUiX0W405w3kAWY/J5l1rOAbYfoS+at/c+L5qvDrUuOLdiUe
Jlh74Wrq428xd9xmRFfkp3WoOed4AD/tYghY+lzUof5OOp/iNb8nSqZbc40bjK2R
KrwK5yrQUb8kAL2DDGPKNMUkCpbQtUdRCKATf4cXMhF8M59mVme1rIzsrzF4uAsT
mVgeLE+KBLcIvf9APQlZb/SUuWYw3vxaCocgA1Dzr6yxXKxgDJhRR7Ys43aB5USo
cgiMbrKaiTtfsRwXUONpZZi4QFRkz0hv7QL1DUXPM84E0G4rsBa5eGCxYByz+Lm1
gjflQ8znE6LsF9SbnJJPEe7jfyPkOvLrf4EwlkfG77UWM1tMemfO+gUCCKIzDZSk
VIIc4kZgfRFntRoPYVNoVpK/4Cx4ghsXj/+bNod2mAxd+dLS10v3QWyO1dQyGJ1U
GUNVoye0M7ntf7TvmMnCfIc0oDBDSxfVVPmsajLs6/jhCPUZ5qk=
=/cbP
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
