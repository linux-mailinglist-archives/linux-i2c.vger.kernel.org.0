Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42B71C0765
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Apr 2020 22:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgD3UHC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Apr 2020 16:07:02 -0400
Received: from sauhun.de ([88.99.104.3]:55464 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbgD3UHB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 30 Apr 2020 16:07:01 -0400
Received: from localhost (p5486CDDB.dip0.t-ipconnect.de [84.134.205.219])
        by pokefinder.org (Postfix) with ESMTPSA id 242652C08FC;
        Thu, 30 Apr 2020 22:07:00 +0200 (CEST)
Date:   Thu, 30 Apr 2020 22:06:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Elie Morisse <syniurge@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i2c-amd-mp2-pci: Fix Oops in amd_mp2_pci_init()
 error handling
Message-ID: <20200430200659.GA19155@ninjato>
References: <CAC_JBqofuyRiSmK0mFqVLaY=5k9MYmjGaVmggx2dn_YjN8VOmw@mail.gmail.com>
 <20190910134242.GA6620@mwanda>
 <20200430141050.GB3355@ninjato>
 <CAC_JBqo4x0KBdb3j3VFrZu5sG2Mfx3xpbDzFk68h3TU99ZVj3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <CAC_JBqo4x0KBdb3j3VFrZu5sG2Mfx3xpbDzFk68h3TU99ZVj3Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Yes I'm still here to review patches.

Glad to hear that :)


--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6rL98ACgkQFA3kzBSg
KbZhCg//QeNHhV9f1rXCvKq5Q0ePNMrFWiSk3HTktz1ULK5o8oRvjberyUM7azzd
estLO7Wy8q4pFrxmXFs2K3sY3xIB/JyjMKIHMcfvV0gdEb8QHVo5S7BVsbga7qKB
YRV6Pwk8Z0vbjGfxHjSUomY2x7NRbNJdOS0uMyBMPdG4yRUHo3KJ/ZA7iAeIVB87
/w7l9mWd6UcQNCdANxMGOhnd5WqdfDCuCAVqpKJ5qWe+G8yNo09VcgGSwKCOfait
nIuiiY2pDo9MxsvYRBlP3VqQiEQCcQEKZpLzbvC4hP7/GAqa1Jl4Uzwd5GsLCjPw
IjuX88WWb3Ls2s0G4WBUMCHAfhXw6PL6+aZ6JewGlR3jxOlsRKzpU2eTRlcYm45c
7MYmHW2V/cmYgqm67WvkP/P8EeqK5dEl3QZNF0k2g2cvjlFidImDKEOBIk8eFofw
RQhh7dEWYKds2E8kdF7gdZYt/OeMhgQiwGwINHZs91yHXn4tOtrGW2+rvQPoRQry
Iw0736Kz8Fhp0jxYAXaqAdsSkPnsZJib2ReE0Dd8hMwCFF4iTF2p1jRw6WR7YTrf
bocsIj5OAIkkQLIOliiPdp6JWLEDsoNNjyt5jCjkq+VD2XfVW5lUSOS/niYX/EX6
6ooQfkAHWTD+X5IlBLaweUV6q2smwT31j+xetgueb8pYCVnQXdw=
=g4f+
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
