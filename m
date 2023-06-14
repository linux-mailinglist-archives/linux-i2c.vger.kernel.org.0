Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE0272F80E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 10:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243446AbjFNIkt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 04:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243683AbjFNIkr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 04:40:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E4D1BD2;
        Wed, 14 Jun 2023 01:40:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 26B2A63EF7;
        Wed, 14 Jun 2023 08:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BA9C433C0;
        Wed, 14 Jun 2023 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686732045;
        bh=uYEr2AWlYvSrSez1pdsQpkYDnx2y4lKZqdexEQK+6U8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=knK2MtCzrVrzyJvrvvgA75tydiV4eBRkk/TX2ET8DOinPcd950irE9RenM2EXQBwk
         KB6rv4WSeRhryajI1PdXNli6l3EWYTPbMYHWwGBaQMt6Jg/icVNitDY6CmWvgABzeN
         fTap6F55PWRcecuaP2/7vAts9KdG849WRkKLhx99wJNZJ2w+3zo5qoIN01pt+PtBrd
         TG96sHErHo8qOjapEqRT13m2JXyVw9CNj5ce/ZL3ntUbhrfyr2SKWtSymTWRv+/W+G
         giT7hv3KXY4PfOc4Ia7RZd6ZrYdoEctQPkdDRAHwpXz4brshoHBGtlKIAVQfOKMnVv
         BfPo1tYY1lNuA==
Date:   Wed, 14 Jun 2023 10:40:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     ye.xingchen@zte.com.cn
Cc:     linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: versatile: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <ZIl9CtpIfrIVgSMA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, ye.xingchen@zte.com.cn,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <202301191721230148862@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bHCzeOfie6Gtlp6I"
Content-Disposition: inline
In-Reply-To: <202301191721230148862@zte.com.cn>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bHCzeOfie6Gtlp6I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 05:21:23PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Applied to for-next, thanks!


--bHCzeOfie6Gtlp6I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSJfQkACgkQFA3kzBSg
KbbenQ/9F2x07scPwaUNQ8HK0yUchBwBw/zakNtSV7t82OeFy1spezRXU2wwQgL/
Usu13NaJxkZ1Hp+33hkhougdqoYS8X3IPddYr0JEVVrTsCHisMxG7WOXs+hRtnwv
84YPGi7ILtP6NIpVrnMVB80p5Uh7H5YwUP5/SH3osaV+A284+oN1jhBKPbJpOXnC
hGPvV/ZM8wphTa4FV/Rd2p/MHdzuLm3HN43YfDEC5rd6Q2wwjqaRh7Gcb8a3SSYX
hpH4gYCxpB1BGZzXoGrVfoBZUeF4smBCcBG2ajLJBKWXJmuyHjvcZKIHuautMhR8
QxermCNhld2BMxco3KvoglWwohNB0mTuob8bXU4TmesbBN0iWQfNnzq1Sd+xY2bM
xufNk5DQ8GNx4DsXciEdnzSD0PoRG34zkJUR1MHN4CB8B4xl9t4f5iNx3jPgXmYx
GV0VvtOwXhz1IGblB0AchobFV7udivTqFZtAA/gI2UP7R1/H0fRomC5cstBf3Dml
kM+Tx/smXSYcQl7O7EhqRJY7FIE5KmQmlqIibGuQGPkNyJ7DMacR8OaVrnWW0/Dl
Vn0Zgjjo0Nv+pWkpNoPuAKS9mbKfNfsoa4oSraz81CiTqCzQNM3DVK2WJ+B1Y4YG
hZCLb7UnrxpD2bZaoEEgHKxMxsMyfH6JhQPTzhcIhOYhF1C6Aj4=
=Yxy+
-----END PGP SIGNATURE-----

--bHCzeOfie6Gtlp6I--
