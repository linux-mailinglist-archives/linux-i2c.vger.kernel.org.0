Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFECF482F4E
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jan 2022 10:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbiACJTG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jan 2022 04:19:06 -0500
Received: from www.zeus03.de ([194.117.254.33]:45392 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232336AbiACJTG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jan 2022 04:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=vA2kIpgF+uXN4zKzOXnJMnFnnUGA
        2eWh3p8Xb3vNc5w=; b=UWjJ/hAaR6FArGQKoz7F+5bBlDScpLhaT7HIvE6fxTvn
        ihiIhk31l2B7ZWFG4ZtiwLmFKeBFmSh0xdPluDHWWRW5dasGYcYks0sm00HzORYa
        hawALr5HZKpo6P/rL29QsG3pRbtIDazGVSkP3ITmNQ3Y3RTXEpoEwQzGYBMCFBM=
Received: (qmail 1589620 invoked from network); 3 Jan 2022 10:19:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jan 2022 10:19:04 +0100
X-UD-Smtp-Session: l3s3148p1@w3ULA6rU8pogAQnoAFcDAH8Lqh5Pgme7
Date:   Mon, 3 Jan 2022 10:19:04 +0100
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
Message-ID: <YdK/iC+YHi8HPVrE@ninjato>
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
        protocol="application/pgp-signature"; boundary="ynH4LiSU5DGN7Ywl"
Content-Disposition: inline
In-Reply-To: <20211221175322.7096-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ynH4LiSU5DGN7Ywl
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

Applied to for-next, thanks!


--ynH4LiSU5DGN7Ywl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHSv4cACgkQFA3kzBSg
KbZOUA//c+vyYYYulCXkOWx7bxWG8oPH/OsKGin8YCZj6hJ6izuAHBRhBuK3SAWq
Z3CreZ7p1YYtlWJf4f2ElkP0VOPr4vSg3cPaHzzGycohrkXZHrO7XVKI1OEeWbhq
gJle8tl2gMtPxMioxMQX39XUpbGgFJUhpnmsJrv3y0XziNIz9UAOXmfrMsiWhQsZ
OgYL3xe9Xm0phw+K6IEeXrF/OwggVud2iTlp/4hUi3r/MQ5ZcGU9hTWEvHU4nHku
jHsk/1P+zG7eKVj0lQgiLVbvUoz6oI6j+oMNcxexcwtyX3fYX0PzgFa3AvLlSHNX
dc8vdZNeVFSUEGpp/6JKbAIslUZCkjyfPNQbj59/SrFKFdTiihjj62navV2UwPoi
cHtotTCY4dW+G/qJJOFXmX6WHwY2gu/oY78t3Mna85CtLLRh9LIuoKskiwoowqZY
vnCbqoaVH+qxczihSuc/KlNAHBp9/nc737ETlFe9BQb8AMzAsZEgkyzLUAPkTuvu
IR8hUN2SpGlQju+SWKeC4VP9ZX32/FJCVqmcb6bSvQRwBsDwDLWEHJW3BRy58oX6
ipAAU8gsBkkx5rR87yL9oSOCZNPFr7zrQ1QJdI22fpZY0IcVG80kFhfZ0f5fmLVt
9DqOZXUBbGMcaFFHEdaKSg5bglVCkk+uXYX91tQ8kUvFYmWcXzc=
=Fk21
-----END PGP SIGNATURE-----

--ynH4LiSU5DGN7Ywl--
