Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9ED6050A6
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 21:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbiJSTob (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 15:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbiJSToa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 15:44:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6A6B87A;
        Wed, 19 Oct 2022 12:44:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3B636619B2;
        Wed, 19 Oct 2022 19:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7B4C433D6;
        Wed, 19 Oct 2022 19:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666208664;
        bh=9gUtndE8TXwdW+4qM9EPSTwtXGv7PgXPdWAIJ05D1Us=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G6xCxeXVuw1mbkWEuQUYMYvHX55sAZ8BlVmUcqix4vXV2aEhmi8Ewy42AcEIIo110
         q8/xGHDrr5ksrAxHOA9jRPayjjwGUZHWFixo3sPYtmsSLcHH/eJuDB9NT1dWdY9MgM
         xHQ/fgofd7VuaJkxgXCNN7ToHY7aDueMbIp/owNwrh9vjYawRVY7PpOmkRnaye4bMN
         sUPWHGWTZgw5qplbggau1Go+4P5I/KGbumKyIfdxFAKDHiJRBO6dxNgboeaeyIOTfP
         Lo1a8M/9z1ZXCEoik7Rls4w2KVISa6EDY2NAju20O0hhHPUs6Cxbd+E2G/mS7BmHNE
         jyNIh9n9EdoOw==
Date:   Wed, 19 Oct 2022 21:44:21 +0200
From:   "wsa@kernel.org" <wsa@kernel.org>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     Ren Zhijie <renzhijie2@huawei.com>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] i2c: mlxbf: Fix unused-variable warning
Message-ID: <Y1BTlflJKNS8JmI1@shikoro>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
        Asmaa Mnebhi <asmaa@nvidia.com>, Ren Zhijie <renzhijie2@huawei.com>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20221009133822.254122-1-renzhijie2@huawei.com>
 <CH2PR12MB3895C3FA56AE40EA043A0BCAD7209@CH2PR12MB3895.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4ozRfCY8FRgb6UQE"
Content-Disposition: inline
In-Reply-To: <CH2PR12MB3895C3FA56AE40EA043A0BCAD7209@CH2PR12MB3895.namprd12.prod.outlook.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4ozRfCY8FRgb6UQE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 10, 2022 at 12:00:09PM +0000, Asmaa Mnebhi wrote:
> Acked-by: Asmaa Mnebhi

You need to add your email address as well.

> If CONFIG_ACPI is not set,

Since DT support is gone now, shouldn't the driver actually depend on
ACPI now? Then, we could get rid of all the #ifdefs in the code?


--4ozRfCY8FRgb6UQE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNQU5UACgkQFA3kzBSg
KbZnEA/6A0K0O2J2tvM5gm79RQxyyWxBBgvA6hPvemhR6Msvh9SWCHKQAo9s+R+D
l3OvrGquCaozjpN7hqF9IlF/G7RVc7K7ZLCGpjZqUXU+zPUl7m0HjCsmNadpBk+G
vvvKLmF4GybLc98crdXT4lgCk1oGonwaveoIlYFoUypinGoHrHrIRfKY3Mp2ZYvn
BHhl+jaSz0vnXrlqndotr/k6i9Iusgmb2I/ZbBkmOzjCTUDKn2U/DQgVA18K5ll9
RjcNXe3ljQZ8HpbMjd24jcAFvfckxw5zeJKuvgZNPQdRbvnMbHi95jozcx2G6TyC
IUnda9NyZHzv/bbmczLb7fIT187eD4jfJooXoCSmZzabp5yUPEEy4dU5BTVcmTa4
HK/SWrvZj+70glO2z3VEmytK47sMliNiqKqjtoER83/s54+Vm2XE44ZNAh05RSEX
e3MJlMeYSDUKX/GcRLEo9GzWQTVZfV2ep7/XoxiNTWjiWIfAziwGohGumiOVZg/i
Ah7GvCiV+Vz/e9mrRBM1jpomHxCmknTM/dj3SYFVP7GOvwdX1otW5+8YxLcHEQU2
uCp3ENL1iM2iad8DPzmHcBUtceEsxhiRVXiuEg5u4dBN+rHcxnBQClPgAMpvt51z
PQoIaXb7ueNnYbJj7s7sP9dv47tLfpp82Kh8kE0fKA1txMR5QsQ=
=10v/
-----END PGP SIGNATURE-----

--4ozRfCY8FRgb6UQE--
