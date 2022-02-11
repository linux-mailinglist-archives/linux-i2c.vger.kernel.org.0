Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E79B24B2BCB
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 18:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344233AbiBKRdj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 12:33:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239369AbiBKRdj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 12:33:39 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1185391
        for <linux-i2c@vger.kernel.org>; Fri, 11 Feb 2022 09:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=k7BRMSBPM3NYQ2+OiHkOZUOZ9tZ7
        5v/RJw3UrmiIEZ0=; b=LLuN5RuclFGNRQX2J9xCPX4yo/aaFm02fl8kO/5jMm5c
        Iv71eP1HQ9Kw7PG+Dk1mV0bpXJqoxohbnpfgzO5yAHX4mVWzwW1SszpM7mTjZTpq
        BAYXpvTvVR5wASIq/FhQllES1XymIglCstr7hGn0YRPZNNf9OcouTn6HuqZKJLc=
Received: (qmail 1733156 invoked from network); 11 Feb 2022 18:33:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Feb 2022 18:33:31 +0100
X-UD-Smtp-Session: l3s3148p1@dTUed8HXrJsgAQnoAG/OAF8CQcyiW2Kh
Date:   Fri, 11 Feb 2022 18:33:30 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: renesas,rcar-i2c: Add r8a779f0
 support
Message-ID: <Ygad6tm8yEUxs4Py@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1643898531.git.geert+renesas@glider.be>
 <9558127ad3a49fc6e03a0f9cb9ff19917f4e52ab.1643898531.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8bL4afByqF7nlHix"
Content-Disposition: inline
In-Reply-To: <9558127ad3a49fc6e03a0f9cb9ff19917f4e52ab.1643898531.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8bL4afByqF7nlHix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 03:33:16PM +0100, Geert Uytterhoeven wrote:
> Document support for the I2C Bus Interfaces in the Renesas R-Car S4-8
> (R8A779F0) SoC, including a new family-specific compatible value for the
> R-Car Gen4 family.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--8bL4afByqF7nlHix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIGneYACgkQFA3kzBSg
KbbD9Q/+KK5T8KUdVLVdt9VMrJao2vjdoRWKxtnqSP3qAoupX4bx6ZgMgj0pu0qm
VExIZNE96PxsW1iipNrHb2ZDZta/LfNaZUMzs+LQKTHivLn8eUQxtmsxnALYbP4a
45q+9jy9ncge6Fcab0NxE/f7kACgcBxuqZdxGFHx8vIDgCLY2NDc5WiUTlZxwZA0
ldRpa25w5Y+k4sgiCI8sHOoRecBsEVKvIR+qFKJ08qzHR+vhw+EXMK8AvJWg1Rto
1RJ4oTE82Ky4HwMN3B6e/0BTJ1cR4oSXOIcl+d3167nmTiQdeCM0u905k6/gRuaZ
Iwbdmq2MJY6Pe1I613nT7g7k8vYUW0MkuWDKeE3crkoZg9dfcuGRfOqcgwd83u8d
P/GUV9RgVKeFfssDgLvTQkZ23tLX8EnspE4bIZMxYrKUhNCzUjSGA8Y/Ds/IYE3o
SsZWn1Tn0uD2wfvZXhgOzGm9Gw3NWMQKPw+CMfwIBstG5bWX6DzIbE9PPwvf08bV
kU6cvArgZ2qAHdYkyenTCvPvBDQ8ar1AgPqJ7BL2BnUZL0CAlVKjJsDbprNRiTrT
aY+UgAqBllwUIdIKfVCxQM4MgDGkbl1m7di8dkON55xsbmT0uHksotGg3Mrebrk4
VcSNFs4JyCwjUKFWpb7XTG+Dr6JKyVL9WlerAhk3Rzj/o+UPkFo=
=9+Nq
-----END PGP SIGNATURE-----

--8bL4afByqF7nlHix--
