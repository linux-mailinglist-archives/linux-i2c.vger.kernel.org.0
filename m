Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 688DE132B46
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 17:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbgAGQpi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 11:45:38 -0500
Received: from sauhun.de ([88.99.104.3]:52638 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727559AbgAGQpi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 11:45:38 -0500
Received: from localhost (p5486CF8B.dip0.t-ipconnect.de [84.134.207.139])
        by pokefinder.org (Postfix) with ESMTPSA id CFA6A2C05BA;
        Tue,  7 Jan 2020 17:45:35 +0100 (CET)
Date:   Tue, 7 Jan 2020 17:45:35 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 1/5] i2c: core: refactor scanning for a client
Message-ID: <20200107164535.GA5309@ninjato>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-2-wsa+renesas@sang-engineering.com>
 <bf17ebe6-550e-dcd2-c5c4-ff669519ef79@bingham.xyz>
 <CAMuHMdXVxeF0bCV8tNMr_0D-HudXBMXycs=LXCxJX=wKzjQZgw@mail.gmail.com>
 <20200107102557.GA1135@ninjato>
 <CAMuHMdWM0PoqLuAP2qjCjejNQ8FaArnkAT0gnd96xp3yJKLE-A@mail.gmail.com>
 <20200107112311.GC1135@ninjato>
 <a6a85a80-309b-16a5-99cd-e14e70ead5f9@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <a6a85a80-309b-16a5-99cd-e14e70ead5f9@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Maybe dev_warn() +  dump_stack()?

That would technically work, yet it feels like a bit like we now
open-code WARN because we shall not use it. I will ask gkh about his
statement...


--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4UtasACgkQFA3kzBSg
KbZOdA/9FHE/4MZPPLC4HHR5RDlLtpIjsEZOtvki457I0+gD5uszprs03FUspBKb
j3PuAJd38X2GFnXjGjIyPPUnV0x1CxZVK+4BBDxetvekVnneC2huddX/QJu98c9q
yT1jBQ2AWjk+/q1FDhx+aJdTIY7FN/0rftF2tgPvXT5v6aHFCU2Mfy0VFZ4Ftyu/
RRngmVo0WevG8ElrNwqB7xJGSUljPuXM9UbpkHUFEGtIpAfIjhNmcyUB0MBDMef7
91zHsvy20Hrxd/3w0GzkznhX8YzJBrMZEgCtcBq+KQBSa6HsXjQkBroiv8PkHg/3
Wy3E1UexFUj8U7HN/A/Sfzn+jFAmWhUTot2Vaq93Toh9rXh63EiEDXvkuXdR1SlF
qdMkbGVv7grTdM8wAs74q9Xr6vpLkZY0cgDll5wypZsJpMY53KE80jQWtAV8ZK1f
7HTo7BckbwIwes2FglIv9qAXr5Z5ioomJXfzN3a8vKHKcA4NeGoTfVsMyeyTIYRw
9S+tAhGdQA71+vRmsxclK8W1v69cziNpGLddJmjkELwTw4iXMQnbPqmRAqDXdhDY
Zf0muWSSp0PXjUpxH3i/Fzg2LY+h0sxChdgtw/O+VXqJ/hxmX7+4w1sXcewsyRdI
QIsmVAxPxYkW21x02FbMFGOl1YDACrJTtbC38c9Kk7hX+qytEL8=
=vwlV
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
