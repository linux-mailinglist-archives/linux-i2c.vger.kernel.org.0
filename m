Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F22F2F2C5D
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 11:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388682AbhALKMa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 05:12:30 -0500
Received: from sauhun.de ([88.99.104.3]:54884 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387616AbhALKM3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 05:12:29 -0500
Received: from localhost (p54b3320c.dip0.t-ipconnect.de [84.179.50.12])
        by pokefinder.org (Postfix) with ESMTPSA id 79FFE2C04EC;
        Tue, 12 Jan 2021 11:11:48 +0100 (CET)
Date:   Tue, 12 Jan 2021 11:11:44 +0100
From:   "wsa@the-dreams.de" <wsa@the-dreams.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     Vadim Pasternak <vadimp@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver
 to support word address space devices
Message-ID: <20210112101144.GA973@kunai>
Mail-Followup-To: "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, Vadim Pasternak <vadimp@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20201118144416.184120-1-vadimp@nvidia.com>
 <20201118144416.184120-6-vadimp@nvidia.com>
 <b1e3b52d-ddb2-ac56-665c-7500c939a55d@axentia.se>
 <DM6PR12MB38989872E06EA9593E862F23AFAF0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <268612bc-dc4a-cfcd-f529-e8540adfd8dc@axentia.se>
 <DM6PR12MB389804F87C41F41210837810AFAB0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <e02caf3a-86b7-23de-2723-3abe97fb92e4@axentia.se>
 <DM6PR12MB3898A35B743227426802C081AFAB0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <5860104a-f922-068d-18ca-32b69c7970f7@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <5860104a-f922-068d-18ca-32b69c7970f7@axentia.se>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram, is there a better way to get something stable for user space to
> interact with? Is there maybe a way to do this with aliases or something?
> Setting up an ad-hoc scheme for forcing the adapter IDs feels a bit outdated.

Yeah, it feels rightfully outdated IMO. Bringing such policy into the
kernel is frowned upon. I think the proper way is a udev rule to act on
the newly created I2C adapter. This even could provide a really stable
symlink for userspace to consume. The above scheme is only stable per
"block" but inside the block, there is still randomness. Or?


--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/9ddwACgkQFA3kzBSg
KbYdig/8CiEx1Ivfb9GwlZB4LFojjKur9s21n+ioTeMcuj3aPTgzVpG3dLV0y99E
LnVuZO7fAM0P2Vz8pC8mopJOqz632U7egoQgDx5lLSJaWPaDJnbcLhlFNwGqXJVn
1FJ7N5B52bbs7JRgsPlq6l0d0IUg4vh6p2snF5ONOhjqBwxDzOsg3t6d6lmHrbFc
WzHxVUmmAaxxQJOeFjHwlAXcKsmLW/NXh30yI7Ci2iU4YdAgTaARhrOYZVX9zrvr
A7MHEG+pdndUhrZzztjwDXa11bgEAz4EjfqozutemHBSZ1EP6UVCIxkOk2v2dQBI
f5LTyTEHczOjUqYOEztqUA6dJC90wtxUiGCg3Q9DpGnRaHHGpsSKtgM1unLwcc72
mZKwj/jTQxxJ8wGTxuCHA06ll3SQSYxU+KGKqunmwgPpwmqm+w5v5I8BH/2DBLV5
k7f+mtMqjX5OPW58b6GCGR/97OYgYvojnCnNfYuHNHjIT2nUfXIZU8Ck/Z6ApI5/
IpUXXokEGgKCdyAVj3Lf4QY2GoaqHl7xrRWWm7Iy+aiFCXAeiEFUSJSEsyDEyEzX
WtSeqaPz8Fcve+bC80sYzbwZqzOlovow88eH53MNFDHiHe3MWWg2oB/G5fOigL5y
hCjo3tPOSh7sOO8V7r29+4tiBLC90ihqwXztJlylmJw7z3IRQMg=
=6Ubh
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
