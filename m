Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6DF33FF27
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 07:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhCRGAE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 02:00:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:54084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229454AbhCRF7k (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 01:59:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 158A364F10;
        Thu, 18 Mar 2021 05:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616047179;
        bh=aIghCnFTgYTEh3YwzUwa6H7CqfKsbAaPXnVUIaCUXqk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R6blLqRdrxp2stOo/KeCL82xWV4xhxFUBTUv7JDCLOrpCSrBipj9Z9PWJcjLofav5
         AGR0E+Ck48HfOGRwfNK8FT3+mB5OrchpMs3hpu1AipIlnWDAlL0pK8GuFJI+wEdtQY
         VR4Z2VzOFjlXqOaf3GXsst6G6cFJQoEg+CQSVn7Z/U5n5G1AEuphpT15HY2q58+cJ1
         XaqWrWcmwBn29hnCjB2EIwoPHqWucMj50jhkeqF5+srunQpoeB4ztbFrHk6A8/RUDj
         Dtpd8H9mHN2HpcjAHIwhZdi1sK70xirWAaDMRAwty3wLTw31gPJ9sMFj6A+nKVUVGO
         eILjgxTJM69pw==
Date:   Thu, 18 Mar 2021 06:59:36 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Adding i2c-cp2615: i2c support for Silicon Labs'
 CP2615 Digital Audio Bridge
Message-ID: <20210318055936.GD1053@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210317103021.1913858-1-bence98@sch.bme.hu>
 <20210317123344.GD1315@ninjato>
 <CACCVKEF-R1zvr2=AKf_a0vxQodbT0_CFnu0pWMrBZ3EjxteL5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline
In-Reply-To: <CACCVKEF-R1zvr2=AKf_a0vxQodbT0_CFnu0pWMrBZ3EjxteL5g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bence,

> You are right, sorry, I am still familiarizing myself with `git send-emai=
l`

No worries, the progress from your first to your second version was
really great! You can add such information e.g. using the "--annotate"
parameter og git-send-email.

> GPLv2 or later is fine by me. If I change this to "//
> SPDX-License-Identifier: GPL-2.0-or-later", is that OK?

Yes, also perfect.

> > > + * FIXME: There in no quirk flag for specifying that the adapter
> > > + * does not support empty transfers, or that it cannot emit a
> >
> > Can't we use I2C_AQ_NO_ZERO_LEN here?
>=20
> I thought that meant the adapter cannot handle NEITHER zero-length
> reads NOR writes, but the CP2615 can do a zero read combined with a
> non-zero write or the other way around, just both cannot be zero. If
> both are zero, the chip just ignores the request, as I've learned from
> a very confusing situation with `i2cdetect`.

I think we still should use I2C_AQ_NO_ZERO_LEN. The almost only use case
is a standalone zero-len read or write. This is not supported by your
adapter as you found out.

> > True! But it makes sense, so we can fix that. We just need to add
> > I2C_AQ_NO_REP_START and a short explanation to i2c.h. If you want, you
> > can do it in a seperate patch. I can do it, too, if you prefer.
>=20
> Sure! I should just define it as BIT(7) or something, right? Should I
> do it in a completely different patchset, or is it OK if I submit it
> as the 2/2 of PATCH v3? Are there maybe other adapters that would be

Yes, BIT(7) and same patchset please. But you need to make it 1/2
because you will use it in you driver which is then 2/2.

> affected?

Maybe, but we can fix them later incrementally. Currently, there is also
no client testing the flag, so we have a bit of time here.

> > Maybe skip the defines for VID and PID and use the values directly?
> > I am not a USB expert, not really sure what the consistent way is.
>=20
> I think this is how they usually do it, or at least from what I've seen.

Then keep it.

All the best and happy hacking,

   Wolfram


--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBS7EgACgkQFA3kzBSg
KbbuGA/+KaucbDtzrYePhtEGS3aTaStyBejDo54Aj9uA/tFEVQtcrdMAB5rtqueV
//CAwia6o17aBI6m8AOpzE2xzuQtoEBCHTGjzS3/89ze1c5KM6c/rgxVWvwn5jP1
YioB4WK/2Xn2w5Z2yYbC1Mt/39RJ57RrYVXoVs496g0ZLWvtMWLGiv2BBy7pm+jm
hpcBBRT82WAI9hzSL29DG6rbAGqJBBCXdPpmFs5qz5ggZJlnUYGhlTawFnaBpj1D
QMSt0jFN/H4mJ5eIxJY5l9lQpEVYP/ByFjBfALS9jT/UrqiLhevhhMjoPQdSgGhQ
GaUbGseDOwEcAumluTcxxZD5upocjevwAUC75w0GbQ2GhNmE88cHT/oAeta9wAPl
H/UioCX+3NYFlRGLhM8KWKfIKDnyawpg0JBjl/SjbknSbdG/1RWMwyg7+JokUOuc
SQEIYgSpErVJvNrsBC9Vluwjvyqki/WBln4k1Lxh5xJHub6LO6mwU6U3ah4HRNFf
ZRFBxB0Y38fteY0li7e8ib2jpJm3+6o2EoMuA5/gzZGJGs5nV226cl4QSZQ6bGPq
c3PFDQveTnEXhk7nIOCd1yN7QX/BezDtg8e3aVIiKn3xwzcZxvLs5RE31chtn0VJ
26Bz2r0gd8l2ovxRNbsMqKp+jTKp168HQ/IMHuntvNys7RWLClE=
=+myQ
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--
