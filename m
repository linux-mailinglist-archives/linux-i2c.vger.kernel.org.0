Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96A772307BF
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 12:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728563AbgG1KgN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 06:36:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:54860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728424AbgG1KgM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Jul 2020 06:36:12 -0400
Received: from localhost (p54b330d0.dip0.t-ipconnect.de [84.179.48.208])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C74220672;
        Tue, 28 Jul 2020 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595932572;
        bh=+fSZv8SO/xPHmeFtaK3Kpc56b52vGxnFueC+0xzR6Ds=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tBsZxmwAfDw+g8+QFGAeevXJ5bMurJihlI5yGOYI+DH1ejPux8vIhgHKnxTF2iQlU
         wRwSWqxdLZKyUZ5MWzJIk0qHu2TUaqSG9dUUpLwQk0Xpos2qUkT3l8hcbnhUls1yhy
         iYATKsEucGr28wUh7bLpl/60XVkDCXVu9P8osZHg=
Date:   Tue, 28 Jul 2020 12:36:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Daniel Stodden <daniel.stodden@gmail.com>
Cc:     linux-i2c@vger.kernel.org, jdelvare@suse.de
Subject: Re: [RFC PATCH] i2c: Support Smbus 3.0 block sizes up to 255 bytes.
Message-ID: <20200728103609.GB980@ninjato>
References: <20200728004708.4430-1-daniel.stodden@gmail.com>
 <20200728094037.GA980@ninjato>
 <88D24A81-513C-4CA2-9AC8-FB156E992F34@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline
In-Reply-To: <88D24A81-513C-4CA2-9AC8-FB156E992F34@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I thought about this, too, and wondered if this isn't a size regression
> > in userspace with every i2c_smbus_data getting 8 times the size? But
> > maybe it is worth if backwards compatibility is maintained in an
> > otherwise not so intrusive manner? Jean, what do you think?
>=20
> Yep, exactly. It just made for a nice drop-in replacement for me to
> focus on i2c-dev.c first.
>=20
> A lot of clients will stack-allocate these. I suppose i2-tools doesn=E2=
=80=99t
> load more than one at a time, but haven=E2=80=99t looked.

I just checked all in-kernel users and i2c-tools. Never more than one.
Which is kind of expected because you usually re-use i2c_smbus_data and
move the buffer contents somewhere else.

> Retrospectively
> - i2c_smbus_ioctl_data.data shouldn=E2=80=99t have been a pointer type, b=
ut is.
> - i2c_smbus_data.block should have been pointer, but isn=E2=80=99t
>=20
> And then the kernel would pass around an 32-bit-only i2c_smbus_data union=
 -- by value.
> Which would have been much leaner, and leave the right buffer choice
> entirely to the client.
>=20
> One could explore this in kernel space. Let me know how you=E2=80=99d lik=
e to experiment.

? I'd like to keep kernel space and user space in sync. Why should we
have a different i2c_smbus_data-variant in the kernel space? Or did I
get you wrong.

> But in userspace that means we=E2=80=99re looking at a new call number. >=
:)

No way! :)


--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8f/5UACgkQFA3kzBSg
KbbcHQ//QOrYscxs7q9ghewg/Nw0N6NIPMQGCI4sLZG6UF4UXMikqWs606iAUcE9
cb3H4dej8To4NH1zYo+6GGQ8iz3Uv60tfWQ5IsUbyX1zb5613wWSEsKnABYPIO8B
ioPxbvbMDcQRaleVMJKR39Q0uGMxX3nQD6dlLlfwDoEXZ3n6Q8izPX2PEMXILnHQ
SH0pRJDDD1U6JpmPbbCT/4yDbS/8PF0+4NMEO1t1Gb2FLPSexP5yWLHP5BLHHiYX
4WBVlNNUWGXXwX98z7L1uMuL5KOAlnw0g3e4coqb6qsmN+3EBg12KdgF+s5PLilL
pmAttSMkmzSD2lEZL6KUidNBxMXBnxA/HdShHd87FhuXNZA6Ypy9tD3k4MtHx5OO
zpArW23BoOTRDFG3VRU35MSImIiGGNHJIO3BWVXMLBtuQnZGJYdhRYS7CNjxIlzu
irilYXIWo+rwj/Ks1Kynux7ML2C1uzNdLpJeKhw1HiFjA/pSSmmSuU2VSmF1UbCS
8rQTudy1ffrZmiDAFrC8GBqD1HH6UPqgbQwWMpJTGwwrZw1iDHVfJaOjTVjvwme3
fvqV6nQihKuc/X7JPFaEe5AAVLe6Rqi6QCw67is2RtvlGYDtNb8aeMZrP7jKyboU
4QAw+KpULL3PunW5khFVO/Sf5N7/Y5Q6edkYJsK4CtsosZPLLDg=
=Qhbp
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
