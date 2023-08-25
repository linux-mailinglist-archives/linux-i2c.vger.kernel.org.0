Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8CB788F84
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Aug 2023 22:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbjHYUIK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 16:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbjHYUH6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 16:07:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD00A2686;
        Fri, 25 Aug 2023 13:07:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 39DF362AD0;
        Fri, 25 Aug 2023 20:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3CEC433C8;
        Fri, 25 Aug 2023 20:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692994075;
        bh=kvYJY9GVkYB1KvLokRDqmnYgpNsujZYT6/nl/kMTZHM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mAD1fmKqnwS1/LbiUvdzh0WfHfssTaHymtW7SXRUAa8qq8Y8Zi+AbANCzY8UMR69B
         0aM8w3V9Lwr6wPexmih6fAyhbkkKE6Ukyfw9vxon87sOr1j+PGkS6Lw4W2vr2e0Tl9
         02ADvZ+3COI8ZWf/i4vktTYdvLoVJz6MBKbwyR9kQAZpDMu4old3IbVoFSBetWfps9
         11oKD+87PwhrH5NFOknacLolivH5wbIeG/4FH8JwtEmL2zGn15ejLoK3bGY5c9FVud
         BfIh04UsB0TPrlx0cf5UuRxLG5pzcLKKzGyygTBGSJDvR13O3+lz6PQ/EKneHKKoI6
         0vGJaRg34ODoA==
Date:   Fri, 25 Aug 2023 22:07:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc:     dmitry.baryshkov@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Liao Chang <liaochang1@huawei.com>,
        Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, vegard.nossum@oracle.com
Subject: Re: [PATCH next] i2c: qcom-cci: Fix error checking in cci_probe()
Message-ID: <ZOkKGAv5iBHRNL4M@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        dmitry.baryshkov@linaro.org, Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Liao Chang <liaochang1@huawei.com>,
        Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, vegard.nossum@oracle.com
References: <20230823194202.2280957-1-harshit.m.mogalapalli@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="B0A59Lbk1gxNIIfK"
Content-Disposition: inline
In-Reply-To: <20230823194202.2280957-1-harshit.m.mogalapalli@oracle.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--B0A59Lbk1gxNIIfK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 12:42:02PM -0700, Harshit Mogalapalli wrote:
> devm_clk_bulk_get_all() can return zero when no clocks are obtained.
> Passing zero to dev_err_probe() is a success which is incorrect.
>=20
> Fixes: 605efbf43813 ("i2c: qcom-cci: Use dev_err_probe in probe function")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Applied to for-next, thanks!


--B0A59Lbk1gxNIIfK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTpChgACgkQFA3kzBSg
KbYsYQ//fCeqqLuAljmXlXehorWuqtDXrAlPqj5kBBySFZEgZwvwZk8WtONlY6PL
9I5SLVOwwUIHX7P5p9lrsN6E7dlVcSp5E6olJLV5fY/rANLgd6tLU9XbIvOig9zF
D7atebwcLCRZuP407yt0OMPm8tf48KIAQBHeae5WreWnAdgDzARVFi8NrFrQI1oL
NW7olTC76jtj9/9FGVAbvRAJsQU9nW/tV/ILS+S9rSqO1HLPfF2KXe5Ua6AAvOQy
Y9vPkEWYsNMQO0vzoyFWem6cFxznzLRirtcv6R4DBrjmK64jivAYKeWtUt7i7tIY
NsfFIKZBoMn+XxfGzogeib3ShdqUgFaNChwyh95wmG40HnIRHQn8fBdDzX9tJir8
cYpnHS3zNY/iQh37uZRW+UZUvCR6VEUqev67LaFDm/4uRMAyKUUsVvWsizvMN/Ex
7WOhzWMt/1M67pFBXDFRLssLTEJQ8qZPZDBhvr/97xr1xglGsR8+kLLLRssD52Sm
PHuzPf7KCg/msJ1DJ9KzrBGoIPscpuM38aIleH0DLan8nql3zzCkK2OP3UmIrljh
DMe+BN8NED12eFLkJWUr2oKaa3B28ux8FIUST7Fn24u5myNc6vVAeoBfbsjzcWTC
HbPpPa+ylOSLBscEWEQR/GFW+z8qiYT7ai2yAQfXhBg8kDWEAWU=
=F7WM
-----END PGP SIGNATURE-----

--B0A59Lbk1gxNIIfK--
