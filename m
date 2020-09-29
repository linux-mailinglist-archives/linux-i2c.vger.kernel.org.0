Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8F627DA88
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Sep 2020 23:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728737AbgI2VrC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 17:47:02 -0400
Received: from sauhun.de ([88.99.104.3]:34540 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728658AbgI2Vq6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Sep 2020 17:46:58 -0400
Received: from localhost (p54b3311a.dip0.t-ipconnect.de [84.179.49.26])
        by pokefinder.org (Postfix) with ESMTPSA id C8D3C2C052F;
        Tue, 29 Sep 2020 23:46:55 +0200 (CEST)
Date:   Tue, 29 Sep 2020 23:46:55 +0200
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
Message-ID: <20200929214655.GF2010@kunai>
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
 <20200929193322.GA2010@kunai>
 <fc8704c2-85bc-98ce-4765-c28ce8ac6be9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Content-Disposition: inline
In-Reply-To: <fc8704c2-85bc-98ce-4765-c28ce8ac6be9@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Any comments here? I'll apply this series later this week if there are
> > no objections coming up.
> >=20
>=20
> Please hold on, I just spotted a serious problem in patch 23 and v9
> needs to be done.

Ok, thanks for the heads up. An ack for this patch would still be nice
:)


--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9zq0sACgkQFA3kzBSg
KbazJw//dor6zAvqnnJ4/3TpkwOQ73x4ZMaKkfzVRNGdig+/GuccXdwW0I0y7bmk
Z6iye4ww67F2yD8sCdg315MDOOV5b40P7vs7zsvX+1EeM7qfZ5yP/OMIloRDIYo3
AIBUX84PWUs598DPJhCcfMenF78c78W/eiNznMUFCrA1dW93B0viYR8CUs3R90sc
mEJAS6IpRej7Hklp8ySh6eqouLrkB/1fptKNjbfVGE9SJ0kFztBte4sBr6GMiRpQ
MPeKh6vd5JDuPupibXSslv5kX48TU06f5b3b+P9llk+BGHpDWc9ZYe5QRL2ThZPd
A6ifxvhJ9FrL1/gQeeVDfsUVV7n4///byG3YngN/Wgr+qx6dLzHRfT/g6J18Cuo5
wh3kS6jyB8d44d/MQYcSIPszRrui+IYvzlCItL1VbCbjP61McM55f5MtHCh9034Y
ZfsT3pNioGTbI6pN/jifPnVca8tgXGhJKLRnJX+fXKTwSUu+CRph+KVDOj2yIDAM
NbuecEZQlpTs/RskP33BinTCzJomBhP4ygDpKhhJUPm4N/UwntB8TQOlDp7mSSFf
GhZEG+qxNVq9ei4oJTngeuXdBeEL6h0W+whXY5rX9HxvGAC+a/Q+QXodp2YZkTmc
FWg6L2P1L0LwjuBu2amLOF1+mAXQfBpSKH2Ad3anDr9zgau6HRA=
=NThJ
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--
