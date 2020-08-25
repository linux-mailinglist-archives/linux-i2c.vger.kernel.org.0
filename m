Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEBA3251A2C
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 15:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgHYNvT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 09:51:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:38588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725926AbgHYNvS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 09:51:18 -0400
Received: from localhost (p54b33ab6.dip0.t-ipconnect.de [84.179.58.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FC0920738;
        Tue, 25 Aug 2020 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598363478;
        bh=eIq1K4YwKevM0Z+xrupyI1e4rDXhwcMQbYLXwiGI9/k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c/nEA1x+7z5tdSDCHfM2LAtZREXzJ6s4HkGFN6S67BQdim72iZxz/GpoalDTz3RwP
         /j2Xzj35IPHY1BTNwALSCQWqDUO384Y8Jjs50Goj8hZJ2OfihVB+iKk1N/B+vIdClc
         amqwfY1JgAc6wOJPiKHGo+g48C6r7/OieN3ZJsNc=
Date:   Tue, 25 Aug 2020 15:51:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Frank Lee <tiny.windzz@gmail.com>,
        Frank Lee <frank@allwinnertech.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, gregory.clement@bootlin.com,
        Thomas Gleixner <tglx@linutronix.de>, jason@lakedaemon.net,
        Marc Zyngier <maz@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        "p.zabel" <p.zabel@pengutronix.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        clabbe@baylibre.com, bage@linutronix.de,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, linux-i2c@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v5 00/16] Allwinner A100 Initial support
Message-ID: <20200825135113.GB1753@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>, Lee Jones <lee.jones@linaro.org>,
        Frank Lee <tiny.windzz@gmail.com>,
        Frank Lee <frank@allwinnertech.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, gregory.clement@bootlin.com,
        Thomas Gleixner <tglx@linutronix.de>, jason@lakedaemon.net,
        Marc Zyngier <maz@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        "p.zabel" <p.zabel@pengutronix.de>, Icenowy Zheng <icenowy@aosc.io>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        clabbe@baylibre.com, bage@linutronix.de,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, linux-i2c@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
References: <cover.1595572867.git.frank@allwinnertech.com>
 <CAEExFWsvScMgi_Dftfq06HZiF8CFAmym8Z_tgQoHHAfiGxWt0g@mail.gmail.com>
 <CAEExFWuwjmqAh0c3kMLS3Gs6UC2A8TtY-9nJeWxFPRDugtR4pA@mail.gmail.com>
 <20200824080327.GH3248864@dell>
 <20200825085532.vv4dpuzmjnshm5qn@gilmour.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline
In-Reply-To: <20200825085532.vv4dpuzmjnshm5qn@gilmour.lan>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 10:55:32AM +0200, Maxime Ripard wrote:
> On Mon, Aug 24, 2020 at 09:03:27AM +0100, Lee Jones wrote:
> > On Mon, 24 Aug 2020, Frank Lee wrote:
> >=20
> > > ping......
> >=20
> > "Please don't send content free pings and please allow a reasonable
> >  time for review.  People get busy, go on holiday, attend conferences
> >  and so on so unless there is some reason for urgency (like critical
> >  bug fixes) please allow at least a couple of weeks for review.  If
> >  there have been review comments then people may be waiting for those
> >  to be addressed.  Sending content free pings just adds to the mail
> >  volume (if they are seen at all) and if something has gone wrong
> >  you'll have to resend the patches anyway so [RESEND]ing with any
> >  comments addressed is generally a much better approach."
>=20
> This is true to some extent, but pinging after a month doesn't seem
> unreasonable either.

Especially if resending would mean up to 16 patches sent again.


--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9FF00ACgkQFA3kzBSg
KbaQCw/7B0HkLUNDaoRkScvwvMsZwnYphPCyyQwyYSGMOlmp9LUnRLs8wgHuKwvF
U65QpySYVeF2oRjy1Q5u7oXEQUnprwXLXkVaHt832UpeCw6nvKs/i8Rs8H+0tWo9
/O7pxPMFrUouMTUAkAqKuKsCOFRflr2R32JquWopYWi+MgzoPAWV1OAtOC0XHdqw
lWnioiMvY3Japg4eaqxLWZ5nqp8XYy+qXGwJdtiWkFu8+LnTvTcK+stQqROhYlKm
6Cm6Uy13ngTrnB4ait2I/+YKuwljumU6m8xuxyb7a/j2ZWO80LBwoCiRdGNE1A7V
SEDzhfVmYNjeHqCBB3Vryx5N5Bkz4Be6paj8tthKHjAXxBbLYfheaXeO6aLpd4l0
sshVn10Dv84yYcL8GR4baFQCrNiZivjEZiVFXeiA6ygkQeNkQPoT4jGVYiHiNzuO
y2TAjUKypZ2Dst24Q+38o9HUTa38mSIKKcif0SwmbryPq6NL0elOgd2F68KQJzSk
ob/zI8yw9nK9Kiz6JpjvKBv+Aaf25R1U7a/URD0VcgJVdUv3X0RJ0yk79HSNeP89
fEz9mx9k6sK09qRFLZTcYJ/whlSa0SONFcfEma3W7iVmDzjFDW0ZftzMneSFVRbp
HY/EadYE5G3VNklMSNhyT9Bf9ArEoxN9osMTzwSgpiHzAovoq+o=
=iNuN
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
