Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACC022943F
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 11:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbgGVJAU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 05:00:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:51610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726807AbgGVJAU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 05:00:20 -0400
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 046F7206F5;
        Wed, 22 Jul 2020 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595408419;
        bh=Yi6AS996K0DfjW15vZXqu8ki28iyEoRT+iHhuz3j7+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XUnleD7LHqvGtxq+wPCwjAtfLU8iE/aJVtLD7hmQ39Twa13AoyiA6X9P9DH8aRvig
         Ul47e9yAZJjJif8/IKCkkcS2OPTJRA4qNIm2JMLgdp7xNCZOP95Xxlx1IASlozmoD9
         JhxmS+9oHSqRdukmWAbnCWt0oYHCWFBdZRrFrfwY=
Date:   Wed, 22 Jul 2020 11:00:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-ide@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 02/20] arm64: dts: renesas: r8a774e1: Add PCIe device
 nodes
Message-ID: <20200722090017.GG1030@ninjato>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200722085849.GF1030@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VACxsDaSTfeluoxK"
Content-Disposition: inline
In-Reply-To: <20200722085849.GF1030@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VACxsDaSTfeluoxK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 10:58:49AM +0200, Wolfram Sang wrote:
> On Thu, Jul 16, 2020 at 06:18:17PM +0100, Lad Prabhakar wrote:
> > Add PCIe{0,1} device nodes for R8A774E1 SoC.
> >=20
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.ren=
esas.com>
>=20
> Hmm, doesn't apply on top of 5.8-rc6 for me. Is there a branch to pull
> for easier review?

My fault, I missed the first series. Please note such dependencies in
the cover letter.


--VACxsDaSTfeluoxK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8YACEACgkQFA3kzBSg
KbYt3A//Xgag8bMPdab8inAJPDV9Tk6V4XS9gbC6IgjEgp3oqU1d3BHkhJWG/+D+
2IyT2/QPM8/BjxYbDxFO2S259nZfkTEzzdfUa9oqFmv9cMugPgx++I2Pd/JQWCRt
5+gCNoNna6ra3Jst7ACmZvRoD2KAehRkC1j9+XHvVJzfSMZp9AE5vW4QiD3/jclN
beLqBzsQgKS9kTC9cCL4FQElaqj8yHoilinNXYt9EzHbMxWS7Zx0pvs0Eoxi2TKK
gs8pAC6y0Rcw6FlNzTT9wJyN/su4auribb+rQVK9DG5E5CMPKFyrHRWQU3Wjp8db
lHDZsu0+k7xxNS5IdQRr8FsZJuocTX0XU1v2CHBbSyncBYrKCrbWKCCDYcJ4Bnk6
q+7Zo6YnyeaZkSQXy7wumFwS4aqnGoqIImjIUtmfhSXhOQ/L6C7AHqMpkdB1yy/m
re40qlmZLVc3R+o427vgcUxyU0vrY61qTRn1jtNuIQVGRJj8TXKw4P9QW4AvZYNC
1BseDJS3W4q98/itkFRudLcXakyLYDRZmL22OLTSMpHPpmneH5bE9DzITvJZHMAO
EDkoJbb9L0RN77Tw0b+M/1xX4jPBwq9/9BFBZgGROZC14zoPkhbsc51QwZPF9OPS
dgRl9yHu/5nI1RmWbEIaeD0C+c+Pgzlfy09oCI4kHLxQJ1DIaWQ=
=O7WM
-----END PGP SIGNATURE-----

--VACxsDaSTfeluoxK--
