Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9458015FD29
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Feb 2020 07:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbgBOGuY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Feb 2020 01:50:24 -0500
Received: from sauhun.de ([88.99.104.3]:37672 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbgBOGuY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 15 Feb 2020 01:50:24 -0500
Received: from localhost (p5486C46A.dip0.t-ipconnect.de [84.134.196.106])
        by pokefinder.org (Postfix) with ESMTPSA id A395A2C08B8;
        Sat, 15 Feb 2020 07:50:21 +0100 (CET)
Date:   Sat, 15 Feb 2020 07:50:18 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Robert Richter <rrichter@marvell.com>,
        George Cherian <gcherian@marvell.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: convert SMBus alert setup function to return an
 ERRPTR
Message-ID: <20200215065018.GA1005@ninjato>
References: <20200210172929.6001-1-wsa+renesas@sang-engineering.com>
 <20200210172929.6001-2-wsa+renesas@sang-engineering.com>
 <20200215072020.75b1b772@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <20200215072020.75b1b772@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2020 at 07:20:20AM +0100, Jean Delvare wrote:
> Hi Wolfram,
>=20
> On Mon, 10 Feb 2020 18:29:25 +0100, Wolfram Sang wrote:
> > Only few drivers use this call, so drivers and I2C core are converted at
> > once with this patch. By simply using i2c_new_client_device() instead of
> > i2c_new_device(), we easily can return an ERRPTR for this function as
> > well. To make out of tree users aware that something changed, the
> > function is renamed to i2c_install_smbus_alert().
>=20
> I wouldn't bother renaming the function. Chances that there actually
> are out-of-tree users of this function are pretty small, and if that is
> the case, they can adjust their code easily in a way that is still
> compatible with old kernels.

Agreed, it is easy. But they need to *know* that they need to adjust.
Build error makes it obvious. Otherwise, the code will compile and
silently not work anymore, I am afraid.


--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5HlKUACgkQFA3kzBSg
KbaemRAAtggqw4SVtbyQCRrmfxnLHzx6kn4nh+llG1MMVBv0T00C1mN/VwljvQAO
lD+fOgYcon9hqXh8NS7CruNfVhOQ0DsWsPEEbagy7ajWiEnMuKWaxlu9hKDdFaWx
FAuPxhY7i5aS8jkZOK+5d3m3xXJR18dT6NwlwVNAEde4deevE2CnnVixwNwiPZbC
pOfktojkOIb3YFyC5XO/2Qq0bHnU1XM7nyjHHMqo9wwxZxV8Y+PlQ3M5sjEIN4af
VSeoIRjaii6cKSlANDylKxpyrF8R24tiJuD8eCUOZR+piG+iQ5eCnhs18f3s5ISC
nZ3CsbK3yd6dpujDAACaklbIVXEjuVnfQCVmrvIp/HVDO6ttvqx9ecuERRvjdPjO
w3DuKLRk3+VqkxGt2SsnXU4oih0I410wjRrhq0zvT3toTjocWj6r0zRXn2PW9IoC
cGebBHvPMsyVQQNCQ04dUmg4P+BY5aa4BFcvQeaVWcy+9sltcpNcLWkmZH/+q964
w0wtZh4aRemO8GGLDStdU8wXx2hGdPyzMoj7xjPnyXnE+PBnym9Wd0CDvofxa//o
WFg3eKkSiCxfkqHd9NwvNTiKV1bYllfusWrlaTCjZswJm3wf/PTnyWRXJbLtIer2
ztTcsLx9CtA/vvAbn3zsOXqcS6N7cxOTAoi1rNzEId64QnIUxJE=
=XNJq
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
