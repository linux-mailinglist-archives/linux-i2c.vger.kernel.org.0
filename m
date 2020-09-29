Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9690D27D6FA
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Sep 2020 21:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728563AbgI2Td2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 15:33:28 -0400
Received: from sauhun.de ([88.99.104.3]:33568 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728264AbgI2Td2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Sep 2020 15:33:28 -0400
Received: from localhost (p54b3311a.dip0.t-ipconnect.de [84.179.49.26])
        by pokefinder.org (Postfix) with ESMTPSA id 9B7262C052F;
        Tue, 29 Sep 2020 21:33:25 +0200 (CEST)
Date:   Tue, 29 Sep 2020 21:33:22 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 12/32] i2c: tegra: Use clk-bulk helpers
Message-ID: <20200929193322.GA2010@kunai>
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
 <20200922225155.10798-13-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <20200922225155.10798-13-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 01:51:35AM +0300, Dmitry Osipenko wrote:
> Use clk-bulk helpers and factor out clocks initialization into separate
> function in order to make code cleaner.
>=20
> The clocks initialization now performed after reset-control initialization
> in order to avoid a noisy -PROBE_DEFER errors on T186+ from the clk-bulk
> helper which doesn't silence this error code. Hence reset_control_get()
> now may return -EPROBE_DEFER on newer Tegra SoCs because they use BPMP
> driver that provides reset controls and BPMP doesn't come up early during
> boot. Previously rst was protected by the clocks retrieval and now this
> patch makes dev_err_probe() to be used for the rst error handling.
>=20
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Any comments here? I'll apply this series later this week if there are
no objections coming up.


--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9zi/4ACgkQFA3kzBSg
Kbbrlg//YXTGTLSh+tvodavHHfG4QdBSrq225fyLdzaZuhg0R283mmfYqjBpQrOZ
Sp86TDz632mnmwoTagZiM2Ex6uCqkD0/qy0rsfV5xTC85cSHM0SrOrQFFBGWygeM
ip0iYNAV79J12xO3dUwIsgcQEBKO/ocHXrmbiMuqBOR0DG+ACv086oE4ouslVDgw
c+xmsvkQoRP2KTU5jWqAov8jah6dNmvjZ1tXoiIK6jJX58W+pBqzawtxciuiA8FW
c25IhcxOmJ0LHbwv696Mx6R1E9Bt8pvVaPTM2NyqNLegGmsSYONlogNYtkTxZqZU
ig5oR+eH2d1PD36vC3brG9GLoaPkGMz3p4s0kyaLDsju93Nyc0zBWOxWyXfQ//HQ
x2cuVmFPFFrkffEgmbH/f1/0VdVh6eOXgsLZ2gYB45kfh9fll8NQq6y/7XTqnwYw
hq4Yxi4FJdvdtlYvZOsseY5mWfQgFngfD+gllSEhQzMt4ydsaEFs8FDyYS/Sb734
ACGDjXVA+CTD1C28EtcVlMCCRJGx+7sSMgZZ+PGs9KR9qr4bkEH4KUyU+gZkFDkH
/bLXZ7AOeO4X9jDuzUXgGRN11e3rcKx8r8ZKzf1D8DK3ZOBgBlwhg+TZP3qDpUkR
z/zxnoGWovxFNAQ6RXWfRJmwBN7Cvts/eZwKc2Cax1MMU8rhv+g=
=VwmE
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
