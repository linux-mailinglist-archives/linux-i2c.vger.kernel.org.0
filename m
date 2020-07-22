Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD89229429
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 10:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgGVI6x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 04:58:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:50118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726254AbgGVI6x (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 04:58:53 -0400
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 718E92077D;
        Wed, 22 Jul 2020 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595408332;
        bh=R0xVdgqiB7s3O/DqEs6GN9dYzeeYY+lcRy+1jPlzd70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W9pwhuYHxVLA9WFvIszWER7midOVsx2uDEZoEd7TXs7QtDMzaybMeyOsADVuqMixq
         8C9QMQnw9W7brJHXh/UP+CTjQYwzdX6Xnwns3sb58eLqFWn1nspNwOdSNRFNo7rfF/
         2yWgceNvAxLbxamBwNA/XlbfB8F3vLj4kDrDDu5w=
Date:   Wed, 22 Jul 2020 10:58:49 +0200
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
Message-ID: <20200722085849.GF1030@ninjato>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1Y7d0dPL928TPQbc"
Content-Disposition: inline
In-Reply-To: <1594919915-5225-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1Y7d0dPL928TPQbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 06:18:17PM +0100, Lad Prabhakar wrote:
> Add PCIe{0,1} device nodes for R8A774E1 SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renes=
as.com>

Hmm, doesn't apply on top of 5.8-rc6 for me. Is there a branch to pull
for easier review?


--1Y7d0dPL928TPQbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8X/8QACgkQFA3kzBSg
Kbb+qw//biayHVrdtr2LDibooHUV8qi0GGMOUqYzn6LSC97+YHSK+LuSg3RfHW28
WF9bREAuLpDfZj7B7VKkjk1UN+MBrzOtXvXMmVhenztZQQxBHd8HX+axLFK1HrZ/
K+3X+jbEsCB/NTac43d0yYFj9IkFBIPVcExN83vJcn4MWYpk6kUPN1yFz5bdLO76
Jh56YvRaeVbxKfU6rwv4Oho5JjJxbpmjZ3m+yyuT8dp+VEE3cV9aesW3R3Rl2d71
pV7hc5gr7zIgadYfWUovWX1MzgD4Q0e5H5nLjjOIGYwhj8A6l1JT8n5vw6b3ERbM
MPBgNHQbohKl9HWcD48LWNQBhH8j4AM9tD7iXxXFeC8olpn+aFFKLV0YK1fqocXE
EZXT7Pv544SZPZetGfHNEkq9fQkkJ/IzcomQIIfWLCTLw0wc67QwDpE11pphkHg/
fwcYu54T/WhlUGrmFQmbrXYboytT7CzXFSuZ5VeJZqgi1zDtFqThHjPr/us5E0SA
Jghh/PHZnWDIYS2MB+revceePGtrEnK8Chu0XMDnfyrh4Naspk88ISX5WLDq8juh
FBb4W335vVfUJ0ByD1kgErUH6/qxrvcYC5QH0Txk40i2WBt8ISyeEugJir2uS2U6
M8fJEh5lzVQeKdG8zyI6i+aD+xhktGR66DbOLncW8feW2NB0m9Q=
=RR4j
-----END PGP SIGNATURE-----

--1Y7d0dPL928TPQbc--
