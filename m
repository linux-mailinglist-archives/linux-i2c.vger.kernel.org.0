Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84B9C86655
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 17:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732680AbfHHP5M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Aug 2019 11:57:12 -0400
Received: from sauhun.de ([88.99.104.3]:56634 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732662AbfHHP5M (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Aug 2019 11:57:12 -0400
Received: from localhost (p5486CA1C.dip0.t-ipconnect.de [84.134.202.28])
        by pokefinder.org (Postfix) with ESMTPSA id 994732C3112;
        Thu,  8 Aug 2019 17:57:09 +0200 (CEST)
Date:   Thu, 8 Aug 2019 17:57:09 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] i2c: replace i2c_new_secondary_device with an ERR_PTR
 variant
Message-ID: <20190808155709.GA1316@ninjato>
References: <20190722172600.3452-1-wsa+renesas@sang-engineering.com>
 <9b71c556-bd70-4d29-dba5-fbeaefb5f3b4@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline
In-Reply-To: <9b71c556-bd70-4d29-dba5-fbeaefb5f3b4@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2019 at 04:47:09PM +0100, Kieran Bingham wrote:
> Hi Wolfram,
>=20
> On 22/07/2019 18:26, Wolfram Sang wrote:
> > In the general move to have i2c_new_*_device functions which return
> > ERR_PTR instead of NULL, this patch converts i2c_new_secondary_device().
> >=20
> > There are only few users, so this patch converts the I2C core and all
> > users in one go. The function gets renamed to i2c_new_ancillary_device()
> > so out-of-tree users will get a build failure to understand they need to
> > adapt their error checking code.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >=20
> > Kindly asking for acks/revs/tests from people knowing the modified
> > drivers.
>=20
> Certainly, this looks good for the adv748x.
>=20
> The ADV7511, and adv7604 are not mine, but they also look fine to me.
>=20
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


Thanks, Kieran! Gently pinging for acks for ADV7511 and ADV7604.


>=20
>=20
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 18 +++++++++---------
> >  drivers/i2c/i2c-core-base.c                  | 10 +++++-----
> >  drivers/media/i2c/adv748x/adv748x-core.c     |  6 +++---
> >  drivers/media/i2c/adv7604.c                  | 10 +++++-----
> >  include/linux/i2c.h                          |  2 +-
> >  5 files changed, 23 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu=
/drm/bridge/adv7511/adv7511_drv.c
> > index f6d2681f6927..9e13e466e72c 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -981,10 +981,10 @@ static int adv7511_init_cec_regmap(struct adv7511=
 *adv)
> >  {
> >  	int ret;
> > =20
> > -	adv->i2c_cec =3D i2c_new_secondary_device(adv->i2c_main, "cec",
> > +	adv->i2c_cec =3D i2c_new_ancillary_device(adv->i2c_main, "cec",
> >  						ADV7511_CEC_I2C_ADDR_DEFAULT);
> > -	if (!adv->i2c_cec)
> > -		return -EINVAL;
> > +	if (IS_ERR(adv->i2c_cec))
> > +		return PTR_ERR(adv->i2c_cec);
> >  	i2c_set_clientdata(adv->i2c_cec, adv);
> > =20
> >  	adv->regmap_cec =3D devm_regmap_init_i2c(adv->i2c_cec,
> > @@ -1165,20 +1165,20 @@ static int adv7511_probe(struct i2c_client *i2c=
, const struct i2c_device_id *id)
> > =20
> >  	adv7511_packet_disable(adv7511, 0xffff);
> > =20
> > -	adv7511->i2c_edid =3D i2c_new_secondary_device(i2c, "edid",
> > +	adv7511->i2c_edid =3D i2c_new_ancillary_device(i2c, "edid",
> >  					ADV7511_EDID_I2C_ADDR_DEFAULT);
> > -	if (!adv7511->i2c_edid) {
> > -		ret =3D -EINVAL;
> > +	if (IS_ERR(adv7511->i2c_edid)) {
> > +		ret =3D PTR_ERR(adv7511->i2c_edid);
> >  		goto uninit_regulators;
> >  	}
> > =20
> >  	regmap_write(adv7511->regmap, ADV7511_REG_EDID_I2C_ADDR,
> >  		     adv7511->i2c_edid->addr << 1);
> > =20
> > -	adv7511->i2c_packet =3D i2c_new_secondary_device(i2c, "packet",
> > +	adv7511->i2c_packet =3D i2c_new_ancillary_device(i2c, "packet",
> >  					ADV7511_PACKET_I2C_ADDR_DEFAULT);
> > -	if (!adv7511->i2c_packet) {
> > -		ret =3D -EINVAL;
> > +	if (IS_ERR(adv7511->i2c_packet)) {
> > +		ret =3D PTR_ERR(adv7511->i2c_packet);
> >  		goto err_i2c_unregister_edid;
> >  	}
> > =20
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index f26ed495d384..76cb91e064b8 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -966,7 +966,7 @@ struct i2c_client *devm_i2c_new_dummy_device(struct=
 device *dev,
> >  EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
> > =20
> >  /**
> > - * i2c_new_secondary_device - Helper to get the instantiated secondary=
 address
> > + * i2c_new_ancillary_device - Helper to get the instantiated secondary=
 address
> >   * and create the associated device
> >   * @client: Handle to the primary client
> >   * @name: Handle to specify which secondary address to get
> > @@ -985,9 +985,9 @@ EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
> >   * cell whose "reg-names" value matches the slave name.
> >   *
> >   * This returns the new i2c client, which should be saved for later us=
e with
> > - * i2c_unregister_device(); or NULL to indicate an error.
> > + * i2c_unregister_device(); or an ERR_PTR to describe the error.
> >   */
> > -struct i2c_client *i2c_new_secondary_device(struct i2c_client *client,
> > +struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
> >  						const char *name,
> >  						u16 default_addr)
> >  {
> > @@ -1002,9 +1002,9 @@ struct i2c_client *i2c_new_secondary_device(struc=
t i2c_client *client,
> >  	}
> > =20
> >  	dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
> > -	return i2c_new_dummy(client->adapter, addr);
> > +	return i2c_new_dummy_device(client->adapter, addr);
> >  }
> > -EXPORT_SYMBOL_GPL(i2c_new_secondary_device);
> > +EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);
> > =20
> >  /* -------------------------------------------------------------------=
------ */
> > =20
> > diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i=
2c/adv748x/adv748x-core.c
> > index f57cd77a32fa..2567de2b0037 100644
> > --- a/drivers/media/i2c/adv748x/adv748x-core.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> > @@ -183,14 +183,14 @@ static int adv748x_initialise_clients(struct adv7=
48x_state *state)
> >  	int ret;
> > =20
> >  	for (i =3D ADV748X_PAGE_DPLL; i < ADV748X_PAGE_MAX; ++i) {
> > -		state->i2c_clients[i] =3D i2c_new_secondary_device(
> > +		state->i2c_clients[i] =3D i2c_new_ancillary_device(
> >  				state->client,
> >  				adv748x_default_addresses[i].name,
> >  				adv748x_default_addresses[i].default_addr);
> > =20
> > -		if (state->i2c_clients[i] =3D=3D NULL) {
> > +		if (IS_ERR(state->i2c_clients[i])) {
> >  			adv_err(state, "failed to create i2c client %u\n", i);
> > -			return -ENOMEM;
> > +			return PTR_ERR(state->i2c_clients[i]);
> >  		}
> > =20
> >  		ret =3D adv748x_configure_regmap(state, i);
> > diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
> > index 28a84bf9f8a9..8ed1d9b59dd2 100644
> > --- a/drivers/media/i2c/adv7604.c
> > +++ b/drivers/media/i2c/adv7604.c
> > @@ -2878,14 +2878,14 @@ static struct i2c_client *adv76xx_dummy_client(=
struct v4l2_subdev *sd,
> >  	struct i2c_client *new_client;
> > =20
> >  	if (pdata && pdata->i2c_addresses[page])
> > -		new_client =3D i2c_new_dummy(client->adapter,
> > +		new_client =3D i2c_new_dummy_device(client->adapter,
> >  					   pdata->i2c_addresses[page]);
> >  	else
> > -		new_client =3D i2c_new_secondary_device(client,
> > +		new_client =3D i2c_new_ancillary_device(client,
> >  				adv76xx_default_addresses[page].name,
> >  				adv76xx_default_addresses[page].default_addr);
> > =20
> > -	if (new_client)
> > +	if (!IS_ERR(new_client))
> >  		io_write(sd, io_reg, new_client->addr << 1);
> > =20
> >  	return new_client;
> > @@ -3520,8 +3520,8 @@ static int adv76xx_probe(struct i2c_client *clien=
t,
> >  			continue;
> > =20
> >  		state->i2c_clients[i] =3D adv76xx_dummy_client(sd, i);
> > -		if (!state->i2c_clients[i]) {
> > -			err =3D -EINVAL;
> > +		if (IS_ERR(state->i2c_clients[i])) {
> > +			err =3D PTR_ERR(state->i2c_clients[i]);
> >  			v4l2_err(sd, "failed to create i2c client %u\n", i);
> >  			goto err_i2c;
> >  		}
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index fa5552c2307b..ebbe024dd9e0 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -473,7 +473,7 @@ extern struct i2c_client *
> >  devm_i2c_new_dummy_device(struct device *dev, struct i2c_adapter *adap=
, u16 address);
> > =20
> >  extern struct i2c_client *
> > -i2c_new_secondary_device(struct i2c_client *client,
> > +i2c_new_ancillary_device(struct i2c_client *client,
> >  				const char *name,
> >  				u16 default_addr);
> > =20
> >=20
>=20
> --=20
> Regards
> --
> Kieran

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1MRlEACgkQFA3kzBSg
KbY75g/+KoLVKl50vLnV8t/WlRCPjw1QiiofzMQ5Dtt3N9HwGWPvXqbQ11KUL0He
27nMKf1Chf1V9iwnkPCoUluLU5l2ZqFJcvW5VvHMtvGHDky1On/5IrdhwJdEPyXR
m4CfqQKxGkvJCJTrIYDMYFANcDpTUvtoqDqPCfcT0NcbhiC5hQvn4eIvHbv4jy4S
8nHBv4FV6GIIlmi1c1Iux2AmbTOKwtL9uo5VEeefWin6m8NXrfMxpVZmpxoDyjAJ
Xz6ZrZKEl0VAXHgBa7CIJ6N5S2W5jMq3ZETRJuBZj4qgoYcDQhnaSxz4ksT+VIG9
7rSEpBCXw8wsW0N1INB1mZpiSArg6BwALbXzHsB0UaOrQwMKqNG/WHm79Gl22uZ5
RUnvUwcKjXvsxnSL7V8p+jTIUmGuIr1ytWazySOACePgePGNIwMthIYKBvquu+/v
nbkWeEzDPpZq9jZhcRpwfseQodVrgsTwR6a556L928iF9cRFWDxhU4FjZyfiNkzt
8jONRD4EXlXygcFuNkOROZ7/Aa5+EIikUSoCNRXOm8TqR9ptpHMh1gAwlfIgnGjO
kKpa7JyZLS7Uc/3kw+tShClsExYPRc1hG+EW/f31CZ4BpajQ+q50Ilf7/eqNbsQi
EaLNAZbjMhNZQ3+YQ4IB3WwK53VQP65sU8uxGqwsBVvlCoey5Lc=
=oIN2
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
