Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED687B21A5
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2019 16:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388542AbfIMONr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Sep 2019 10:13:47 -0400
Received: from sauhun.de ([88.99.104.3]:35910 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388349AbfIMONr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Sep 2019 10:13:47 -0400
Received: from localhost (234.77.63.94.rev.vodafone.pt [94.63.77.234])
        by pokefinder.org (Postfix) with ESMTPSA id 8BC042C3115;
        Fri, 13 Sep 2019 16:13:45 +0200 (CEST)
Date:   Fri, 13 Sep 2019 15:13:45 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     andy.shevchenko@gmail.com, rafael@kernel.org, leoyang.li@nxp.com,
        meenakshi.aggarwal@nxp.com, udit.kumar@nxp.com, rjw@rjwysocki.net,
        chuanhua.han@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [v2] ACPI: support for NXP i2c controller
Message-ID: <20190913141344.GB1022@kunai>
References: <20190906075319.21244-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline
In-Reply-To: <20190906075319.21244-1-biwen.li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 06, 2019 at 03:53:19PM +0800, Biwen Li wrote:
> From: Chuanhua Han <chuanhua.han@nxp.com>
>=20
> Enable NXP i2c controller to boot with ACPI
>=20
> Signed-off-by: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>
> Signed-off-by: Udit Kumar <udit.kumar@nxp.com>
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>

Added Rafael's tag from v1 and applied to for-next, thanks!


--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl17pBgACgkQFA3kzBSg
Kba+Cg//Q9SHjSTH13UGRUp2U0vv+JXhqpjqwDHNLtrcgLy5K1XTRpVp+HFwE/kt
RWOBpIHo4UHOwHLpxX9TcHYdKNPg/ZZx0lfoyIP4M50aznEXoDXxYeXTvtM+2RId
gaTu/w6OHA2wIDty+8cCuJMzxiYeS+AEwgVn82WcF19ZFzFehCpUs6j0w1aqBi2k
NunT4wQUO4AUlI9TdMUwY5/xm5/DZPKLYHtH3P6GKQTGkR0t3gyFTeVfNWtg8INJ
Ih3bPh0bFO5IZXkUC46mRxuLaAM7q/WbfZ5kj8UyQz/3VZq0td+mGWnRfVix5P7v
8if1Ay8jrv5bsiCcpfFmZMZteR4qseNNW+l9JL3yd3hjeH0pljaC8TiDxjIfEqYm
O3kvmj7T0ZEGmrgFppq/81jH5+xFK5zShpCT6ijTubt8Pr/FTGSGzGX28jBQ240V
ftguvv8FLZUBmHH8990eLIgHn1xHdETs2u1yutwlJxWN+UyJMeOBuwc6d2nwkNXR
gixUEQOcQxdGjBAXZg6fmeuJpUvg2izKadNmkPDXILzp1VupbyqotIMlHPLHOD4X
ky5v2eFbZfriCe4CbZqqV98pxIZFskzdHjZkXCNqzjGUpSz5Fgq8W6SWgzOJ40n6
VA2OMoXrj72XfReZE7k+1IKRg6ZhAZXAv5tXsmuxs2W5VmGsBRg=
=Jmts
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
