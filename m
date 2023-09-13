Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 649F879E292
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 10:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238884AbjIMIuX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 04:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234532AbjIMIuX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 04:50:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35674E73
        for <linux-i2c@vger.kernel.org>; Wed, 13 Sep 2023 01:50:19 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4599CC433CA;
        Wed, 13 Sep 2023 08:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694595018;
        bh=RtP/B+F7D4CpZgLKbzrSbQYzwCaaAINV8dkTtT7whME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HUjVAJ3nbsOrMG1YMYek8m35SyGmBXXHuOLYN68jZGpuqpVArM4wf5/evTueLuz/Z
         TquPEvkI1zAuHCl2escW/9ynoBA/z0bm/1c4zCiZlIJ0G2gwgDs4zBZ6gzQoE4AliE
         FRn2bFjl8mPFcZqmccBxs5iQHttsJnJALC5GzEG2bcRrjb1hzZBgqncIuOM1f7P8OI
         u8tQVxxWqFEx0SmSJXzw5oLjcomIIV0PIUErjtrSW1orZSQXmcljc5Pz3SMz+S2rbS
         mxy4BFXfRZ25AdcQ86/pk1bE12g+HCLN9GNVGqmjyibcddYq4S79hp8vBSvko3gI4P
         c6OZDhbAdFKVw==
Date:   Wed, 13 Sep 2023 10:50:14 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 1/2] w1: ds2482: Switch back to use struct i2c_driver's
 .probe()
Message-ID: <ZQF3xtPTDo5Sj4TB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Lee Jones <lee@kernel.org>
References: <20230905194253.256054-1-u.kleine-koenig@pengutronix.de>
 <20230905194253.256054-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y/ZdRyKT7lxCXy9k"
Content-Disposition: inline
In-Reply-To: <20230905194253.256054-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Y/ZdRyKT7lxCXy9k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 09:42:52PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> commit 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Link: https://lore.kernel.org/lkml/20230612072807.839689-1-u.kleine-koeni=
g@pengutronix.de/
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to for-current, thanks!


--Y/ZdRyKT7lxCXy9k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUBd8YACgkQFA3kzBSg
Kbbduw/+MbArYYeVyiyrl7XrTY1l8kGHreCO+zouhWnPDyRpHFIi23NQ+gMTfS4s
VoqtN3R2EFEB+FmbC4tYdLemFpjAlTR7aNYuwbJW5UvX9Cgnk/8BaVTjgPaiSIC1
1u36M9H2NV0E8ozFQ0752YO+WGzqOs6JyV9UBtc2hapLfwKJShDE2RHaEY5Impph
NGp5MQQox3GkW/fXgt6JUBcXfKUrcx65gN5Yt2SwWQ3GhrbqGibUuorNO4lpYJdt
f5kay1K2VjrV6NatBNkd8y3S5GzoI0cinMbGGTeYmj7+AAlsktbWuyZCyVP1+UAL
SD6Ipfp6db+xIvriMvB/5MYgm3eRKAHfvCzith21psl64AYuZnPaO8M0YrncW5gj
USg8KCwETKUMRRh81jk/DDTioT06OQVOIZ9AoQVFC+DTS/hBLLJHyOWYEwideyhS
1aw2yirzkeLab7BF1+z8Bhhq4F5WrkOMKdkctRv+5eZmm0shnwtorZutokrT3zQO
eVEtCFq6plrC2All2q8RwQmIhSByp8qWRGEH4xYvAQzCDBvGjt4NiHHrx8yqcIB0
+11cs+TzXW0tUK3L0+CCbqNPpihC3N1eK0iydYdtjKRX1uTjEttmg5odRXGcRZKm
gx5oFXfHTJ4jbSSfpPlEG2gQOovBfAFXNZveAWyfAjlD7V7s21c=
=fOvj
-----END PGP SIGNATURE-----

--Y/ZdRyKT7lxCXy9k--
