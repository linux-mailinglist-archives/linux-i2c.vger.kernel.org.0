Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26BCB35C5A
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 14:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbfFEML3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 08:11:29 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:49627 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFEML3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 08:11:29 -0400
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 54720240014;
        Wed,  5 Jun 2019 12:11:26 +0000 (UTC)
Date:   Wed, 5 Jun 2019 14:11:25 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: i2c: mv64xxx: Add YAML schemas
Message-ID: <20190605121125.4p2eyt7zhtai652b@flea>
References: <20190525141821.20082-1-maxime.ripard@bootlin.com>
 <20190525141821.20082-2-maxime.ripard@bootlin.com>
 <87k1e2k98v.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jcggnhf3ykfk7lac"
Content-Disposition: inline
In-Reply-To: <87k1e2k98v.fsf@FE-laptop>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jcggnhf3ykfk7lac
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Jun 03, 2019 at 04:56:48PM +0200, Gregory CLEMENT wrote:
> > +++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> > @@ -0,0 +1,106 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Marvell MV64XXX I2C Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Maxime Ripard <maxime.ripard@bootlin.com>
>
> If you take over the maintenanceship and became maintainer for this
> driver, then update the MAINTAINERS files too. For now it was assigned
> to me, but I don't mind letting this for both of you.
>
> Actually I gave my acked-by to a patch from Wolfram adding the
> Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt file to the "I2C
> MV64XXX MARVELL AND ALLWINNER DRIVER" entry "MAINTAINERS: add DT
> bindings to i2c-mv64xxx" so I guess this patch have to be discarded or
> at least updated.

Sorry for that, it's definitely not intentional. I'll fix it and resend.

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--jcggnhf3ykfk7lac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPexbQAKCRDj7w1vZxhR
xe/dAP9810+E+YG6xK7o/znoo25OToisA4qAfR89Ox8darfLQgEAjPOHR1jQl2S+
xakb+9c/vF+oAFjJD//9cLNS1UOxHgE=
=JR2U
-----END PGP SIGNATURE-----

--jcggnhf3ykfk7lac--
