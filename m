Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87968101DAE
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2019 09:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfKSIf0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Nov 2019 03:35:26 -0500
Received: from sauhun.de ([88.99.104.3]:33712 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726170AbfKSIf0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Nov 2019 03:35:26 -0500
Received: from localhost (unknown [94.230.152.199])
        by pokefinder.org (Postfix) with ESMTPSA id A02112C0505;
        Tue, 19 Nov 2019 09:35:23 +0100 (CET)
Date:   Tue, 19 Nov 2019 09:35:23 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     Khalil Blaiech <kblaiech@mellanox.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        David Woods <dwoods@mellanox.com>,
        Michael Shych <michaelsh@mellanox.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        arm-soc <arm@kernel.org>
Subject: Re: [PATCH v6 1/2] i2c: i2c-mlx: I2C SMBus driver for Mellanox
 BlueField SoC
Message-ID: <20191119083522.GA1124@kunai>
References: <cover.1571868492.git.kblaiech@mellanox.com>
 <4c2f30c9c42531f816e4cabe2db33d22f73213c5.1571868492.git.kblaiech@mellanox.com>
 <AM6PR05MB522438244E23D478059F5E8BA24C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <AM6PR05MB522438244E23D478059F5E8BA24C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vadim,

thanks for stepping in!

> I see that this driver is already under Wolfram's review.

Well, I gave some very high level review. In general, the outcome of
my review was asking for further help...

> We have Mellanox internal review process, and it's strongly recommended to
> Pass internal review, prior sending patch for public review.

... like this one :)

> For system drivers, like 'i2c' you can send a path to myself and cced to
> linux-internal@mellanox.com. In such way we can get better patch quality
> and save maintainers time.

This is super awesome and good to know for me as well. I will keep it in
mind just in case another driver which needs this pops up.

Happy hacking,

   Wolfram


--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3TqUYACgkQFA3kzBSg
KbbAag//SSEc4tqMWHcXkktQAxmOANYs8Oq6U5H5sF8VEmilm18kNWnQbzdk8fOp
VWpiK8RGS4TJOP3TWGEGbJ5jYMdPaZjLqs85F9zXd/Mj8GYYvfnUwjsopr3/mDpN
RPwYANd7ceSL7F4ICbgbXmK9TCBJvReJs/+Ie6r3QLEVFc9vIqNkFGgEVW+wFLgY
P3HtrRAuO/jgl0QZOGu13O6JIIMPoGvWiSfSA878Vd5CnWaOnst2W6nGoZutntWS
8SuFAlqJP2MQdBXpS3ZoEqhPsFYpjqjSBoX3gL5FEkMMJqSwCEYf/CDfpRW52p/F
wM1fkNakRzVc83xA8Fn7l+H3MD6xHXUew7nzenxRdgNmGKyfx1morcsQdLF1lg5y
tTHJg9WLfDrGZIMEc0J0nKKg6c/hsHo7qQglLkAfCjaZIaaylLuZdaCE0AyJnhRJ
0kPZmwg/Fjvn6eR7fYsSIeD/mG8UqSn5LVHWPSxomvpIG+LAcKWh582ccwHO0MDs
3ATFlY3yCaBvKgrDA6Kfj1aHgcklHE+hq4/0NLpsSWzSR85VsxV+55Z5l969r/cT
UdT6pWOP/2AG9QfZ+nWoFoMW4Qp+SW1u3ploKwvfjGTI3odkPICGz/X5NyyN2kR/
DNhvT1JlMpujH4enygslvB1mFdgWpfeIrpn2bW66v1KvEaC0gCk=
=A7PB
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
