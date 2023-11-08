Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B25C27E5288
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 10:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235393AbjKHJSU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 04:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235475AbjKHJST (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 04:18:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09D410A
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 01:18:17 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DA5C433C7;
        Wed,  8 Nov 2023 09:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699435097;
        bh=bSm6jEOqooYuoqoXFz+RxpEyBDmFfEV0S8uqG48Y7ek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AeY1zSy5+eJafNYr1KSrpYAhhWwvy/d3KyZkLGwaY5WBoMysQyhQnIWriPeoPKGVE
         rNLeWV5Jc9oKUpa+CMLMUKY75McE4dZy285SyaFvqwHu//EOqYU8FW6/akNtyQ6DbV
         AZx7I3pbSW3avXgs0r38b+weoSpNWjrJ22Es63O1uq8C8rf+zTH7WmXwSZiS9cfVVF
         C3UBCpb/kZr5r8Sn9eYYmK3BDuwHN2Yu1cng/0bzHCFq5/SgMxH0Uc2gyYiWJfMbSO
         bWuxNGoWCmMoW3Po7fTpYey67xDvs2gPeYkEe4/ntkx6DmDs4Zn+imTIX7BSPvP7Wc
         MJbNzP8jUkYUg==
Date:   Wed, 8 Nov 2023 10:18:14 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/1] i2c: lpi2c: use clk notifier for rate changes
Message-ID: <ZUtSVr/cI/EVgq0M@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20231107141201.623482-1-alexander.stein@ew.tq-group.com>
 <20231107212049.csimqzzvim5uecpa@zenone.zhora.eu>
 <22082032.EfDdHjke4D@steina-w>
 <20231108091513.6ddwhu6o6lbvvmag@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FoCUYU+NpuFkyMW3"
Content-Disposition: inline
In-Reply-To: <20231108091513.6ddwhu6o6lbvvmag@zenone.zhora.eu>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FoCUYU+NpuFkyMW3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> If you see your part in my reply down here you see that some
> parts are missing. Perhaps there is a bug in lei that has missed
> the top part of your patch because in lore I see that, indeed,
> there is nothing wrong with your mail.

Seems to be a lei bug, indeed. I can apply the patch from my mutt inbox
without a problem.


--FoCUYU+NpuFkyMW3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVLUlYACgkQFA3kzBSg
KbZ3rg/+Kwpe8giT0k1ZBFzoH941h4z5WYUqtlWSHxiSEndkd3u2dBElBhQHux4H
KkYa2Kx1jx2n2S/j3UevCkii4LcRoaknA1FIovkKwt1LvrpVvg5U19VIM6oyXXg3
Yb96dQH2Pc+2G1hqFTRvYI89VPssOHPVwxu29kQAg9O4zVX+UBCYFf98ifNUYpn+
T/ujlMqkrNzwIschvSWgAqzsxI84+sJ+B6SCOBbniTWeX2vYBitpNkougngEUykn
bgzmJ6PkNlqJA+pmKKjm9teiUpKatnarTim/YyKa5qajNl0o9CaNDkEcB5uJSzHN
TnsEU61AwY0a+RtfgILjXZ9HSne0Vz0Ow45+r3ih6h7BtbJqJ6STwsphYuBaI15k
RczXyIj7NmMAZmBFXr0rqT4mnoeobnoyzLAhUgET2/fzGqI2pThjG4+3FaJrt+x2
9l64zjv5brSyqnHuQ9r0sOv2BN8d8D8Q2BoIKaFGoH4mjMmsvN9ZnPnF2/QX3OJL
OrD6pfIm4c0QkMFa0Uc9FWGUhT0OD0uSE9AxU15zSUftQ6IA0y1kTe60IYkNy0cF
36tQTR9MRvJbJOC3g6m2m3HETWC8PcgOyE9V6EpijispeSl5iqijxhEaNaQS0zJ+
xsqY89XqrZcS3alvNPZFnh44DSrWihZCZhvP9VzrEOu4YH3Sgbk=
=M/kl
-----END PGP SIGNATURE-----

--FoCUYU+NpuFkyMW3--
