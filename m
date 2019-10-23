Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1EA6E19D5
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Oct 2019 14:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388366AbfJWMTs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Oct 2019 08:19:48 -0400
Received: from sauhun.de ([88.99.104.3]:39604 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726636AbfJWMTr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Oct 2019 08:19:47 -0400
Received: from localhost (p54B33207.dip0.t-ipconnect.de [84.179.50.7])
        by pokefinder.org (Postfix) with ESMTPSA id E608B2C001C;
        Wed, 23 Oct 2019 14:19:44 +0200 (CEST)
Date:   Wed, 23 Oct 2019 14:19:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugen.Hristev@microchip.com
Cc:     peda@axentia.se, mark.rutland@arm.com,
        Ludovic.Desroches@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, Nicolas.Ferre@microchip.com
Subject: Re: [PATCH v5 0/9] i2c: add support for filters
Message-ID: <20191023121944.GA2011@kunai>
References: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
 <c17182ac-67dd-d11f-5daf-066bf446b969@microchip.com>
 <20191021140515.GC26782@ninjato>
 <f5bd0c1f-9a72-6661-146b-ef5de77e31ff@axentia.se>
 <c1f5c3f0-860e-e86a-5658-49e2100225a9@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <c1f5c3f0-860e-e86a-5658-49e2100225a9@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Send another version of the patch with the nit ?

That would be easiest for me.

Thanks!


--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2wRVwACgkQFA3kzBSg
KbY+cg//beA6zQrkT9jDDrRJUPM3LpUWqzeo8RMreuQzJp6Pw1X8BSuxLanDvhT0
PlKK59ZEhsXHtaXiyw2yVN1h3WILCiWryq81eyw8+ZgLkoQS++cBIdBwB/ZswY4t
vtHV+9mc82sCVJYEH9UKp75wqEQ41dOTL478itGb89ESJ2R772foKlipQwQ1zzTJ
gS35TGxdmwuiJ3JCgDs1bkCorwpY4OBjF9H1QTWXqfyoTgRPguBM8NYXmj21Cn+r
VRFMvpmFlxGsSC35Zx0Fb1Q1QxZNb49TwC1nnNnBhUSkAP9rmrW8SrofbMZ3Dekx
A3pVvyhzi6IO0sEvbmtbm64tP/nk5Yf4n3DmVbHufOQ/wKWtXWIhsqC/p4BA6TZw
xB4yJbxsljD+HLbigCjP2KpsonYeBAFG9O0RRqMQG8bp59BnzCvZambx6fadjI6x
32J9dHsSgfrXsG2ABcQY9+JFqv0SjlHo/5VmtnjV+kExa8jwx+f2YDbqcxr99PR4
kdfsAWOE28CZowJFKn84jUaabmISqHz9ejUCNvNTeuAC2yxvRqUCzoUpguZnqEgn
c5y7u8byZWNlOcUNRnCIfen19LmZagkZM9xn48Dtcp8RCBZRZEIeWnIvuaaix7V9
+kNWRT3uArzuZDD7A+CyefduySTQj1UZkJfzYyYKEL3fLAh4ZxQ=
=ywNb
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
