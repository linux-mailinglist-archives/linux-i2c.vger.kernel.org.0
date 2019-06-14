Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D04BA46B72
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 22:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfFNU6x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 16:58:53 -0400
Received: from sauhun.de ([88.99.104.3]:57024 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727063AbfFNU6w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 16:58:52 -0400
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
        by pokefinder.org (Postfix) with ESMTPSA id 0EC2E4A12F7;
        Fri, 14 Jun 2019 22:58:50 +0200 (CEST)
Date:   Fri, 14 Jun 2019 22:58:49 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH REPOST v8 3/3] i2c-ocores: sifive: add polling mode
 workaround for FU540-C000 SoC.
Message-ID: <20190614205849.GE17899@ninjato>
References: <1559369475-15374-1-git-send-email-sagar.kadam@sifive.com>
 <1559369475-15374-4-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Content-Disposition: inline
In-Reply-To: <1559369475-15374-4-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 01, 2019 at 11:41:15AM +0530, Sagar Shrikant Kadam wrote:
> The i2c-ocore driver already has a polling mode interface.But it needs
> a workaround for FU540 Chipset on HiFive unleashed board (RevA00).
> There is an erratum in FU540 chip that prevents interrupt driven i2c
> transfers from working, and also the I2C controller's interrupt bit
> cannot be cleared if set, due to this the existing i2c polling mode
> interface added in mainline earlier doesn't work, and CPU stall's
> infinitely, when-ever i2c transfer is initiated.
>=20
> Ref:
> 	commit dd7dbf0eb090 ("i2c: ocores: refactor setup for polling")
>=20
> The workaround / fix under OCORES_FLAG_BROKEN_IRQ is particularly for
> FU540-COOO SoC.
>=20
> The polling function identifies a SiFive device based on the device node
> and enables the workaround.
>=20
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Applied to for-next, thanks!


--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0ECokACgkQFA3kzBSg
KbYR0hAAk0+oxNuosxpSqRdd+ybkY+5wQ4XEOSZddRvI05A8Q94hlKrrGbuZVXrf
NRg2i6cA1Zdvdvcheg0AVYY/1h9yfC+Vi8paSeXOiOq/D1o+GK4fCQnR8CONTqkD
8qHWFmqYInEeVbAxNoo7rInrlS47HavEvrOGg2Qpkmljz0kDqUZrGhgY9eaQ8mOH
8xMRooOzMniLx9uFVE+KmmOkaBetmoCJERVdnmKWqabV3r9sJs0Wvdhmrxjrdxhl
dA56SfVMhpg+JoGiApkvUOhjTAQQabEVmSbtQuxCAb9gwQHV7gV3pYQqoalp08cg
xLJNjGntX+kvtUcc7y1qa1HTKKPIBEk3Vsr3j8Toy8CKMI1uU4NI6FzZZ6Cl+lfU
fwoiIZYqOBeCNOpQlZYYdqsWTcmMzfIQuIghSl2RWl1ak7PSrBPG+ZXtzf7/E9CC
nTDLbMoe7LnYVjBt517jZCAtlrDfr02QmoGTIcFQFEsovI3m+/1F+eu2rXxbEEhM
L1/Eo6iX6hFGyCwyEnyxEGdEohH7IYyiMk17VCPGQRvk4YX0TRHPJntOHYPPhoWR
sxdkqyj8WgsdkhH+ZnGb2x48ArHw1wdayiZ0qE67Hht7zj2oBVxDaKHaVxzlv/lW
9RcwLLMTjYQrpZIiCiERDVBwK3usDOs3LbodTC7g4Tp1uQ9aYZ8=
=c6hW
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--
