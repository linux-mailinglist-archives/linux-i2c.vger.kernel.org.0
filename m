Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82A6C7AAE7D
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 11:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbjIVJoQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 05:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbjIVJoL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 05:44:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B5C199
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 02:44:05 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC09C433C7;
        Fri, 22 Sep 2023 09:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695375844;
        bh=mGzu7de4XOoNI7ihlFU1CLNniryH4BBo9SBjap4z8xc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e6hrztMN4d+8uOzTK39Gdwt/4DFjpUm/8uFTmJCv+CspLORfTNM+yFAFNZgeC1Xkm
         /50O1h8V4nCgfUdamH+XdcPyeW77tGfCuKYfBIqC2NsBN/6NfkSUY/rgbyFpJxJGC3
         eNcPfp7vTzXNmpzbm31IZf/6jv4m1MslVTKs8w7mOSC0LYf4++fh81l+G9ybbLaPda
         TT3Atw5wNBkrK/HGn0+qrASWzNje7CN1VPlaYWalgQ5wLV8JitdrF5y0xk+pEiaIfD
         oy/hQhEh+iQOvdujQg/xC5LngX6dcXpI2qfRsvpBGNdTW/ZzoOv3eB7Kq0SP5d3GhT
         Fyh45Ym29agdw==
Date:   Fri, 22 Sep 2023 11:44:01 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH RESUBMIT] i2c: i801: replace acpi_lock with I2C bus lock
Message-ID: <ZQ1h4Rtz8Snf9+zI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <3ef0a090-13ef-4fa9-9b91-1b03abfd01f4@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="doHbOn9ZOuO7D4wd"
Content-Disposition: inline
In-Reply-To: <3ef0a090-13ef-4fa9-9b91-1b03abfd01f4@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--doHbOn9ZOuO7D4wd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 09:33:01AM +0200, Heiner Kallweit wrote:
> I2C core ensures in i2c_smbus_xfer() that the I2C bus lock is held when
> calling the smbus_xfer callback. That's i801_access() in our case.
> I think it's safe in general to assume that the I2C bus lock is held
> when the smbus_xfer callback is called.
> Therefore I see no need to define an own mutex.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--doHbOn9ZOuO7D4wd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUNYeEACgkQFA3kzBSg
KbbaoA/9EkUhU/pgL1oy8GdtczDH6lhbml0Hp1NzfwV5gM7I4m+Hyu0iwukUWM9c
w7Nv14Bv0XPkD2f87s5lZHZuOjJpBj7YbFAzW9xPQf9NQvakatqoqvCiyq2MmCTa
9HRj5HgrZWTuNciSnLB8hDKOiXa1qU9YPC3zL4gH1aLVgRe2EThEev15ZKAZRtzI
M6gY8KdsfUSDK5Re721pQ4OiOmnpQJo6HHWnkqG54xUWQuHUiLcxYJrI9dWxS84O
/ViCygHFNazLegDFpe5l8OxlEA66QYF6lmWIm6a5DWTNDDnOS5QyDV9c2iZ9sUuR
QUchEuemxiITYFB6yPHmOxioi9DzUmFuImnkR3pOv3zG0xQdLbiixGbkgKK6MPtC
KNKauDcXOyESXbOkBdgaz+WKdJI+IZYLwL+iQ4O7uj3dUqEJ2dUwg/dmf7lDoWWp
GsSmKwYf2WpayiHmpQZ2mlUcPlRsBqw/kbj9mNPR0pzDsHl0BTAt/p3w8MM6G/9V
nVzpW9u12sLpxe4LzNxE/OKpbqzBwFIAhqcT/soImPltuoHQmwfR6mubXG2bK2Ko
uR2YkAKps7uL23qAIXBrrOy4QwktwlFIylr/iSCuoVCey7TyF57NdhN0fAu1N7ux
g0WnC0onutfF6SKq2YuEsolTpR0ZHXAG2dKSXejJ6YkOQs0VQtc=
=Pjqt
-----END PGP SIGNATURE-----

--doHbOn9ZOuO7D4wd--
