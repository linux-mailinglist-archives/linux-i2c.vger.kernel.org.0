Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5F318E3AD
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Mar 2020 19:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbgCUSdA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Mar 2020 14:33:00 -0400
Received: from sauhun.de ([88.99.104.3]:38074 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727028AbgCUSdA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 21 Mar 2020 14:33:00 -0400
Received: from localhost (p54B33C59.dip0.t-ipconnect.de [84.179.60.89])
        by pokefinder.org (Postfix) with ESMTPSA id EF69C2C2E9A;
        Sat, 21 Mar 2020 19:32:58 +0100 (CET)
Date:   Sat, 21 Mar 2020 19:32:58 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] i2c: designware: Discard i2c_dw_read_comp_param()
 function
Message-ID: <20200321183258.GB5632@ninjato>
References: <20200306131955.12806-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132326.74A92803078F@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline
In-Reply-To: <20200306132326.74A92803078F@mail.baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2020 at 04:19:56PM +0300, Sergey.Semin@baikalelectronics.ru=
 wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>=20
> There is no code left in the kernel which would be using the function.
> So just remove it.
>=20
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Applied to for-next, thanks!


--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl52XdoACgkQFA3kzBSg
KbZ+2g/9ET2kP7rBU+hwVtjzUDDKJOTVrejHg2+Gdl+oylMtZzlQRh5+0e78qlPQ
meV3IgIEsils+e39WEzmeNLaDBbVLxep6hGo6qTr+j7FxCGWcUTaLZxOu+tqApdb
eABIy77t/XuyS5Cl2BRYnLW5IiXhFMDMT6KtH7k7VxDr0ATzai7HBG3QKwCYrkV/
aXfVtNFGwa1hFQyVF1Imnpsnwj/VxhSLbQ3BWAUkpc8ian6DXu921xzfuc7otT9I
v+V6UQJTixCqhdDaPwN3YnZv6jvH2MiK1CwGCAhUmKZi0fK68C0SQlAw9o83ajxT
dLLxy3n7Gi6QC2BCna16l4dNXP5zjps9sHm6uHTPAXiMmipXnijasWA5FJ9EgEAy
rmBB/yW6Q7KAIWJu/jW6bFw/Rza12RqFIPZ1ydudD2tQKAiruveF5qdCppxVwprJ
ST9tm+qnRBxdcm+2l/kSkxLo9f8Y39WJvfU5LCyzQeF2w6lcmbhRjzEj8V7NXvtS
WwTaqEyVt+hc3B1DEllSC6H8zmY8BPYmEHX09SVlLIxmzzWZiiPVHRIBbM0Qhjwk
HSuxSOrk6whDZrjoj5Iz0UedJdrYDgnxQzF16Wgj0qvLU+93SRS3r+1Mo0Ey7A/3
TaY4HCurDKUXg2SX2lc5fJb1Z+pysjZ0uzc4Ok0lWfp1nVQ5Ers=
=vY7x
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
