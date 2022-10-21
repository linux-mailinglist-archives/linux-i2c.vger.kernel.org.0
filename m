Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD68160704F
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 08:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiJUGqo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 02:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiJUGqn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 02:46:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5DD1AD6AD;
        Thu, 20 Oct 2022 23:46:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AD6D261DD8;
        Fri, 21 Oct 2022 06:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7097BC433D7;
        Fri, 21 Oct 2022 06:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666334801;
        bh=bubvLQWB1sUU1KkIeLghnVMfGA+k2ZKujgBoivY4kwc=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=U1i1XfFXvs5/ikSqtUqexz3VEzckcOavlygbiHeknTA6wQmXHOV7NEtnDlPUqqcqP
         0kldxzprBKJPAH4IUucRSW0o4Q4eiKcIH9UXW/cgqIAvX8fQ7Yx8v++QnRQtvjXJXw
         MG4bGCBzqhl1rILnJFOiF9KqXe4r5E1tvQV1oCkdOTSQVJon8BlvsMyz8yk4N4996W
         ahhOEHPaSiiaLbTySwCY+NmI3debWltVX9KLqOtvyJXpJu2d+0dFT6RQRaymLuoU7m
         Siv/eP7jl1E4AJRd3r5IjaYx8sU9c9DuO6CAzuUhfRe6jyrbuswrlagCYYkBGmNCQv
         pJqXIYB4A1uYQ==
Date:   Fri, 21 Oct 2022 08:46:37 +0200
From:   "wsa@kernel.org" <wsa@kernel.org>
To:     Asmaa Mnebhi <asmaa@nvidia.com>,
        Ren Zhijie <renzhijie2@huawei.com>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] i2c: mlxbf: Fix unused-variable warning
Message-ID: <Y1JATQQ9E0fjM93K@shikoro>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
        Asmaa Mnebhi <asmaa@nvidia.com>, Ren Zhijie <renzhijie2@huawei.com>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20221009133822.254122-1-renzhijie2@huawei.com>
 <CH2PR12MB3895C3FA56AE40EA043A0BCAD7209@CH2PR12MB3895.namprd12.prod.outlook.com>
 <Y1BTlflJKNS8JmI1@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="52vh7K2DLLEJAkC1"
Content-Disposition: inline
In-Reply-To: <Y1BTlflJKNS8JmI1@shikoro>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--52vh7K2DLLEJAkC1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 09:44:21PM +0200, wsa@kernel.org wrote:
> On Mon, Oct 10, 2022 at 12:00:09PM +0000, Asmaa Mnebhi wrote:
> > Acked-by: Asmaa Mnebhi
>=20
> You need to add your email address as well.
>=20
> > If CONFIG_ACPI is not set,
>=20
> Since DT support is gone now, shouldn't the driver actually depend on
> ACPI now? Then, we could get rid of all the #ifdefs in the code?

This has been submitted and accepted meanwhile:

http://patchwork.ozlabs.org/project/linux-i2c/patch/S229897AbiJTWqk/2022102=
0224640Z+957@vger.kernel.org/


--52vh7K2DLLEJAkC1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNSQE0ACgkQFA3kzBSg
KbZ8Og/+MUEdlilgl4Ix9MktDfryIigT8PrboTHu/jRzGOjDuDrrHhLQnYETe0xW
WoIVq+CBaaeaoP547SoPzG8XbxKmfDMx/gHHmcZu+R87b9PAwJhwLU35Y9tVtCak
t1L1mewiEaQqNYE30vRVhIyFOdobP6HoV5V9DhioP0SahFTh2rbRIjshGkq4yZ/Q
iRY7Xd3ktt0PKb5jWWOMudcLppDS6Mej/Y1A2Rg1E2HfNgVG2Q5Jkpd7y+47EMKl
szShJHi3ljiKVg1si3G7ynl14rSoSz3AZOIO8OSqhW8jne8AEh1Vt+CjcqW/ysZI
PzX55UTUsJGIIoM2McLX7Ny3Gw3tWmr6WUOyPsiqK6yA+fXEomcg1PiKpAN2sF7v
K+PlxA+C0Xyow4s+Te8poektujFLPgM0vC2mJWB39uG2G5wVGGJ4cZGWaPBJ2HJe
5Xmen0Oy7ueUr3/24xtBN6PVRQquLLtRoUjrz0b3ZY0fIf8HN+0XxanLfA/WdBda
mI0s6QGfKUoFEEqTD9Pao34ULRN0h+vWbqq34IVzsMvWZBM9yy1BNRF0jyhQh0Da
+bN1XsaXtnHVh+wT0SnQFkcg5lO3Wd990PocVp17ZxRPMwotuZd8FzUyHbBK1Tw2
MqBYTynrTsN2T82mJLCceZenB8J7kcryjkqb194mbD1yk8yJ338=
=Z6Ja
-----END PGP SIGNATURE-----

--52vh7K2DLLEJAkC1--
