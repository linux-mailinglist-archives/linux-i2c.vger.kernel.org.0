Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7593D6344C1
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Nov 2022 20:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbiKVTlW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Nov 2022 14:41:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232734AbiKVTlT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Nov 2022 14:41:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441956F361;
        Tue, 22 Nov 2022 11:41:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CBBA061882;
        Tue, 22 Nov 2022 19:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096D3C433D6;
        Tue, 22 Nov 2022 19:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669146078;
        bh=GVLw4FJLLj9ZBwJE0RHDJHJAoLMJ5hWQw+7USx+e5qk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tGCyjI4u4B44sXWiJK6n6ftrkA6qhoS/cRlniaQOZY/WrHiQg8eAsStghLf3Uis53
         pBKwBqNKjZYkYSc8ZQLPqp5bIaGshkxVzkHYcCVoovnR2eeFXgoQ+HGClaRRUS6zHO
         W3Qu51QYRNzqCVhE3mHj/YZweAOBYGvu7/hVv8buBgWwyg7prw/6xAjFA1sWxcxvCn
         snzOCJaNGXUnT6ph66pW2Kjo93CqAgaC5d+gXy+SmKrOqntGTOZMXjDyq4O2GB+UQY
         98DZQFCA2o/VE7HihhcdrEhJtEb7qLplL2M4U1Utu0D3DilN5QLlq+v1rV57OxU/TM
         dH8M4GmgXfgWw==
Date:   Tue, 22 Nov 2022 19:41:12 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 541/606] regulator: fan53555: Convert to i2c's
 .probe_new()
Message-ID: <Y30l2LiPQIxb+Vll@sirena.org.uk>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-542-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NxScMwPqhDBTz3BZ"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-542-uwe@kleine-koenig.org>
X-Cookie: Everyone is entitled to my opinion.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NxScMwPqhDBTz3BZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 11:44:35PM +0100, Uwe Kleine-K=F6nig wrote:

> +	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);

This function is only in -next so I'll skip all the patches that need
it.

--NxScMwPqhDBTz3BZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN9JdgACgkQJNaLcl1U
h9CSggf/WOekPBfdSo0lV5LhvVz6N399INRCJnxo8RvyV0r8s2Z4ezEQDNIcFDN6
gMUYJeYKjdBhMIBzSTyTNjUaPhOMw1puqanK2C8JxZNh4uZuKjw5DBuR1b59sOEa
oV2eqJIbD2EbUocxA6sNhP1ECvvWrK8pJWejb5GIO7JaLiyB7VQTGyWG91p7/BDh
GINXNhrHXOnShRXu20Ynn8OFw5Lv+XyBqRvDP3NqZqpZMKGlmIgHRdMoq0RzSZof
RppD0Jk1eXr4fkc8VIfQNd12vPQj91v48ANCXlZCpTAof0HaC/MtEJjsxFA9qqWN
in+IpwBO+NW6NoeREU0qbbg7QXReZQ==
=Criw
-----END PGP SIGNATURE-----

--NxScMwPqhDBTz3BZ--
