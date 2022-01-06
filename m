Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B436048653E
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 14:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239456AbiAFNX7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 08:23:59 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:50594 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239337AbiAFNX6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 08:23:58 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 32055B8212E
        for <linux-i2c@vger.kernel.org>; Thu,  6 Jan 2022 13:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7F6C36AE3;
        Thu,  6 Jan 2022 13:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641475436;
        bh=zDQtgKi/mR4QAi7lIBYm/oBleKar7U1vXetCehKFWdw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nuUZrxGjDGkarHAN7iSXbTbcJn1vTrf3BwYx65WN64dtnum2djFCQkn4ilyks1owz
         Khhna+Ppz9RvOFiUGUPZFwW/PG+hb0haa7HHtTwMeV9v4ZIA/WcWRqHQIzdSEcqji+
         wSnXNP9lqRfCnF0r2iemC5Q4yKcVvBT04le4XHS/2LacouxCT/bvI+lh0lGc+9pDuQ
         Bj/eq3/qpuHqiz7xeRf/4T7M3fIy545LcDcFpPPpSwQGMnnyYomgFUKb5q9Ts8za/h
         BeUrpkIRDFY46Uo0Ze2bxEjcJI5iZhTOwmB6HyUItp0a9AgBBgCcq3OuNdKKlkoDxU
         VWNhKE1cU9VJg==
Date:   Thu, 6 Jan 2022 14:23:53 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Kristian Evensen <kristian.evensen@gmail.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: mt7621 i2c fails with upstream driver
Message-ID: <YdbtaYzG9MX0pwMd@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Kristian Evensen <kristian.evensen@gmail.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org
References: <CAKfDRXgUvN19PUd_ebRJs-k_ytrGwgA=e6d3QJ9cwJogUGpoyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hEebnpKzs8edaAmj"
Content-Disposition: inline
In-Reply-To: <CAKfDRXgUvN19PUd_ebRJs-k_ytrGwgA=e6d3QJ9cwJogUGpoyw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hEebnpKzs8edaAmj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Adding maintainers for this driver/platform to CC...

On Wed, Jan 05, 2022 at 10:51:38AM +0100, Kristian Evensen wrote:
> Hello,
>=20
> I am in the process of bringing kernel 5.10 up on an mt7621-based
> board. The board is equipped with a temperature sensor that is
> connected to the i2c bus. Reading the temperature worked fine with my
> previous kernel (OpenWRT 4.14/downstream i2c driver), but fails when I
> use the upstream driver.
>=20
> With the 5.10 i2c-mt7621-driver, i2cdetect is no longer able to detect
> the sensor and i2cget fails with "Error: Read failed". An strace of
> i2cget reveals the cause to be the final ioctl call failing with
> ETIMEDOUT.
>=20
> Replacing the new with the old driver makes i2c work again, but I
> would like to try to avoid that. My knowledge of i2c is very limited,
> so I wondered if anyone knows what could be wrong or have any
> suggestions on things I can try to for example change in the driver?
>=20
> Thanks in advance for any help,
> Kristian

--hEebnpKzs8edaAmj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHW7WQACgkQFA3kzBSg
KbbCaxAAlbsj3gAjxVXPaqQXIegsuaQF9y7O0JCV5w+B1iMBpkmOu/M4koAUiJzz
ETh+A1uoZ6UVa4GpVrw1TBy75yE/SQcnVTIgCO0JtY+XfYtq/UyHSMaKjwhFe3md
TwF5R30bwJYANONITW22bigiJ8YP5e9XTXZXCoxAFmMD33+KPot4kXkRT88V/7S8
MIDVl2ah6/YRMem6F71evPSACD1uqvfocYSymvMpi+NMb+zYJTZ1IlBYqWkrNO2u
+viv12Hbf9aOUmw3bONVDc4jnJiEWcvnT926A6ElHVdnWq9TW3bQSu9cMf/AzmAh
CYYw9KeE2Ym+lWIzQRGZZnq4Gb/un+Mw4jWKFYrZ1q1EFeoWHjB8ZTr6U0tHS6y+
Pytb0DW+8JRKOil09A/E7Ewj88AZsBFa+VLyzRoM+NsoIkIIgJiqmcsHF50MSgLF
56Xwiog3BH5Sqw13svbOFUT/ozrwkQfzKWQdZSl7sMyrxPsVUo9ZsFZ8xFaOxo+2
a2GGgM36FWCVGUza4a5yHAAcZL9Ru6n5YFOl2jw1Xrv8wufA34Lp44Q3Z+vT+C/P
c3x4tjjAqZTAwRJzlk2iczfUX6NdlcXfXzieSqxiGYX3dBdmaVA9p2LgpxAj+dVG
W2GkcBzmvMMLLUFFwQge7VZs3xhpO2jpdWlFMwPPhVlMZgXP+G0=
=adZp
-----END PGP SIGNATURE-----

--hEebnpKzs8edaAmj--
