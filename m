Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBD6528C1
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 11:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbfFYJ5g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 05:57:36 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:34499 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfFYJ5g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 05:57:36 -0400
X-Originating-IP: 90.88.16.156
Received: from localhost (aaubervilliers-681-1-41-156.w90-88.abo.wanadoo.fr [90.88.16.156])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E9AF82000B;
        Tue, 25 Jun 2019 09:57:28 +0000 (UTC)
Date:   Tue, 25 Jun 2019 11:57:28 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Gregory Clement <gregory.clement@bootlin.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: i2c: mv64xxx: Add YAML schemas
Message-ID: <20190625095728.owvyfkrai4jmitue@flea>
References: <20190611090309.7930-1-maxime.ripard@bootlin.com>
 <20190611090309.7930-2-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="g6tayui22w2buk2d"
Content-Disposition: inline
In-Reply-To: <20190611090309.7930-2-maxime.ripard@bootlin.com>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--g6tayui22w2buk2d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Jun 11, 2019 at 11:03:09AM +0200, Maxime Ripard wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Any comments on that patch (and the previous one)?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--g6tayui22w2buk2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRHwCAAKCRDj7w1vZxhR
xcMGAP9Yh+98/UwJd6K4O3L8NmxKzovMwuUbtUgAmhFkPjRItAD9F2+3vrDlGPzw
OfQRGO7ebLU8QLfQRN7SdjUcrVr/WQ4=
=I+6O
-----END PGP SIGNATURE-----

--g6tayui22w2buk2d--
