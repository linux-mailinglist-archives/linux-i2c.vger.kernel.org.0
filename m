Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD3247CF8D
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 10:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244024AbhLVJt7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 04:49:59 -0500
Received: from www.zeus03.de ([194.117.254.33]:35710 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232246AbhLVJt6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Dec 2021 04:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=EJkolah8Mx37t5ori5JgQfX7iPuH
        YlTj6iZGbhM2QEc=; b=qoMgW0s9Fqj4GnsdVnt9A7PPqK5SxqmTbzpcVqOwOg9s
        f1P1uW2Mqpk9KqBM0Hq3P2ZU5xcYUe/RYlHZP+GfS/bLzCALHpbG6HCAopJasFXr
        QmE03Hb9M2Mpdhuwh/7EvHiupdZas0aG0hsiXQlJdJyJjgkqrk6Vv38mQ83gr2s=
Received: (qmail 1700184 invoked from network); 22 Dec 2021 10:49:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Dec 2021 10:49:56 +0100
X-UD-Smtp-Session: l3s3148p1@xGE2C7nTwrUgAQnoAFCUAc+q0T6Ni/m/
Date:   Wed, 22 Dec 2021 10:49:53 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakarprabhakar.csengg@gmail.com
Subject: Re: [PATCH v2 2/3] i2c: sh_mobile: Use platform_get_irq_optional()
 to get the interrupt
Message-ID: <YcL0wWX5921wkFRt@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakarprabhakar.csengg@gmail.com
References: <20211221175322.7096-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211221175322.7096-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tiR5Eds0Az0bZhMg"
Content-Disposition: inline
In-Reply-To: <20211221175322.7096-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tiR5Eds0Az0bZhMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2021 at 05:53:21PM +0000, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
>=20
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq_optional() for DT users only.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested on a Renesas R-Car Gen3 SoC (M3-W) and IIC port still works and
no false positive printouts in the kernel log:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--tiR5Eds0Az0bZhMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHC9L4ACgkQFA3kzBSg
KbbDFQ/9GPOCfr19hOXCepCCX0YK9KTMA6Ra6T6hof3Jrtb4HkxSbWixuLYQ8niR
5yVLDRgVoiIIboJacRCNR/+W24pajz7dRd6WXODpnaMAKlIAvfeLQ/EXDOH9hjX5
mcuYNd/KdjZ97y7FbotILTE6DZDBBO3vGDUtR2SpTQnVP00bqKXr72xnuCkkmP5j
XZuaxaVktcP8xpNDPqNab/okpDx6kTIr4noNl5aldFH2b1JQIQJQb5PNFGIGrKA+
tHW4B3mp4dHVwQ/0OT3zUZDW632VdLwLy8Xn2bQEMrJiiorb0cNm4LHA92smB1lK
qO/yMpJTgkQnVpuL3GTiLs/zshNnezjO7y6Xs5FLCsSRTWMWwTYBOM/ln4BmtFHJ
PxRaSAHVzKBsd8kjrV6SMt31n09iT4VYMG+twhz1BPLarRvdZOOpNPaJ4s0dNVdh
XwMHHlnFKPFxx3a5H04f4wl0ozwV5nPdTNjPlxOUrGy2LPs2VhRPQfg2KtFmyRfj
d2Zua70Pm/p32Mx2FN1Vss8oirIXQFfKYXxS48GPUNXGPJviRi7/U0sSrwOwzX5s
JxE8yjlEKrGZp0ymG7jU4h8xTaXgIUMHPbD4efwlc6ZdWbVPBHfRfQ30M6xsUdya
GmIkNjXWeLsTMp9L20pmypnAUOjkKItg5RVsHkF5u8sP+5fckyE=
=zGXh
-----END PGP SIGNATURE-----

--tiR5Eds0Az0bZhMg--
