Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5248B12EB00
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2020 22:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgABVDm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jan 2020 16:03:42 -0500
Received: from sauhun.de ([88.99.104.3]:49546 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbgABVDm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Jan 2020 16:03:42 -0500
Received: from localhost (x4dbfb270.dyn.telefonica.de [77.191.178.112])
        by pokefinder.org (Postfix) with ESMTPSA id 4DF7F2C0162;
        Thu,  2 Jan 2020 22:03:36 +0100 (CET)
Date:   Thu, 2 Jan 2020 22:03:35 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Message-ID: <20200102210335.GA1030@kunai>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <20200101165515.GC6226@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <20200101165515.GC6226@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

> > +	i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
> > +
> > +	for (addr =3D 0x08; addr < 0x78; addr++) {
> > +		ret =3D i2c_scan_for_client(adap, addr, i2c_unlocked_read_byte_probe=
);
> > +		if (ret =3D=3D -ENODEV) {
> > +			alias =3D i2c_new_dummy_device(adap, addr);
> > +			dev_dbg(&adap->dev, "Found alias: 0x%x\n", addr);
> > +			break;
> > +		}
> > +	}
>=20
> This looks quite inefficient, especially if the beginning of the range
> is populated with devices.

Well, we have to start somewhere? And actually, the range from 0x08
onwards is the least used I encountered so far. What would you suggest?

> Furthermore, I think there's a high risk of
> false negatives, as acquiring a free address and reprogramming the
> client to make use of it are separate operations. Another call to
> i2c_new_alias_device() could occur in-between.

This is why the whole function is protected using i2c_lock_bus. No other
device can scan simultaneously. And once we have the dummy device
registered, it is blocked like any other registered device. As we
register the dummy device with the lock being held, I don't see how the
above race can happen.

> There's also the issue
> that I2C hasn't been designed for scanning, so some devices may not
> appreciate this.

This is inevitable. What GMSL and FPD-Link do is very non-I2Cish. I
don't see a "perfect" solution. We could skip this transaction and rely
only on that all devices are pre-registered. Yet, I think the
requirement that all busses *must* be fully described is more dangerous.
I'd rather risk that some rare device doesn't like the transaction. I
think a byte_read is the best we can do. Much better than a quick
command, for sure.

> What happened to the idea of reporting busy address ranges in the
> firmware (DT, ACPI, ...) ?

Fully in place. All pre-registered devices won't be considered because
i2c_scan_for_client() uses i2c_check_addr_busy(). Did you think the new
helper only relies on the transfer sent out? This is not the case, the
transfer is only the final safety measure for so far unclaimed
addresses.

All the best for 2020,

   Wolfram


--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4OWqMACgkQFA3kzBSg
KbaKbw/7BoMpk9HHHxqD8zOHyF60xbaxeSUVg/eheu9sMVeT0/z08gj0/N+YD6Us
sxus8hEcDApf/FJ2fXgIVWIK8ekZeR9TmyKb+QPgDqAYCJdwpqKCWkoA45Idk16g
cEY1s0mR+W6+8gK8ILKq1sMx0Tu4UGNqYQPi37S/g1EO9+8zVqYu3+YvPSjBy/mK
zOUpIAMFijK76lmByor14+fUH2WAgeWMIc4KghEBLBXfe5MemRPOrEayIlSU17ol
w7D88Q+1JGg0uqb0X/NrSObIu5cb2N2SVWjreiuqFJwe7h0oFxBruMGlJwgo2pZf
ZA8/UqpslJV5Im3v8gc+WSHgflLwIz8KvZaZTS/+FmhF+raNEKQ3UHS8woM5KnVK
wSIHMePb/MGDHFybSCJTaZy+1jg0JXZRTakBuCPcOXbXKH4eb5ZPMspXgipYHNYI
LZ8v1jydSpr+Wt2KLsj6XS06NCA5O5ARQjFjJbv2Ddckzc2Ju1lmta0qHqjgAwUP
E/chLCIpQROZs5iyRbCYD0Iir540lDGxMIGoHjhvHjp71TbAb8H9E2rxk9OcGNaP
2ngSBOVjKBNkQffOqbjngOmc/L2zFapq4lBh4tTyXkah2qHTaVFl61Ol6fJ+5FHp
xLJyqDhmJB0ozqNJChHLtCNFgwe23YQ4ptKCpcyfWyv+Ls7/CwM=
=xKSg
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
