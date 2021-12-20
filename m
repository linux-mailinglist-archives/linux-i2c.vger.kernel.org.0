Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D55B47A7A2
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Dec 2021 11:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbhLTKQy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Dec 2021 05:16:54 -0500
Received: from www.zeus03.de ([194.117.254.33]:52890 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230506AbhLTKQy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Dec 2021 05:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=jwTcjGKZKIWZ7xTeIXy1kwuAp78W
        OQ0V4ISj4B1OY4Y=; b=Yoa0lACcdYBEVmWxDbnSISFAI1W9xN6lPGF5ZcnTPLb9
        0ZyqCfpcV34LpHlrSsk9GcikPlf60CTnXQuPJouM54KlK8O32CIWpQl2f4B/rmil
        dtZEcEtTbwgvs6d1sf3I9d2u9BCBb+JA95bB7XDrimscbYDwIx9Nvnrd76mqOrI=
Received: (qmail 913424 invoked from network); 20 Dec 2021 11:16:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2021 11:16:52 +0100
X-UD-Smtp-Session: l3s3148p1@G2z4L5HTwOggAQnoAELRALGDYlCZA5dV
Date:   Mon, 20 Dec 2021 11:16:51 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 3/3] i2c: riic: Use platform_get_irq() to get the
 interrupt
Message-ID: <YcBYE4VvfhURqoLB@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Chris Brandt <chris.brandt@renesas.com>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zv4fCuZIaXBG56Ez"
Content-Disposition: inline
In-Reply-To: <20211218165258.16716-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zv4fCuZIaXBG56Ez
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		if (ret <= 0)
> +			return ret ? ret : -ENXIO;

Same comment as patch 1. Otherwise, thanks for doing this cleanup!


--zv4fCuZIaXBG56Ez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHAWBMACgkQFA3kzBSg
KbaevQ//QGpL6nRsWsyJDyNCWZgSDvlVgDXYdODS2BhXJlHXAsorKtHNZmFqrVE7
lBDiujBzA7I8E2AbwQxIzzzzofV4H3MeBJCPVLQbHCL8iTkhxkCrwUxd6Z4zGlV3
mqt68HQfS3OFMdy0Dvr2w5YDBH7VrxYEIejgL7KxvW1pd9VKEvjiuXYxYPMx/M9t
laLWhr0lH+M9ixl3EFePg9eGRwu1paelaJpJqe6o9AwU1ui953QVl067TJVnz18G
qu6vUaj6j1il1B71BHKAKaZkOqwGFu28bXrdPXwMhYUb/4zfL8RWqI4VLP2cDJyk
QkOjALdhIq9xBPQPWV1o7s9g8HDU256EhgBLHv0SaeuU1ulZMos/XrUMQwBhvZ5t
YniwNQebz+Wup66Vf5W/1qnLgBUTX8vpPf0qxKZAj6RUzUpAGdAAAgXicFQcW2yS
dNN1IlI8UGI8QZtV3nlssfOfizSRx80ZP4edGcmxKufDlSK/vvNpQrxY6gv7rL4M
6cT34uQS4HUgp0kZujC5v1RHcQsbFJDPHxvJbmZ3///wHH4gCqKk7RmL58JwwJxH
Q0Ln9zuHEqcXXGCgZt9Xv5OWFiZP26M/Xq9oEsRxIIKZz1EJOiX2BFMk79o5N+Zi
/fH3qhDtJLGNVpJS3d2ODlcMbddQMry8vF2jxvHsGrzZXk8WAuY=
=5I+j
-----END PGP SIGNATURE-----

--zv4fCuZIaXBG56Ez--
