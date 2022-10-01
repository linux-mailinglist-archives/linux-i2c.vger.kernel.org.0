Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB1305F206C
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 00:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbiJAWrf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Oct 2022 18:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiJAWre (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Oct 2022 18:47:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47ACD3FA11
        for <linux-i2c@vger.kernel.org>; Sat,  1 Oct 2022 15:47:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 02A30B80880
        for <linux-i2c@vger.kernel.org>; Sat,  1 Oct 2022 22:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D57C433B5;
        Sat,  1 Oct 2022 22:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664664450;
        bh=jXGh2bZp0gIjKn3cnwdgmgVrXFExvZSKVDfSzpdm2fA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T2MCgrJBpewMo9Lrk/qGC1eFYl+ojCN/x3C1JROd4SKd7vJxU8gNvjfvw2WPghxB7
         K5t3hSTZel34DJJE6P3UHjCcAylwhLNzGnTFaKVDXju9CUOHrZlJ5sOKTNpnALvqn0
         jqm7LYeepR0Jrwo4EyJ2otvSa2NCnjgQOzSIsnFFtapaZO4Y/5X+6SdZGApBYV+U6z
         IhU2muoKGZuZTJ3e6AvBjX1Fa0t2q6REFXeCs4/PoskvkL7LHwvqeXhuY1+tF+Otyx
         SgPLFgDi67nG/c99zPNEXHu0opoBVzn6IXqFqtfQysLusmEr3qHa4AhYHs245+LOh1
         yAD+e86ZX1FVA==
Date:   Sun, 2 Oct 2022 00:47:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     nsekhar@ti.com, brgl@bgdev.pl, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: davinci: fix PM disable depth imbalance in
 davinci_i2c_probe
Message-ID: <YzjDf3Gs49j9E2x/@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Zhang Qilong <zhangqilong3@huawei.com>, nsekhar@ti.com,
        brgl@bgdev.pl, linux-i2c@vger.kernel.org
References: <20220929143038.60864-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3dmNTwoswuyrxLOv"
Content-Disposition: inline
In-Reply-To: <20220929143038.60864-1-zhangqilong3@huawei.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3dmNTwoswuyrxLOv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 10:30:38PM +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus a
> pairing decrement is needed on the error handling path to keep
> it balanced according to context.
>=20
> Fixes:17f88151ff190 ("i2c: davinci: Add PM Runtime Support")

Space is missing after ':'. I fixed it for you this time.

> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>

Applied to for-current, thanks!


--3dmNTwoswuyrxLOv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM4w38ACgkQFA3kzBSg
KbaLRg//bwHCmguunRMFsLXJXlYBcCUekkDWEgvAKpiu+cE9bLgBcet731Mw3Rgh
zJGreA7oM4QVYp15uap9g5TFwzhF/XB02iEEdaGUgWjUW2cDUNLf4ZG5tCFA8Qio
Gi2iZDRSpQMeAmcuzMhN8tRTe/dmCEUQyTOKCI2wAgSdTOxrdrp81lnNopy1FkIM
H8icuA1rgBp7FGk2FfqNmTvQunP0rrQSqUA3xySzfjgiEw7YMG04BgRnp5qktnoL
kcsPWBOxyVNOqbzdWuaWWnE5P4vdJvEG7VFgE+W16LTskFuq4E67vGkWalK2SICT
rZ2FYJ/9Fun/OSWfe6nDhI++w5P5YsQsgjE5ytfiCr5T3vFfkV44j5oK2KgOhTnR
b2Y1xnWtumlNSmKH4gjzvdpAE7ro9v44/USIiWK/IuszBRLPUZOKVi4GShB0hEEB
smnEDizT/kpPcwxtuMyWXpjJp3umlm7VPXMY7RJ27keMO/GWkJcS8ipfRl3GZuoJ
pEAlen5eaJs5W4QDBoewkHYHG6PVvzZpmbGD4nRwPbbtFBH20Ipq/g0F+FhwwhNv
qBX8AJce5CZ9M2HH6MFSrVv7Qpx6hn0tVV0x9gcPE8OdUCiu2+KuGF6Nm1/8dEyX
jjjfcJg+SxaDKsNSCyzOCvhQ2ruXRLETO1ctu62ndATRgCGRJSM=
=+NZA
-----END PGP SIGNATURE-----

--3dmNTwoswuyrxLOv--
