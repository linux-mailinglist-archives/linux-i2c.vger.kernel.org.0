Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E69275211
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 09:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgIWHCA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 03:02:00 -0400
Received: from sauhun.de ([88.99.104.3]:46058 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726557AbgIWHCA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Sep 2020 03:02:00 -0400
Received: from localhost (p54b330c5.dip0.t-ipconnect.de [84.179.48.197])
        by pokefinder.org (Postfix) with ESMTPSA id E1ED82C08C5;
        Wed, 23 Sep 2020 09:01:57 +0200 (CEST)
Date:   Wed, 23 Sep 2020 09:01:53 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 00/32] Improvements for Tegra I2C driver
Message-ID: <20200923070153.GA2548@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200922225155.10798-1-digetx@gmail.com>
 <aee6c548-241d-2cc5-415e-9f0b60177d67@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <aee6c548-241d-2cc5-415e-9f0b60177d67@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Ahh, I missed to add Andy's r-b to all patches.
>=20
> Hope it's okay if I'll add it here like this:
>=20
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Yes, it is. So, I ideally we get an ack on patch 12 and are good to go,
I'd think?

Thanks again, everyone!


--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9q8t0ACgkQFA3kzBSg
KbZsfBAAm6Gyo2KOrDJeVmhK3iKRJRfceus8uSx0IKSS3+BiYoUIROhLQRHmvt0N
sNrN1kxdCiciTSW7B9O7Aj/6hr+VRHoMqyUacadY5JVcfy1174KzDRBgnLoGxiVG
AVXcirk4fRCHK8Shmde7K4xbKwu3yXfUXBb68qQUkaE+7MidCbgx6tEKNXB7vLqC
YDX9IUa623QRn6mD7LztGkCMcpTYnO2t0b/LUrRnD+FuZicLHVuPjvzVwBS7Xnm6
R3YQ3oV9DoCGR5rktSTiuAWFXbNe36Ez7IIt33ojFoVnNSDv2VbNIG9ZNQ2TXfyX
PiSL6qcdb1YijHGj8LFkK/+s17Y/SWj36QjK1km3NhV9vPFyNF4p4oWaWP9LhQQ6
zao6kNj381eB+AoKLPCTNAaB4CGQYqsnHfdVg/MV6lrkpo4j7XI2mkQkGZrwaYsE
bh/xjvGdzJvEES9NQsBDMLmAs0VgVi/i+YREWJQ+yCeMqlY9zdUHIIUYi22Rp2Iz
vg2R7JQROVL/aoJY9FZoc+6zy1qF52mBJQ1rqLu/p2g2dT3s8F5Zkx1badEMl99t
9DxV40E4fQM8Bd7JvwBKz9wxyqnqQyuAE81gpdqbcq2Wa+1S5oMBQxRp0JsGNX20
gU/glltdHk3icHUvhdkuAU71SOantTTOxPMruBMwreUXN3xrmTg=
=FeEV
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
