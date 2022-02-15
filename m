Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0DB4B6702
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbiBOJIn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:08:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbiBOJIn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:08:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4E213DC0;
        Tue, 15 Feb 2022 01:08:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B5F8FB81806;
        Tue, 15 Feb 2022 09:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C0EC340EC;
        Tue, 15 Feb 2022 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644916111;
        bh=OBIe60fhifc3wDt8zgyeTMnsfMbW3AkK5zwZlXvPYhs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H/gkGvZ7GYv5F0sth/y8T2mZDVX5ad9BGvSinOouXQyScFmvFgHE76FDc/H9QqVVV
         5Bf2uDlGvJk1dgM5thmxYro/TPiNVYZDy0E8WkgstUNCOdtvxOISmmsAd+Qr71VyxN
         RdANyq9kc6QZk8+JIBh+eAgYidhFfZBEnyQVons4Qg96aiM6cN0w8Odyiatbn5qNHZ
         YhEqWf3kDO7GADWjRj7dN9XVnjsBaPAgz2XlO7Twh0n/E7T+OeJpnP7QMFN6HZsiZe
         HGxxL5OnXkYT+j6VC9IPIolk0/VhiM5tqw0FJNfrJW4jITpQFYHbM/MVph+bGV0VRI
         tMypHcCit5Rdg==
Date:   Tue, 15 Feb 2022 10:08:21 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: Re: [PATCH v3 4/5] i2c: nvidia-gpu: Convert to use dev_err_probe()
Message-ID: <Ygtthbj9Ei+G9jwN@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
 <20220105141935.24109-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8UPaZoc8EIaCkB9p"
Content-Disposition: inline
In-Reply-To: <20220105141935.24109-4-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8UPaZoc8EIaCkB9p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 04:19:34PM +0200, Andy Shevchenko wrote:
> It's fine to call dev_err_probe() in ->probe() when error code is known.
> Convert the driver to use dev_err_probe().
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--8UPaZoc8EIaCkB9p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmILbYUACgkQFA3kzBSg
KbYilg/+LA50WrisGNRG4RYmW1bDqZwuYbEaqu0XBbPQZiJzFlSF8kHmEx+nIbm8
FVDUhqiDH8dBym/cY37VSAvlz9ThHRgzZwCQOeQu7ESF3P4UMyijHbmaNTkAbL+i
yEl96YZndGG5nR3HpYBwRXIBtU0fKuvz3TU3gEdZE6GfnPIhZA3esuTVCvQJ2W7g
jUX2ZIye4vq/0NJ2OfeXZZkMLVSnL4HFzInHqPwLadXXkVdzhWzPbg8yMnaMM8FX
I+tBRcoDWuDX/BuWslSesh9uDJOved7NXXk39gNIvejx7FPhpY9yUBO/yVqWuV52
+w5GPh1pAGpKH6hK1Rx4FFj2mz89jCNsNEw6JzhMVeAOQ6YiwemiX7yWxnD45ZFA
Khq7XtNmtdMfXeoHdEIjoBNQpRwPz3ikRszw/HPpZs04OlxByTZ8Ol93tN36m6Pg
aOeBeJ8Hq2aHyoJxLSH4Nqg7HROYiSERpuaEkpVRhX9bCPcMeEPABWqDCsnbRzmN
Oxm5ey/o2p+MLCtDFs2MpXcvlvhJg6pP/Er3OJ+X+6LRddjglNhR2Z8XDWvwLpW7
AMkWOZfSql8St+IkG+Xd3lNmklOKXWpIrENRSkxEBSQCr5IJDqoTdSGKUu1npCLb
T8QwiLN/f/dzCzp1B6DBtWhaj+Sau146Zd0rEaWO1+jtc03uDf0=
=fuS5
-----END PGP SIGNATURE-----

--8UPaZoc8EIaCkB9p--
