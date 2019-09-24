Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71A90BD235
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2019 20:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406723AbfIXS6G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Sep 2019 14:58:06 -0400
Received: from sauhun.de ([88.99.104.3]:44258 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404799AbfIXS6G (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Sep 2019 14:58:06 -0400
Received: from localhost (unknown [90.85.113.197])
        by pokefinder.org (Postfix) with ESMTPSA id 4C5152C039D;
        Tue, 24 Sep 2019 20:58:03 +0200 (CEST)
Date:   Tue, 24 Sep 2019 20:57:57 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ray Jui <ray.jui@broadcom.com>
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Icarus Chau <icarus.chau@broadcom.com>,
        Shivaraj Shetty <sshetty1@broadcom.com>
Subject: Re: [PATCH v1 1/1] i2c: iproc: Add i2c repeated start capability
Message-ID: <20190924185757.GA1538@kunai>
References: <1565150941-27297-1-git-send-email-rayagonda.kokatanur@broadcom.com>
 <20190830125626.GC2870@ninjato>
 <3e70fa7e-de13-4edd-2e17-b7c56e91d220@broadcom.com>
 <20190831094940.GA1138@kunai>
 <540c4e2d-0dd5-5260-30b2-e1589b279d71@broadcom.com>
 <20190904213745.GG23608@ninjato>
 <5ab79d0e-eb54-8fe1-1ca3-e763a17c6426@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
In-Reply-To: <5ab79d0e-eb54-8fe1-1ca3-e763a17c6426@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> In my opinion, it's probably better to continue to support master_xfer in
> our driver (with obvious limitations), in order to allow i2ctransfer (or =
any
> apps that use I2C RDWR) to continue to work.
>=20
> What do you think?

Yes, don't break it for users. We should have paid more attention to it
in the beginning. But, while not ideal, it is not such a big deal to
keep it like this.

Thanks for your investigations!


--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2KZzEACgkQFA3kzBSg
Kbam+A//dpJL9KQfjH0vct83wG2I23jh0ofw2vQQ0Oz4QCKWS+Vz9dex7nvEiecY
Pua7zt0evVz6Du44tpAJGpsydjgNJBdEWjZp4rxksVNpyc5SOkF186eEdjjN633L
LqCpl6TgqyZhVXCs9H1y9WGy47i9xEH4B+gRG3SwEx19Wc47pUnURQrWA/7HGnjF
7tzEIdZTJKLBU0BzGQqXJ2bo5mf1Vt2eT112G3Uj+yh5/TifFnjGKqv4rGG4uE8W
pXkOg94Jb0ywSl2YWV8axsAIyNVNzW74lxkvsRoPuZ/qcCdw9n+U8YoXeOKJuJEc
6BCH4UDC5mf/m88q70UyZwryz2xZtkvS7Df7JU92dbWRgHG5SNAW6cHo3FDKO6km
uWWqMAidEhBw3t8SXbzhQkjyuxTEGNue/LcX+SYhWEXqSiuNQ4Kudr/imW4B6NAC
X1G+fUxdyQlEgju1g28Bfh6cSH7DZ0v20k/cy7Pdqa4yPp3LhgUnRkfLdNH1qo2R
judxCqo824+GiMU5vAQYkA8+ZI5WFPqX8KCEmhqh8qCH++NAnqxmpwmVS4FmvN9X
5bGDRe71F8Z5UTXKTc+IajEc6Nu0+XUN68rNAlpM/NLD2Q0kRJVHh+bFoWrkwNdf
ODfzxF5EI/Uz/G4N6pytdB2SFMdTCvSieG/kqk/K1zTVZUWplw8=
=5VKZ
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
