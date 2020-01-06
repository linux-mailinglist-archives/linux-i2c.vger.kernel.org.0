Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2B2F131273
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 14:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgAFNBO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 08:01:14 -0500
Received: from sauhun.de ([88.99.104.3]:38608 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbgAFNBO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Jan 2020 08:01:14 -0500
Received: from localhost (p54B338AC.dip0.t-ipconnect.de [84.179.56.172])
        by pokefinder.org (Postfix) with ESMTPSA id BB7592C0686;
        Mon,  6 Jan 2020 14:01:12 +0100 (CET)
Date:   Mon, 6 Jan 2020 14:01:09 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Lei YU <mine260309@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: i2c: Fix return value of i2c_smbus_xxx functions
Message-ID: <20200106130056.GA1290@ninjato>
References: <1574162632-65848-1-git-send-email-mine260309@gmail.com>
 <20191125144857.GA2412@kunai>
 <20191126115243.673fc164@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline
In-Reply-To: <20191126115243.673fc164@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > -All these transactions return -1 on failure; you can read errno to s=
ee
> > > -what happened. The 'write' transactions return 0 on success; the
> > > -'read' transactions return the read value, except for read_block, wh=
ich
> > > -returns the number of values read. The block buffers need not be lon=
ger
> > > -than 32 bytes.
> > > +All these transactions return a negative error number on failure.
> > > +The 'write' transactions return 0 on success; the 'read' transactions
> > > +return the read value, except for read_block, which returns the numb=
er
> > > +of values read. The block buffers need not be longer than 32 bytes. =
=20
> >=20
> > I think the correct solution is to remove this paragraph entirely.
> > Because the returned value does not depend on the kernel but on the
> > libi2c version. Check this commit from 2012 in the i2c-tools repo:
> >=20
> > 330bba2 ("libi2c: Properly propagate real error codes on read errors")
> >=20
> > So, I think we should document it there. Jean, what do you think?
>=20
> I would go further and move half of the document to i2c-tools. i2c-dev
> itself only provides the ioctls. Everything on top of that is in libi2c
> now, so the kernel documentation should point to libi2c and the
> detailed documentation should come with libi2c.
>=20
> So I guess I should review the whole document now to see what needs to
> be updated, what should stay, and what should move.

Maybe you can collaborate with Luca on this who just revamped a lot of
the docs? Putting him on CC and marking this patch as 'Deferred'.


--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4TL5UACgkQFA3kzBSg
KbaiNg//cY5iFBrA2+43SMBoEDIkgtFwG+ro0IKYEDqL9pYlSZVkhaFhDpK0J7U7
tmsZzHlfrSAOr7Biq/QuMXRHvDp6kDTKCCIlUdXXT+GhquYIPDyCkwwt4Oa8nT1O
666gN0OCI4ZahsEqNm22RD0E5sDLTZlAUz4DNQY94g95hG36sAeJRj2M+tC9pzaa
4rZp06P+IJ8kqNEFZX13e3z3xsRwAG4wrBWzYrlNWsHkyCblz0svqTHxoAiSN+lX
Byv569JFAOkPqEgNSPTeI0j4I7A3o1BIM/kAnqgfkfFHGEKW0nPScZtqQMqe+G4w
zJ9tF3oNfBkpBX+4sfDrpIsPEmzEL2MUHDIQhyfwagf1DWVhcKF4OvM5kXDRf6By
NBmTkf8eZIwoXTYOqgfBASmsx3cInCcam3aqczp1OxMQdixVqV1Xftdo6p7YCZJV
v/+cCc1rZu/SODaWz6uh/wWBKceDmL2RJwft2oe8meYAJrtTRS63XHlJALrTF1vJ
jHrKTjtReKUH36fNxNPn4w/0DMcySWlayk3G6R4vAs1eZte27eeyo0bl9z8uEAHi
nutigACt9hQpP15kv4gz9ikp8c0sPnlBQ5lLzTvNMBMaJ806kuTQ0dp0UJlR/OR4
KA5hXOBuvhyNXgoDlW3sehBEKEpOIKoabGBG5V2Meg5CzPFoyeA=
=Wc1M
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
