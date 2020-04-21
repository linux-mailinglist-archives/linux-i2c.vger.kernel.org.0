Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897461B22F5
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 11:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgDUJhR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Apr 2020 05:37:17 -0400
Received: from sauhun.de ([88.99.104.3]:58132 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726628AbgDUJhR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Apr 2020 05:37:17 -0400
Received: from localhost (p54B336C5.dip0.t-ipconnect.de [84.179.54.197])
        by pokefinder.org (Postfix) with ESMTPSA id E25912C1FBE;
        Tue, 21 Apr 2020 11:37:15 +0200 (CEST)
Date:   Tue, 21 Apr 2020 11:37:13 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Aishwarya R <aishwaryarj100@gmail.com>,
        "Erhard F." <erhard_f@mailbox.org>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: powermac: Simplify reading the "reg" and
 "i2c-address" property
Message-ID: <20200421093712.GA1241@ninjato>
References: <20200408100354.17782-1-aishwaryarj100@gmail.com>
 <20200415131916.23555-1-aishwaryarj100@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
In-Reply-To: <20200415131916.23555-1-aishwaryarj100@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 06:49:14PM +0530, Aishwarya R wrote:
> >> Use of_property_read_u32 to read the "reg" and "i2c-address" property
> >> instead of using of_get_property to check the return values.
> >>
> >> Signed-off-by: Aishwarya R <aishwaryarj100@gmail.com>
>=20
> > This is quite a fragile driver. Have you tested it on HW?
>=20
> This change is not tested with the Hardware.
> But of_property_read_u32 is better here than generic of_get_property.
> This make sure that value read properly independent of system endianess.

This driver is only used on PPC_BE. And it is *very* fragile. The gain
is not enough for me to accept it without testing. Maybe Erhard (CCed)
is interested. If not, you may find someone on the ppc lists.


--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6evsQACgkQFA3kzBSg
KbZZew/9FFFtMHlcKTYHVgIyAJEHF4gXnOacFSvV02PMg4ZwajJfEatTog1WhMhU
aHpK1kEpP6nwsFk1HXD6+NMeZUsTojUkYk4ipKclvJBydN4O7VJKYYyWhdvcKlNG
T6q2bRsC3qI5QGAxaSumXIqT48HKGxM420yiJDySa8JeAQSDyoL3Q5NAzH04BQBF
JPWfJyJmhB0rP+DLkXLD2ZG/DDnBMZWWmRHxMbzognRcYkeV1RB0svQTKtKsFbLs
vfiTx2E+VvNtt1eoIOXapPnozbkOZUjAd+59JO59UMKORCf0HL393qsAyqMgfSQz
unuzZ8ZRL8xhFv2ptHfi+9zpGt4WVSk8r1U2lvBgM5g1ais7+acRiLWvyBW4yGdJ
TzsYE2x5eLW2bSQtaAo17VTF/cSC927DRvk0GRutj5+yxIqmWlJg6jGDZz8rS4WF
3S5JNkAdOYFWjsQpqOCBSEipY1YhinOlUtfw70bYUlJjUiKDN7nENuPtT5fAMEaj
KhVoAI4pzrTPzz2I4/tBjlV3q6P8fLhVPORPxz4DNzOBGk40oSbgSWeLs6Nr2BKY
J/uIFg5+9K9jdEnRDRWlDNx7fRgGxxozQV7tsGej+Sp/8Cn7kRg8gm4OTbwDlr8j
LZ3cwigeiQYOe3aiCPNVkxWFDbJuhDeM4tnf/fAlbNcLNqhyOew=
=SHDk
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
