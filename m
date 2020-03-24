Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1E41190B1E
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 11:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbgCXKev (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 06:34:51 -0400
Received: from sauhun.de ([88.99.104.3]:48924 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727241AbgCXKev (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 06:34:51 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id D13B92C08EF;
        Tue, 24 Mar 2020 11:34:48 +0100 (CET)
Date:   Tue, 24 Mar 2020 11:34:48 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v12 1/2] dt-binding: i2c: add bus-supply property
Message-ID: <20200324103448.GE1134@ninjato>
References: <20200306034946.11223-1-bibby.hsieh@mediatek.com>
 <20200306034946.11223-2-bibby.hsieh@mediatek.com>
 <20200322130710.GA1091@ninjato>
 <CAAFQd5ANJcReHD_n0LorS+bjE8Cn_W-kY5LNgGG+L+jMmywYfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tVmo9FyGdCe4F4YN"
Content-Disposition: inline
In-Reply-To: <CAAFQd5ANJcReHD_n0LorS+bjE8Cn_W-kY5LNgGG+L+jMmywYfA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tVmo9FyGdCe4F4YN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > +- bus-supply
> > > +     phandle to the regulator that provides power to i2c.
> >
> > I think this is not clear enough. I assume it means the regulator for
> > driving SCL/SDA? In the coverletter you mention also an EEPROM. In your
> > case, this is driven by the same regulator? I am skeptical we can
> > abstract it like this because I2C devices could be driven by various
> > regulators in the system, so there couldn't be one "bus regulator". The
> > regulator for the EEPROM should be described in the EEPROM node. So,
> > this "bus supply" is only for driving SCL/SDA?
>=20
> In our case the bus-supply regulator drives the voltage rail to which
> SCL/SDA are pulled up and there is an EEPROM on the bus, powered by
> yet another rail. There is also another slave on the bus which uses
> the same regulator as the bus-supply for its own power.
>=20
> In other words, bus-supply only ensures that SCL and SDA are in a
> usable state. Other consumers need to refer to the regulator in their
> own supplies if they need it for their own power.
>=20
> Does this answer your questions?

Yes, this was exactly what I was assuming.

So, I think the above documentation should be changed: s|i2c|SCL/SDA|

D'accord?


--tVmo9FyGdCe4F4YN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl554kQACgkQFA3kzBSg
KbamcA/+Ll60/Efzo6FG3APE0g6ZjxtUBgbCskbrOq6AAiExxWU0zzl2zcvkimxm
EzB4MMQDk7XBRnr8IeBNOHgT9F7txegCzrSzCTV8j0peut5akg385S8heeM5b9e+
udCKQahb2tb8vOCZFOTn9OoguZ+VDNhOYCGIoBcgUCA/YWcuomaxt/VPACI+E558
TWqhouadPIqQiRLGuF6N+Ya8Tri9i6cURoYa1uZKL/bsnxKc0TkcWiiOzYXmB+Fu
I6uNg5XJxRzIvYDAeMuWxvUOazNcdJldc1l+neD3HKhKQs+OKyVl25JD7tLpgZNU
CHQHoItGULjh7sapaG3BbjkW//SHTumw6G6JBYNrjrzA3Tr6gv6+dymXyPKp62sA
9XFwguFD2LntFyVBsuBs0tN8jycZNkp0wgEXnTetn2gFQP70lXby6wlhTkUahEHf
WIcDERSPKv7UleKiwaZx9p3KMZisxMMdJZjArKwbLE7xu0iFjwhepD4D4wlmHrT+
dDVLJJJDShtwpTqSFsGjdo6xDT5Hzx7Vdv/dSBtLk9P+OSj3AwgVA3bG+PnXUzLW
C5WvW28kFg78c49B7vlYVnNcoxhIJuuloiCeKGXwjba0OZ1nRjHi37VC5Q4S43Mu
DpVsDnjrkImZub+ijqjHgfLXL5OSV/NVDjrVsCnq8zZlbkHgGgM=
=/K3S
-----END PGP SIGNATURE-----

--tVmo9FyGdCe4F4YN--
