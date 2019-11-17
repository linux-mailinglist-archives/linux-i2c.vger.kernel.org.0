Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38B92FF8E8
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Nov 2019 12:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfKQLYS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Nov 2019 06:24:18 -0500
Received: from sauhun.de ([88.99.104.3]:33952 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbfKQLYS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Nov 2019 06:24:18 -0500
Received: from localhost (249.157.broadband6.iol.cz [88.101.157.249])
        by pokefinder.org (Postfix) with ESMTPSA id 905EE2C01C5;
        Sun, 17 Nov 2019 12:24:15 +0100 (CET)
Date:   Sun, 17 Nov 2019 12:24:14 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Michael Cheng <ccheng@broadcom.com>,
        Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Icarus Chau <icarus.chau@broadcom.com>,
        Ray Jui <ray.jui@broadcom.com>,
        Shivaraj Shetty <sshetty1@broadcom.com>
Subject: Re: [PATCH v2 1/1] i2c: iproc: Add i2c repeated start capability
Message-ID: <20191117112414.GA2522@kunai>
References: <1569825869-30640-1-git-send-email-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <1569825869-30640-1-git-send-email-rayagonda.kokatanur@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2019 at 12:14:29PM +0530, Rayagonda Kokatanur wrote:
> From: Lori Hikichi <lori.hikichi@broadcom.com>
>=20
> Enable handling of i2c repeated start. The current code
> handles a multi msg i2c transfer as separate i2c bus
> transactions. This change will now handle this case
> using the i2c repeated start protocol. The number of msgs
> in a transfer is limited to two, and must be a write
> followed by a read.
>=20
> Signed-off-by: Lori Hikichi <lori.hikichi@broadcom.com>
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> Signed-off-by: Icarus Chau <icarus.chau@broadcom.com>
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> Signed-off-by: Shivaraj Shetty <sshetty1@broadcom.com>

For the record, applied to for-next, thanks!


--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3RLdoACgkQFA3kzBSg
KbbR8BAAgv5t3EtMRE6JTFFM+VTv8HR+Q2hZ9Ux/MexO/h8bmlfQWyNiXeXgyMoI
ptX7un5Af/irMK+JUJgPbQB3akcMfN6Tzw1U3ziuK64yFI4yY6zQsWk3r7GBbHao
UpWWFiW07i3w9bArwih3FafSNghCNh8hbWgRd4JgyIOoWRpL4LCP9AdwBkToqBhh
TYmXwuWXoZkWu6lcgMSX6XkH2qoB1VughKwY3Lksol+FwnfAuNL1NEWhiLlHR60C
bkiYw7YiwcDizCXrvq9cuW0/MaVZIXCw8NmBP42c9PBcMJKH0s3peed3wKn7Xh+8
r1t465ysiOY7RjWSt6Ve2GVl4wsS1fcW9qrVWLXvc1wWhe3SJaCPMjVRyIH1iQ+n
0OBu+7VLekV/ChF4TTMZmfeZo+uABcUQSaguJq3tygo22KIyeSQYOt4u3M713m3s
zcw/27aKYLDkHTGpW9oB1+rdSXeRUfqmoebzfoPPr4Jax2zkThCQfzeg9ovwJNe7
WfEIcpA438Z8ZIdieCGRN4CEJkhP2yPvNDs059JrshyIaloFuFPhSOoffTOvPJro
O1vXOiME8ljS4OA/I9yuaGs0oEEJlj1vKwrNCjvZjU/gkFwNYAFAsm2lapvn9SvP
hyM3xLZT9HLyww1k4ARjSHEzD9e6SKGaeeWnZUVKQvK6h+POWRs=
=IufB
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
