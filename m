Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC004184714
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 13:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgCMMmV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 08:42:21 -0400
Received: from sauhun.de ([88.99.104.3]:51458 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726681AbgCMMmV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Mar 2020 08:42:21 -0400
Received: from localhost (p54B3314F.dip0.t-ipconnect.de [84.179.49.79])
        by pokefinder.org (Postfix) with ESMTPSA id ED39D2C1ED4;
        Fri, 13 Mar 2020 13:42:17 +0100 (CET)
Date:   Fri, 13 Mar 2020 13:42:14 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH 7/7] i2c: core: hand over reserved devices when
 requesting ancillary addresses
Message-ID: <20200313124214.GA1299@ninjato>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-8-wsa+renesas@sang-engineering.com>
 <CAMuHMdV-dfjukuSKiFg4vb4Ntn+XWU0XwHPxyoaWs1vtQVg4cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV-dfjukuSKiFg4vb4Ntn+XWU0XwHPxyoaWs1vtQVg4cw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > @@ -984,7 +986,21 @@ struct i2c_client *i2c_new_ancillary_device(struct=
 i2c_client *client,
> >                         of_property_read_u32_index(np, "reg", i, &addr);
> >         }
> >
> > -       dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name,=
 addr);
> > +       dev_info(adapter_dev, "Address for %s : 0x%x\n", name, addr);
> > +
> > +       /* No need to scan muxes, siblings must sit on the same adapter=
 */
> > +       reserved_dev =3D device_find_child(adapter_dev, &addr, __i2c_ch=
eck_addr_busy);
> > +       reserved_client =3D i2c_verify_client(reserved_dev);
> > +
> > +       if (reserved_client) {
> > +               if (reserved_client->dev.of_node !=3D np ||
> > +                   strcmp(reserved_client->name, I2C_RESERVED_DRV_NAME=
) !=3D 0)
> > +                       return ERR_PTR(-EBUSY);
>=20
> Missing put_device(reserved_dev).

Actually, I think the code could even be like this:

	struct i2c_client *reserved_client =3D NULL;

	...

	reserved_dev =3D device_find_child(adapter_dev, &addr, __i2c_check_addr_bu=
sy);
	if (reserved_dev) {
		reserved_np =3D reserved_dev->of_node;
		reserved_client =3D i2c_verify_client(reserved_dev);
		put_device(reserved_dev);
	}

	if (reserved_client) {
		if (reserved_np !=3D np ||
		    strcmp(reserved_client->name, I2C_RESERVED_DRV_NAME) !=3D 0)
			return ERR_PTR(-EBUSY);

		strlcpy(reserved_client->name, I2C_DUMMY_DRV_NAME, sizeof(client->name));
		return reserved_client;
	}

	return i2c_new_dummy_device(client->adapter, addr);

We put the device early - as soon we don't access the struct anymore. I
think we don't need the refcnt any further because what we are doing
here is to hand over the initial refcnt from the core to the requesting
driver. We turn the device from "reserved" (internally managed) to
"dummy" (managed by the driver). So, I think the code is okay regarding
the struct device. I will have a second look when it comes to
concurrency problems regarding the struct i2c_client, though.

> (perhaps i2c_verify_client() checking dev was not such a great idea, as
>  callers need to act on dev && !verified anyway?)

Yeah, since I refactored the ACPI code as well, patch 1 from this series
can probably go.

Thanks again for your review, Geert!


--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5rf6IACgkQFA3kzBSg
KbbLIw/+MOFwZSkWXt3ikwM+7rKei/WFEDfa/TZK7lKKvujaNfalPdxSx8w7M5dc
V5uUDpEeCiJAn+TO+vOv+i5McITg+GDMiUQvbIqAtzVh+2jqNEkJIaMz+5wlefWG
hcpujZdvPfrQNPf1FM77HO0WI9oChGBJkMb9tLbzm5yHLYh4zMq0aK+Z+oZQ7441
Lz2t2Yp+u4ikEHCvZWQVzOfyGRb2r/4nI5VuLbk8BhnlctKB3ALytdGws0QSctjH
qPz0ePJQ4kXQ/Ch1oVOh9LfTGRGlk3hA2Sa1G0Kk9t42e+C2DmFWh8AYV16kZ8n7
8MF/mUVBrebEzijOyDcUbBt9LYJwr+lsuej94/afVqk68b+s/cal2ZTYjNrX5QM3
/FNYqVV/tvmzmxPoO93IxFBPYethKY7i0jFgflmkzFhWGZv2H6UyU9U0UbH0dDlC
Cw8hjC1de2zxLP2xezv2vv5DH7Py1SFDfAU4xc9Xh/7HQFE9kLYbESG9cEh7mWLU
FC6T9KRrrzkkFNn0cCo0wqmqn+yrA5a9YGkTfQg733bxB0DQINcfo7m7FQPiS1OY
7ZxNfj9IVIpOShOi+/26bTkj8AemRPnRCy9MAHREFza55LU+7GGDkHQJKDqKZI2q
6oI1uERpxeyZoQMTEhRiR8IM2CGy9LtL3ZGe11+NI6aXGe+hdL4=
=VJ9d
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
