Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E18B2278F
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2019 19:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbfESRRS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 May 2019 13:17:18 -0400
Received: from sauhun.de ([88.99.104.3]:44754 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726066AbfESRRS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 19 May 2019 13:17:18 -0400
Received: from localhost (p5486CF3F.dip0.t-ipconnect.de [84.134.207.63])
        by pokefinder.org (Postfix) with ESMTPSA id 6DE672C3F83;
        Sun, 19 May 2019 16:48:44 +0200 (CEST)
Date:   Sun, 19 May 2019 16:48:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH 3/4] i2c: nvidia-gpu: resume ccgx i2c client
Message-ID: <20190519144844.GC7291@kunai>
References: <20190517163818.5007-1-ajayg@nvidia.com>
 <20190517163818.5007-4-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KN5l+BnMqAQyZLvT"
Content-Disposition: inline
In-Reply-To: <20190517163818.5007-4-ajayg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	/* runtime resume ccgx client so that it can see for any
> +	 * connector change event. Old ccg firmware has known
> +	 * issue of not triggering interrupt when a device is
> +	 * connected to runtime resume the controller.
> +	 */

Check coding style for comments.

BTW how do you suggest this gets upstream? Through the usb-tree? Would
be fine with me. Are there any dependencies? The cover-letter doesn't
mention it.


--KN5l+BnMqAQyZLvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzhbMsACgkQFA3kzBSg
KbbYDg//eGmQGn9ROBpShY9pb+HaITR/RLbiky11PFw7b7huAPpsbXCmcUEIi30d
j23AF+L+r7+/9DZq0uNejcgf7r89zme8lMsljzqMmU7oW2y3WVQW89vY43BM6ECH
fxDmLXeqbOWqbrLhC60Dj2pBjacSRYiI3VcYOOeCYcDh+B2/H4BTe8fMqNnangcu
lFWjEVoeRWsNRxzazxf54AuAX6w5A/ClNUeetg8V7mZfoYG4iprqR0thgM8UIPiy
hghkZRI926bw2rK/mNsKtW/Kz9aEtGrKQyic+JXWHcL5Xdh0N1qVsRRBPulc7Ref
drIMOBb5Yos/4eIUcr3u6qGWHoDtN1J58oIOJNjVO3nCl2DmNvbc5504u+ksmkC2
VRNSBWt4u54aOZyKIQX2oscrtqo5R7FWhdb8aRnU06ONtWeo+pefuRxLk6EFRu+8
GXswL9jexxkpmeUlJvgwkkHU70TKpMfeP1mE83ARCIEt3XJ9k3nOVA5Lv/IlHoSH
8CMy7tm2zgcgIV3OWNQ1jU5sQ461aBYaYaBnMKxawJ079tOi/DKBl8sqSr0ewdtJ
Jfutvdl+9Ywk2MofJt0tZxAZm9oihBkQCARBZhbtfqZ29ITNa0CyEQrj6vIHbPwf
pE124ncylPKi78aW9SDXzj0SeAOvWslFGZsvz4RCQ2hHB3Xeamo=
=Tg12
-----END PGP SIGNATURE-----

--KN5l+BnMqAQyZLvT--
