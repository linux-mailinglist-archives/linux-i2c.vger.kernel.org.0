Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46EA7482F4B
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jan 2022 10:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbiACJTC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jan 2022 04:19:02 -0500
Received: from www.zeus03.de ([194.117.254.33]:45328 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232318AbiACJTC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jan 2022 04:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=2LbxrZowuUBajoxRmq0gMOCsxxnt
        NlQG3w0qK7TYl1s=; b=QAMXhZSe9eRpBDzwTXdtP6HWTtkJWjuYsJb3bbzJ/HS6
        FMNnOBVbxFtX9RcenavL88BMsffenvAHXQlTWePx3ZefYq12PJjIZ7jmrS2sp8sr
        7x5RX6qaJs57j1hKPx7f3icDbqndJQV6p8xexYmAfVs31efWQmCgeBydwgkWw9k=
Received: (qmail 1589514 invoked from network); 3 Jan 2022 10:18:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jan 2022 10:18:58 +0100
X-UD-Smtp-Session: l3s3148p1@20iHAqrU8JogAQnoAFcDAH8Lqh5Pgme7
Date:   Mon, 3 Jan 2022 10:18:55 +0100
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
Subject: Re: [PATCH v2 1/3] i2c: bcm2835: Use platform_get_irq() to get the
 interrupt
Message-ID: <YdK/fy7AXn2+rYnx@ninjato>
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
 <20211221175322.7096-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ueVpXJ6n+jT7/Fjd"
Content-Disposition: inline
In-Reply-To: <20211221175322.7096-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ueVpXJ6n+jT7/Fjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2021 at 05:53:20PM +0000, Lad Prabhakar wrote:
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


--ueVpXJ6n+jT7/Fjd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHSv3sACgkQFA3kzBSg
KbYqrBAAidttPOxDWRv4/TxYiMTPM2wDuzJj+XR2LWV/SqL77GqZQ0BRU3Lt7cUx
PpHo1tqmLKJsGwT6tGn1O2dGe927cIhY/7Q2u1ux6h0Uimqfn9aVpnwubaZzu7Wh
ZXeYxiP5ca1+w7mnL39sYusM6cZFIxUARBgzaKGyD9vhR2cbJophuT9GmHb9dAzY
8IMIOmwyFIQsB8kmJcpnIaEuX2a/T3VD/dVWveBBKBbrLSvxxsbJvA51C36QMzB8
WJqB+f7mxngZ07ZS5bmllheZmpuCXBGzEZdtr6nQ3rrx5uCP37JRv/3x7VePJf9p
W59SQaDzNHBtDpb1OtEdPwx11x62jasd1V1ah0xgwA8gOOTWGr64shRZGvzMSHUj
g381En/y4NYZFAfosMkWkiW0PfOVk0EuchYhkaXo4ku0eYBFE0lzEFsmws3y825U
RCg1usdIyTmkmV8fKGUixPS4QUul9x1C4tHO59a5uNLcxoprud8QXO+9tT2uwaBK
LNbd0l4tuzNkjOBdydfy8ZgkZSmy2ZqDOdZtcPEZZfqOSdpX1wOvaw79aJmAG2gu
zkQqj0r7pzqbZNAEaKywiubw0f3cRYsxhodlUa2YubhVTLzcwyOXXFb6q5qKBE1k
tyN/Ri8sr/s8C4Ps+PCo/kzh/O8mYA3rfamSElrEYGn0brkhe8c=
=UHcB
-----END PGP SIGNATURE-----

--ueVpXJ6n+jT7/Fjd--
