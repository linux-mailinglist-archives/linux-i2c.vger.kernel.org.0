Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76E9D1698AB
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Feb 2020 17:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgBWQkD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Feb 2020 11:40:03 -0500
Received: from sauhun.de ([88.99.104.3]:40724 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726208AbgBWQkD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 23 Feb 2020 11:40:03 -0500
Received: from localhost (unknown [77.247.85.78])
        by pokefinder.org (Postfix) with ESMTPSA id 429D52C01EF;
        Sun, 23 Feb 2020 17:40:00 +0100 (CET)
Date:   Sun, 23 Feb 2020 17:39:59 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Martin Volf <martin.volf.42@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [regression] nct6775 does not load in 5.4 and 5.5, bisected to
 b84398d6d7f90080
Message-ID: <20200223163959.GA1456@kunai>
References: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
 <1bdbac08-86f8-2a57-2b0d-8cd2beb2a1c0@roeck-us.net>
 <CAM1AHpSKFk9ZosQf=k-Rm2=EFqco7y4Lpfb7m07r=j_uJd4T0A@mail.gmail.com>
 <85356d1a-f90d-e94d-16eb-1071d4e94753@roeck-us.net>
 <CAM1AHpSpEFshpUGxKdhLV3XuThQg_XVaPgOWzvrTv6YtzHyO+A@mail.gmail.com>
 <bec1f81c-09a8-ba48-c6c4-5d9b340f7c0b@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <bec1f81c-09a8-ba48-c6c4-5d9b340f7c0b@roeck-us.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Outch. This means that the code is broken. ACPIBASE is not configured,
> or disabled, or the code reads from the wrong PCI configuration register.
> What I don't understand is why this works with v5.3 kernels; the code
> looks just as bad there for me. I must be missing something. Either case,
> the only thing you can really do at this point is to blacklist the
> iTCO_wdt driver.
>=20
> Other than that, we can only hope that someone who understands above
> code can provide a fix. Maybe Wolfram has an idea.

I'd love to but I don't know much about ACPI and its resource handling.
This is really Jean's realm, and and Jarkko, Andy, and Mika work with
this driver, too. Let's hope they can provide feedback after the
weekend.


--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5SqtsACgkQFA3kzBSg
KbaEvRAAjoTnvLiO4/n9cpGcelbYKWFi7Udvn8c3r3i0QqIhqyl6O/720WkY4IMd
TfpcUcOD73JH6VOTOk9+VJTvjcch9N4TmcCI1PuiHANjrV1shDhuiD9j9vhlXksn
Tq8dXJfx45rPRLbtnyZEXgf8Wj8f7q9wXeCU4p+DuTVFB+Rn66xZvcPuYPCkjPAM
bktSfWDFkyv8gwDV8HLbGSpatQqcP8ThyLjCIhGCJu5gthwrVUmIyBFWCScTUX1K
QZYjmuT+3htEpg25bkIMMCbc8Oq7XFiqM0aJNQWTsC7huiEfim2Z0AW2eIjhqSh3
dUisQuzng/hbvNzhHiQDJyRj3YB8QdUyTMQeDEt0VzmBNbUtMz8hvoO3QHdBat34
byCH5Ic6qyRGi/RHwB3wiYSQcDPfuUzaeVUhQbQcuzYeG7qfce8JmMOdi5020DPu
99Tz+WzuL1AyefV/+y1frulXBo7oX2xK4R0ZNE/LmzzYN16GvelHXj33oIQ7l1j/
/W/SukcQXGBb06ZxNfFXnOAk7RQhPuk3+oh3QR62Fhffl7fJZmDpcTQZksszba56
QYBBnYoOdesVA58uLJxaicgICfzZ3x26rsLlPedfmsleD3W/pllR+17iZ49jhbuf
MRTlJTRbY7VSYMzwLR2+0Z+ilWTDuZryTIeOH+mZEqcWrXUIgiQ=
=Cndv
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
