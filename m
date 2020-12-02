Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546BB2CC0D2
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbgLBPaJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:30:09 -0500
Received: from www.zeus03.de ([194.117.254.33]:32790 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727995AbgLBPaJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Zq818eC4nVSwduKxL7y/rr9tCVX8
        jngv5zkE5tPYP44=; b=f2qmXBDUvyiD0xOSmPK5JsGXc0G6TYe3NdBOZ6hw/zkl
        A6B7ARRKrfidBPvpPFdm8sWDJ/oeXsWzgk4euE0LeAh64ubzuk5KilhmhFDVgw+z
        fCYeBDuFj9pduLvFP3fJcTsV+lGyKpmz2hounuHC+GR+ADl9H15i9dZL1EnfRVA=
Received: (qmail 1569066 invoked from network); 2 Dec 2020 16:29:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Dec 2020 16:29:27 +0100
X-UD-Smtp-Session: l3s3148p1@HeWh6Hy18OogAwDPXwYGAC+09q6oRBZx
Date:   Wed, 2 Dec 2020 16:29:26 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [PATCH i2c-next v4 1/1] dt-bindings: i2c: mellanox,i2c-mlxbf:
 convert txt to YAML schema
Message-ID: <20201202152926.GE874@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Khalil Blaiech <kblaiech@nvidia.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
References: <897f036098a9bf2497857c328c344aa0de5cdfdb.1605913307.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Content-Disposition: inline
In-Reply-To: <897f036098a9bf2497857c328c344aa0de5cdfdb.1605913307.git.kblaiech@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 06:06:06PM -0500, Khalil Blaiech wrote:
> Write the devicetree binding text file associated with
> the Mellanox BlueField I2C controller in schema file,
> JSON compatible subset of YAML. Besides, add an entry
> within MAINTAINERS file.
>=20
> Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/HstYACgkQFA3kzBSg
KbZO3hAAla4ALECCk3SABS2FLEAHDqaRiYNw5Uu1Qgjq2bFJ/kVFrzoPEjh/XZek
Ciu3F1nX1bd/PiNZSjAsNOj4uff2Ph+M/PqETWXYhCXkcBYLBbEaLsgVw7VRncU3
2uDQpsFV0Cb4ajOfmIOpr32VbQDGjGSayx+4evoHQKUKl2F8bUfeSftI+scT4xme
rE1kdmjidohI3dPKkFHvYT0XrUdH/ZtuI36u32n2ed3Cd6nTqWjZhXGPdr1O35Pn
GHVzeArgkfTZz9qXXEnRH5B6CTQF2CgLfFXgk2YD+o57GuKso6STDRRPWfeFUe/7
7ksHwrz4zv5ynXgA2u5c3E/AIA5K65p4K5Ig80ifG9O/ycY3PyZFjuF30bdLI6Mm
02dDZ2Qwq91ZK73zXEbkC90N6POqBKpghH6q1Dglbjx/YfqI+cVaMZ1H4xhSSQAj
zkIghq1wa/O7GdH0IBMY243Z3LY9u77qSHSyotYKk/vwD8lO7iC5sK4BFmtABxhq
2z9nWq8BzxcbBQPLrJXAIj8XpkSrH0NJqC3e60PwWlaY8cmeQOrKCKR/0+xJQ7Jc
w0PDdl8se2Lzx351IDah34H9LSrob4qQplROwh8VqvignIKrgiyhC0np+pY8GbKl
064j0Ei2CSDo1o0+E1sd71wi1VdnK+dauB+Xf6kGnHMX9fcrqz8=
=aWzf
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--
