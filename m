Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6A373B500
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 12:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjFWKQr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 06:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjFWKQq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 06:16:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB7B189
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 03:16:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5873C619FF
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 10:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07653C433C0;
        Fri, 23 Jun 2023 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687515404;
        bh=imHo/P0BZYazG32eZWUst48vWdvbHXPQN+NiAbMYT28=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b2mmXiTkKWVzcS2NK9rTUlapdkOJCLqvqs/8xOCKee1d+5yvE1Eaf6bUcPj5tyGR4
         v1u7wo240IsrbMfyrCkIDDD0M18Xjw9Eip8ZYqq/2hjRwY9nb2vXXD06PIlBaoZ4rX
         glCxEiwN950uzuYDpEyfMc+YMUayrtQh/kgPjSN7SWrjKaQDeQqmkvcMOgjgHc8qRc
         m7XjF5n0A7Q7pYnV29jQABvIuyvn6nP3Z8Jd/kqkFmj5E0gzELsyDb+C+P5L59mb9S
         DemWGqXHck0TdehwFe2z8XQG/tT7fNJGPq8v5auHeQtQO0J5VV01DdqlxJsgaEH05/
         g0SnNPiYcwZNA==
Date:   Fri, 23 Jun 2023 12:16:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 07/15] i2c: busses: lpc2k: Use devm_clk_get_enabled()
Message-ID: <ZJVxCJpuv3WXda2A@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-8-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+W49UYkP3hOqNvcd"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-8-andi.shyti@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+W49UYkP3hOqNvcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:56:54AM +0200, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Vladimir Zapolskiy <vz@mleia.com>

Applied to for-next, thanks!


--+W49UYkP3hOqNvcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVcQgACgkQFA3kzBSg
KbYCARAAlh/DIYSxK0sCW6fwKLyvH2Vg9LK5usPKkR6yYUaOxoh1MLuGcnxhVs07
yJgwslX6mAv3x9lZ8fKsAkuB+y+9bVB04b2wzsrOASaxBz+L+/sj+AmnLcIo02e0
UK74FRMp7OU9Y+lG1x4HL+tjGc8jYnN70dIde0ywd1bLNrNO61t/1NRp+QCBwhg+
xhAvRP45+V5890YyrA4Yutyo/e6XFucmMMUfhy6YhvCMHbwt8fE7iJxBtvs2ZVfV
E4aENjpnYe0O61OkBS2hemOKWc1Lv6kBIvOztvLrspBShrZLZBeedtn+AmV2N42C
Qm1ZWFwiD8jeaeM0ehmVCkGzKK1nyW5SVeaqZkR7IBg7j7ukY8WCj6TY6vjW4N2T
GM7pqoy+MF2PaBlIAUpIwyhZ9If9X/qXdOLDdAR2gJrN+DG/+razaFyx95ElP9KV
qGyNgwv3PmiNI2NyxQL/1IcDPbMPxfEs7uTQHv2jlZlqSpU8SdUA4A0B78O6Uvbj
HTYzMEZJ8b4LbnBjWonToh+hEdlap/83ggYTFSckUtpGU+t7VehCpEYp1v+1FYin
NREmgXIN7E8aFddadniqRtJ06zrzSoiHcBDA0mEOrV274OWdOK3FzB182/9NVSqL
AlwuSYi5Tq/u+creM8gy3r0qoSW+O53HlPXZgbRJA3Emf/cn8Ug=
=N8Y2
-----END PGP SIGNATURE-----

--+W49UYkP3hOqNvcd--
