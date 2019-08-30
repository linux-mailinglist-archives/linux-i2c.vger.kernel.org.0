Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1DAA324D
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 10:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbfH3I2i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 04:28:38 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:54043 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfH3I2h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Aug 2019 04:28:37 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id BD5FF240002;
        Fri, 30 Aug 2019 08:28:35 +0000 (UTC)
Date:   Fri, 30 Aug 2019 10:28:35 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Denis Efremov <efremov@linux.com>, linux-kernel@vger.kernel.org,
        joe@perches.com, Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: i2c mv64xxx: Update documentation path
Message-ID: <20190830082835.rn65ssnvxwywyzkj@flea>
References: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
 <20190813060913.14722-1-efremov@linux.com>
 <20190829200055.GJ3740@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dia2uwz2zxeowuxf"
Content-Disposition: inline
In-Reply-To: <20190829200055.GJ3740@ninjato>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dia2uwz2zxeowuxf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 29, 2019 at 10:00:56PM +0200, Wolfram Sang wrote:
> On Tue, Aug 13, 2019 at 09:09:13AM +0300, Denis Efremov wrote:
> > Update MAINTAINERS record to reflect the file move
> > from i2c-mv64xxx.txt to marvell,mv64xxx-i2c.yaml.
> >
> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
> > Cc: linux-i2c@vger.kernel.org
> > Fixes: f8bbde72ef44 ("dt-bindings: i2c: mv64xxx: Add YAML schemas")
> > Signed-off-by: Denis Efremov <efremov@linux.com>
>
> Looks OK to me, Gregory or Maxime?

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--dia2uwz2zxeowuxf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXWjeMwAKCRDj7w1vZxhR
xaEnAPoDNLBUnwm9U8F0pEZ0gWj8mkYPw5mDVLtnrTq7Rghp5QEArnHKyRcnf5kB
dVQkWB6NE3ppv5IQRTG+0UXVEU+JgAo=
=cm+j
-----END PGP SIGNATURE-----

--dia2uwz2zxeowuxf--
