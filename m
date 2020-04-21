Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCF31B25BD
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 14:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728719AbgDUMRC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Apr 2020 08:17:02 -0400
Received: from sauhun.de ([88.99.104.3]:60144 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgDUMRC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Apr 2020 08:17:02 -0400
Received: from localhost (p54B336C5.dip0.t-ipconnect.de [84.179.54.197])
        by pokefinder.org (Postfix) with ESMTPSA id AE2412C1FBE;
        Tue, 21 Apr 2020 14:16:59 +0200 (CEST)
Date:   Tue, 21 Apr 2020 14:16:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bjorn Ardo <bjorn.ardo@axis.com>
Cc:     Patrick Williams <patrick@stwcx.xyz>,
        =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: slave-eeprom: initialize empty eeprom properly
Message-ID: <20200421121659.GE1241@ninjato>
References: <20191001164009.21610-1-alpawi@amazon.com>
 <150599be-9125-4ab9-e2a6-e792b41910e6@axis.com>
 <20200420164349.GD3721@ninjato>
 <20200420203146.GC95151@heinlein.lan.stwcx.xyz>
 <20200420205325.GA1693@ninjato>
 <adb03545-88db-689c-dbf7-9f746236adb4@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vmttodhTwj0NAgWp"
Content-Disposition: inline
In-Reply-To: <adb03545-88db-689c-dbf7-9f746236adb4@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vmttodhTwj0NAgWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Yes, it might be easiest if he merges your patch (with attribution) into
> > the else branch of his fw-load patch.
> >=20
>=20
> OK, so to summarize, I should update my patch to use
> device_property_read_string() instead and also init the memory to 0XFF if=
 no
> file is present. And change name of the function to

Or something else went wrong.

> i2c_slave_init_eeprom_data.

Yes, that is my idea. You also need to replace checking for an of_node
with some equivalent for device properties maybe, but that should be
easy to find out.

> I will look into that and let you know once I'm done.

Thank you!


--vmttodhTwj0NAgWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6e5DcACgkQFA3kzBSg
KbbQDBAArMsUqUxWgqSrbwcIRt/Gr1cw3ADl+WmjfVx86o4L2zXR6pxtLqd3XZlw
ETCYwyuI3wd1o67wtJTES/XurkgGa1QjgKuLEkbPW/G5dU+A9bDdjYbiJfzFJZmb
N45BlhIjEa4mf9d6r7387sGtApMkjQhsTWQxjn1tuzPvzvB26ntJ6q7hM+M5JldV
1JYwin5YkcgvuFp4cECIO92jyvvupIWtJTxMaMlsHJFeicLWKPaXI/We7vC4W7Z9
aAZmc5NNrpNiT2ffkR4sGveVT2D0KckPHPsgoEWP+1FI3QrV72NAo6gTxbuJKbcp
dlDDIGt8f5nU/ubUG21zy0RzWraX+pzXd+/bOkh5H9jeY7Z4VjBCepbEj+ekn6eX
4GpVNz2Eav3+N8aCRWcv8bwW9U5ww/cQoOlkjh+aI3AIlwOXzG24IC3LLXyjtTt1
xXDNOubCHZa3RGcmfduhEue25trD/+05kxcFe5zvEC4c6JP9GaiQC2w4f6FtJmHf
pOzGKkowDO3rV8OpBqyyWTSjELG/icW/yOGFbqe1haP0akor3eiad8aiGFfwvMkA
CDm/h0S6NWR7XYpLTwYy1/TyjTpX+d9fqAiPOROrc4T/LzNUjfLNkvwvLjAiqXUJ
UxWdgMA26T+ui1/dZi6XcWt+sZs5r4DUjbEWJZVXCM+NmdHTZ+o=
=jvL2
-----END PGP SIGNATURE-----

--vmttodhTwj0NAgWp--
