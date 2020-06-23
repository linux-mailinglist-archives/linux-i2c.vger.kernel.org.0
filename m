Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67103205BC6
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 21:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387510AbgFWTZN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 15:25:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:55482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733270AbgFWTZN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jun 2020 15:25:13 -0400
Received: from localhost (p54b333ad.dip0.t-ipconnect.de [84.179.51.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E56B20C09;
        Tue, 23 Jun 2020 19:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592940312;
        bh=D8Zpk6k2VFN1tZojurw8ol8F8ThGzyxzyMimMXrr5Xs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hh37k0UDNyRNyTRrFjEyIyLjlo2oGc9NmCAZcIWDj549CmHb/sWP8NCQ8mO30Rwuf
         zyFWXEU7Fhlaonz0Zihcnv/CB6ehc+RYgW0KXqxOo7eLG8izWZetp3qAd8O4Pcnxw9
         MdmLR9gwh+Dz2eC1xiOPZNaeioNrEOY4VYhS9WNw=
Date:   Tue, 23 Jun 2020 21:25:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v1] i2c: designware: Adjust bus speed independently of
 ACPI
Message-ID: <20200623192506.GA1203@ninjato>
References: <20200623091501.50070-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <20200623091501.50070-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2020 at 12:15:01PM +0300, Andy Shevchenko wrote:
> John Stultz reported that commit f9288fcc5c615 ("i2c: designware: Move
> ACPI parts into common module") caused a regression on the HiKey board
> where adv7511 HDMI bridge driver wasn't probing anymore due the I2C bus
> failed to start.
>=20
> It seems the change caused the bus speed being zero when CONFIG_ACPI
> not set and neither speed based on "clock-frequency" device property
> or default fast mode is set.
>=20
> Fix this by splitting i2c_dw_acpi_adjust_bus_speed() to
> i2c_dw_acpi_round_bus_speed() and i2c_dw_adjust_bus_speed(), where
> the latter one has the code that runs independently of ACPI.
>=20
> Fixes: f9288fcc5c615 ("i2c: designware: Move ACPI parts into common modul=
e")
> Reported-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-current, thanks!


--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7yVw4ACgkQFA3kzBSg
Kbb++Q//awh6tfmxnEh02CxYgs1sPiDLTVasslwIT+M6QRw832C9anzuM98GkaQ0
yte0MvYBsriIMjzLOJ+pID9dPFlEemQR/NORSbrVhpBb5FDAL6E9xCzzCFt/DJsA
GO3xeqrAZf5hyeHg6jtif8HcR/n64cuDjCV7Mx9MvGbD7YI8kjh0la8IHEvBfmZV
42ZcldXTn0puKirOfLQNmJCc8SKReBxALtWsXUXtQgFs9jyDvKYOLTKxC5rrlKjO
kWOTROJKWQr/azaLAo/BlzN2Rox0gg7Auyn+SZ26HLvivICsLhVaS1wPlvMJps2G
0ABTQhb7XsQSsaZKaMmf8TxuYwhltyoHeEqKwhhmJxprp0wwqwxkLcJ7UuJDZ1vb
+UFv+FraHe052Wy/opzA+f35i33eyeKYX47GnZ4KPwQ5NFUeooYzwWAggXaN3wAZ
Z5Yhv6Hm1xng38OxvroXbw3m0HufstGue3Sc9FJcAKuF1YPSoOxz6kv1SDrGP5J6
PfI3mOV+axBmyXOnZ6jhMcXGa8QkV+hHpyavBrmXRSSqc8Kr3WHSeP5bFA7Bfe1z
xBYzjcx+zdU+uGBxiDmPJ4cMHFlVKyAHV9j7CFtTwSDlkzXOGW9Ms4bT18ShD/yO
phqQM9z9I3DEMZ9Pzvm3qtNQFao0c76Nsip4Stwdlm0/cLrGByU=
=lpx+
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
