Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDEC27A14D
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Sep 2020 15:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgI0Nyr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Sep 2020 09:54:47 -0400
Received: from www.zeus03.de ([194.117.254.33]:49748 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgI0Nyr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 27 Sep 2020 09:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=bvAH7FwQfXc0z6ppBLDLuuegRX2q
        8Dug0rUGILLXwqc=; b=J9w2J9bG26moFuHX1lhluqNt605tNw0OHmNIol4GvFHI
        bBy9a8p8KlH3yGKQ9VUzUoYMiIT+7ze9zAKpIAda12bllDRSRosf1RWWsUHuLqQB
        5gxkaDzYCWuUlw4dpLDLnBfYM9g3AGnWsq9wfCzPT3hrsXXBDu3G2udJvIuvqDM=
Received: (qmail 1944306 invoked from network); 27 Sep 2020 15:54:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2020 15:54:53 +0200
X-UD-Smtp-Session: l3s3148p1@CDXx5EuwdM9QT+F6
Date:   Sun, 27 Sep 2020 15:54:45 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: Re: [PATCH v11 1/2] i2c: i2c-mlxbf: I2C SMBus driver for Mellanox
 BlueField SoC
Message-ID: <20200927135445.GC7298@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Khalil Blaiech <kblaiech@nvidia.com>, linux-i2c@vger.kernel.org,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
References: <cover.1600804577.git.kblaiech@mellanox.com>
 <69651f24de181c7ea766a41bf7ac7a2539368ee5.1600804577.git.kblaiech@mellanox.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OBd5C1Lgu00Gd/Tn"
Content-Disposition: inline
In-Reply-To: <69651f24de181c7ea766a41bf7ac7a2539368ee5.1600804577.git.kblaiech@mellanox.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OBd5C1Lgu00Gd/Tn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 06:49:37PM -0400, Khalil Blaiech wrote:
> From: Khalil Blaiech <kblaiech@mellanox.com>
>=20
> Add BlueField I2C driver to offer master and slave support for
> Mellanox BlueField SoCs. The driver implements an SMBus adapter
> and interfaces to multiple busses that can be probed using both
> ACPI and Device Tree infrastructures.
>=20
> The driver supports several SMBus operations to transfer data
> back and forth from/to various I2C devices. It is mainly intended
> to be consumed by userspace tools and utilities, such as i2c-tools
> and decode-dimms to collect memory module information.
>=20
> On the other hand, the driver has a slave function to support,
> among others, an IPMB interface that requires both master and
> slave functions to handle transfers between the BlueField SoC
> and a board management controllers (e.g., BMC).
>=20
> Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
> Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>

Applied to for-next, thanks!


--OBd5C1Lgu00Gd/Tn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9wmaAACgkQFA3kzBSg
KbbqiRAAi94f/9TQKJIZqAFE4twc54Yzb9Y7SVuwqb+xpSsINAAaX0HWJrfZjHMp
LLrwaF+vxf9Me1sMMLBFiQVcd1ApaolQXmDXAa4X7NWQnYaqvRjZ2liuLYcsduPY
dyoB/eBdseadd+pK5AsR9oWXm2ef1PueKTT4od0JW30JZ7DNhOOchm6Zy7t6okdI
q6SzbVJC1lOjMiu3psJ1qz8sQYhhU2e5+2PXDlIuWiG3wpgTjjqWJoeFTzla9ogk
yPaq2yHbS9ScCTjf4unv4vGjLJlBzY94WwK8jffqipyFnrxUhmK6+WQGfObcA5I1
obwqNJspzHJ+GtS090OST7qpiNQRIkyjdw0E6lMIcI94ep0LDK1y34YdpuTI0IV9
G9mZYfcbhraFa1rhfrrL5VOOOk7rj170X6cZXu4fSIVUxiGsH2sVNT6Za4QdpQvR
dSZVuSP2ehlBZkTbbTqp7GhiG6oYZfA6TesZqsPkPo/y3tlhKPsHQ/yvfOxaFWrg
KQtQ7qhXvrbK8NbXwnCIUctEbScwRamcyIUd/cvso1Vi96KnOAe2m1e7nqf9ZXGc
y6Hz18gV0JOqukye+lA6hKTfyOjnnsQuMIVu9J5YdIiOBf2Rzsn/IBKM5Djc7l6u
CXPESbrARPq+A8SCsQnzVX/FXB+NXwg6/RyjOkGkrow9v//O8yU=
=dPbR
-----END PGP SIGNATURE-----

--OBd5C1Lgu00Gd/Tn--
