Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01A23B455D
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 16:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhFYOQq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 10:16:46 -0400
Received: from sauhun.de ([88.99.104.3]:48324 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231280AbhFYOQq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 10:16:46 -0400
Received: from localhost (mue-88-130-48-002.dsl.tropolys.de [88.130.48.2])
        by pokefinder.org (Postfix) with ESMTPSA id 2ED6C2C01E6;
        Fri, 25 Jun 2021 16:14:24 +0200 (CEST)
Date:   Fri, 25 Jun 2021 16:14:23 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     minyard@acm.org
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
        Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH v2 1/3] i2c: Add parameters to sysfs-added i2c devices
Message-ID: <YNXkv8bjBBWZ+H/G@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, minyard@acm.org,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
        Corey Minyard <cminyard@mvista.com>
References: <1462896699-1627-1-git-send-email-minyard@acm.org>
 <1462896699-1627-2-git-send-email-minyard@acm.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1wjaYi0/bh6Z137C"
Content-Disposition: inline
In-Reply-To: <1462896699-1627-2-git-send-email-minyard@acm.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1wjaYi0/bh6Z137C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> From: Corey Minyard <cminyard@mvista.com>
>=20
> Some devices might need parameters to control their operation,
> add the ability to pass these parameters to the client.

Cleaning up old patches from patchwork once in a while...

I don't think it is a good way to add parsers to each and every I2C
client driver which wants to read extra parameters. Maybe there is a
more generic way to configure at runtime these days. I never needed
something like this, so sadly I can't give a pointer.


--1wjaYi0/bh6Z137C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDV5L8ACgkQFA3kzBSg
KbYYag/8CWN+Zn2LhXN2340jdzS3lKxNKuQAToyeJrethlEVzTkuFfRTDjW+Quyj
1PM7IIiSvHTnxojFv4pGl3o3MidPfINatgc3Rs0Ohl2HD0lVSZ8Uh40yqM1PZctU
rVN8MpIzZLm1gh2AmRWcuhtMlW9y0gWuVV18nmI4vwUhtv4u4m6sRF/7edNY8Fr2
2RdLi79Lx+T44YlSGZpMe2oED8kDC24fWRTGKnq5l9Uh4PSvsD0pYDuW+uKy7Ino
LDpeXM6/dKndnMJPDEmcnP9AgvlRGPj9tjzGZnuXMWNfXf3B0FnBMGBCS1cJUOdM
128p8WkcVZQ3el7+I2KwxLff9fdL7A5vF9q6zTKHwRj3gNr7I6tl83v1rFduOAJD
Rm3E0h+EpzQ9dH5GWSwggrGWDEU7Z4Ht0RCCTkvh3BuFpBjWWZtHkI1Zj5p9iDNX
q16MMey6we8rzKiGpgAZJjUuyhprjFQXsBmObRdkPMiMQstmxUVT7EQCPw8is7/N
woB0NpjhlVt0YNISx+42sX7uFmFbsWE3l2fT5IVQjA8uYBiqzQOuz5fW60USjFt1
/yGfsqmD8HpduaFtlBk6jJrl4Hdd9nr/j/4wazGn7VDM4a3aAyvy9N8rOoc/ZUIL
Rdbdq2mi4rJRxsohs2BWc08PDpPRf2GNPUEVxNClTvj8RF+6mkY=
=/MCd
-----END PGP SIGNATURE-----

--1wjaYi0/bh6Z137C--
