Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0444E616E67
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 21:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbiKBUQ5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 16:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiKBUQx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 16:16:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E962C6;
        Wed,  2 Nov 2022 13:16:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 250CC61BB6;
        Wed,  2 Nov 2022 20:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C29C433C1;
        Wed,  2 Nov 2022 20:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667420211;
        bh=GTYFJtGhlCkU92mWmUMQCSGQLE336EN02hyduNQrokU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JQQQDTRjAw8htvzl7daWLNupdGzl+mhfakPUbxpZGeboIDs0q/95+WkOb9pgp3/Hl
         OVoGjp0IFTZDCTgISM7ea6xFFQAGJwBS8NsgI6WLyJSzG8EyZH4QVLF3UaLcukjW6p
         lwNWXEXoROXZKr+KOVSaAUSc+F0qxbs1lsrAyPuYLntlpiaP04xsABwM78Z20kRqTZ
         289wPmQMDv6qotnWHoA9vFjdTUezu7GO1dQHeD1I0L0+cd+KlsaJy4S8abIAP4YGTc
         dBmAa946eDhTj/QOiMPwcxsA5NsYKluZpU+5jN58mba5tRx9ayw7KG679rjtKbXszd
         G7w7RJ0N+q0ug==
Date:   Wed, 2 Nov 2022 21:16:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
        yangyicong@hisilicon.com, andriy.shevchenko@linux.intel.com,
        digetx@gmail.com, corbet@lwn.net
Subject: Re: [PATCH v2] Documentation: devres: add missing I2C helper
Message-ID: <Y2LQMMSF4dbCIc+X@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
        yangyicong@hisilicon.com, andriy.shevchenko@linux.intel.com,
        digetx@gmail.com, corbet@lwn.net
References: <20221102134559.282716-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rxsYk7i4/pYfchcP"
Content-Disposition: inline
In-Reply-To: <20221102134559.282716-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rxsYk7i4/pYfchcP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 02, 2022 at 09:45:59PM +0800, Yang Yingliang wrote:
> Add missing devm_i2c_add_adapter() to devres.rst. It's introduced by
> commit 07740c92ae57 ("i2c: core: add managed function for adding i2c
> adapters").
>=20
> Fixes: 07740c92ae57 ("i2c: core: add managed function for adding i2c adap=
ters")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Acked-by: Yicong Yang <yangyicong@hisilicon.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-current, thanks!


--rxsYk7i4/pYfchcP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNi0CwACgkQFA3kzBSg
KbbAuA/+I1Cy4gVdLTZHzWvg3VcqMkzzldEcE0DZSJcoFk1EA3OIz8kXR/Hj68J5
Z3UcH6f8NT4DUALfVGemgPC2wogoHCgNkt2KMADME0HUntmW8bFBdf8/A6cllpSy
jOVBkdRz9/iZDZFVlS7dFR2N0shVDhJWrifljtLIb8wWNLd+tR0xPXUcZrtzcAqt
3AI325RNTSokRMDdxNpbsByESuQV+Q1xOwHt5HtjJe7NUvqz5FIZ/KCXgxPQ5CDr
A7Ccr7ahuQY7a9iGx/0YQAKJ+cLuboXagPELw7UgG7xhjmwD8orUMux35SeVli2v
wi8CXud5OXO4aVPLi0jlm/Lp5RnrcxM1K3Ulg5FIRNSNlL/UUfqxp3rmeMltl/yS
V/tC7TodyJxtTmC385FOHexb/QC7nR3UJW2afmb7RdDrFTZUDUjAW/ke8pmi+PGU
FhdO8jWixpUBwWlJ8/Dv6rV/IawKEps0daxsg9Y0apGhIVOrln8Ba6WVeSZJ3e5U
sNdNcL6YM5Oz44tL438+bhlQ42jgF7HFMwjnZgaZb5piCre34GxhHw7U0Qwdc7kq
A/qn3EaDqfXNTjO00tJAqZunE8DNJPTbDR1f/xQWkrAW+2p+96OwAyCjWg8zV5S5
fIGYRVHyOG94q3w8mCOzig/rlFvy7Qnc1fUkjwaJ4OsTypmX1xQ=
=pPgh
-----END PGP SIGNATURE-----

--rxsYk7i4/pYfchcP--
