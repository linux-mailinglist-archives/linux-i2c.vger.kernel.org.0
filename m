Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6FE57B2D13
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 09:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbjI2Hd0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 03:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbjI2HdZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 03:33:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 079141A7
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 00:33:22 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139E7C433C8;
        Fri, 29 Sep 2023 07:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695972802;
        bh=lNS5a6mFHaWPXk1rJvxJGtirkZ5Y2ax+5DsdVeuLm0o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MDsK0GkxuBjrh7njzkwJNI35J2fVCDWJL6zICZXSnEhm0mo9m0G9Sf3rpmvnfLbRi
         i+mprGdNjfCjxuvmsxB6sjlVLM/9+3pKizfpq+XJkJfS0BPpKSJpT2qanFNBaQ4aeR
         e0Lg5DU0Ls1B5eeGGWguKRIbT+kOAeY/RfQ3cqdJKnzqJQX9Dge7gB9I1OKd3FiMQA
         D31hAii479hlF5ew0oLFmXvIwLBbpdKbkVf90wdpLj6WIyRQxzjF+yf9kzqlUjyF9r
         uuPA3bSD/xZF/hK2OiTspBEwrej6hrUh3tA1uSulT4en8PmoEkOO/T1zTPqiZFBYG1
         TbjyCEvEvRKWA==
Date:   Fri, 29 Sep 2023 09:33:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <ZRZ9v3GTLcH3kBnw@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
References: <20230928101655.47d3dd2a@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hSDfBXN4lzOTnxP2"
Content-Disposition: inline
In-Reply-To: <20230928101655.47d3dd2a@endymion.delvare>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hSDfBXN4lzOTnxP2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 10:16:55AM +0200, Jean Delvare wrote:
> The i2c-amd756-s4882 and i2c-nforce2-s4985 muxing pseudo-drivers were
> written at a time when the i2c core did not support muxing. They are
> essentially board-specific hacks. If we had to add support for these
> boards today, we would implement it in a completely different way.
>=20
> These Tyan server boards are 18 years old by now, so I very much doubt
> any of these is still running today. So let's just drop this clumsy
> code. If anyone really still needs this support and complains, I'll
> rewrite it in a proper way on top of i2c-mux.
>=20
> This also fixes the following warnings:
> drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' wa=
s not declared. Should it be static?
> drivers/i2c/busses/i2c-nforce2.c:123:20: warning: symbol 'nforce2_smbus' =
was not declared. Should it be static?
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Acked-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>

Applied to for-next, thanks!


--hSDfBXN4lzOTnxP2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUWfbsACgkQFA3kzBSg
Kbbv8Q/+OliHq17HuBB/949NMPHakHdj1zyBMYuOn+D+64PXVPDouuOETL3/4ll/
ThgoSoVgsP6fHOzwDxHQcM7TXT1BRs9APJfMGYPNieSxvlpnabGn3NlCNL9LukVz
rNjXP0rCenQQ/mhY5LuA4tF2yX0rKh6SJA1Cm/zlkDutboz3WFk/Ocjhvtsbv9rL
hPgdLYVa2VxMJDqlxxCkt6lQQIkKiwS60WqYRXC5Xpb4yVARcri3eWxOzPDphkHu
v02mrOLeputwl9hqZrHLML+PmMQW41P7DdPs4hfKm8nl7pXc8zjAmB5gx0130DtR
jnw8q4+G90fpULBx9R2yvI9V0gmuOXlAg4RrDBTAswoxG8ut1MIWFVT1HuhrKTlX
e109IEOZquSYWV+SFkIUvIpUQd6+miB03hAF3UtARCKMHOae0Bfc0VWYg2kEb3GK
IgHw5hKEzAANl3xbk+vTp+dccqusMMDDkLc1A3YvDjjWLuiZXPqwqF0JHVpQLIuQ
sP89poeM3lEUw00JoK0/wAfIMtrW1cz60gP3QoYiMSCZnJNX6XOObZRw+DNuX74w
IRNLDWPeThl8D98b2eKqIBph/3VKAHXBDduOjTUI/zyJA/IcdaahdewJAUW4hw82
4MUEDIB7CjzMtIlRObME1YOQxHzqiFUdacfToqq4YFEl372khQ8=
=oVjU
-----END PGP SIGNATURE-----

--hSDfBXN4lzOTnxP2--
