Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2645939C189
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 22:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhFDUql (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 16:46:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:41852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229854AbhFDUql (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Jun 2021 16:46:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84BEC61287;
        Fri,  4 Jun 2021 20:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622839494;
        bh=2zdI+hMlCVUd0RQwlmxUZwvWLHioQb1ObS44E/avPSc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ra8yALzJoz+PaAxo2RNSOwqeTxh3l7vumEINlg7NL7+mf1LCEVWAaUF0u1BqvENrw
         p41n9SvIqkT48gOdx5pYJIVqlQnzmKjNfuXktlSO2U6ltjyCW2ABnL0cS+qt8bjflv
         GBoXei7HjIbwgmfX5Ex71ZWGB+ab9tiT2rhETIMMPoS1iaAO1S5A2x5FVEwLuebaSh
         j3UHx+QUxubtxrNCCbRqaE4qFxL7yddyNqzAmUN/XZDp2iNGVtftbVq3T5uHDRNLjl
         sloswEMgWSK+s+UByeKd6dZnuVTpdZ+Kc4ODmIJiyIFUpCM1JjEzGa5983MHoilPCe
         5pF/w1N4R3/7Q==
Date:   Fri, 4 Jun 2021 22:44:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: cp2615: check for allocation failure in
 cp2615_i2c_recv()
Message-ID: <YLqQw6Yc07RecKZs@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <YJuosd6rew91vlyX@mwanda>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w+7nIKOIqzoxf3p4"
Content-Disposition: inline
In-Reply-To: <YJuosd6rew91vlyX@mwanda>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--w+7nIKOIqzoxf3p4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 01:06:41PM +0300, Dan Carpenter wrote:
> We need to add a check for if the kzalloc() fails.
>=20
> Fixes: 4a7695429ead ("i2c: cp2615: add i2c driver for Silicon Labs' CP261=
5 Digital Audio Bridge")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Bence, are you okay with applying this patch as it fixes a bug?


--w+7nIKOIqzoxf3p4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC6kMMACgkQFA3kzBSg
Kbbx2BAAqQMi+uCLm6tFayByobklOjt+scSi09e2anAZDfiUlOhzxNGS2thOVKUO
A/AioFc8mJggSyUjJnyTDiHi+IX6UCj3TjoiVSmAdYTIqGVJ+8zJUklLNyNQqF+0
lVCvDLjrfkFsPBxQeuvviCKXJ5EQ0Mk5FgXlG9jR1BmE81oPElBSJ+fOJMqkmlTZ
wYAtFJYc7T2lyMvs4zyoA64VapR5eIF6ZjEkz94WDAwUlBrMPv9xJKUWMW/JRqqD
PbFhD0BhaSJwMFoRMoBczwy+FdXT3yRQVtN/2T1EzuwHGKftyDXxnimLiR9edl5+
sSIg7DmHrr2iKub65CdSGkjzSqBZPJma1q4cKoVJ4rbXfd2MBtPfk1QAKA53eq4a
fGEHDISyG4RNCMixlixoiCbTFybYJzYxhxU3MLO2EchSKP5VbPVzMR/QBt3YZrgd
t71ZIbwEgCw3D0U1aJBdSVMEAt33Hj1xKPZcK9hArp/GejEnFyrktTdj+uVD4FLv
98On0yd4AFwapVQw8w8BRX4W1vdxLzjB9CH34/Cr2zVFulLYBwf/j8rwuT950cRn
5jRFPiofevxZyMUXDMKtVVq4U3o7RMtj6JzkCWSC4Uq/XDlvgFy+kh9LnU7rQJCB
prpNJE07zcX6sj4UyewwdgePujJwxbAq9edayu6mD0DVXHhernU=
=yEJ0
-----END PGP SIGNATURE-----

--w+7nIKOIqzoxf3p4--
