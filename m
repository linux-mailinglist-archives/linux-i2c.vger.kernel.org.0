Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7DA1A8657
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 18:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391311AbgDNQ4f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 12:56:35 -0400
Received: from sauhun.de ([88.99.104.3]:38822 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391192AbgDNQ42 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Apr 2020 12:56:28 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id EDCFE2C1F85;
        Tue, 14 Apr 2020 18:56:25 +0200 (CEST)
Date:   Tue, 14 Apr 2020 18:56:25 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, linus.walleij@linaro.org,
        patrice.chotard@st.com, info@metux.net, allison@lohutok.net,
        nehal-bakulchandra.shah@amd.com, tglx@linutronix.de,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: img-scb: remove duplicate dev_err()
Message-ID: <20200414165625.GB3708@kunai>
References: <20200414142650.29359-1-zhengdejin5@gmail.com>
 <20200414143837.GV34613@smile.fi.intel.com>
 <20200414155047.GA10848@nuc8i5>
 <20200414162002.GX34613@smile.fi.intel.com>
 <20200414164259.GA3708@kunai>
 <20200414164659.GY34613@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline
In-Reply-To: <20200414164659.GY34613@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > The patch is already in patchwork, so no need to resend from my side.
>=20
> Good to know how you handle the (orphaned?) ones.

Kind of. Those are set to "odd fixes" in MAINTAINERS.

Having per-driver maintainers worked quite good so far, so I keep asking
whenever I see potential candidates.


--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6V6zkACgkQFA3kzBSg
KbafbQ//R4THOv9ZbkYpsBldHJMDKz0aBrMenyfbdTS9mBrahbG4HWbd7SRG+ZOi
Gn2nitt7fhfoPOpDqpMCpEGjewiub6AD+lkbrYqo34tGxheLkyjoUKy63E61ffBS
UJ0MQ/51WaiudXOeGzlyX+bprihgHmSm7gdHz0wG35hVci4GwUvX/PkCMCQCXuhf
rs11MJZNTChNlgSV7g8h3vymOiyULnnK+q1W1PbWkjgBPemcfQ3pYCW0NXh9vUjq
YlVHUPrbXJ/E1ZRq/85z7cm7/1KTs6273W0L8iLKQQFljVZf5nckhbA9QtnH+oRG
O0aAg7e48wd+Jy/7yj5vgUsBz9qg1KnS/qV256rIBlCtY4c4rfKh2dJEmYTmITgn
sGdU6F9gI+fgCbE0RBLnDICSGD3f2HnJioKwpHoGt7LmBbiHsV3XRHHabMVoiAs9
us5J1615Xzg+9M4/51IS35Cxyl2WWGIuTcIZhuGZoWPvGIAvuuEDgXt/+4AzCPrN
5bOGTSXUg+1Z2uzIrWAWodjLhn+BCDQGxjFauqYtUW256zhCgjtUX5A/2yA0Q8RO
OJGvAieOmmL8xsaS2l2CMcIuSGD513wzc6I6OSYE9QUgKSszU5rlrfqBV/UiqOAX
/2XsSBAfgfzbPI7xBfpxNDSP+bDd/g7fz5xbE/fTOS4WV/t6hH0=
=Or44
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--
