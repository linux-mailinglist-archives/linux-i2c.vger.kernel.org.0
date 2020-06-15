Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 361A01F970A
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 14:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgFOMuR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 08:50:17 -0400
Received: from sauhun.de ([88.99.104.3]:37754 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728285AbgFOMuR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 08:50:17 -0400
Received: from localhost (p54b333b6.dip0.t-ipconnect.de [84.179.51.182])
        by pokefinder.org (Postfix) with ESMTPSA id 146402C1F6B;
        Mon, 15 Jun 2020 14:50:16 +0200 (CEST)
Date:   Mon, 15 Jun 2020 14:50:15 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: sh_mobile: implement atomic transfers
Message-ID: <20200615125015.GC4423@kunai>
References: <1591817591-852-1-git-send-email-uli+renesas@fpond.eu>
 <CAMuHMdW=WfGNtKo6y1RFPydFeQ-UqFq4ixOTqQzuW7x3oGmHjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8X7/QrJGcKSMr1RN"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW=WfGNtKo6y1RFPydFeQ-UqFq4ixOTqQzuW7x3oGmHjA@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> After removing the first hunk, this works fine on r8a7791/koelsch.

Removing the first hunk? This one?

+       bool atomic_xfer;


--8X7/QrJGcKSMr1RN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7nbocACgkQFA3kzBSg
KbaGoxAAlVLz2q06U7zPDYAXqylJiMuwt0xcYXVTzy2suOF6SOVd3hUuck/E7Bij
uBuwrgKX3Y7SOFmGGscaKUgrWrGZy6BpdnZHSiagF8SMq2RW+WvT/flH3Oz+nIpI
97VGyq4GFOmmo2TdhjywLKkMDZEUQxjA25cxO7lsdIxUukiS0afbpf3Yf9goGzrn
k04Vn2xO3vocW7HhUlGPfhebVtNMINXlJoJuAk/MVXiIQv4NPyOjqYE2hJlSzAor
Qt6O3a6vG14EgmZVxWIgqwRVmsqkC+sKPj2E483GvYhevdt56XVUkNLh9/jrLBlT
9ZOPPZU9Rv62FI9qQZeycLVkBvA8MZBvwHu8cX7BY9k7GdoEJfHM0r+KTejaKBOG
Fyw087TskigFR8R+Ji9APqq1OVCcjkwUbecyJ+gzGtEuz8DURL0QsypE6iUf3Ylj
MrzFPCkKtrD+sSY5jFdBLw4cYH8QEUMf5jc3OrmK63k9nranBGOyIzFIItTVBuEx
iL5g7+KRapRehOysTPUKrLGdKe+fBxfuwVuF2ZdxH6uJeUNkp+MTxEefr7Tvl577
f4WTHTb42fSnSKYDm6J4shfyuhe0SszteuHqSd1R2KfWhW/6bvJSEODAPnPbJRKr
w5w0baArdinMDGtn+VhKT6YWGfnj4yW8WRolq/fE/H2NKd9eKkk=
=Vqht
-----END PGP SIGNATURE-----

--8X7/QrJGcKSMr1RN--
