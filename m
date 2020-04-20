Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FF31B1218
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 18:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgDTQnv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 12:43:51 -0400
Received: from sauhun.de ([88.99.104.3]:47794 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbgDTQnv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Apr 2020 12:43:51 -0400
Received: from localhost (p54B335B8.dip0.t-ipconnect.de [84.179.53.184])
        by pokefinder.org (Postfix) with ESMTPSA id F06262C1F4C;
        Mon, 20 Apr 2020 18:43:49 +0200 (CEST)
Date:   Mon, 20 Apr 2020 18:43:49 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bjorn Ardo <bjorn.ardo@axis.com>
Cc:     Patrick Williams <alpawi@amazon.com>,
        =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>,
        Patrick Williams <patrick@stwcx.xyz>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: slave-eeprom: initialize empty eeprom properly
Message-ID: <20200420164349.GD3721@ninjato>
References: <20191001164009.21610-1-alpawi@amazon.com>
 <150599be-9125-4ab9-e2a6-e792b41910e6@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6Nae48J/T25AfBN4"
Content-Disposition: inline
In-Reply-To: <150599be-9125-4ab9-e2a6-e792b41910e6@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6Nae48J/T25AfBN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2019 at 08:20:53AM +0200, Bjorn Ardo wrote:
> Hi,
>=20
>=20
> I sent in another patch earlier that added support for specifying a file =
in
> devicetree to initilize the eeprom from, corresponding to the case of
> pre-flashed eeprom. Maybe these two patches should be merged so this
> initialization is only done if no file is specified?

Yes, I agree.

> /BA
>=20
> On 10/1/19 6:40 PM, Patrick Williams wrote:
> > The i2c-slave-eeprom driver emulates at24 class eeprom devices,
> > which come initialized with all 1s.  Do the same in the software
> > emulation.
> >=20
> > Signed-off-by: Patrick Williams <alpawi@amazon.com>
> > ---
> >   drivers/i2c/i2c-slave-eeprom.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eep=
rom.c
> > index db9763cb4dae..efee56106251 100644
> > --- a/drivers/i2c/i2c-slave-eeprom.c
> > +++ b/drivers/i2c/i2c-slave-eeprom.c
> > @@ -131,6 +131,8 @@ static int i2c_slave_eeprom_probe(struct i2c_client=
 *client, const struct i2c_de
> >   	if (!eeprom)
> >   		return -ENOMEM;
> > +	memset(eeprom->buffer, 0xFF, size);
> > +
> >   	eeprom->idx_write_cnt =3D 0;
> >   	eeprom->num_address_bytes =3D flag_addr16 ? 2 : 1;
> >   	eeprom->address_mask =3D size - 1;

--6Nae48J/T25AfBN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6d0UUACgkQFA3kzBSg
Kba+gxAAj7fIStG6KAF5VvDWWpM8Pg8kZRzkCLZ+FY8Ihrj3aJT+hTkUaU3BwfCV
OXQCQWQP9OHDcSJJbjVq3XyG4b4pAXTuokoCQVX5OjB5b5Oi/RJhpt3U8JFKy/eh
x17uULwKA0zUZ05z9iaKcKDy8xNOEkfAdDlJRPdWPx5LJIa0VyGLgeadU+YAtd31
cs/+WKVTMFkA53hAKO+emVlY0yrDzpjBTiBbn9psIhKEyJ78fwEjChUq1m1tF2u5
4Gl4KMvuK5oc0JoNzppsqybDZ67qWqjYT7E99AUPMOBjZwXZiR7BS6v0IatQjn5r
4vdGVPQTZ6NRRAuzq7IjBrj/rVC7qRiAX/0rI6WVCDDa400xA+2zYQDXx2BrceFc
5zTejMPuJheqJ4lESiMgc1gC3BMCpbC8T3CTUqekij4CsakPfQYdpqPXT1L2Y+Rc
Cw5YGw6mPn6EJlsmuxzaRYSQvYpH876cTyIw0wX97Pgs9fbY5l8LPicXbgfqTzzO
ZQt0YVBz/Z65xhjqlifguiMPvARJX0zyAQ/Gr8zRA2uhH/RIxo7Y4RjvajWjvkLQ
jwQXiB5dkB9XX/1DLmMKVf3ADw1gtSjQunKk/cOLt2qNNatVZVivbXQsZfBJz8mZ
nm1EeUgEFjGacGrQFjrWDpRlCtOCvRXwWS6meTU+m+mwnyVIERQ=
=C9ai
-----END PGP SIGNATURE-----

--6Nae48J/T25AfBN4--
