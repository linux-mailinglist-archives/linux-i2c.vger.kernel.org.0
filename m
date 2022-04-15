Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 214C55030FF
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Apr 2022 01:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353798AbiDOVWz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 17:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354560AbiDOVWt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 17:22:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D341939AC;
        Fri, 15 Apr 2022 14:20:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 11B37B82E3F;
        Fri, 15 Apr 2022 21:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8955C385A4;
        Fri, 15 Apr 2022 21:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650057616;
        bh=l2ZVDxltKOnnpwoAj210vzCJVoPCYcAtL2GWUQC4cj4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RnjJ5AjuKUPX1wRtxl+3BVj4UkbCIrdib1v5NY1rBC74VkZOMwsi85R7jyzu5YU5c
         p2PdOnsi3Zbzp8xmmxQuKT/gzSqTDpne8HPUY2L+KS6zDZBE7kB53hyROLvaxznOyJ
         EVgwjihJz7OBD8m5ltnhBUwAPQhuMJQlH8Biq2ae040sMURV9oBWtAFFGnsSq9JyS+
         zWhggHGjmwVyGqZ7KF95qTMg+C1ZOLqoRibKd2YCQxTa7xI9aTgtxqnwGxKec8A6qR
         mz6bnCeZX0n8qsjrakw0NFg2+8XgR8S1OerzKYagpq9LKwELDXouL3tFwRfkNx4ALi
         delCa2KV3VeUQ==
Date:   Fri, 15 Apr 2022 23:20:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: Use dev_err_probe() for GPI DMA error
Message-ID: <YlnhjDeL28/BqRsB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220412212601.2384274-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OV+uEBO8NXGeJuvr"
Content-Disposition: inline
In-Reply-To: <20220412212601.2384274-1-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OV+uEBO8NXGeJuvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2022 at 02:26:01PM -0700, Bjorn Andersson wrote:
> The GPI DMA engine driver can be compiled as a module, in which case the
> likely probe deferral "error" shows up in the kernel log. Switch to
> using dev_err_probe() to silence this warning and to ensure that
> "devices_deferred" in debugfs carries this information.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Applied to for-current, thanks!


--OV+uEBO8NXGeJuvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJZ4YwACgkQFA3kzBSg
KbYwtg//aA/fMooSYp4Jb9nM70vfuH8wDAmD4x77SDbcLIgucludzPYo4cMVl7BG
iYhEi79oOe9IKPxF3sL1QiKYhdje6iv3mSjILqq5i7dzVn1XMOaYc77PqQcHdmjn
KBF+//H0xMzs0pPzla/BRi0SSgzb1QzK67xAtCPwh5BFYGCaGvcVQiy1dpI3twx5
lBfIouFl1TN9qIEIXfdKCbjlSpEhWnv+GeG4Td8wOdd9qqqw6CupdaPyRZiJeBgk
SQMYjxRcB5nehyfGMRNb+PRksfQLKAuINjfFoKEIYG9NzpaX5U99FVw73RQ6meyR
2ik8f8LO9lOCFYqI+TmvOcdwLpXT2C1aYU9cgsm+PhDNeLnzGIVzNeXxrjdhlf8c
GFt796I+HcKKRuvtuxiYaVnXhiB4jH9SSYjFtxlG2Mnp1+KnuM8Wy3ADi3xS8htV
M2zqLgZ7SzTXlHZfSRmnJXmv6h2qmWEFBBNcdPtWGc/r97+aH1r92Gdwer9mS8tn
QN1XbxY0sbCGRZ6/lH0tl1MMKyVibtsSqGj2nBR6YfguhnbLd9an+MuYNYfMqkyz
ZdoaiqiF+vRC4HUBfhDF+FIN/f3wTnp7e60isyVlv+04ZIUdi92zIb5/rb/MxBic
IuLOimNA+Yx3lExK0jaucdj+z9Atn7EqgzE6cbn+9mV2AGJ5gn4=
=mUvB
-----END PGP SIGNATURE-----

--OV+uEBO8NXGeJuvr--
