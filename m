Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41E557220DD
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 10:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjFEIVi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 04:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjFEIVe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 04:21:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A626100;
        Mon,  5 Jun 2023 01:21:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D8DAF61255;
        Mon,  5 Jun 2023 08:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EFAC433EF;
        Mon,  5 Jun 2023 08:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685953277;
        bh=CzcsYZ4ufFeVcmQTCuhbju+7YVG2PkIJVUvG0kNtkwc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C3MLc2MW1y2lMhfmtMy6Gsq7lgzfzXhnzCGxT50lonpJf48e5l5hHFxXPsXuX1L55
         2eYHC3HdC5K2Y8KmyDw7GodkrCQlykud/4pfIRjiFSds96lzbxVyHYD6RIAUHHTdaF
         T/40BRKR133odc1W99U1LifMOGYgr1W+38VAZcZOLzbjLVFeBlRYwEC6DNyJhVQdh2
         VDBZBtTUcW8r7S+OAhXjKjnddaYvBle14404g7q9qPoiPe0B9ZU+k6y7/B+uwPmzNI
         fVL2+N6f+QP6Pmg43dAI/uf6aQIKfoLdO2MYHLeL/LtvIEFf6SiNl99G8lLYLUkITB
         qJiCZWnYeNZrQ==
Date:   Mon, 5 Jun 2023 10:21:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     christian.koenig@amd.com, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, thierry.reding@gmail.com
Subject: Re: [PATCH v6 RESEND 2/2] i2c: tegra: Share same DMA channel for RX
 and TX
Message-ID: <ZH2a+S/1yeV5gN07@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        digetx@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, sumit.semwal@linaro.org,
        thierry.reding@gmail.com
References: <20230427123915.38199-1-akhilrajeev@nvidia.com>
 <20230427123915.38199-3-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LDeXN0taeq+/0mbk"
Content-Disposition: inline
In-Reply-To: <20230427123915.38199-3-akhilrajeev@nvidia.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LDeXN0taeq+/0mbk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 06:09:15PM +0530, Akhil R wrote:
> Allocate only one DMA channel for I2C and share it for both TX and RX
> instead of using two different DMA hardware channels with the same
> slave ID. Since I2C supports only half duplex, there is no impact on
> perf with this.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied to for-next, thanks!

No, there wasn't an issue with this patch. I just needed to make sure
patch 1 (which was for-current material) landed upstream to avoid merge
conflicts.


--LDeXN0taeq+/0mbk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9mvkACgkQFA3kzBSg
KbYXNQ/8D9obKSmFAjE8DXoSZo4dHrcRL8WFA2Bkt45Plpabai8HWhOfI2Th/P70
1pgGZ6tPyrRVG5ZxuCaQ+xhwsm720AVLKIPEKSWFM7tGkzBGk2K+5UOHn8cesyd0
g6Q/RPOoHZTmU9x6xFnWkj3jeFGyIdjmTjiTy7pUPkR5iw+cLPmGymq538BfxicH
der5ucFnJ5RjhEOt1SEP7P7i5ZacJke3dMCNOKK5pC1Tp1Ky8IwvzIVSMJ3XQLVl
sF64VKFkkrl8T28Lh42isLiS+ggDeleWiuFqZXIrZppcA4mnHEE0JgrTigIX+YXE
K54HhsvQEM3w+FU1xh8GbZLukHFUGf7rS0zS7midFdN31aDbw28h2PAxPojKcfEQ
yHsmg//l5aI7cL25hza0ZGKwqbrzd2OyWe2PMO+nWQ8FDBPKM0jAbzC7/bVQPj4j
nj8/lN4gNWBGUGRmikNyoUJAqExvszSLpr6L8FXA+K96NlaznSt6IHYIW/O4wQqD
UYh6sMPf3qA8YcRnB0RHZEZa8vigqTcZtq2hXclDH1K2yksxML25w/gkRR4AitpP
XRhS1bwu/yWK3gDNXPyBrxcq9bqrY53GCNCnFA3t/yz20QHN3QK0mHwtk29O+xEq
l4Rib6LWkDVMCQetMbolBe7jVFvH9mC8mY2El7o5tQwPjPPuW1c=
=vSC3
-----END PGP SIGNATURE-----

--LDeXN0taeq+/0mbk--
