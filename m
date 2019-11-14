Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 866D0FCFCA
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2019 21:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfKNUnu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Nov 2019 15:43:50 -0500
Received: from sauhun.de ([88.99.104.3]:44848 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726533AbfKNUnu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Nov 2019 15:43:50 -0500
Received: from localhost (x4dbf5278.dyn.telefonica.de [77.191.82.120])
        by pokefinder.org (Postfix) with ESMTPSA id 190892C03EE;
        Thu, 14 Nov 2019 21:43:48 +0100 (CET)
Date:   Thu, 14 Nov 2019 21:43:47 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     ludovic.desroches@microchip.com, agross@kernel.org,
        wsa+renesas@sang-engineering.com, ldewangan@nvidia.com,
        vkoul@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, digetx@gmail.com,
        linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, bjorn.andersson@linaro.org
Subject: Re: [PATCH 0/4] i2c: Use dma_request_chan() directly for channel
 request
Message-ID: <20191114204347.GB7213@kunai>
References: <20191113092235.30440-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline
In-Reply-To: <20191113092235.30440-1-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2019 at 11:22:31AM +0200, Peter Ujfalusi wrote:
> Hi,
>=20
> I'm going through the tree to remove dma_request_slave_channel_reason() a=
s it
> is just:
> #define dma_request_slave_channel_reason(dev, name) \
> 	dma_request_chan(dev, name)
>=20
> Regards,
> Peter

Applied to for-next, thanks!


--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3NvIMACgkQFA3kzBSg
KbZ4KhAAqSIoupVPNUTy5EUS3aRgDo8MVkiIW1UWgvqLUQ0Zf1I1wOJg39JEPMg9
mNEvOCYkNOI7W85SarY869oxjmFsKlXjyMk9791x+8cHwNqtMQ/5WW/8oxaPM4FW
H936eUEkiqDivyXszx0lUbc/Df3a8nz71vSEyTfltMQ4ypIrOeRYHbvqmd/3lxpK
YIkVGF2RO76ddQOMJEA7GY1o3CpBJDUDYMiziMuLSgxEdcv+LfiHTE4eqAnSbOFW
nNkC++LLjSPNUl9OqiZTKT5R+umlMXgdRcTAOLxkOb9bYci6ETiTVtjihcLy86e4
Zt1DQIZbyxc0bWkYUB0JpKgHfUxk7s7jk6zFMJtBdF5bpOJWSDl3yc6LNHBimeBK
5AO042p6KsJw6ZCMpuQudrZyAn827OQd0qjffPG74fyj4nA8r1Wa3M+jcy/RnNUp
tp/2l605JpN47LW4qJ8W23MrcTReoeJTHv/xyKQQxAclfiM7yEN7XvHOmegS/I4k
4ehvvUvmlIV5CCB712Ci7sGJcafe7AD3aTZ/VL/up2GsakvJ0HrpSSkk3wrqW5ju
lSf73hxh62sD6o6eZXwt8Jp1FtYCrQKkPCBXXi322d7dgzrQ+8O9T/ffkxGxNYoN
9V420J1qtUXCWoLB+DUHE+IUPOQ5kSbn3R27WALZ4wxrAI2jfNQ=
=LdkV
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
