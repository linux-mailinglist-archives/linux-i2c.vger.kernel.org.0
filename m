Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C98C4D6995
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 21:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbiCKUkX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Mar 2022 15:40:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiCKUkX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Mar 2022 15:40:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032221D86EB
        for <linux-i2c@vger.kernel.org>; Fri, 11 Mar 2022 12:39:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9711AB80EA2
        for <linux-i2c@vger.kernel.org>; Fri, 11 Mar 2022 20:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4228C340E9;
        Fri, 11 Mar 2022 20:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647031155;
        bh=/VeTfkzM0BTiAmO2w/swnUVC2biB06/c55VpO/PgKyg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KkhTT7/xBuflyKVMKiAzUAv//ddQMz2i+cT8H/TSV0n+EmsNWHlMOgqj0edpkjUty
         6UwZlC93pCYK7Kkxv4hf6eXW9mYZ5MJ/2GSh+pfww1xt5FWyBezcpRmIAaZnnzi9s1
         b1JJlgnkCjdxzPnREt6PNiP70ZRMC1sYki4NtrTqOAdb4Gb2aJXuriF1NRHJKP3fZk
         AQIE3qqOQtvOcVtX9iyqgP/xksB7hB4BiWqasZ2aKGrUnizQxL6cF31+glN9iv7SKL
         1UrRMCKu3aqzHZDOz2pWDPAzQJDhB6hIxZ1L4xjZ/UxNGv9jj/kOLHwikYKMpPZ7n/
         4mXFIqw95uePg==
Date:   Fri, 11 Mar 2022 21:39:11 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-i2c@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH -next] i2c: designware: Mark
 dw_i2c_plat_{suspend,resume}() as __maybe_unused
Message-ID: <YiuzbxaNPcxyj3FV@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Hans de Goede <hdegoede@redhat.com>,
        linux-i2c@vger.kernel.org, patches@lists.linux.dev
References: <20220303191713.2402461-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uFpFnEeGJJ1HC/Zy"
Content-Disposition: inline
In-Reply-To: <20220303191713.2402461-1-nathan@kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uFpFnEeGJJ1HC/Zy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 12:17:13PM -0700, Nathan Chancellor wrote:
> When CONFIG_PM is set but CONFIG_PM_SLEEP is not, two compiler warnings
> appear:
>=20
>   drivers/i2c/busses/i2c-designware-platdrv.c:444:12: error: unused funct=
ion 'dw_i2c_plat_suspend' [-Werror,-Wunused-function]
>   static int dw_i2c_plat_suspend(struct device *dev)
>              ^
>   drivers/i2c/busses/i2c-designware-platdrv.c:465:12: error: unused funct=
ion 'dw_i2c_plat_resume' [-Werror,-Wunused-function]
>   static int dw_i2c_plat_resume(struct device *dev)
>              ^
>   2 errors generated.
>=20
> These functions are only used in SET_LATE_SYSTEM_SLEEP_PM_OPS(), which
> is defined as empty when CONFIG_PM_SLEEP is not defined. Mark the
> functions as __maybe_unused to make it clear that these functions might
> be unused in this configuration.
>=20
> Fixes: c57813b8b288 ("i2c: designware: Lock the adapter while setting the=
 suspended flag")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied to for-next, thanks!


--uFpFnEeGJJ1HC/Zy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIrs28ACgkQFA3kzBSg
KbaRxg/8Cr/08H7FVX2nhSRb+l2YEc6TPnGrAfxJj8XdRDMS11y+rhWW3fBZUUZ2
WNakmcXlqiFBhepmh9GhzJwgb/8pswTnUlRFL1Vqr0RCMUck6Au38pSCOU9s2Trv
XzctixOo//k3LuX8xIwSC+QPOhQgIVOxahp/2tLDe3cmHzMYQbw2V7g5osqqcFEV
w1OP3h3fMvj9n52Dz7zNCRWJHobcJB3fh/hVCE21XQULxN8wMBlet6NmyGo4KC9r
IXemXZEDyfCsqs6be36CRCyGJ8uB1CbHjX+fDMMGD/ArcsSx1wGVL5iP3ZBkVc4t
B6fy+N7QXcCrvCTchmADfhemlZnWSoylOC+L0Z9Gm63Kbk18hqxzhTVhUDUD4cj+
bcJEwjyw0Atk7WRuWi3CoHhHXtojoGAovMGKtSnlUFI13FApE7CyrFHPPW2W5UsT
9cZMd3wnp1Kt8MhlFHbL4kJD598nhkdPikVEguVbDCLrNPienC4+pXp4Wj+DbB/a
yyGeX8VDPcbKk/OS3xyrmbW+5OTvRGHEPsOw6eXEmct2yGGVzufXgqWPEVrbRdNi
sVdVXLYPXxAJu3TMw4WjeYmlGEf+haYp0Pt7M4apOKH8HUsoeUuSuth/fEkCbANo
HxAx+pEOpyiTj35HNE29eN+7BZMp4pscymXydQWx6DKxfFzOCFI=
=3CXD
-----END PGP SIGNATURE-----

--uFpFnEeGJJ1HC/Zy--
