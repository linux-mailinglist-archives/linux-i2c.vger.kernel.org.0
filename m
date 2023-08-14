Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE30977BD8A
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 18:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjHNQAI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 12:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbjHNP7p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 11:59:45 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8BBF10FA
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 08:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=13fD
        tr5RGVxMatqp+5PRiwH9poWYh3uB+bymHm5fjMM=; b=WuSix5gG7x1VtMh6u5UX
        vVF6FOvQZXqudgMYKM5jAQBQ7I9z6NV2o9SN3+3ETV63c7IaNIvEvRv8Lt6SUdR0
        uYYlxR7Zrv2JCW6uZrFMF8+HyKqZRamYsGRZm3HAljexNieU3Q7jxWxHsRyS5swu
        vYnv8qx0nr5dSlof2QD/WaUyM9aQizZMa+Xa2yX5ZHbPijQO15rFCpL6wnby1I07
        StLrq80fbWNMkDNy6lViO9JDegehrBU0yhGBABln2VzoCUAnxQ8q6VUxrYccY5EB
        E2Lzv/dC45KfngpLje/1VnU0EZikxglYKTeLrPxReLyHTkC1UqWM9CrKANy/RJCn
        vQ==
Received: (qmail 97684 invoked from network); 14 Aug 2023 17:59:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2023 17:59:42 +0200
X-UD-Smtp-Session: l3s3148p1@DuyFJuQCHIYgAwDPXxIFAOXxDpD4UZq0
Date:   Mon, 14 Aug 2023 17:59:42 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Minjie Du <duminjie@vivo.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        opensource.kernel@vivo.com, stable@vger.kernel.org
Subject: Re: [PATCH v4] i2c: gpio: Fix an error check in
 i2c_gpio_fault_injector_init()
Message-ID: <ZNpPbhqNqD90VuN1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Minjie Du <duminjie@vivo.com>, Andi Shyti <andi.shyti@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        opensource.kernel@vivo.com, stable@vger.kernel.org
References: <20230713101829.15548-1-duminjie@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="F3VAkMY5d1uSTLql"
Content-Disposition: inline
In-Reply-To: <20230713101829.15548-1-duminjie@vivo.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--F3VAkMY5d1uSTLql
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -		if (!i2c_gpio_debug_dir)
> +		if (IS_ERR(i2c_gpio_debug_dir))
>  			return;

AFAIK, the trend is to remove error checking from debugfs calls. It is
debug only anyhow. No need to bail out. But please double check.


--F3VAkMY5d1uSTLql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaT24ACgkQFA3kzBSg
KbaHvhAAteNEN5boU3yeCiAtEbnto/LU6ozZJ10oprKOFKlRCXdb9r0Q84nHswwa
c3MtS0ApRUGUIvlZmJtNG404Z9y86KbnNYS6mv4Ghqqgtg/1HrcUwoRV2bJa6nMC
BC2wPkl3IqYFXmDyA0NuKSUZnwh+ZKSQ6hOUAkxYerqiAKld5/bF5VJXGuSxycqJ
Wmgu19yoIlFE3vl1UxIqpFpUY4ygP8nsANdG4MG0jaM+Jgh5YgLmBDCP9LXtZgun
5Hb4E+TIGpWUJA418b9JOp3bSXYDjQJmUjrM2uSuged+h19pOFdg981khh0h/BHN
y+ntBS2WZ7AoE2J7baK5eQuJv7Bxi1ZH0HQ1xamQevi8rjOUH3kZGB12Jyt0WCv2
erfUjS/oio2xZPgMzKu6Z1MB7NK3bJEblCQ1hOZ1JKDcH0XEgrsSILH/BWqkzad2
PTY+U9nANiQe24NRK1bE2wVrBCEZIhjQdDpGLMfceIa58fy9iNflw3de8dSrqvLU
CacC0l7ykyMQvYOuGml9PvZszbhXec5AzrtisEXsPVK6l+1l3WYZvHZUpMugfzAV
7xZaTqWXuJE2fEEdG8Tf3xr2lDB+JJtuXgAt4tixQqNprliSya/i1RMS42kBV2zy
h/Pv9tyI1C7X0dZCZbslzXvwNf+Xl1yD4PB33Dm6ckWvuZcNy04=
=n8bT
-----END PGP SIGNATURE-----

--F3VAkMY5d1uSTLql--
