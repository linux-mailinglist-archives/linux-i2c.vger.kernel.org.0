Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B66006629C8
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 16:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbjAIPWp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 10:22:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234146AbjAIPWU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 10:22:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8041B1E8;
        Mon,  9 Jan 2023 07:21:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CD4FC6118D;
        Mon,  9 Jan 2023 15:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1A2C433EF;
        Mon,  9 Jan 2023 15:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673277706;
        bh=Pq2cqssVpv2um64tGuLW8CbA38OKeVtXW0pClp5ay+g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l3wlD0K7v7pv2RP/tIsMka1mZDkMyyvkl8rwEzIwf6+WQgWn21nF7TGFcf/bRXLjc
         oQlHeBzOETkIE/+cf1fXuXDj86oFVYIjEiL8Jq2X9QX/azHJem1BmDEERBQWtjH1eD
         oB/zIEjv0FURRBnvGGS7e6c6ml3LcZdrR3/Lx8HRTkPzkz1gSXoRa4Aq9tZQocE5fQ
         l3eph/TjFanhg5RD3OwT4Fj+AQczySYWGaKaqKIB9EGpmrkP1SI6R1/XP21HI704DB
         pYMfrTGygh1Brdim+1yWQs+ZDubeFt89sI57VwpA1SjyqybYOesVTVTqJx7ocG5FPL
         7KPMPzpvgNSLg==
Date:   Mon, 9 Jan 2023 16:21:43 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        neil.armstrong@linaro.org
Subject: Re: [PATCH -next] i2c: qcom-geni: change i2c_master_hub to static
Message-ID: <Y7wxB7sLClQUAhgB@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        neil.armstrong@linaro.org
References: <20221228093403.3165722-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ovKzBLZyr3tb7Iae"
Content-Disposition: inline
In-Reply-To: <20221228093403.3165722-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ovKzBLZyr3tb7Iae
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2022 at 05:34:02PM +0800, Yang Yingliang wrote:
> i2c_master_hub is only used in i2c-qcom-geni.c now,
> change it to static.
>=20
> Fixes: cacd9643eca7 ("i2c: qcom-geni: add support for I2C Master Hub vari=
ant")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to for-next, thanks!


--ovKzBLZyr3tb7Iae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmO8MQcACgkQFA3kzBSg
KbZd5g/+MosuuEWwiOezIqmcVLkH5TWR2DlPt5sGMINLD6kc7/q5FbZUYCHmebhP
dYfdSRJZ0W1Hn4UKtJX3NUWe8aB0hHK5oKu0TKCQYGC5la82MboKVbJnuHH2qDNj
Beues+aHtGD4qGjMwwgL2At0FWpvNxlKd9lelZUkziWkEeIRWoVETn07AIJdsiX+
8wFG/1ZWDPPGig1hGsaBhdckLdc6s1m/7XqDYcJFUGwTew3stcGWmsbk5wAAwnmt
Zt5iAz1BuWE6xXnpjeJu9nVNvrCZFJhyxtgTRO8tOIS7aWlGs4C5G87btt6EkGDk
Dx93XGvP3ULlXPEKWzkLgEc5iLEFnUcx/+jDELySRo5b2321Qcz5FgGokmXga3Wa
etTGRICyZdkKkE0sEPLsyFlZjId+S0dI6rsAISg2EDhfIsFXGf88OgzeGKPgs3Rl
VTNgYM++r7WOipm6OWHlVeiAYmpWSaWAD42FdadLZEUGnIUTz/oZKFYpH9JYKS2b
2NoBvgV5vu3jSZ9DEsRFKLGCEGAaH0SBq0WQjn4KSYBNqb9MribxE8AGjKnZm56o
hJCWNd84RQqSZouDIPegJhvWYl17/KP0gL9rxEPKFWAeGteTYx9Soj1fiZx0G1CF
tBHRNi/gfgbgR1DMGIZfeUHwET+WHCOUbLNGlMgN71GczsgqFZA=
=/6EF
-----END PGP SIGNATURE-----

--ovKzBLZyr3tb7Iae--
