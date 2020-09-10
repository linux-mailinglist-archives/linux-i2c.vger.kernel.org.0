Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739B3263E24
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 09:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729802AbgIJHLI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 03:11:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:37908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730431AbgIJHJS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 03:09:18 -0400
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88C132075B;
        Thu, 10 Sep 2020 07:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599721757;
        bh=dau+Mq0fk5glQHCe0pIK1VY4BUymkhnmFbWfWSkey0Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SOsB4gAPE+5rVRjFTkq31bo6S1Pg3lxpNIIlV4M2xPIIDU6ut9IqvsZ1X10oKoMOA
         zn80JWF0RUwyuPr8Thvg3S4FT/VI+NZF9VVcvhhSGbX2aIXiygX8rdl6snJeH2ZzB2
         4i9+RKUzuXiipIWLB+HYnT7gCcBSJPfmW0O5Me0E=
Date:   Thu, 10 Sep 2020 09:09:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Volker =?utf-8?Q?R=C3=BCmelin?= <volker.ruemelin@googlemail.com>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: i801: Fix resume bug
Message-ID: <20200910070913.GI1031@ninjato>
References: <20200901152221.3cea0048@endymion>
 <19d445a6-0410-78a0-77aa-4297e864d064@googlemail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YhFoJY/gx7awiIuK"
Content-Disposition: inline
In-Reply-To: <19d445a6-0410-78a0-77aa-4297e864d064@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YhFoJY/gx7awiIuK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Volker, hi Jean,

On Sun, Sep 06, 2020 at 10:00:50AM +0200, Volker R=C3=BCmelin wrote:
> Hi Jean,
>=20
> with these two patches the code in i2c-i801.c looks really good.
>=20
> But there is an issue with the reproducer.

I am not familiar with the HW; do we want these two patches here or does
the issue below need to be solved first? And if we want them, is it
still stable material?

Regards,

   Wolfram

>=20
> > I noticed this bug in a QEMU x86_64 q35 VM booted with OVMF. OVMF
> > doesn't inititialize the SMBus master. After 1s of SMBus inactivity
> > autosuspend disables the SMBus master. To reproduce please note QEMU's
> > ICH9 SMBus emulation does not handle interrupts and it's necessary
> > to pass the parameter disable_features=3D0x10 to the i2c_i801 driver.
>=20
> Since commit a9c8088c7988e "i2c: i801: Don't restore config
> registers on runtime PM" the reproducer doesn't work anymore.
> This is because commit a9c8088c7988e works as intended and the
> pm->runtime_* callbacks no longer call i801_suspend() and
> i801_resume().
>=20
> But there is more. With the SMBus master in runtime suspended state
> the direct-complete mechanism skips the calls to the pm->suspend
> and pm->resume callbacks on system suspend/resume. I am convinced
> in nearly all cases this disables the fix from commit a5aaea37858fb
> "i2c-i801: Restore the device state before leaving".
>=20
> At the moment I see two ways to fix this problem. One way is to
> revert a9c8088c7988e "i2c: i801: Don't restore config registers
> on runtime PM", the other is to set the driver flag
> DPM_FLAG_NO_DIRECT_COMPLETE in i801_probe(). I tested both, but I
> can't decide which way is better.
>=20
> With best regards,
> Volker
>=20

--YhFoJY/gx7awiIuK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9Z0RkACgkQFA3kzBSg
Kba1eA//fgpNciQs6XQKjVhLnaQLXcPNw9jjsILHl0hpAgBvHGEh3cMlHDHG5T5f
nC+oAFXrEdWQNNBswRXY/zVgP0RUS0JHSPGxsAKeMP1XXqARwrP1CtRtwN5D1Kc0
r631OaqqJUTCwD/Rfj5C0tBPIfjnz0SMFk94XA4a64+7oKgK0fbNOTYryZMcmXnV
xJ8o/OB3m+g1ZTPQCydHarmi8pkkSrDbVN9GO1Yi4IZrpfyhYfmGUzA9PJpXIrsh
ba1cSkAFhSWhgzVe9pJ5ZCf6U7+dJ80wHv8ndE+BP2LF+LyT3VWEXKynL1qfD1jz
e+zMEmGOA82VL9QnMRP9n+XfBSZjSEDLf/iNcOqulvHYRk2roZm53nN/h9lS96rW
rOouZHrIBT1RjQI+4zomewWnwIjeH6wZdgIUMbJhZBZ5dmrGqCoBJnkMZ+y84DUC
6BSQcLAnejgxc+MpwOwioe5PsgKsSMvd6Ol9di6Pa+/8RIfU75E4BZxBXQtROOa0
BseRKOswMj8y4hWfUj15f76FI56bEz8wfe8EG4qHPcV9JN6GIdc+7Qs4+BDJsrM4
wWCYjikzd/SOut7eTcHg4t/xbTW5uweOTUxPFnNIWT4qF4uX/drgOhb9xo1uyemw
ibDcBn1nF4CziUMjifYB7238UpsuYlxvd6MhY2Y9URNgFPpxMuM=
=mGss
-----END PGP SIGNATURE-----

--YhFoJY/gx7awiIuK--
