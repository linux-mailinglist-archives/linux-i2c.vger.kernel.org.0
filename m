Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8472535F16
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 16:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbfFEOVw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 10:21:52 -0400
Received: from sauhun.de ([88.99.104.3]:54978 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728211AbfFEOVv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Jun 2019 10:21:51 -0400
Received: from localhost (p5486CB35.dip0.t-ipconnect.de [84.134.203.53])
        by pokefinder.org (Postfix) with ESMTPSA id 25C0F3E43B4;
        Wed,  5 Jun 2019 16:21:50 +0200 (CEST)
Date:   Wed, 5 Jun 2019 16:21:49 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Robert Hancock <hancock@sedsystems.ca>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: xiic: Add max_read_len quirk
Message-ID: <20190605142149.GD962@kunai>
References: <1559685351-25249-1-git-send-email-hancock@sedsystems.ca>
 <f1a679b1-71e7-c260-0f38-c617d906b7a2@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BI5RvnYi6R4T2M87"
Content-Disposition: inline
In-Reply-To: <f1a679b1-71e7-c260-0f38-c617d906b7a2@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BI5RvnYi6R4T2M87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 04:18:49PM +0200, Michal Simek wrote:
> On 04. 06. 19 23:55, Robert Hancock wrote:
> > This driver does not support reading more than 255 bytes at once because
> > the register for storing the number of bytes to read is only 8 bits. Add
> > a max_read_len quirk to enforce this.
> >=20
> > This was found when using this driver with the SFP driver, which was
> > previously reading all 256 bytes in the SFP EEPROM in one transaction.
> > This caused a bunch of hard-to-debug errors in the xiic driver since the
> > driver/logic was treating the number of bytes to read as zero.
> > Rejecting transactions that aren't supported at least allows the problem
> > to be diagnosed more easily.
> >=20
> > Signed-off-by: Robert Hancock <hancock@sedsystems.ca>

Thanks for the patch!

> > ---
> >=20
> > Changes since v1: Added more rationale in description.
> >=20
> >  drivers/i2c/busses/i2c-xiic.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xii=
c.c
> > index 0fea7c5..37b3b93 100644
> > --- a/drivers/i2c/busses/i2c-xiic.c
> > +++ b/drivers/i2c/busses/i2c-xiic.c
> > @@ -709,11 +709,16 @@ static u32 xiic_func(struct i2c_adapter *adap)
> >  	.functionality =3D xiic_func,
> >  };
> > =20
> > +static const struct i2c_adapter_quirks xiic_quirks =3D {
> > +	.max_read_len =3D 255,
> > +};
> > +
> >  static const struct i2c_adapter xiic_adapter =3D {
> >  	.owner =3D THIS_MODULE,
> >  	.name =3D DRIVER_NAME,
> >  	.class =3D I2C_CLASS_DEPRECATED,
> >  	.algo =3D &xiic_algorithm,
> > +	.quirks =3D &xiic_quirks,
> >  };
> > =20
>=20
> Reviewed-by: Michal Simek <michal.simek@xilinx.com>
>=20
> Nit: The same limitation is there for write. Maybe worth to also set it
> up. Anyway this can be done separately.

I consider this stable material, so I'd prefer to have both fixed in one
patch, if possible.

Robert, are you willing to add this?


--BI5RvnYi6R4T2M87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz3z/0ACgkQFA3kzBSg
Kbbkog/7BFvavz5t1VuEYMuzQI4v5+GDIRrWznv6S62Wjx9iTO1ubEyyRu33A+CC
VIOpYUIjMkYSEKEwljYklRH9F9uvVvWsDYwXm3zxwrM8wR0dwu1xxMyj08w86Smo
FpBAqn6kqXg4yHm2lr66m5NBAmtUnZmq67VcxhEAwGCXXwDYuMCok3hoQxEaWC53
JrZc6KIOZ9jiCtinQgleXUiKGfEyPvaO7VwG2MjWOWpiP2qhvugjZu7aJ3jGD2d8
rtIKu6bx/Acm3TpVsliZxsAJtsK1o5wt1jfGs+fCNSVJfFnpWKkeMr2V+1ofBg88
adIsKEDGHbQ+k3FdusCzdLviT7m71E0e9iYKtOw8k1Or1uuSkF3q8msIQbnIgOy7
BOliUphtOrhORSYgukArVS5IJAk13jR8OyGwTbct6DtvxmLOcXtk3G6615pIIr+k
uLYFOu9jsR4eJ5xDcOv7o/zh5m/Melb7xsL7g27hgu30LFgyzHbCXoOORujRCK3k
FLMiiwF0+cZuNg+U3qNCU4JT+FTa+0x+bJa+HK+ynj0ChzuazGDUErxBKHo2yDze
eRtPeBPwtiR/Qh9sYsjU8nr+L0uOAtwMbbDO1Su/WFaqa87cMIVCB/pS5jRMLggh
8vX9O12DfcLAqx0yIS1+Dq996ErXovAaWPw2DOre3XlN/Al6DN0=
=IqM3
-----END PGP SIGNATURE-----

--BI5RvnYi6R4T2M87--
