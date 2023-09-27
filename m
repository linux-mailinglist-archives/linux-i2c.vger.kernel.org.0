Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6DE57B0C85
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 21:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjI0Tbz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 15:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjI0Tby (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 15:31:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96220CC;
        Wed, 27 Sep 2023 12:31:53 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F22BC433C8;
        Wed, 27 Sep 2023 19:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695843113;
        bh=qi1xKDFFWwCnBLkMoVy0/9oY9qyTZUaD3X8g7C8BD6E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qoXuqIegm0rgyVqtewApMNzZr5aiY6pTVzsWxBdONdjYZ/VW6V2s2rg36k+QAkOu1
         myA9mBKe5bYSR4yb/pIPjqZQnYhV61WyI+aro1Wx/hfSXLzM6rc97IQPCmiOHwiSh0
         nk8h15392L22kogFn7OxSeKXubplk3QF9eTg3Xai/YeeeUuhorZP4Ma8CaIbNVCZJn
         LhSbig01JmELbDZpj/u9LbqPIJFq2W84RWfcXelB8SBoDNDjEX9yhvsz3FF9xbebqw
         bpEju7CvJiKCycQF9nJuDZYk7DIZ/OORqAJbphw3srJq2+WcbtiJ1c0LRPGrHR2ZAJ
         9aFj6MkWQVyHQ==
Date:   Wed, 27 Sep 2023 21:31:49 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "William A. Kennington III" <william@wkennington.com>
Cc:     tmaimon77@gmail.com, tali.perry1@gmail.com, avifishman70@gmail.com,
        joel@jms.id.au, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: npcm7xx: Fix callback completion ordering
Message-ID: <ZRSDJc8NlVkRvp5Z@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "William A. Kennington III" <william@wkennington.com>,
        tmaimon77@gmail.com, tali.perry1@gmail.com, avifishman70@gmail.com,
        joel@jms.id.au, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230924010214.3700150-1-william@wkennington.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4bOEtt9VmoOmGDnm"
Content-Disposition: inline
In-Reply-To: <20230924010214.3700150-1-william@wkennington.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4bOEtt9VmoOmGDnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 23, 2023 at 06:02:14PM -0700, William A. Kennington III wrote:
> Sometimes, our completions race with new master transfers and override
> the bus->operation and bus->master_or_slave variables. This causes
> transactions to timeout and kernel crashes less frequently.
>=20
> To remedy this, we re-order all completions to the very end of the
> function.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: William A. Kennington III <william@wkennington.com>

Applied to for-current, thanks!


--4bOEtt9VmoOmGDnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUUgyUACgkQFA3kzBSg
KbbQrxAAtBOAJjzGWzT1aMnS9rkkiu+aXkQadOouKjQd3etbUWfV4Yf6O0FL7HdP
Fyo4b+hns7NAD2/zUZAVpc/6FlqB7P5/nmUv9ugVMuN1W3bwTeDQRytjfG2/ii4N
k44S4v5I6+XbGdYLSpgoGrKFRBJMdRtZYL5qvhsdiXPUdUEsx42j04xNzmazhzEw
dLDWdOmPckwnu/A9u8kOw/OU7MD8+/VOh8h259Fw0Evo3vSZxsdNJeKyEp5LTIS1
mM/BG6JY2SOu5LBm+8RIDRBnK5X/Bfg0AhGvczKSpdZeiZccapNLbgg5tKBKj4OA
inP2cs2t4dzswZnwKiCr47W5E9mHgg5OUoc7lB5vmHZcJuZCTnoN8adsLh355J+k
3pzlq5LwYTFgbq+iTwV5Aw/Jh6kIQbb8evAp0grCMpX/6FgrrSwQwwQS2MlyuBgp
lLGISV114hFqf5PvnTnmYUf+zUB3lLNeFA21v6l/AGzldkJS6Q4DtvrsvxKRAyim
9J8nYpqH44Jaq81AAkEdI6uCXeyw6NplhdxXkEfO/ZHfGKwrRI8ra3HXzeI6fPb/
bwVuFEIO1gGksO8p/p4ncpBvuQCj9PcVCjbSv/79ndrskvNzi4srBOZ8qydorRv0
Vuj8H4mEli36X01pKZBGFeBbBh2wY4vj/FeU5Q2YVQAxNkW2snc=
=5RVG
-----END PGP SIGNATURE-----

--4bOEtt9VmoOmGDnm--
