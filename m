Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E903262E07
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 13:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729773AbgIILm0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 07:42:26 -0400
Received: from sauhun.de ([88.99.104.3]:48374 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726883AbgIILmO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Sep 2020 07:42:14 -0400
Received: from localhost (p54b33098.dip0.t-ipconnect.de [84.179.48.152])
        by pokefinder.org (Postfix) with ESMTPSA id 1B8B82C082B;
        Wed,  9 Sep 2020 13:11:22 +0200 (CEST)
Date:   Wed, 9 Sep 2020 13:11:21 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [PATCH v8 6/6] at24: Support probing while off
Message-ID: <20200909111121.GJ2272@ninjato>
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <20200903081550.6012-7-sakari.ailus@linux.intel.com>
 <CAMpxmJX40=iYYxL9Uvs1Pjj9c3NvZBGJ9Mh9-87T0c==FKEXRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9Q2l3mYpK16UQ/iv"
Content-Disposition: inline
In-Reply-To: <CAMpxmJX40=iYYxL9Uvs1Pjj9c3NvZBGJ9Mh9-87T0c==FKEXRw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9Q2l3mYpK16UQ/iv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This currently conflicts with the fix I queued for at24 for v5.9.
> Which tree is going to take this series?

I recall we agreed on I2C.


--9Q2l3mYpK16UQ/iv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9YuFUACgkQFA3kzBSg
KbbPiA//bLpenFByrgOHGcnTs15I5XOFV265XepqY1gAEtxBftW1cz1Z9VXYs3tR
p9RCBb+Lf6FcNah3nA4Nwksdl8SH/zWPJhWRTAcxgMx+s5PmfY4giXQyHblTNMtv
xYNxJFpmFN01TE/Vi0KXqelssyNBwj2cvbfoMKJiINbn9sE8V9s08AxLxBAsJmlK
qtKkuNzctQhbewUyVW5Z+S8MLuxYRSKibfGPEXFm9h6+NKhg50TCTRrhkVYPEzLe
kt2ZFU2TjxVnY4yxL8igM4vktC/Cgy359PlWCe2mFoY3Iz70fEDoXMrIq4V1cTeD
EyCqvjSRWeV8YTK0lPwJRQJQUbfYXrAiA9S+41Tch/NWVOpymBaMxeML9hbb33P4
rxTKygGQVwKZan61IKw3paOou8CA5RSiask/4okabdVz6UJ1qGDEpBiuEeRxL7u0
shdEHZBcT84zRHRQIpFc3z/LsgeXwxi2z0kwN2EBVt6NniuHCsvAzlEx1ZYMM2nY
ykM/uta6gLbzfbI8agotN8TDRME7Eipv/+//oDFyoRETxzAqnph1R8LpjNOhOGoS
8T/PHM4uB30sIA3JAE79S25txIPfNHvPUJeRIzud0Ec81R/m2WyOyyFUMAu5oVuz
2Dzx7FtHclH3HFkqz2bFTd+gw0eY1ZL1FuEPJXkfxBwe7HN/3lA=
=rCmE
-----END PGP SIGNATURE-----

--9Q2l3mYpK16UQ/iv--
