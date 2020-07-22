Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752C22293F1
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 10:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbgGVIuY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 04:50:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:45574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgGVIuX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 04:50:23 -0400
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6785D2065E;
        Wed, 22 Jul 2020 08:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595407823;
        bh=KBex7YObWFkv3ZED+tckY/19Y0OC0cIjEMo2Ccpv9Bg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iJzPYASLrtpyTXcRKDvZ/DG2+ITva/hZLilKwxh9W9WVvDgyr+Jf7zCm98iQodmP0
         wXVnB3cdXiMmbV1Db++NNRZ35/pzumvSy/HpvIrhnm2t9ibHKi+f3AnTAYeoWSJnFY
         yAsS1ll5wCriS7wGUkQlq5BljvfR5NCn3mALKCKs=
Date:   Wed, 22 Jul 2020 10:50:20 +0200
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
Subject: Re: [PATCH 00/20] Add support for SATA/PCIe/USB2[3]/VIN/CSI on
 R8A774E1
Message-ID: <20200722085020.GD1030@ninjato>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C1iGAkRnbeBonpVg"
Content-Disposition: inline
In-Reply-To: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--C1iGAkRnbeBonpVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This patch series adds support for the following peripherals on RZ/G2H SoC
>  * PCIe
>  * SATA
>  * USB2
>  * USB3
>  * Audio
>  * VIN
>  * CSI

Nice. But please update your recipients list. No need to have the i2c
mailing list in there.


--C1iGAkRnbeBonpVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8X/cwACgkQFA3kzBSg
KbbCjg/9EwkGut+pjFLsSqqQcdsIzTD9kym4OTeB/bHTnHu+yCKyYJ0Sa6ytd/+O
J9JLAahz7QkGnfOSFkz17HGK29XcNocub/8bIAuUBuydV8yQrleXLt/3oOKWOWrt
FC9p8gGr1q0/DLKeCOeIG1ftIaOe22L6bJsuxCzhJG8DetJY0If4fZ+nZc08r6Af
qMClhrnXZDqG7mYhLiWkeeKoiootXREJ8b2NozWKGLkQF0zMpSzQ0H+IwNrj6ElB
OCZHdbRrRLc1oIHmNWosZiFrH20DmVdjRUaZhvP1sBiw7/CdjZAf10OedOF8fv48
PGMhu3HM2FsqzPncnYAiNtTJrwESnDDROinJW8D+mAjFToABbnr1Nhc5iC38elIl
HTsJgC03NEZfZ1k6rvr1t/cYGcHePKzXod1ftEvvmT9093mGLlArZhMmKDFcXiDU
4g01TTz4SetHaOqdzZlPdxu5cJ1YGyMcOQQgBAC1C2vOLGg2Fsqs8VBI/ud/VAG2
XYAILg0D7wbFUd1fMYkG1W4x9HNdVlNXd4cCZWr4Geqc51B/9CQyJPhPJfCMK8py
KNcd8JmzsXN1oXW9E7K1VjHiMCb9TsBswsXXz8nnsfUuE09CpVQGfFqtmS+2nMjV
4VyHziCHbgqRqmlFlzwkGp7gcBcxBywyBwhRobKdGCTwFF+J7VE=
=oXte
-----END PGP SIGNATURE-----

--C1iGAkRnbeBonpVg--
