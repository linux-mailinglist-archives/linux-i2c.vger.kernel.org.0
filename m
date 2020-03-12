Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E97A182EF7
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Mar 2020 12:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgCLLVj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Mar 2020 07:21:39 -0400
Received: from sauhun.de ([88.99.104.3]:41300 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbgCLLVj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 12 Mar 2020 07:21:39 -0400
Received: from localhost (p54B331A0.dip0.t-ipconnect.de [84.179.49.160])
        by pokefinder.org (Postfix) with ESMTPSA id AB7A02C1ECC;
        Thu, 12 Mar 2020 12:21:36 +0100 (CET)
Date:   Thu, 12 Mar 2020 12:21:36 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH 7/7] i2c: core: hand over reserved devices when
 requesting ancillary addresses
Message-ID: <20200312112136.GC1013@ninjato>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-8-wsa+renesas@sang-engineering.com>
 <CAMuHMdV-dfjukuSKiFg4vb4Ntn+XWU0XwHPxyoaWs1vtQVg4cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV-dfjukuSKiFg4vb4Ntn+XWU0XwHPxyoaWs1vtQVg4cw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> (perhaps i2c_verify_client() checking dev was not such a great idea, as
>  callers need to act on dev && !verified anyway?)

Can be argued. I will have a second thought about it.


--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5qG0AACgkQFA3kzBSg
KbZ1pw//a08b5SMNFzv8kd0sP91WzfI8fKmIuGx/frUmdIaZ30e5cNuotjUL02ek
Tswmx+2eMxogD6/Q+N7jNbwFh/YghCpxY/hthdc9XKcwJBtCxzSgZzDyFo65aZ2d
ZmMR1Yfh3O/bk3fzSU9HcRn9MiBksaPnPNOCQMXhu2BWc1ugDJiM4c8bSiGeqqVd
4EMjxl+M8x4VvSRv26qwerrjyXWEU7rW0+NoBL704qgIKfgecOARCf8/2L96vX9A
14U8VtRE6E8z07EvyQHdT+9S/Er0daYI+tb2iAP0S496Zaar/PBeaC8xoSXY1SKK
lSXlthO8tgycRkyoZuYaai91+KPRq1WpYRPaHqkeVOmGzWR2INk7Ne8v/CRwL9f/
hUhnMfylrIAE5F1/QRA67HrzFy/yX7bC918wCTk2hrmA8wWkkkn9e2Ab9ToXu9S+
7rysp5gE82jgf2w/PqPhtkLbhtvcll3K9r9xBb0Mo11saIjk5UskUX4N45RpoIVx
5Wptct5MKdnEUv2gAj4oNWJ4mvlQOgqfY+KWjjl4usR9KfYfbknhGSPxp4WNqXPX
KrYPDcWnfFpHqHWPdOrbLd0aTpdxHMyswcj20jkmHPUDs1jnhroa8au5yiG67qEK
mO2Q2Cvik/4H4A3HL1DuT64wnt5Ev9m35rYC1tYc14+WKkDBarw=
=8zo1
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
