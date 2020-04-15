Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280871A955D
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 10:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393761AbgDOH7l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 03:59:41 -0400
Received: from sauhun.de ([88.99.104.3]:48470 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390630AbgDOH7S (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 03:59:18 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id DD7442C1F58;
        Wed, 15 Apr 2020 09:59:14 +0200 (CEST)
Date:   Wed, 15 Apr 2020 09:59:11 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH v2 2/6] i2c: allow DT nodes without 'compatible'
Message-ID: <20200415075911.GA1141@ninjato>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
 <11ca7487-ac07-f714-8573-20d1a0040212@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <11ca7487-ac07-f714-8573-20d1a0040212@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> As I said in the reply to v1, I think we should reserve addresses also
> when there is a compatible string but no matching driver, but this is
> another story and can be handled separately.

Unless I misunderstand you, I think they do already. Note that
only 'i2cdetect' shows a device as busy *IFF* there is a driver bound to
it. The internal 'i2c_check_addr_busy' does not care about a driver
being bound. You can check this by trying to use
i2c_new_ancillary_device() with an address which is already described in
DT but which driver is disabled.


--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6WvssACgkQFA3kzBSg
KbYQ8hAAruiFHx6/xDYq9vD1D8WLWFXqoxuwD4NbJPlRSuzJvimBjPE7ynrPH4Ga
S96O5ehETCXYz2yXLQmo1cwCbnIRo8W9kl+H/knosYOOdBd5jFpKNd7Z3+R2ldHL
jr7z0qYXDcN+ErsIKUL4jJpmcSQL26GrNSmUFbadRvcsGDTq19Qwc+mhNx90oDyh
xxb3RZs1cZWdkc+PygDNWwbh0dvbMHL0LBl6smJxf0z4wyVEx3YWxB4Rzfb4wVo6
HRr1Ubdz1sSGhxyJoZ1PZqQy7lrpg+vLNv+sYG5nrdPsX5KTXlKBXowdWHeSFlXv
nZ2DtsHzwSzE2LaeY9HmlV9iZEFGD/21NQ+u5B5wxcV5EbPyPHeOLUXp2t+6gOLC
TT5vjxshNUPKBYBC/XrPIPC8P08Ajp6+gzckYqLY2/E+Nzmv8akKSNq4+idrw+59
+Gj89nHXXzqSPMDUJ3XfMgLTQcRVNW46H+f6Ix+xwj/JuV1uR0XWELnn/cfH+Q7V
rAuCawvjljjh/h9KfcHAbzpfCSkxXR4dYdKQGD8YeVCrQFvC5IMrZ/cwqF6W0Jj1
xJ5lngRYJsdqRc0Y2/rLpAae8UT54bzPbn4KFNCZ9LHx2Qx0dStIFhG+k927OlZe
6cDCHUXGwC4ypb0pJdeSxD8Y3rRe7GbHfawZkLzzl8z3OjQ3K54=
=LEQy
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
