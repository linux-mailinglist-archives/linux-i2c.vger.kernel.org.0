Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF692EA896
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 11:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbhAEKZt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 05:25:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:59938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728768AbhAEKZt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 05:25:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9761922288;
        Tue,  5 Jan 2021 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609842308;
        bh=zLoJm/jX8+jgBPXDxQcbEqrCSdvNxPcfwvCFMTIo8Vc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sGwfZ5h0bEAuJbJKVVShympik/S5fFRfJjCySO+em2w5mQnujlvFUxZhe3JEVyqSQ
         7fTGqFq/X91FpOi+51NV5f3JswISHekebd007LDKd37ooWm9iuktwMwNudguogMlCV
         ZOit1IToMBYPhGG9cvBI3ZPzh2vPYNYIgDc3uRAWaCrNpl0mjcze/N2NdL/cRITYJB
         AJsenICB2+ebb0UvLZvj+m9wph0JbsjKAJTDU4p1K0AkSmKaPACDxlNLyzMYCm8SP0
         +AqFB72dZcSp1X0h7U0gMtALNIcclEDAAMlPEEfyvH+NxqKvHpnOkPHn3c1fBYDErQ
         YDcWK1RRFcN3g==
Date:   Tue, 5 Jan 2021 11:25:05 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Evan Green <evgreen@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v3 2/2] i2c: i2c-mux-gpio: Enable this driver in
 ACPI land
Message-ID: <20210105102505.GG2000@ninjato>
References: <20201118234025.376412-1-evgreen@chromium.org>
 <20201118153951.RESEND.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
 <CAHp75VdtwyCj7emc7Bk87q7kMQA0sSX81-aK-fMq4qTfTF-c_g@mail.gmail.com>
 <CAE=gft4OW7_pWfco4+kY65tbUGUDzXXDfsVMCP8MN93inVem4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qoTlaiD+Y2fIM3Ll"
Content-Disposition: inline
In-Reply-To: <CAE=gft4OW7_pWfco4+kY65tbUGUDzXXDfsVMCP8MN93inVem4A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qoTlaiD+Y2fIM3Ll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 10:59:12AM -0800, Evan Green wrote:
> On Thu, Nov 19, 2020 at 7:24 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Thu, Nov 19, 2020 at 1:40 AM Evan Green <evgreen@chromium.org> wrote:
> > >
> > > Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
> > > property translates directly to a fwnode_property_*() call. The child
> > > reg property translates naturally into _ADR in ACPI.
> > >
> > > The i2c-parent binding is a relic from the days when the bindings
> > > dictated that all direct children of an I2C controller had to be I2C
> > > devices. These days that's no longer required. The i2c-mux can sit as=
 a
> > > direct child of its parent controller, which is where it makes the mo=
st
> > > sense from a hardware description perspective. For the ACPI
> > > implementation we'll assume that's always how the i2c-mux-gpio is
> > > instantiated.
> >
> > ...
> >
> > > +#ifdef CONFIG_ACPI
> > > +
> > > +static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
> > > +                                    struct fwnode_handle *fwdev,
> > > +                                    unsigned int *adr)
> > > +
> > > +{
> > > +       unsigned long long adr64;
> > > +       acpi_status status;
> > > +
> > > +       status =3D acpi_evaluate_integer(ACPI_HANDLE_FWNODE(fwdev),
> > > +                                      METHOD_NAME__ADR,
> > > +                                      NULL, &adr64);
> > > +
> > > +       if (!ACPI_SUCCESS(status)) {
> > > +               dev_err(dev, "Cannot get address\n");
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       *adr =3D adr64;
> > > +       if (*adr !=3D adr64) {
> > > +               dev_err(dev, "Address out of range\n");
> > > +               return -ERANGE;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +#else
> > > +
> > > +static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
> > > +                                    struct fwnode_handle *fwdev,
> > > +                                    unsigned int *adr)
> > > +{
> > > +       return -EINVAL;
> > > +}
> > > +
> > > +#endif
> >
> > I'm wondering if you may use acpi_find_child_device() here.
> > Or is it a complementary function?
>=20
> I think it's complementary. The code above is "I have a device, I want
> its _ADR". whereas acpi_find_child_device() is "I have an _ADR, I want
> its device". I could flip things around to use this, but it would turn
> the code from linear into quadratic. I'd have to scan each possible
> address and call acpi_find_child_device() with that _ADR to see if
> there's a child device there.
>=20
> >
> > ...
> >
> > > +       device_for_each_child_node(dev, child) {
> > > +               if (is_of_node(child)) {
> > > +                       fwnode_property_read_u32(child, "reg", values=
 + i);
> > > +
> > > +               } else if (is_acpi_node(child)) {
> > > +                       rc =3D i2c_mux_gpio_get_acpi_adr(dev, child, =
values + i);
> > > +                       if (rc)
> > > +                               return rc;
> > > +               }
> > > +
> > >                 i++;
> > >         }
> >
> > And for this I already told in two different threads with similar code
> > that perhaps we need common helper that will check reg followed by
> > _ADR.
>=20
> Oh, I'm not aware of those threads. I'd need some advice: I guess a
> new fwnode_* API would make sense for this, but I had trouble coming
> up with a generic interface. _ADR is just a blobbo 64 bit int, but
> DT's "reg" is a little more flexible, having a length, and potentially
> being an array. I suppose it would have to be something like:
>=20
> int fwnode_property_read_reg(const struct fwnode_handle *fwnode,
>                                  size_t index, uint64_t *addr, uint64_t *=
len);
>=20
> But then ACPI would always return 0 for length, and only index 0 would
> ever work? I'm worried I'm designing an API that's only useful to me.
>=20
> I tried to look around for other examples of this specific pattern of
> _ADR then "reg", but struggled to turn up much.
> -Evan

Andy, is Evan's answer satisfying for you?


--qoTlaiD+Y2fIM3Ll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0PoEACgkQFA3kzBSg
KbYPthAAn3lYOe2d2fVI+hrRlYvYV7KgQkkeLODG00f26qhA5RSIf5bBGwcLSZcN
7XeW5MUf7ofCWmBAOvxHlpiazLlrkDBTsQi5lXWAcF0y0FZkCjkI72lD2cHY1iZJ
Tu7O4y/b//N5yTIgqjMHKwC8ZOUhRZ0pR/Tj5OGq6iAo6KCWj4FC+odPXc/mRsM7
jrfRRHSDhT6eB5WHUoemaJqo0CH0rQ+OrQyvYKLzIePePvSBqBi64F4Srv6vNXsf
sVXvVYzVLHoWKvJK9oUdMx6DLeXG9w43y5nCqVllM+WQ9CbQXimlS7XKjESy9YN1
QNWCgRSKE+lKl45yAe0DlmuMIagjbctk57LYvtVFHflp8dqyreuPPPfhy7ZC9sui
3nbkN+nJrHKe1iMLhVEEIi/fVPjkJA0Hb/wtOxoxAjILAxhsMRBxXs8idxIepgfA
uk1W64qo2DKU5b57ukU/gz738Xy4QAwW0lpOCTsqzXw0O1ez5/6jDlzJ4tRf+WwZ
bmpGiCZm93Y6u7Jhx1a5LneUqCGEn8xKHh6p5V2ily26WdvEI77K6SxC5nfPUElq
USz+vYDUD26L67betIvvWEmcj8s4rOPcYDaPzAOe783RnvXhjMZeniCo5t5oTiBB
rL+nIAQaD2ENPWsLPxrjggVQxdrMWhG+rGBYmT19pDlVOhkQmbM=
=RerS
-----END PGP SIGNATURE-----

--qoTlaiD+Y2fIM3Ll--
