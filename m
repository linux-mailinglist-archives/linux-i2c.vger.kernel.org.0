Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22B747CF92
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 10:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244039AbhLVJwv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 04:52:51 -0500
Received: from www.zeus03.de ([194.117.254.33]:36526 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244021AbhLVJwv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Dec 2021 04:52:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=AHNPN1hdXL7hd2i9ZuGladTAOJCQ
        W3apvH9TdmfrnHI=; b=foYXSNO2+l+O3fOb+hseepoNn9kHj2VMWrrn5mXWy/Yu
        u+MJaxaGqpJqLzksr8EBwd4rghzUFLAab8K8FigM1bzUdC+SNk+UYTMpOoetA0Yv
        depZiKyY34fEHcn6zlDip6aocBTqsyf5SAkOOBuRWFbfZA9rdpcugrOehT4PfJ4=
Received: (qmail 1701447 invoked from network); 22 Dec 2021 10:52:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Dec 2021 10:52:49 +0100
X-UD-Smtp-Session: l3s3148p1@06GoFbnTxLUgAQnoAFCUAc+q0T6Ni/m/
Date:   Wed, 22 Dec 2021 10:52:49 +0100
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
Subject: Re: [PATCH v2 3/3] i2c: riic: Use platform_get_irq() to get the
 interrupt
Message-ID: <YcL1cR0RUUsSwn0u@shikoro>
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
 <20211221175322.7096-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AyxD8pR0xn0cOwpA"
Content-Disposition: inline
In-Reply-To: <20211221175322.7096-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AyxD8pR0xn0cOwpA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2021 at 05:53:22PM +0000, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
>=20
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--AyxD8pR0xn0cOwpA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHC9XEACgkQFA3kzBSg
Kbax8RAAhWBhzDGrT4VrmbsJidDPuoYUFK2RAb8dI6JMAL7Zk52s5CopunI4Z4xt
eRGtd86E8YblKiNbWCD8+t9pukJ97Z51js2HcGB2no72vIbCNPcHf0+fNmDC9bI5
aROl3QtLfgYky3sK1AVQSV4CEe2ZvwDny9p+yy5zyH1fLPKkbiB+OMtkUS5ktC0q
/icnbEfVf/qXSbnYSIxw6jd66Xy8KMqzBCjx5vhIfJaB/IXWPwkNm4QA/AitgcSC
F0T2WFtygXQxwlDKCw1fSmF0tb9In2gu9CHOimaxtjb2ysZ+ZqRhFkwDuSVInDXK
myvhZvbeDLI5OSfVKNNBB1Bn9lvUGPZj036KoVdDliDcVr4pPYuAVbuEfY50A6wz
kn6bTkOT4c3JZvzjNo41sTcL6nRJd6ynOZYizlzMA9qCfB2j2SDKdBnNItJXwlNs
T84k0HmLR7oRrqTxYP/P9XGayZHUPkybkDqAqvP23rm6ka77re2Mg7/sC69ss/8l
f8UJSCeq028oE4zF2zv49M8S4a9RJSW9LXVGLlVrt33jMyn0fBF0RpRWAkzSuPoL
IGdClM3vCrdOoo50KxST/8su36U05kLeJE4lv609hJ+coAYtkWnLM6q8/Nd/gmPB
MVrfmlpD5fNbZwGDQx67ZiizWfO3nCi79pATQFSX2LAgR5AImcY=
=GJh1
-----END PGP SIGNATURE-----

--AyxD8pR0xn0cOwpA--
