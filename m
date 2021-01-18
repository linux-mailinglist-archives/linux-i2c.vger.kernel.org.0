Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0364C2F9CE4
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 11:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389879AbhARK3z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 05:29:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:37082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388537AbhARJtr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 04:49:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA85122240;
        Mon, 18 Jan 2021 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610963342;
        bh=9bTutVuu/DSuDKBMjc+IVf0+eQrTrDMyPzHtibHj+6k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UAR35gZ46BzuN7kM6fHMzaBLqnTSd1J7OPzW8UCkfDgrutwQ0fxwL/B3demIaiTP5
         7U+DY26pte7HTim5LazSjwT3I+RIOqsC7fvZCulRc/WZocNAnM+NytJzcj5NwQYipo
         MMKDmeLFjI2+qtOsTzE1TNdpqfuECs0aJyOCiVf5fO6k1WNdT26VEQZGZXwS91ORae
         3AyHTivLWMCb1j+bALrSkgwJAPSPJ+/2e3DBWAjvblsOd2C23q5scZFi382wEOavuK
         yJmflvccN7Wa5EB78J3X+u9qFXJyiv94HXJvdMbfwr2YADaz91hvBT5GKKS+WRAq0i
         w1CO90NpxvCDg==
Date:   Mon, 18 Jan 2021 10:48:59 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        andy@kernel.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        lee.jones@linaro.org, hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 3/7] i2c: i2c-core-base: Use format macro in
 i2c_dev_set_name()
Message-ID: <20210118094859.GE1018@ninjato>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-4-djrscally@gmail.com>
 <20210118094158.GV11878@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Dzs2zDY0zgkG72+7"
Content-Disposition: inline
In-Reply-To: <20210118094158.GV11878@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Dzs2zDY0zgkG72+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  	if (adev) {
> > -		dev_set_name(&client->dev, "i2c-%s", acpi_dev_name(adev));
> > +		dev_set_name(&client->dev, I2C_DEV_NAME_FORMAT, acpi_dev_name(adev));
>=20
> Over 80, please wrap.

I am not that strict with the 80, and I don't think it will improve
readability here. It can stay this time IMO.


--Dzs2zDY0zgkG72+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAFWYsACgkQFA3kzBSg
KbZ5TxAAqm6pyHARUGL0cKim01HMV/DtxQ7nhbhn/VLKU53KGUuaBt/1obKOLso1
wgY9LSF/Q0AjqgCEk8TqAi0oKPqBJdjzeIIBMe54dxiqCLo5RlaDIELGe51BZtKQ
29xIhGlsla1j+mFx0Rerfj5hq3ne58e2MnBQDFIOJpwGdKkdaH1SqvDlA9OtN0nJ
dMsXbVCIcPCyVPEwW4evvlBhLa2PCxxuJB6WgQFPxHhgaXZoomi7lIhwH5OE66Ea
PVuGvIAldWSAU2bTBBfeKxpwRWWJ4ktsjU31aaIhwT8JHxe7K7eltFrhXXqCeXSJ
fKxX2og3vx7wVuCAaM7pPkJFTZJTkb/cn+Ukh6S4UaWc80LV6nAcSWMWO68tTGVt
Evx3Ym+UqWwDP/FW9DcI+44wQgjPRh6q/c++KgID1E7MyrGVWAyNQb3OFYqRuSp1
6xsrDrJqTdm9DAsWwW3eSC0Dmb3i2JmiwdHluMnKr9C21AbiUTMKxrIz3lWj1Cs0
7Ukn1GJIq+gOwiTZFJkEA69+LDOoGztKi6gzj2HQwDDG48GP9FHQVCmH9t39LHFm
sm76hgfNYZNBGtda/WYTZL6wYwmzDvNCPqP4Ukyl6qmUWYN5fHMm0Akr9yrL13KR
Ts1zB536gMUPqtLdgC2l0kqisbbqtXQetkv7QWaxyJ/vlEXXO54=
=sHGt
-----END PGP SIGNATURE-----

--Dzs2zDY0zgkG72+7--
