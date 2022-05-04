Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5776C51AEF1
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 22:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235679AbiEDU0t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 16:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377965AbiEDU0r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 16:26:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6C84F442;
        Wed,  4 May 2022 13:23:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 54714B828CC;
        Wed,  4 May 2022 20:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC16C385A5;
        Wed,  4 May 2022 20:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651695788;
        bh=QrFCUWQLjsqhifr4JEmhceDzfk2B5iNFkT32BfKeubM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=if+h4McrpPmTNKjn2RKQXUGiYVtTAKmeG+sOji0xT0L/Lnz9+IYe/fX5OJmOqtQ40
         TYRWouVw/69w5U1CAhtLD39tM07FZxMk8nSt8Y2D3AtfDW36q1mm6plY1+tY4I1c71
         tgDrBk5Fvxhmyy6BFgy5WeGWMag7Sy3hClF/dEzvWeIUpssKq69Si2EVzsNOYY7P0T
         Rpn42TzCU0bsaOKsL95RdA3mVeUzGgbvjTL5tKULG3iA9MI+pqxF1DI/vFmbXrLjJz
         4/S2UCzjIy+842RTSF/AuorMU9/9b7jIdu0yuyThVk/Tnys9B6fXXcr8p1GcwXSf65
         sGmSRUCy0W94A==
Date:   Wed, 4 May 2022 22:23:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: at91: use dma safe buffers
Message-ID: <YnLgpyvVjcbiCs7m@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220407150828.202513-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xOXT6sHbYu1zHM8Q"
Content-Disposition: inline
In-Reply-To: <20220407150828.202513-1-michael@walle.cc>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xOXT6sHbYu1zHM8Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 07, 2022 at 05:08:28PM +0200, Michael Walle wrote:
> The supplied buffer might be on the stack and we get the following error
> message:
> [    3.312058] at91_i2c e0070600.i2c: rejecting DMA map of vmalloc memory
>=20
> Use i2c_{get,put}_dma_safe_msg_buf() to get a DMA-able memory region if
> necessary.
>=20
> Fixes: 60937b2cdbf9 ("i2c: at91: add dma support")
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Applied to for-next, thanks!

BTW, my name is Wolfram.


--xOXT6sHbYu1zHM8Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy4KcACgkQFA3kzBSg
KbbfyxAAqlBQgzYvk5zFGEKhaJOpGrt6dl2RWN64FtS403YefsRtT95HSriFq3+m
/e4ZcG75CoZoH9B7kiNlKvA7fvqmmkxLDn+PHfr/gsFpWNmuGC6NhP8DV/qzFjPi
HWbJBjDWeoA4UxCN+98eEJtH1CFaME02LA74eErk2BpKmAxNXqjd3oFUnx0B6NpB
ues8UFCXX87HZG2sJxvDWIVlPifcsuQmwZMFiJyIY0hRrfkJEbb5hRstKjmRgJl1
8FKtw0511JmsEaekOYvhGZdZVFtnc8UrZqLvJAmKncnR3ps5GgMA7R+49VFgiAXE
PeYXq50jHuOYPmBPMH2U1dGq5s0mTdMTAJ/mv1HO9YRHVBrUu+8MEbtqZbbIFzoS
1h2PY5/dLcMPKTByRMRtU4H5+1ltOUZmIyaBfixCGf8Wuw20FQiw4BDc8+nxCLLE
aQY1u9phdBhMziA0+ofpoBNi1oJr2wi9WpVl90TPen0a5uqclQI3aroR8NoVvmKX
WFWx9XZuHyAfg37BHRMolpBJTTHI20b8+H3BxMSELmKqW+e1XNCjfL6+OlgSuz+Y
Rzsx/SW8+0FCSaH+k+TFbC9Hf4qkFzOqua/IRctoALoGDDIea+Z5rsNzU3LPl2DZ
vB0p8iIyT14FzyaQ0wE2MBbbOapbFXWqjRpm3rRGcu3FA8G/uIg=
=qsBO
-----END PGP SIGNATURE-----

--xOXT6sHbYu1zHM8Q--
