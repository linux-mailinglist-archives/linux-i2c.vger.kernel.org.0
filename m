Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCEB11F9702
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 14:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgFOMsj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 08:48:39 -0400
Received: from sauhun.de ([88.99.104.3]:37704 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729845AbgFOMsj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 08:48:39 -0400
Received: from localhost (p54b333b6.dip0.t-ipconnect.de [84.179.51.182])
        by pokefinder.org (Postfix) with ESMTPSA id 7D2542C204E;
        Mon, 15 Jun 2020 14:48:37 +0200 (CEST)
Date:   Mon, 15 Jun 2020 14:48:34 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: sh_mobile: implement atomic transfers
Message-ID: <20200615124834.GB4423@kunai>
References: <1591817591-852-1-git-send-email-uli+renesas@fpond.eu>
 <20200614093131.GD2878@kunai>
 <CAMuHMdWA82HpLAjYBK0fHm=wTM3LGjKn_c9KRH1EZTi8UznrBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWA82HpLAjYBK0fHm=wTM3LGjKn_c9KRH1EZTi8UznrBw@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Uli: can you check if atomic transfers work with the touchscreen or
> codec on Armadillo-800-EVA?

Atmoic transfers are used for very late communication (e.g. PMIC).
Touchscreens and codecs should be already down, then.


--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7nbiIACgkQFA3kzBSg
KbYQOBAAmjhxU61zMae1DNVnWB3DuT7Zx+VIsJvm4hwWPC7+0wsJ+Zx2tUaXB0Tv
vTCrbysxfM0c/H86cDGErSqM4Yyv283PV/8lVjqNmqexLlnQtJtq/RdAS4edSn0R
z7oTtz8pPAMiKJUJqz5aahxEKf+Hn44pcP5XFCPBjwPeshNYwsuQXKOBoy7EYba3
invK4pxIYPBzrNrE6Qze039/xlrN1C/ratIBEj7MMqYPtzlRQiaQ1v9Oy/Pvn99I
CnKcprmBGQTbuVeNAvAJmP2fgfEu1fIiXxjgpdJNnFgaxxqVJxOG60hJ9T+taCfR
w/klJgh9S3w58g6RMyL0cMXJ0jwzSoHfZkJX5ONbTm55KHpRBiPFUPxUmd2ZRndG
IKDnDEY4StN9L6MGqDjOBpX4KzbhOHv52vajBqRhselo8V81xK/5TmoM9WVzzcSm
v7aUIbGfiCgOHtiy0Q44kbWd7LZrl9x9XUaZRZH7oxPoTouYHi7PffPFnju55qL1
zrcqzIWGt/YqJr5knb/AFE2PjxjSbQ56AR89zLyM9VfE1XYOM9+tTvy8GpWGmKG9
HrU681Xz3pgAdEcT9Cw67UJxZaCtvP1XhE+7Yi3ndNe/GIbbp5XuPQ8/yyOrEj+V
ifEcmf3Rl+XyTk9xuJgQg9hBO8TrwJ4VPNZdI4qcy07LSaWgtIE=
=krKW
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
