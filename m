Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40450231CEF
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jul 2020 12:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgG2KwI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 06:52:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:39816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726800AbgG2KwE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Jul 2020 06:52:04 -0400
Received: from localhost (p54b330b6.dip0.t-ipconnect.de [84.179.48.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 77E1420663;
        Wed, 29 Jul 2020 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596019924;
        bh=nZS4p36m3R83VoUiw+ZEwPiyAVCEBtSWxNPwbA1TXzQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wgZo4hgL4WaKk71JTm/935IODYq6H70baewYcI/IZKKdNhq+/kBAP7PnGQSHMeivC
         1zZMj/x79aZNjLpJMsdic2p0VuuoT/pfr53hAKE/se7/z6RgpXl8kU0Kgl7ILohBEZ
         OVgGI404Zx2HXPn6DUwW1Nq71mKLAneuojkc9I5Q=
Date:   Wed, 29 Jul 2020 12:51:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Daniel Stodden <daniel.stodden@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH] i2c: Support Smbus 3.0 block sizes up to 255 bytes.
Message-ID: <20200729105156.GA1015@ninjato>
References: <20200728004708.4430-1-daniel.stodden@gmail.com>
 <20200728094037.GA980@ninjato>
 <20200728190435.3c4f5d5e@endymion>
 <5E3EA2AC-83B1-4B7B-87DB-DBC4FAB2B7D0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <5E3EA2AC-83B1-4B7B-87DB-DBC4FAB2B7D0@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, hi Jean,

some more bits from me.

> Cool. Meaning we may then leave it at a single i2c_smbus_data.block[257]
> declaration in the headers, and i2c_smbus_data can be 255 bytes.

I think we all agree on this one.

> That doesn=E2=80=99t mean we shut the door on 32-byte buffers. After all,=
 backward
> compat requires we maintain support for those. Just that we need not
> bother declaring or promoting dedicated small vs large transfer types
> while noone wants one.

That's how I see it as well.

> This would also mean we=E2=80=99re likely to add an I2C_FUNC_ to indicate=
d smbus3
> support at runtime. It=E2=80=99s probably what you already have in mind.

I suggest I2C_FUNC_SMBUS3_BLOCKSIZE. I have seen the datasheet of one
client device where you could set a bit to select how many bytes should
be sent by the device in a block read (32 or 255). So, you could set
this bit according to the presence of the above FUNC. Also, I suggest to
do it finegrained, because SMBus3 also specifies 32- and 64-bit
transfers. If those are ever implemented, they should also get seperate
FUNC bits. All of them can then be ORed into I2C_FUNC_SMBUS3 if needed.

> We=E2=80=99d probably still prefer to move all kernel/driver buffers to 2=
55 bytes
> unconditionally. However, I2C_FUNC_ presence normally indicates lower lev=
el
> driver + hardware support, right? Not just a kernel upgrade. Which makes=
=20
> sense here, too.

Yes. I am all for using 257 byte buffers in-kernel only. a) defensive
programming b) for most I2C controllers only emulating SMBus, it will be
super easy to support the new block size. I expect it to become it kinda
default soon (for bus master drivers, that is).

> I=E2=80=99m just pointing it out because if we want an I2C_FUNC_SMBUS3, a=
nd at
> the driver=E2=80=99s discretion, not just indicating kernel + compatibili=
ty
> support presence, and if i2c_utils uses that to pick safe size values,
> that again means we=E2=80=99re yet again less likely to actually deprecat=
e the
> old transfer numbers. Some drivers will never be SMBUS3.

Yes, they will stay around. When I said "deprecated", I didn't mean it
in the way of "will be removed" but more in "please use the new ones".

> I2C_FUNC_SMBUS3 is nice to have. I=E2=80=99m not against it, I=E2=80=99m =
for it.
> For i2c-tools and all clients, it can be valuable to confirm conflicts.
>=20
> Still, one can keep it indicative only, and not synthesize faults=20
> because of a perceived client/adapter/device feature mismatch.=20

That's always been the case for I2C_FUNC_*. It helps people not to shoot
in their feet, but when ignored things happen.

> I=E2=80=99m not even sure if my new -EMSGSIZE condition in i2c-dev.c is s=
uch
> a good idea.

I'd need to see this in a new patch to comment on it. For me, it is
really easier to talk over code. But we are not right there yet, or?

Kind regards,

   Wolfram


--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8hVMkACgkQFA3kzBSg
KbZrIw//fMgG5nreRdcUCc6HA+1INCKnuMqtrU+HJtBaQf0sm8rJ2n9wfy5Jq2vM
VfZ1Pp0IzVd1A88DRB8a9TZ+yCrKKNA5uQSUegglZAUJEyA0nJ3mOMwnNfbGW5it
CHVedNtFGfexlkSkjYsv7LmDIawxhIrn2G5yH19a1aA9bip/kwbT/PIeAVsWRBiy
VOPz+1OAShfyqxuyuLL3RGlKcr9Rq+TbPYab3/G8zbdQhXZrj1oGT3BjBwUkxdG+
XWHU6eqQm7OkEKpfvGzOufG1/4ocDnB1eYyNIu76STtZUBGKSajR/g1Knj0RCetZ
Huttl4e32motafCxCVmB17Mvk9h2Ze8lwPMc4XP5gzPiffStR7867LboMuph4OmS
hk179Xb/LDGqLmPpJgr62xDpyap8ImQtTJvwDJMvAKWZ641/GjAglCWUXBDtJSAt
Jw1VDLQ/V+JjwlTfP+RczpCGDbnEvcWrKDBrboZMw19FmRPhjk/77q7DY4tRFclt
RNJqRHJeyIeT4QSWafWZye7yJwwVEM7Up4aV3epZcA0A0rtQIf23ixdmbcD2seBL
g0H1GIX/O+pp4EzYAKACU6ek5RbIF3NtfisyuuzVc+Xljci5B5qk96APJJ5oKBmE
bbAJVzI3CDZWD6LDJ3Hdms75ButD0z8rosqeqzmQ1/CbZ59Hm9I=
=F5j/
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
