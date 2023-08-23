Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E42F978625C
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 23:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbjHWVa5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 17:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237932AbjHWVam (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 17:30:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A4E10C8
        for <linux-i2c@vger.kernel.org>; Wed, 23 Aug 2023 14:30:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4837962AB9
        for <linux-i2c@vger.kernel.org>; Wed, 23 Aug 2023 21:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C03C433C7;
        Wed, 23 Aug 2023 21:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692826239;
        bh=txQEgkxMXHSya5ze2yHq0yt6OmWqXon8SHlj341eV9M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oYPJw4RrWO+6Ml0d8bYiuijGlZYEvAYMS+yGaYkX2J8v816doimM1L/we2yKhS+9a
         l9F9iPVG6xNN+JxN/+h7PMwGqvYJcnUcnHjuRRcozZCighj6WAFcgkcegQRpZ5xFyT
         0HFtTFH7VK3CDsmJpywuF4cgk3c7tCs3D73Aieu0o8fP89en4RUZwDVYwxCIbFkXaH
         2qfVPH0ppFwdkKnp3E2IG84Cyio6JLponzusqyB8wyo3+yowc8/akN2pzOkED5XZnL
         ZaPL0olawPzUhlJdYzkCXFKy2dkSq0l+ds0TMgCpBEMpPX3Yr1ihfVO6KqZzPYC0Z9
         LZqJy0/WySXKg==
Date:   Wed, 23 Aug 2023 23:30:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     linux-i2c@vger.kernel.org, git@amd.com, michal.simek@amd.com,
        andi.shyti@kernel.org
Subject: Re: [PATCH] i2c: cadence: Fix the kernel-doc warnings
Message-ID: <ZOZ6e/b2Zh7J3CeE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org, git@amd.com, michal.simek@amd.com,
        andi.shyti@kernel.org
References: <20230818104654.9604-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8sdgDIsBfrJ5NOIg"
Content-Disposition: inline
In-Reply-To: <20230818104654.9604-1-shubhrajyoti.datta@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8sdgDIsBfrJ5NOIg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> + * @rinfo:		I=C2=B2C GPIO recovery information

For consistency, please stick to I2C like everywhere else in the driver.

>   * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
>   * @slave:		Registered slave instance.
>   * @dev_mode:		I2C operating role(master/slave).
				^^^


--8sdgDIsBfrJ5NOIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTmensACgkQFA3kzBSg
KbZ4jw//ZDYXQA4tOms1XHPVhC8CYpZKsFUVP3X9kJ3rc8TtCZOterEayQGPqMsh
xwBsOg/GlS9F9CFLen6rHg8yS4SiiKGFNXoYhx2ZaAU6Lyhd+SqmR7xyQ8FZ6k70
Wpb2ABNU1mq8p/PoAkVOeZmRICoy5VsGT4B1bMsXrAZh7zPIFjespMNoWMg51Mst
GAFnRfc2kodxl+mrEkDdDAXAWDBgePXF16D0HMFcdxu0HDbu+el6EeY3CeOT9iZ8
6/1yRzkQB8V2uxJs6hYKRLnP1N1AB4dN1vQVvOiV5Dwsdrhf8FfDIO/e1kh78ujt
4eD+X/mAhicrrBCTJaGsKN0RXPL+cQZa9hdiZJFxPEqqoGme/4mRFUlLEPnujbMs
Isjuaoi6BXBK9S3WRv0S2Tkn4nAuZ1f5OpWkDqAHVHw/yiqoe5dTIa50yzgmkPMT
xbcJUku8X4klsF5o/FXjaupeaqkqylV+kV5qYaIvsP1jB49BWuqHYdyPPVZZuN1l
6iTCp1V4Dy5eFVAvFEL1vXkA/lp87AH+6qLv7GnFLNzOyfToRHtQYkME34ye1WqR
Xula3crfP123ACj1J3PyhnssJdVWcHCBrz/oVYRoXZvmFlBZzlm31b2jYX9ffBhB
LGuR441fCpkZ1zrtgkqlRqcTCfKDU11+2GjON4x0ksaKmZpua8Q=
=b8z+
-----END PGP SIGNATURE-----

--8sdgDIsBfrJ5NOIg--
