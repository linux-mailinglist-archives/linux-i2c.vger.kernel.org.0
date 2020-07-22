Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBB9229406
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 10:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731145AbgGVIvM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 04:51:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:46292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728911AbgGVIvK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 04:51:10 -0400
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ADA222077D;
        Wed, 22 Jul 2020 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595407869;
        bh=5VKULX8ADgA7+H2EigrTRpvSe/lUy15QaMOU+A/CI+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TvDvcjfKa+vjcCeAISmgjEW+fYRbaGUNquFQgXGpLqYmkm80KFOgCerMuWLycm+ZV
         k+xSZ1nc9noBosM5GPDDzmj/H5F/WzdPyL7Fa7ImHzdKh1VwobjPGB8fKtAb24Isis
         RGJsyWPulH2eYURc982loSrrzS5yw8NYtlevcruY=
Date:   Wed, 22 Jul 2020 10:51:06 +0200
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
Subject: Re: [PATCH 01/20] dt-bindings: pci: rcar-pci: Add device tree
 support for r8a774e1
Message-ID: <20200722085106.GE1030@ninjato>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Rgf3q3z9SdmXC6oT"
Content-Disposition: inline
In-Reply-To: <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Rgf3q3z9SdmXC6oT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 06:18:16PM +0100, Lad Prabhakar wrote:
> Add PCIe support for the RZ/G2H (a.k.a. R8A774E1).
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renes=
as.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--Rgf3q3z9SdmXC6oT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8X/foACgkQFA3kzBSg
KbYBWQ/8DnQbj6fqdgDpJjxoGMvRlAGRmD/LQyLgeNZDawpLA777Z4SwPpfHuyXH
tJy/aVjlLezk3AtfaxG87wUrwymDi3qmcjOQ/7F0exSRseGNXLrM3jYw37cH0zxr
Qcf3G48YkoHNFOTk4HYO9q5UYEhMtZOZnOBNOopox1cRy8glrR7nxNSfDhxpZVZs
dL3kgz14gDgBt14Oz4NgFWQ1iggFHB0TazeOr7a9r3NF/JazPQ1y4fmlTgPz1DWA
2yEE2P27ev+KZ4uqtwueghMFgzAnE8lJax8giRAltuS1QCe7D2i6hV9yyvc+aOV+
ci8xl7FHxyHeIDtRCfyp5Dfl0ud+vg0ewbD8aFe5lYW37rG3/8NJ/UShQKjJj2mT
YU1ne29hQ19sH1WUpAIKfGum2Ps7VZ/Bjgv4pHiAM4siayrkgAE7uRAI0vEFj6do
drNmWmySFFGx/sbjYQGdnvZfvGmUk3Y4t3VHNW5NhPk17gxMMht2iUeU4JJCurhR
/BE5wVtwfdArEeoMTvjTCyE0oZOGrCmpngp9i53vFvgTpU9vjzuKmPYatnBG7jiN
ctixKPeb4U9KoEMN1p1VnATLvLlBCxKi+blTVO06005x3kMkck3bMD6ZAfb0/ztg
30sT5P11NP9Za8s2A/TwTV6Nm2IBR4tMW+t1sJLCuSdR5X7RJJk=
=FHkP
-----END PGP SIGNATURE-----

--Rgf3q3z9SdmXC6oT--
