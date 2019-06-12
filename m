Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEED439A4
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732693AbfFMPPI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:15:08 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:41001 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732231AbfFMN0G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 09:26:06 -0400
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr [90.88.159.246])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id F29BB20000D;
        Thu, 13 Jun 2019 13:26:01 +0000 (UTC)
Date:   Wed, 12 Jun 2019 17:38:18 +0200
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
Message-ID: <20190612153818.q5xj5su33krlignu@flea>
References: <20190605122936.11972-1-maxime.ripard@bootlin.com>
 <CAL_JsqKC7uP0J14A8_CvPhbZkoSRNWSpS1ee+Q4sG013jY=JeQ@mail.gmail.com>
 <20190611090641.byr6mpywkfmbhrbk@flea>
 <CAL_JsqL3cua3u2gNTzHEdgFU0On5J9ziPZeFNiTpu5HS=SJoDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jqnskoivfbu5krfp"
Content-Disposition: inline
In-Reply-To: <CAL_JsqL3cua3u2gNTzHEdgFU0On5J9ziPZeFNiTpu5HS=SJoDA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jqnskoivfbu5krfp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Jun 11, 2019 at 08:50:37AM -0600, Rob Herring wrote:
> On Tue, Jun 11, 2019 at 3:06 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > Hi Rob,
> >
> > On Mon, Jun 10, 2019 at 03:34:18PM -0600, Rob Herring wrote:
> > > On Wed, Jun 5, 2019 at 6:29 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > +properties:
> > > > +  "#address-cells":
> > > > +    const: 1
> > > > +
> > > > +  "#size-cells":
> > > > +    const: 0
> > >
> > > These 2 are covered by i2c-controller.yaml, right?
> >
> > Indeed, I've removed them.
> >
> > > > +examples:
> > > > +  - |
> > > > +    p2wi@1f03400 {
> > >
> > > i2c@...
> > >
> > > That should fail on the schema (I need to get the schema checking of
> > > examples finished.)
> >
> > That would be great :) The compilation of the examples alone already
> > caught a good number of examples that weren't even compiling.
>
> I'm primarily waiting on a dtc change to be accepted[1]. Feel free to
> review/ack.

I guess it's too late now :)

> > Speaking of examples, one thing that would be great too would be to
> > allow the usage of our C headers. It's not supported at the moment,
> > and this often ends up with an example that is less readable than the
> > actual DT.
>
> It should be. You just have to add them. See
> Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml for
> example.

Hmmm, I'm pretty sure I tried this before. I'll try again.

> Maybe the common interrupt and gpio ones should be added by default.

I guess so, yeah. The GIC too is pretty common

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--jqnskoivfbu5krfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXQEcaQAKCRDj7w1vZxhR
xWTgAP9WB+1aXtMSPMtLHzMJKOV6r1RNowdkygnwiE+cBDkvOAD7BDqmviqSzzZt
6saIUD3M+DBgvkUTsko4s0nJ4Wp+1AQ=
=GewT
-----END PGP SIGNATURE-----

--jqnskoivfbu5krfp--
