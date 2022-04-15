Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 683FC503194
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Apr 2022 01:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356056AbiDOVrm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 17:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356139AbiDOVrj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 17:47:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C54606D5;
        Fri, 15 Apr 2022 14:45:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C591EB82E4A;
        Fri, 15 Apr 2022 21:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C39C385A4;
        Fri, 15 Apr 2022 21:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650059107;
        bh=ZC+7rqZ0WgJdhnVTkfnQsLj7Dq2lp+QzIX3emi0KtK4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tw2sTFb2+s3S2OMkknsciUh6ECOOjs1MTVDhU3GYQWxMthoU+FSSa1Va9gLyuds0Z
         nduZgO6b/muLj70219dGTN1kIeJ5on1YGWeGzRjSgzhGP525FPxctH4+a+kHLXVHyv
         d+3+PxLDOitBklXbnG1X027lRl0Ff0xt5d+lJc+6pDebloVpo8sqJ2zr/HaX3vk28x
         zv7WBP/ppuyOrMgTZpEPM0YK7BYWC0CJG3H9FNr9gRRtm7UPlsj4enZzBE8xHjvZUk
         MTWqNGT5S0ay1H3b6VXWsI19ah4VIf8MyNQy2nenSvM17jQmEvsqxiE+JESWVCjyJb
         NipJQsnLAysBQ==
Date:   Fri, 15 Apr 2022 23:45:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lucas Tanure <tanure@linux.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: meson: Use _SHIFT and _MASK for register
 definitions
Message-ID: <YlnnX+zUonH86W6T@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lucas Tanure <tanure@linux.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220409164334.157664-1-tanure@linux.com>
 <20220409164334.157664-2-tanure@linux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sk4ebDzxWw1Hqa7G"
Content-Disposition: inline
In-Reply-To: <20220409164334.157664-2-tanure@linux.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sk4ebDzxWw1Hqa7G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 09, 2022 at 05:43:33PM +0100, Lucas Tanure wrote:
> Differentiate between masks and shifts
>=20
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Applied to for-next, thanks!


--sk4ebDzxWw1Hqa7G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJZ51oACgkQFA3kzBSg
KbYw3w/4jp7YI9RnvStF9nA8HnM6PJDHhMUyeuCbA/zv3nc9R889Y6V0ji64/eut
paK/Gk7NcRk0bZifAFZkMDZVhyYLkBB84U8BMoHgC6IYnKcmIpLDQZCa5nxDDD+/
u8qwUC0bLXtThvU7jkqTmwhpvzK/8YHyEsGBHukiRq8Ka93xR5A0u7cCF0HyWu5j
yaucFX9I9d5E2GTuybJRCweOKiLk5Kp77VnFuLfX5Nr31iQC1CrLvkyokJGovEeP
/1nd0dqCF/D9bq83DY6/dKTYfaGImlYgIVXqA7N141PayIZQBYmRRLFdTtPyYA7H
RecTD1TyprJT9LUeiAq/80Fx8g3arNSl8pE8VvICuv5D2WfhVgel9QpGGEeSDrPi
pFBs4IgYBFjVQGmgq1jZ6a4iW0yJ6EMzLeVVOU2QZD3CjKoWkld3MYC+yBTUkrlt
Z4xZcEMPahYeTtj5T7d8lObHgHCaSe/BBwxl6alPcZIg4XaO5ywIdZiHiJZXNGiT
G5nW4v0M/fu0TP+boD/hg2xYFsDUZEkqO3YOMHc4XFeWONUJehupXQSgyemJENjB
IbhWTaPxGCiuBypbpE5hlArpsToZb56ki+V804Ck/x7VWb3/CI7Gl/WylAoGMF4Y
4GoBWcefkdQB4U1Qs/Pz8e+reUaBlhBebqdBA5H+5Jl5rHfrYg==
=w3QQ
-----END PGP SIGNATURE-----

--sk4ebDzxWw1Hqa7G--
