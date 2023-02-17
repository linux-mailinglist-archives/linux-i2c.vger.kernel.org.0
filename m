Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 647A769B545
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 23:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjBQWIi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 17:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjBQWIh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 17:08:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E4863BDF;
        Fri, 17 Feb 2023 14:08:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8608461349;
        Fri, 17 Feb 2023 22:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604C5C433EF;
        Fri, 17 Feb 2023 22:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676671716;
        bh=Xbda1OXgKnV+klepby0tkD+9nTNOKlwNq7a9ZioG46k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s+Zp0wvqNx0G2fwh9RRKgtEIIdu2l04WmJAkzuCbTIkCH6izplRTBSycN0T2xfzp5
         gMcbOZynOpet0/x4NgpB1ja6Ru4KA9RT524mkIofUII6iirar/l+FBKTMqWEKDAO7F
         8LfU9JNkXSd5gr4QS6T8165ckxoTOA6lwXIqJeg3vmua8Ehe3xEeYqED1Ya3phLLsi
         whJbfDBVCXUV2UGsMyRzvk+HqwHB7Pk6fDtMiWEYA3A6xCb0bWLCTt5VA7ragpim4M
         yGHqJ9HwTPV72TtNyFj57d3AOtis+iTxe0uN1HmYMzMz8ME9unXBput38pMLUc55Jv
         a4Bhr5MnRk5lg==
Date:   Fri, 17 Feb 2023 23:08:32 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     nick.hawkins@hpe.com
Cc:     verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/5] i2c: hpe: Add GXP SoC I2C Controller
Message-ID: <Y+/64OlWnV8f0GOL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, nick.hawkins@hpe.com,
        verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230217155054.99757-1-nick.hawkins@hpe.com>
 <20230217155054.99757-2-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kcqR8OLOiCis4cLy"
Content-Disposition: inline
In-Reply-To: <20230217155054.99757-2-nick.hawkins@hpe.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kcqR8OLOiCis4cLy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2023 at 09:50:50AM -0600, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
>=20
> The GXP SoC supports 10 I2C engines. Each I2C engine is completely
> independent and can function both as an I2C master and I2C slave. The
> I2C master can operate in a multi master environment. The engines support
> a scalable speed from 8kHZ to 1.5 Mhz.
>=20
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>=20

Thank you for adding the #defines, it makes the code much easier to
understand. I noticed one thing to fix, but I will send an incremental
patch for it.

Applied to for-next, thanks!


--kcqR8OLOiCis4cLy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPv+uAACgkQFA3kzBSg
KbamBg/+K556Vq6DNYht3Ziw8Lm/9cOi1/Z51cMfrlyjdHj7ceKQJv2jqUvbNyfG
QTvnp2FIf4eG1jXgYdTSHR//E0FdQdK3+85uEagGJ+lShBR09PNUh681Kk6RVHuD
ymbXKbTsZuDCXoq7Ia7EoO3iKEQRoPdXuRkEeHNG4VrtXRTXIMM8ef03dum+u+g6
H9YnbV+pZffA1DUp3nsXiuLLNKbjU3dQmuYvD2ir69trXfVEKXo9K1ZIdXA3nGgp
4Y/N4hYmRz/Sw1o7tMi0ZXgVzCC/SVNSAIj64gqocSDIoQf124A35OfvjORi/XFA
+MW9M43TwS0W8fFOkp9lh4zq2XbkEMjNl489LGVOkDqyWnHtfzgdNBRhLHadYPip
AkCaeqWNnmO7NzFQltrS2A4FkFMdFWoYbSeNe6rUwqDelS4OvljdxhZc/eJVgJRk
Z3TWoXe4hvVBZTC/me49RG8Im3i+hz1DWGrAWAZdn5kOiSUEUqxm4sxd8ITi07bG
22ZRneoz8JrGHfc4Lmm7pPelUqvGQKsFUo3jLC5weLVXc5pDlxb4tvqFyO32cMB3
dHoNbSBLzBk4qjXb+ewrJQsya4DjPx63HHifi3y4rMCEjKdYLyqQmY4b9T4yt8De
vvugqCEvqhBEg9adEJ4TQ3kaf/99/hnuhQ0e1EKV6ATxL/Dt/C8=
=WoRI
-----END PGP SIGNATURE-----

--kcqR8OLOiCis4cLy--
