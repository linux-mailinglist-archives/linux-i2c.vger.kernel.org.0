Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1873C700
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 11:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404619AbfFKJHV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 05:07:21 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:59497 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfFKJHV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 05:07:21 -0400
X-Originating-IP: 90.88.159.246
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr [90.88.159.246])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 32085E0024;
        Tue, 11 Jun 2019 09:07:14 +0000 (UTC)
Date:   Tue, 11 Jun 2019 11:07:14 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: mv64xxx: Add YAML schemas
Message-ID: <20190611090714.sjqyo4cqyh7l4li2@flea>
References: <20190605122936.11972-1-maxime.ripard@bootlin.com>
 <20190605122936.11972-2-maxime.ripard@bootlin.com>
 <CAL_JsqJczoTpq=8BS5FwL3TJmitZp9e4Mh4oXcvgOMdRmoURvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i4ldgqqqixlfi53r"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJczoTpq=8BS5FwL3TJmitZp9e4Mh4oXcvgOMdRmoURvQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--i4ldgqqqixlfi53r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 10, 2019 at 03:37:17PM -0600, Rob Herring wrote:
> > +examples:
> > +  - |
> > +    timer {
>
> timer?
>
> (and missing unit-address)

Yeah, sorry, this is a copy and paste issue..

I've fixed it in v3.

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--i4ldgqqqixlfi53r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXP9vQgAKCRDj7w1vZxhR
xVKXAP0RF4cYMBzsD/TKvd2+MSBUJprWGV+yr32Y+uRWTlAbRAD9EcJQoYoITgBA
6SZNHmYk4JttNkI5odc971TTyVX0UAw=
=XakM
-----END PGP SIGNATURE-----

--i4ldgqqqixlfi53r--
