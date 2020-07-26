Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F1822DDFC
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jul 2020 12:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgGZKew (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jul 2020 06:34:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:60180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgGZKew (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Jul 2020 06:34:52 -0400
Received: from localhost (p5486c93f.dip0.t-ipconnect.de [84.134.201.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A4A9206D8;
        Sun, 26 Jul 2020 10:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595759691;
        bh=y3HfwhHup5ZAOGmkq6Mx9+reJ/UuYNeN12jSDc6PIG0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F4d9yaAasHavgIA4it2Jcy45pgn0+GqYzRQojMGfskTg7wyz6aDJDHnFzaOwbq1rQ
         4mqJZOa9/FV9TYJ14hqTWv5lmHsSWOQkiK6hIYHbzICKqH5t60VM67ZIxuk/5bgyl0
         O+8RULqF66KvLXiLN/OMTcITIEqBE8u7Nvx7TkHk=
Date:   Sun, 26 Jul 2020 12:34:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Daniel Stodden <daniel.stodden@gmail.com>,
        Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: i2c block reads > 32 bytes
Message-ID: <20200726103445.GA1714@kunai>
References: <9329EDA0-18B6-48EB-AD2B-AA27FAC6FF0A@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <9329EDA0-18B6-48EB-AD2B-AA27FAC6FF0A@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

> Publicly available PMBus revisions appear to be based on SMBus 2.0,
> but with relaxed constraints regarding block read/write length: 255
> bytes, not 32. [1]

I missed that detail for PMBus...

> Contrasting I2C_SMBUS_BLOCK_MAX=3D32, obviously. Similarly, Smbus 3.1 app=
ears to have removed the 32-byte limit=20
> for block read, block write, and block-write block-read process call. [2]

=2E.. but I am aware of this change since SMBus 3.0 specs came out. As you
already discovered, you are the first one to ask for support for it.

> There are workarounds in place, but I don=E2=80=99t find them very attrac=
tive,
> compared to a more supportive I2C_RDWR ioctl. I=E2=80=99m fully aware that
> I2C_SMBUS_BLOCK_MAX=3D32 is basically set in stone. But I could imagine
> I2C_RDWR growing to support newer Smbus protocols. My question would
> be whether this has been considered already.

I neither had hardware nor time for actually hacking on an
implementation. However, I thought about how one could do it and I don't
think the old limit is "set in stone". My idea for kernel space:

#define I2C_SMBUS20_BLOCK_MAX 32
/* Next one only for a transition period */
#define I2C_SMBUS_BLOCK_MAX I2C_SMBUS20_BLOCK_MAX

#define I2C_SMBUS30_BLOCK_MAX 255
#define I2C_SMBUS_LATEST_BLOCK_MAX I2C_SMBUS30_BLOCK_MAX

And with that:

1) Convert I2C_SMBUS_BLOCK_MAX to I2C_SMBUS20_BLOCK_MAX for all current
   users in-tree to avoid regressions

2) Update the I2C core to handle I2C_SMBUS_LATEST_BLOCK_MAX

3) People can convert client drivers to I2C_SMBUS30_BLOCK_MAX
   individually. So we ensure it has been properly tested.

I haven't fully dived into it but I'd think something similar can be
done for userspace, too.

> Recap: the problem with the current i2c-core is that i2cdev_ioctl_rdwr
> is passing msg[i].len in a way which makes it impossible for adapters
> to execute block reads greater 32: kernel msg[i].len isn=E2=80=99t user
> msg[i].len, but set to the number of extra bytes initially, so the
> adapter driver is left with assurance that 32 bytes buffer space
> available, not how much, if more. I suppose this is intentional.

I'd think we can extend that guarantee to 255 bytes when changing to the
new max. Needs definately some more discussion with Jean, though. But
also, if everything is correctly updated, you should be able to use the
native i2c_smbus_* functions again. No need for rdwr detour.

> Also, I suspect I=E2=80=99m not tellying anyone in this forum anything ne=
w.
> Bear with me, I=E2=80=99ve made an attempt to find older discussions. But
> didn=E2=80=99t see anything later than the exchange leading to the current
> handling of I2C_M_RECV_LEN.

As said above, there was none. However, your timing is not bad. I am
currently devleoping a "testunit" driver for IP cores which can also be
an I2C client themselves. It is already on the todo-list to add test
cases for I2C_M_RECV_LEN there, too, so it can be tested independently
of specific hardware. Of course, it is very good if there are people to
validate the results with devices actually needing that!

Kind regards,

   Wolfram


--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8dXEEACgkQFA3kzBSg
KbZ5XRAAgZQI6U46Rf9UNfRdcRNuB7gJ8pbgp3IHbAyEpoPUb1ky56SNXR2l/Dci
Lbp0XgAXFnUZvB1WCijcGchDGR2tKCPUsX+DpfUMYuwpaC4b1K8igfwSzOan7+f3
vT+0b1pJqQuifFb4rFPpQWZcdlZcjLf0tDc7PSGbhOq2/VgcVxGq8ruzjnXTpkAw
geq8IKxbcTajp1ozi3ME8Z2l2tn2242aePRWrmBGlfYnZahdH7PjGOG+q7+OakOJ
kjsNPkLSHK4JpVYJ4c1eqxcakQvnHLTY88HChFggh6ZJor/b7Tszeb91t3EjUSPI
Q8OEM9u7YkHgi2CV1Y1/a9zC5zuB/86n/Hz9gOSiDKZN1jg3k3QlOm+p7wJK8twH
A4dwNVC/mo6zb0ccOseOcrypNevy2U8VCk8/qexMB2Of9KKEbpgyUCHNCXGWjqxQ
gG14ZbtXoTGLyozcdpbPlAhy5YpXQPZQ3TFMk0YAc1t8iShkosZT2ihqkSsNQofc
rnWiY8K0lwoUzdhiDOuWOMfVPENHUnAqLlkMSHyiURZb+dEDHkz1z3CISQmUe6C5
O8Qpbce1AI4i2g8eIxer8HmPVDBEXTfrDxMLF/gor5pod074YWmkCL313bFDDMuG
BHlFx8hDZEndb9Pi4wLqT13Kv5v1cWplNF086bALxfSslxZV2rk=
=M252
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
