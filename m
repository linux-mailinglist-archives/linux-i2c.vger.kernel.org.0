Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5686E160CBD
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 09:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgBQISD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 03:18:03 -0500
Received: from sauhun.de ([88.99.104.3]:58544 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727332AbgBQISD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Feb 2020 03:18:03 -0500
Received: from localhost (p54B3307E.dip0.t-ipconnect.de [84.179.48.126])
        by pokefinder.org (Postfix) with ESMTPSA id E568D2C0746;
        Mon, 17 Feb 2020 09:18:00 +0100 (CET)
Date:   Mon, 17 Feb 2020 09:17:58 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Robert Richter <rrichter@marvell.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Jean Delvare <jdelvare@suse.com>,
        George Cherian <gcherian@marvell.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: convert SMBus alert setup function to return an
 ERRPTR
Message-ID: <20200217081758.GA2814@ninjato>
References: <20200210172929.6001-1-wsa+renesas@sang-engineering.com>
 <20200210172929.6001-2-wsa+renesas@sang-engineering.com>
 <20200217075837.2agub5deqdpet3ce@rric.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <20200217075837.2agub5deqdpet3ce@rric.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> > -struct i2c_client *i2c_setup_smbus_alert(struct i2c_adapter *adapter,
> > +struct i2c_client *i2c_install_smbus_alert(struct i2c_adapter *adapter,
> >  					 struct i2c_smbus_alert_setup *setup);
>=20
> This function naming is a bit odd. It creates a struct i2c_client.
> Then, there is also i2c_new_client_device() and i2c_new_device(). For
> i2c_new_client_device() there are no users at all outside of
> i2c-core-base.c (except for Falcon NIC), it is only a wrapper.

i2c_new_device (and friends) returned NULL on error. I am currently
converting all i2c_new_* functions to return an ERRPTR. So,
i2c_new_client_device is the new function, i2c_new_device is deprecated.
If you check v5.6-rc1, you will find many more users. Similarily,
i2c_new_dummy is deprecated (and removed already), i2c_new_dummy_device
is the new thing.

> So how about reducing the interface to those both only to:?
>=20
>  i2c_new_device()
>  i2c_new_device_smbus()

Given the above, it would be:

	i2c_new_client_device()
	i2c_new_smbus_device()

Yet, I think this is too vague. Maybe

	i2c_new_smbus_alert_device()

? Note that I never used SMBus Alert, so I am happy for feedback from
people actually using it.

Thanks for the comment!


--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5KTDIACgkQFA3kzBSg
KbY2Tg/9ERLUoo/puQvUCT2DmwNLxguPXMBXpvLqfU/dSnClgrzdH5Mct7sMnLqQ
k2Vs0mnQNMWXMmX2Nxl7Mmp14iI9nbBuSGmSQa8TVdeCcJO5snPaCS8i52E7tfmI
otYuwegi91DmoWw4ETyoT/xSKuD9R90lUeBVfN4xxTlkEUpX1JbOnSHoFqH374Ne
aQLWs4z4IRHK/FO+hvbkStYtTq1zLhFSk+/3so5C3mjp/hGF8C7nufjOqS5MOR4j
OQqU8cmzzGQUoXoZkKJ08Jj2/zw/fdFgsCnN3iZOLsBn4ChrIKGjdZH3XhmKeKYa
xB9EF/zPs4bXXsIoJrAZ57a3aglYpberK29W0+oo9pJ/F8bMd+bBFojp/UAM0DDR
zvFhmU6N0UUIRI7+otYl84wZ/xUVnnHOhi/qPjMheDCnCK7QtShYysKEDpfy1gSY
cBbatkIe183a+kUrQqaU43uA0sour2JxViLzjCvLoLtSqbwy2YReV+PRRgN5xlqR
Bm2lTXOX+7dy06y4h5tECKCoKXM2Ek/BNkvXJPq6KF/j82gEEqlc3P86bvZwoIwy
DHqjM3N3JtHLOwtKwl2jCV/+SnHaprkW6fCrGiPougarDdSI8iH+AFdQvPxC2/zH
wq6S85inc5KI2mxUHtmj65UDLYtKSMUHyJ8QxJt+WpRKOkaIfSQ=
=yipG
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
