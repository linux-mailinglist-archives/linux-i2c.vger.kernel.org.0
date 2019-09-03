Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 390A7A62A6
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 09:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbfICHhX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 03:37:23 -0400
Received: from sauhun.de ([88.99.104.3]:49762 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725895AbfICHhW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 03:37:22 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id 7167C2C4F2F;
        Tue,  3 Sep 2019 09:37:20 +0200 (CEST)
Date:   Tue, 3 Sep 2019 09:37:20 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     jacopo mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [RFC,v2 2/6] i2c: add I2C Address Translator (ATR) support
Message-ID: <20190903073719.GA1020@kunai>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-3-luca@lucaceresoli.net>
 <20190901143101.humomdehy5ee73sk@vino>
 <20bac324-c4d3-270c-5175-0a7f261fd760@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <20bac324-c4d3-270c-5175-0a7f261fd760@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Adding the ATR features to i2c-mux.c was very tricky and error-prone due
> to all of this code, that's why I have moved ATR to its own file in RFCv2.

I forgot to say that I like this.


--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1uGCoACgkQFA3kzBSg
KbZidw/9EM+Hx6X3hquMtRxGgJV6HJWi8UYyPYgFrwAIYCAt7gtjHWnk1cNizf98
4DSVtoi6zpMeLx4zM76DZ3P2nnDSDNQ+QwJRYRIoWLs3yWkZ56EPQvCxcc4lhNRW
+XDgzFLnoVnkn4PJlAjztG7xcVm0u9XfM+8Ion0U9A9E7wIR1ml3XwctccOL0Zd7
VW2zR+nzhEEH9iV/bCKeKTQXg75YgHyIIUlJm48FuP1mA5uWMqtX9hf5h6ctRZK4
AYcxw1uLOICIBmbW5WaTOHq0xd3TaE4R0+lI9fcODckq7CVFijl1/odDsmgy/ISU
24A0v/ulqd6b8XMXq3DyU3hyFmbwbJjWitI0nYQKdpCvF9hNFJ5KR++ko/P2I4s8
inR7erFYYab2RSo0VKsZLgB4t45jmbQmCQtwKjla9uDcz2lHgG5/JzumGaPYdDEa
DdQZOM8vz1GxM/3Yf2sCNkE2WJ5S0dT8PvrtsIhkn4Sqd9WiGPDiyjpK9mhdU1ap
H9aXNKDRl+t4/x0zRe1K1gCydQzRsmLByXzAbs/sq+aKtUHl/obBKt9j6XFHMStG
hOdIT2mQCys07yZpSK/LApFds0PbYBIB8XQjEsXIzGbSwau0BUJl3Ezwn7seZeer
1SKdzmZlqUCJTeGdvjz6ef8RWeFRKrtl4srdu6ApbgvYAxGvcVk=
=RqGE
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
