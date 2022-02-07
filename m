Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 887674ABF0A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 14:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344271AbiBGNTk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 08:19:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442351AbiBGMU4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 07:20:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBEE0C02B5C4;
        Mon,  7 Feb 2022 04:08:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 66A1061027;
        Mon,  7 Feb 2022 12:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239F2C004E1;
        Mon,  7 Feb 2022 12:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644235696;
        bh=aJS2fMJOFOu6nNUlDjL6FgGlZo9MICA7XYvXLN/4y6k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fhg3SvK4SFuwMYrPoW/24O1P70+1xqqeudOs8fEyomQr/FN/UJwWCMoUdDjxmgPS5
         cCesZajB+PjlwovB1EeOhC2UyCYNhejtYILBJuv3/GQWjAQbOoxRpcCyB7IjAoDGVm
         YiR5fhwPIjf3EZ5/ygKIbW5UuLTD3pT7F0x4rzXVfH+R5ugiHn6pXsESDJtYOAZnZ1
         UELlN2dofYGqtcQfawmd+sDerheL3N77KK/p2Ku40CYIO8EsZXUjxISCl4gt7MtUmI
         Efopu4Zp8pTdtKFm0/SHx7zfNKGRZhB8UmS74f7Afv0uRnHJBnx5EMTMCf+efZOVdQ
         NVkwj+x+4B4xw==
Date:   Mon, 7 Feb 2022 13:08:10 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Terry Bowman <terry.bowman@amd.com>,
        Jean Delvare <jdelvare@suse.de>
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-i2c@vger.kernel.org, andy.shevchenko@gmail.com,
        rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
        wim@linux-watchdog.org, rrichter@amd.com, thomas.lendacky@amd.com,
        sudheesh.mavila@amd.com, Nehal-bakulchandra.Shah@amd.com,
        Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com,
        Mario.Limonciello@amd.com
Subject: Re: [PATCH v4 0/9] i2c: piix4: Replace cd6h/cd7h port I/O accesses
 with MMIO accesses
Message-ID: <YgELqjDHnPdJeor8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Terry Bowman <terry.bowman@amd.com>,
        Jean Delvare <jdelvare@suse.de>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220130184130.176646-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0kO5rWOtCL0wqwOz"
Content-Disposition: inline
In-Reply-To: <20220130184130.176646-1-terry.bowman@amd.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0kO5rWOtCL0wqwOz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 30, 2022 at 12:41:21PM -0600, Terry Bowman wrote:
> This series changes the piix4_smbus driver's cd6h/cd7h port I/O accesses
> to use MMIO instead. This is necessary because cd6h/cd7h port I/O may be
> disabled on later AMD processors.

Review from Andy is already great, I'll give Jean a few more days for comments.


--0kO5rWOtCL0wqwOz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBC6YACgkQFA3kzBSg
Kbbf+A//QnkzRA2XLzIn4yFkblDLK1v4Eb8XLapnVWTg6CF3fjzr5vYT0PTd/J+c
OdWVrwW1SlhKHMRVEyfZMpXPw/6Zys8EPKuoBA7eitqXCnz3mSu0RFx9SNcAd1Xm
HPPamxgrf38Tq7jFOaVpUPzTulkB4rvDfBcy4CdKJAF7hKUdXvGtC3n3tKwRHvrw
gZalZOaCKK6bvL/VcCrNr0MagP32Lte9+uziOSgBY6e5OJovnux7xHYGlsSU/E49
Uvy6dcIkK+351RUT+kHe//hPGTyeK8EZ1/vIDd7YSAbOY2bfAC7fcC7UV4DBoX5T
hwdi2s7nRybXqfORTbN1sPoxjyJx/l3w3yLghhrm3zknNGu24qF/7iAh7ZggRvpK
we5a1eLAe//7ozZQmmk7Evj1+uEj/JPbDsAX3fOXDJfMlkYaRaGRFtcbCViY7cJj
1gVApL4oA2/0RhRC9G0DJNsvXeyY6tsW2Kf0RYtAjVnxs4PGFxzDOfyPno78pRuY
6udoUbHHw46sMYRnhiRxRz8L4EFcNfbKpKjkEV8Ynazpp5qlDwDThCjUgg+EwBSp
x9H7HjlcuD8T3s2cXtZpyjvT0JoCHcWYL5HYIplBjM+LBF6bjvERHv2xP6PyS0lF
+KHLpea6ON3CJDH+/NWLe8lpNWEZy7IqY36GVMp7xlg/mdQowCw=
=+FEx
-----END PGP SIGNATURE-----

--0kO5rWOtCL0wqwOz--
