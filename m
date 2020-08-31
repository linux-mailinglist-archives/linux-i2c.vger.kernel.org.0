Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA6D257687
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 11:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgHaJbT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 05:31:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:34770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725960AbgHaJbQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Aug 2020 05:31:16 -0400
Received: from localhost (p5486cebe.dip0.t-ipconnect.de [84.134.206.190])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D0D5F206F0;
        Mon, 31 Aug 2020 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598866275;
        bh=ySH1+6Jh9ju1pBcBa/0k0ga+JwPla8k1WrClPUf5np8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vHClRnfo9ityhzCccYkxwWCz2GkVHT13yIVpkskiFJXqqRZUoN/1f1oR40GHaOavL
         0LdkkH6jRdCutfHdxwZg/pwLStkt4MOXuJhtlXimuNAJcxRdwavi2cKmFDAVEUAzaR
         3lGnw5cgeF6a82A2U+Ru/NAkeUYboJR4IrakiQzE=
Date:   Mon, 31 Aug 2020 11:31:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v6 1/6] i2c: Allow an ACPI driver to manage the device's
 power state during probe
Message-ID: <20200831093109.GA4632@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
References: <20200826115432.6103-1-sakari.ailus@linux.intel.com>
 <20200826115432.6103-2-sakari.ailus@linux.intel.com>
 <20200828083832.GE1343@ninjato>
 <20200831082305.GD31019@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <20200831082305.GD31019@paasikivi.fi.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> This patchset is really about changing the default of ACPI powering up I=
=C2=B2C
> devices. On OF the drivers are indeed responsible for that.

So, maybe it makes sense then to move from 'device_property_present()'
to 'acpi_dev_get_property()' or something alike? To clearly tell this
binding is expected to be used with ACPI only. Then, we can skip this
discussion now and postpone it to when someone wants to use it with DT.
Which is hopefully never. Or does this approach have drawbacks?

> My original series had a field in struct device_driver for this purpose b=
ut
> Greg K-H suggested moving it to I=C2=B2C instead:
>=20
> <URL:https://lore.kernel.org/linux-acpi/20190826084343.GA1095@kroah.com/>

Ok, we can still factor it out in the unlikely case it needs to be done
again.

I still have the question via which tree this should go upstream?
It is probably more I2C than ACPI?


--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9Mw1kACgkQFA3kzBSg
KbbvUg//ZGzzxNAg3XIfseLb3DTZeNc9KriLfOkTeI5xVft/KknFffM2O7EKtywl
W/QFoIAt2CeNwlc3Xn7Gr4H2//L0FFa4UZv9pjpIUSCo4h6PQpre24LpGSaj104h
IK4qLm2+1GqeA7OUQiXdjz9To98pw//VcJ0crCL3s+ymNiC2oTr/nwRAiRILmzrZ
lDYPrtjoeL1NPHw/SCMh6Ga3bOFTsG7pkiNeXgdAigf79hE5GqpDVZ+VxOAGb3Xv
WH0FKsHA47zBQGa8Hp+tf9FrCwtLN75GF1VuqqXrRxmHeFHOn/lHbg94d7NXkhZh
RrL9TTRa1SMRnxJjc3Gn8usXw3W/xIa+CMLjyC6oxqzMMRr20qrfxQLPMqmxlMnK
4+CC5cslBZNQm1xSeI3eqF92sTkViVxCFudNAfQwl1FlTGYciW5j57wRQT7qqGl9
aAvrPBc1IyK87N95Mse7Cw8B/sIlws36nPqG+xPdf8sSZv3RRgpB3XZ8t7jId5bl
IzEXhVmZo63xc/4TV5Wl85FVAbWjkJBNZN7C0rVfTDJ/Cvn9Mlzt7FPuOyMwPddf
zuWpnRFjUolq26i/kMQn2mUs9dhzFxvU4HZT+JdYmg1YaLWPHxd0m7QmhFcS1Ksc
Pp9XiT6UQd/LlOLMgO8gxhTiLUlf4Ssa2+Rcs6dFgMzIEG/FFqA=
=uxY3
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
