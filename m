Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBA063C6FE
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 11:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbfFKJGv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 05:06:51 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:35599 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfFKJGv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 05:06:51 -0400
X-Originating-IP: 90.88.159.246
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr [90.88.159.246])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1D896C0028;
        Tue, 11 Jun 2019 09:06:41 +0000 (UTC)
Date:   Tue, 11 Jun 2019 11:06:41 +0200
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
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: sun6i-p2wi: Add YAML schemas
Message-ID: <20190611090641.byr6mpywkfmbhrbk@flea>
References: <20190605122936.11972-1-maxime.ripard@bootlin.com>
 <CAL_JsqKC7uP0J14A8_CvPhbZkoSRNWSpS1ee+Q4sG013jY=JeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tp4lyww3y3wdgyv5"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKC7uP0J14A8_CvPhbZkoSRNWSpS1ee+Q4sG013jY=JeQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tp4lyww3y3wdgyv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Mon, Jun 10, 2019 at 03:34:18PM -0600, Rob Herring wrote:
> On Wed, Jun 5, 2019 at 6:29 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > +properties:
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
>
> These 2 are covered by i2c-controller.yaml, right?

Indeed, I've removed them.

> > +examples:
> > +  - |
> > +    p2wi@1f03400 {
>
> i2c@...
>
> That should fail on the schema (I need to get the schema checking of
> examples finished.)

That would be great :) The compilation of the examples alone already
caught a good number of examples that weren't even compiling.

Speaking of examples, one thing that would be great too would be to
allow the usage of our C headers. It's not supported at the moment,
and this often ends up with an example that is less readable than the
actual DT.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--tp4lyww3y3wdgyv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXP9vIQAKCRDj7w1vZxhR
xeGlAP4rbegd1UDuKXUKFF3WhWS1KZK+o17bmmgQWsh+mRKxCwEAp601hbl4LHuW
G1FzOaVHASk0Y180ji5wRzDpQS2E2gw=
=1utz
-----END PGP SIGNATURE-----

--tp4lyww3y3wdgyv5--
