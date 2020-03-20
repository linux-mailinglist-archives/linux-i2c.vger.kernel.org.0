Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1106A18D674
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 19:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgCTSB6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 14:01:58 -0400
Received: from sauhun.de ([88.99.104.3]:50864 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727129AbgCTSB5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 20 Mar 2020 14:01:57 -0400
Received: from localhost (p54B33339.dip0.t-ipconnect.de [84.179.51.57])
        by pokefinder.org (Postfix) with ESMTPSA id 264CA2C08E7;
        Fri, 20 Mar 2020 19:01:56 +0100 (CET)
Date:   Fri, 20 Mar 2020 19:01:50 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kevin Hao <haokexin@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: dev: Fix the race between the release of i2c_dev
 and cdev
Message-ID: <20200320180150.GF1282@ninjato>
References: <20191011150014.28177-1-haokexin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ni93GHxFvA+th69W"
Content-Disposition: inline
In-Reply-To: <20191011150014.28177-1-haokexin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ni93GHxFvA+th69W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kevin,

I am very sorry for not making it for 5.6. I work on it now to make it
go into v5.7.

> entirely released. We can easily get the following call trace with
> CONFIG_DEBUG_KOBJECT_RELEASE and CONFIG_DEBUG_OBJECTS_TIMERS enabled.

I didn't get this trace on my ARM32 board (Renesas Lager). Anything more
I need to do besides activating those options and using i2c-dev?

> +#include <linux/cdev.h>

This line is not needed. We include this already.

Other than that, the patch looks good. Although I trust you, I like to
verify the test results.

Kind regards,

   Wolfram


--ni93GHxFvA+th69W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl51BQoACgkQFA3kzBSg
KbZkJg/9FxZThbUyX0dWhpWH06gnu7rRa+vamxAdH3GE6c9RfdSzy5mJFx2RusMo
dIPcHtf0enptZp4e2jJs7HU21P/U9HoiNepkP/Wi03M4aYU/u9VU08UVngHLNHeI
L6k6A7XCrylQb76Xu5YqvOB4I+pZSxwaxWh/j+YoP4UorBUjuEsgALlFoPr211jr
9bOTX57IbOsuIPZ05C0+L7rb0AETJ8KX/4lE3PwmX7j9L5KCT02cH0WA/qr2frvx
7AcKzdTCwqV4wlPDoD8cL7Jy35fFjamhjDnRo6gWl0mkKOXiUdABV37UKlxcZqd/
pvxxzkHF6OTcTbg89UbW04WdoDgCRi/NZB5+Pzmh/5fHDyMw7ReB7nhBJjUXmEll
+vg0Q+ZCfxmY6c9oVhxWlC/b2ASMVwWtXFtvIH+DklCK1nreV6iYlHnClRBgy2tK
iSDHM6ls01WDMOM97MvjK4R+9xAbTESucC5EfoEYGDGQrgQtuCxUs14kssSqoPCt
qlnCS8crnB40CEaqjhDraIkZKfhB3b/nYoLeIlFyMmDheM2Qr/4z6kbiwmp/W9zC
/nd31b28UVgP5kfhLxKMcRSLIHaKSaDS3m+Wxg2XghUwC1pigh4p3wy9zffD9Gu2
5fa6xAS1vroju6yev0gl/sEID7mx+tdkDW5mhn+XsZEjWzojcNY=
=GJpq
-----END PGP SIGNATURE-----

--ni93GHxFvA+th69W--
