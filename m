Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F32348BFF3
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 09:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349024AbiALIdT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 03:33:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238074AbiALIdS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jan 2022 03:33:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3063CC06173F;
        Wed, 12 Jan 2022 00:33:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C4D6360AF5;
        Wed, 12 Jan 2022 08:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8946FC36AEA;
        Wed, 12 Jan 2022 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641976397;
        bh=g/tmk3pAfTDGQWS5JwOnqJTU1VMtm32sdiN4+TEMDRw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g4RGnzJ/ULsyzn67BO0tvOKxkRDlahw1Oo5I8yOXkEMRLVdhEf1bUa1qjsubTnEsZ
         EFnqdAWsyl6e7M52dHqaz9drgPI/B76yVVDvspClUl5v+T/57oBPAwdH9Kk2MUHX8E
         agyJ3v0Efn5GGLekM1qc4q9YIgavaIedHQJKkG2O9bv6RvQEc6LzbBnDbVdYC0SFKF
         VwHsOzLSgy4Itmxnf0aWDwX4+2Ihs/LJjo0MSHDzXofwApcIGF/kdVUbeubGOnIAmo
         iDsz2eOCvfhXKVa7ISxhQWzqe/+HG3Arnafs24Dq7BA/6WEsThF2RGERbxDdhgWfW0
         D8K73Loz0+f3w==
Date:   Wed, 12 Jan 2022 09:33:10 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Benjamin Tissoires <btissoir@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrea Ippolito <andrea.ippo@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alex Hung <alex.hung@canonical.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
Subject: Re: Touchpad stickiness on AMD laptops (was Dell Inspiron/XPS)
Message-ID: <Yd6SRl7sm8zS85Al@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrea Ippolito <andrea.ippo@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alex Hung <alex.hung@canonical.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
 <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
 <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com>
 <YdbrLz3tU4ohANDk@ninjato>
 <42c83ec8-bbac-85e2-9ab5-87e59a679f95@redhat.com>
 <CAO-hwJJ9ALxpd5oRU8SQ3F65hZjDitR=MzmwDk=uiEguaXZYtw@mail.gmail.com>
 <5409e747-0c51-24e2-7ffa-7dd9c8a7aec7@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="orTsQsEWg79dvGxB"
Content-Disposition: inline
In-Reply-To: <5409e747-0c51-24e2-7ffa-7dd9c8a7aec7@amd.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--orTsQsEWg79dvGxB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mario,

thanks for joining the discussion!

> 1) Systems returning SMBUS address 0xff
>=20
> The address can be potentially be returned using port I/O or it can be do=
ne
> using MMIO.
>=20
> There is already a thread in process to add support for MMIO, but last I
> heard it's waiting for review comments.
>=20
> https://lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/

This thread is under active discussion again.

> Now something else interesting - the SMBUS controller in these laptops of=
ten
> is listed in the ACPI tables on IRQ7 with a _HID of SMB0001.

IIRC tests done by Miroslav showed that interrupt 7 was used for
completing SMBus Block transfers and alike, but not for HostNotify. He
suspects this is wired via GPIO somehow.

Would be really cool if we can fix the bugzilla entry you mentioned as
well during all this!

Happy hacking,

   Wolfram


--orTsQsEWg79dvGxB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHekkIACgkQFA3kzBSg
KbZT8w//XYOkaE+SCx4hZcqIYSK0qr9wH7cbYqwfTh+oZv6nMMMxCxTRHjWy3thM
J8uT+/Cgnpjqj+ewXgS892gpum16MZ+iqa3HGPt4XXtkQjmzJ+mfAXnRmK9SyhAU
wro340uGVWxw2XwY9pf0RVadqLrCvMZhO+n8p+RTlnJhUQxtVYsIKz+hbzzRWCio
QQJ2qdoSjbGbEo/DEk5LeYgDY5uwZ4apBaQ/NTe9nmEJiwwBnMXkbPoP2mYJzdsv
0yc5OElbaNEoxz0G2joc9/ko0yecbvQazlvwkBQv6U22i+XwfKCZut3gOOkvnR5A
JJ+1C3m0/fuX6MmyCi2jKuH6v5ylOuVNDqxKX8umMOhYSrxCAh6rtD0K/YF+nS0h
cjw5h3OGWCSMf4rSbLYEekFWjyUeJwNUq9G9TkicplpHMGfeZbPQgsNSknL8286r
7/bLXHa9kdoLr3TWvROXHeXeBubd+N5F2te8SO9h2FMcK6+INx9lT39lK+YECZjL
zKtDP4ya7BdunCB6OuGmUgkMo7vPbhdDFPF5PG2pUXHAes5Uzt8G4oniTgADZh2M
pApLv8lQY8zDHxrFhxOMn7qvWl2EWkDUxcOisEsr4+eT1Aw+1ZZxzSJyidCdsd8G
azWzMhlJWUjzjfPSSK4L0U83Pd4cm1DVWkMrPH7GL5QOZz1WmWE=
=6bmH
-----END PGP SIGNATURE-----

--orTsQsEWg79dvGxB--
