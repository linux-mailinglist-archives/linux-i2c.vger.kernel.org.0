Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D01482F51
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jan 2022 10:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbiACJTM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jan 2022 04:19:12 -0500
Received: from www.zeus03.de ([194.117.254.33]:45424 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232333AbiACJTL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jan 2022 04:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Vn3aJxyDkPL71XRKDgCqDg71rfPI
        Et7SATEKvTbySz4=; b=OjFanPf8tZJPOAqOtP8VEixy8l0ISOLwe2fVgS2MNIO3
        yDkOL8m1T/AG6KUOVDTZR4QL00BrsRiLXozxPCrPa1hurvxiUz3WdOBAfncPhBuy
        LcbMtuPeLh+wZUE+vV3sjJcDkRfL6vEQWtkSzTEPrry72jxFCQVkN3EY0EesTQU=
Received: (qmail 1589744 invoked from network); 3 Jan 2022 10:19:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jan 2022 10:19:09 +0100
X-UD-Smtp-Session: l3s3148p1@rCFeA6rU9JogAQnoAFcDAH8Lqh5Pgme7
Date:   Mon, 3 Jan 2022 10:19:09 +0100
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
Message-ID: <YdK/jYJTaDQRfOzi@ninjato>
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
        protocol="application/pgp-signature"; boundary="LbZOgwvcfKOW/9BI"
Content-Disposition: inline
In-Reply-To: <20211221175322.7096-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LbZOgwvcfKOW/9BI
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

Applied to for-next, thanks!


--LbZOgwvcfKOW/9BI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHSv40ACgkQFA3kzBSg
KbYujw/+KThxY3hK++tUtGTWh7XlVZponjPor++a2HB4FvXu98o9fOg2edVejNgg
i4qD6PjSTlbc3axRU39RUxSootrs+IjNV9AxAr/tZvWUDYqGW4GGjtuS1NLcOet4
EjapfWRN+0CGojyPyylIrld+GDzAXB/kgYaoavFekul8jss9YTfqrL1busKuAH1/
LvPJEAEj367CJ+GsWTWeO1C9eBvYq566NEHwFx0jYLWLg9at8bSQgjZ6xvSBuiy3
xtsCuQW4+2Qpb0jqvBJLYtt5SW/UzYT7MjoULLqphriSpui+MZ0BNY8e1dJy9snA
GHZWAKmICM2sk1QyODulAx6Dyr8pQrk2C8l3lPSc8WJ+UGsrdQdmFRgy4WdHG7cV
F5loEfmEoMWZiqGPGS+/NCajtb1xbHIZqrRVpSszhausu3FbuqVmMNmhDWQ2nc0i
QdaF47cBovGd+AKvKfpj/4lro/4qQHRek2Dh3F3Pg7l5ZDABRkdLnN3LxcsT3PLG
shxiNRkkppXS5NZStyjaas9CsPaj38g8H+XiQFAfPpZ9waw5t8JmJ5bQJ8GRM3WM
ZS09g39sPv+qw6qkb69NxXRZ+Tj7u1E7wV8MqUD+GPkj6HWDUsGR8neNvKUfk4oN
3UBcTrjslgdWeODgfFEeeaXQBKFisYZqve362HNu7L/tFtEOBQk=
=huSE
-----END PGP SIGNATURE-----

--LbZOgwvcfKOW/9BI--
