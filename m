Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBF13B3789
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jun 2021 22:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232370AbhFXUGh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Jun 2021 16:06:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:44168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232178AbhFXUGh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 24 Jun 2021 16:06:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E72CF61220;
        Thu, 24 Jun 2021 20:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624565057;
        bh=NTWckRn1poC49O7dy6r7JRVT/OR7EtV/ck2t1K7Qa8A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ied8OL+680PQ8FsfytK/XFLQhtYGL9zS3Kb7aVZ0rSJw37hspfaHZxqMvPC17GNsE
         IJuhFB3Ry2djSV3ADpW+XcyQftMOXRL7kn/dw4s55tdd+1WIQOwZz3eJPD1bdZZp1q
         5ajHm4XB3jMYb151n0GmNzoaaLLT8DhHYydSOt04Cyx7wVXiNxV36OrSMc8cnc2MN1
         J/4+KiVhtvIg9kMXuwerZZ1NuGXoTtV761FInpilIo6mpOhhG8l2DvIBk+hfrQRTZV
         mzbXCfxfHMKbF2ivQp4Y3BZXutSGB359YM5xuQ2J7WslKaQ4eqZdqEUVLvhPiA+ih7
         6bWifVHA0PqiA==
Date:   Thu, 24 Jun 2021 22:04:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] i2c: core: Disable client irq on reboot/shutdown
Message-ID: <YNTlPeP7UMz4FJkg@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20210604232744.1259150-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lK/r+RGshAVR/Cbr"
Content-Disposition: inline
In-Reply-To: <20210604232744.1259150-1-swboyd@chromium.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lK/r+RGshAVR/Cbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 04:27:44PM -0700, Stephen Boyd wrote:
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>=20
> If an i2c client receives an interrupt during reboot or shutdown it may
> be too late to service it by making an i2c transaction on the bus
> because the i2c controller has already been shutdown. This can lead to
> system hangs if the i2c controller tries to make a transfer that is
> doomed to fail because the access to the i2c pins is already shut down,
> or an iommu translation has been torn down so i2c controller register
> access doesn't work.
>=20
> Let's simply disable the irq if there isn't a shutdown callback for an
> i2c client when there is an irq associated with the device. This will
> make sure that irqs don't come in later than the time that we can handle
> it. We don't do this if the i2c client device already has a shutdown
> callback because presumably they're doing the right thing and quieting
> the device so irqs don't come in after the shutdown callback returns.
>=20
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> [swboyd@chromium.org: Dropped newline, added commit text, added
> interrupt.h for robot build error]
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Applied to for-next, thanks!


--lK/r+RGshAVR/Cbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDU5T0ACgkQFA3kzBSg
KbZ23hAAlpBEOrTHLQ98sISGlEx9SLvsZVqzHCUPBj5ipjKB9fhp+7daqOsEIRs3
qpFd/vQCdcBsuTasC7xQYoAw8OJAWGs5dfr3s1DUoyMyJ5YJq3ZZK+9u9IR23z2Q
F6VOz5G6Kzwu8JGA+3tR0B8lcwMh+7ppgYv4A7DRuvzVoTTFezzR2YoPNJU8D5yR
jCxRbPZbqNFzt/gmB1UMWI+ZQ761vhC6IcV0qhevPugO5Gvsn/u31Uq8oMEtU3u7
U3BslPhw0CwV0YkZN3FaPmq0Huv5+tJ99oe5SvE5yLX5AVG3GhmZqRsDewBKN/m6
x55r+Wfc4zWK+8KhERe1/1aOetbpYG/QGMX9ZrDnnPVB+oPihBGdvUY3udu8qN+V
SUr3ZAhAdTS7c3x5JY1EQJMrMjzIIacpkgN1v7762oyxt+GEZSDIj6odT3XgqgOY
QrKFpc2l0W47I7R3Ss/roe9+FSDgjfDXxVoAJQwcqOa13yqR6Mm22hwEF0nKFT92
JvoQm686yPJembutX/GTA8rA/FfuXVRfDl7wDizS6qhPbqOSMESoABh+jelu+eFy
ELmh88SX+nlHFFuS+GDT375F/lIJWAFBET4iclXhlyox0CjIDiCcvoxbX5CbdYgI
T/P/DLU6EPqUH8sPxRS2wBHNPgkd4T3y87/a/hrDcQel6+xQCRU=
=L/nM
-----END PGP SIGNATURE-----

--lK/r+RGshAVR/Cbr--
