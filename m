Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE3267FA38
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jan 2023 19:38:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbjA1Si0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Jan 2023 13:38:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbjA1SiZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Jan 2023 13:38:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5B2CC12;
        Sat, 28 Jan 2023 10:38:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C12BE60B4D;
        Sat, 28 Jan 2023 18:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5165C433EF;
        Sat, 28 Jan 2023 18:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674931104;
        bh=B+OhhkGo2KUENYhKUv6kM1CbCWEgNBM+74C+T1fBRGQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s9/6HcFUPWwm+Zvt4jQVV5dwyBJBGKFH0FhJaqukbETskzcrzovo3tPbtxAfSQygk
         xvHxE4ICgeRc4K7V6PIpYGL4ovDH9mp/qZ7K1Qe63ZmO2TAbGYQmHWsTUbHFNJltr2
         fdrAJm0ogXQF+F/gcPe+fP+69lSmDKY7/DK2FD0yBnjpbL805MiJyV6wVvhSAdxM/+
         dvOfPdMkinIexRR7lNVp9l9yQI8KfIxNzb+Z2WKzVxTst0ADUmYx6/kqFu/YLy1FTn
         /YRsAegmvTHLQ1UDW8ukehoQZ1ujCws5sanrydxkogoR8foJ4EZQtSxmOrdGT9cg87
         UaZcIW6LO3sIQ==
Date:   Sat, 28 Jan 2023 19:38:21 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     nick.hawkins@hpe.com
Cc:     verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        joel@jms.id.au
Subject: Re: [PATCH v4 5/5] MAINTAINERS: Add HPE GXP I2C Support
Message-ID: <Y9VrnQxiFjVqtybb@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, nick.hawkins@hpe.com,
        verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        joel@jms.id.au
References: <20230125184438.28483-1-nick.hawkins@hpe.com>
 <20230125184438.28483-6-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lNxp1tmexppqM6Q7"
Content-Disposition: inline
In-Reply-To: <20230125184438.28483-6-nick.hawkins@hpe.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lNxp1tmexppqM6Q7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 12:44:38PM -0600, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
>=20
> Add the I2C controller source and bindings.
>=20
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

I assume this better goes via the arm-soc-tree as well to reduce merge
conflicts, so:

Acked-by: Wolfram Sang <wsa@kernel.org>

Let me know if I should pick this instead. Will review the driver in the
next days.


--lNxp1tmexppqM6Q7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPVa5kACgkQFA3kzBSg
KbZuiw//WHjb284iR9poKsAdHIl6F/9f3Vvhsb98qHX6geaJxAHNV883ntRTQVkL
WJ6cC5fykclOevvE5K9hJEBshtuvtIa9XVuh+iNQ2NkdhCjjVyCP5k3CUE5A+/75
3f5KDLShIzCv2pTPsSRdmTV3Tx9rAnW+7gIHuiZ5TXNNVO5kiVyNoE/BvPqojIvs
DnoMvvg1kd8hpB+pQgENJ+Dr/BP93vHlYu8/nYtw+0tzzaPSrxMsNB0ELaxW/qsX
mS4dY1Y8gTvunwOAI2LugnwJEvrt64GEFU4S5HGNIrXIqyf4QC0wHUusgTVD30de
yCCXYCELF58mwAzsT6KMa0Ghdab0fcxtPJcR968sYxSDA7xdpKr5KvEP+kGKOlqj
hkpPMG847QIcfyeTBJrYu5YZSXV9cvPhBE18/r5RuiWPTZO/oSWFZ9hHbdiYdiTE
+vQfbQxPrRWqCJW+U7zS6bqB5ta5KPDlbiM/cQdF6k+Y5p2SisFAHK4BnR4z7KPv
b+XncIJBy17OPlfc+dsvW519Y0y5gb7+FAMd63fjmo6uHzxpLLmC4p8l5ISLuloK
9S5myjUS47ouvL7D8CmlSge5mtAf7QWwvDKJ0UofGHSSw404b4R/jhewClSgwXZV
PoRH3k7LpqkpMQ0MKmUfm/Y7QUP1gzpW9HLfwfynsxChalWUI7M=
=qbLO
-----END PGP SIGNATURE-----

--lNxp1tmexppqM6Q7--
