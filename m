Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04C76A4467
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Aug 2019 14:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfHaMTi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 31 Aug 2019 08:19:38 -0400
Received: from sauhun.de ([88.99.104.3]:37884 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726195AbfHaMTi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 31 Aug 2019 08:19:38 -0400
Received: from localhost (p5486C98B.dip0.t-ipconnect.de [84.134.201.139])
        by pokefinder.org (Postfix) with ESMTPSA id CF5272C0093;
        Sat, 31 Aug 2019 14:19:36 +0200 (CEST)
Date:   Sat, 31 Aug 2019 14:19:36 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugen.Hristev@microchip.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pierre-yves.mordret@st.com, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, peda@axentia.se, mark.rutland@arm.com,
        Nicolas.Ferre@microchip.com
Subject: Re: [PATCH v3 0/9] i2c: add support for filters
Message-ID: <20190831121936.GD1032@ninjato>
References: <1562678049-17581-1-git-send-email-eugen.hristev@microchip.com>
 <20190712082044.6eteunzehyptsibk@M43218.corp.atmel.com>
 <867070c3-02c8-da1b-04d9-0a1b628577de@microchip.com>
 <20190829202817.GT3740@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline
In-Reply-To: <20190829202817.GT3740@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > What is the plan for this patch series?
>=20
> I hope to review it this weekend and my hope it is good to go for 5.4.

Series looks good basically. Just a few comments for some patches. See
there.

Thanks!


--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1qZdgACgkQFA3kzBSg
KbZsZA//f78QF1bYvAot77Sdun9f88jzno8Z7dYA6QF/uU2GL7npsGzJilGHp0bX
18ft7DNi86YVPNglhutCWhlLDicMZOTe2fZkqrSX/w574Kq9TKadW4aCaVBkIyhj
lvFP5lDSVQo9lHaXv+ocopAcFkKLlZ7KivZAXbOCAW9AwYF0l2bSC7FqVyJVYQOY
8LEfUB0T4ZANnMuN2xn4S3OyTlidykhOy5rF+oppjpesIJ21zjSKwKLKKqz0eD2p
vP4RcoEYvP+UvswkfMFeQ/nW8sSOOVi0lIpWPkRUwog9rHtZfVov8qd63r4/ftQK
IEkQDXCmB+0oK5Dgz+FeIS7Hty6oJluLSpxLG1TTZ3W/716j2BrcrcTX7V0EoHGv
YutKi0SD855I2bSWrk/O+P5Vor13a0oBVsu4WjRFbhO/Fzd3bIcZghILe3ty7um/
US6WEMXpn0HRFPA2wdeBHfYWwGheN67Eovuxu24aPLF3G9GkTsaN38q4HCLfEZaf
ofK5L+b2Tmb9O40aaXWIIZ5BwsI8STpT0LA0HS5zUh/j6y+3WRmKAaGA8tjDQUNz
5GlQwcdvyBe8bsXSAqdFwR3r1mX3G9bC30hm2PX8DyCxQfgV7FJQjns44p3NKfHn
5wPMNxUVEU2VsilefWifVBUwpdq8UxmPPJamPdY4sygrxOq+GK4=
=4j4B
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
