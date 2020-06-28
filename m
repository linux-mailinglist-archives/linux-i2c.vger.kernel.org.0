Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B8220C977
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jun 2020 20:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgF1SUW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Jun 2020 14:20:22 -0400
Received: from sauhun.de ([88.99.104.3]:34542 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726060AbgF1SUV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 28 Jun 2020 14:20:21 -0400
Received: from localhost (p54b335b3.dip0.t-ipconnect.de [84.179.53.179])
        by pokefinder.org (Postfix) with ESMTPSA id 543AA2C0095;
        Sun, 28 Jun 2020 20:20:19 +0200 (CEST)
Date:   Sun, 28 Jun 2020 20:20:15 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: core: check returned size of emulated smbus block
 read
Message-ID: <20200628182015.GA1274@ninjato>
References: <20200613104109.2989-1-mans@mansr.com>
 <20200626082208.GA4559@kunai>
 <yw1x1rm2vtml.fsf@mansr.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
In-Reply-To: <yw1x1rm2vtml.fsf@mansr.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I saw it with the mv64xxx (Allwinner) and omap (Beaglebone) drivers.
> From a quick look, it seems like quite a few others have the same
> problem.

Okay, well, to be fair, both drivers don't advertise
I2C_SMBUS_BLOCK_DATA. The client driver should check for that. Anyhow,
it makes sense to have your additional check in the core as fallback
safety.


--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7431sACgkQFA3kzBSg
KbZ8lhAAsFt5LNhF1SI2Icc//SnkzxmhFirxO/4jucUpvTQqt+jMRK5oCskj7Cdp
p2SKK6JqCA5zNSWVy/rNV/GDyIPy90qjuaxn0jgWii8O+HQj1FI07aOIGoLvix1r
aZaKala71kODJQR/0mp8qnw4gSHfyCilvZWfCtDVR6TLHWVyN24EIES1KsZgtXe6
CVFIbcaKUgz9pTDzy6teTX81/FJWAcW8ifhYKiFOKgz0WR/tJThZ6wEwXbEQoPGR
fBGyczzw8Q5cKCBy38+i2bTOotWwN1wfMkpJktNb/yG/uj65eOPv/qlh3pgEe+Hc
RLWCtgHaNN1QcI0jnUTaiI+poDvWGA3I4SAjVVDO5uoQKTO2S11SE6F1FDVXQaXS
DD22nOWTPpSb4NA/asaxk4ZM7v9k0Ugayp3IWBHqb+BF9xKKhhfoXzWH3MO3fTBn
+7WBZmynlmI8S5F1+7jtd+1FBPW5/BDhWq+JeVKVpyIFJ+hWIS9wTDWJjSR1DhVv
m8QWu1HJAiYWrMzQyDEUg/Y1CNdwlyQH7/o4cyN4rTJ0r4/K8KTeD7vYxcSvaHcY
gUrXesYmtMyrnxu5ch3cdOFqSmM3sD8++1/czqo4DGYzp+UbAuHX24FdQZ7dwuT1
eqIryR6y5iUmh0RDBc/i2cvoO63uRrNnuU5+yTqYrz74IVPfSp4=
=oRHU
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
