Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D20E363FB8D
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Dec 2022 00:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbiLAXDQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Dec 2022 18:03:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbiLAXDM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Dec 2022 18:03:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A019A3AC1A;
        Thu,  1 Dec 2022 15:03:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1783A62183;
        Thu,  1 Dec 2022 23:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2753AC433D6;
        Thu,  1 Dec 2022 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669935786;
        bh=7KgA1NLXzNMM/GfnjUZZi8hCGEVUPfHsJHxSIxSHTbI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uBSERu1hBwR5RPX93IOyg7kMwy0GxZtHF9t1N3ZZBFq6PDXtZOogFvPMCuDu0WDf5
         mqGvI22FTJaSlnCLFBfNwJSxmLCaX/+O/EU66AtbAlsKF6331IfmDPhAXo7G4avn1r
         mUomg71tjGoJpLSLVsf7G82sgMJ/vwoKsoBXo9ujouOIQQKc9EAJri9u/KuSnxJRMz
         JIlzdyFlU1t1li7DMy9l2PRLkHmxtG3TcJDAXnhYGS4Q0EzzTKsI2BsSJvFwGGGtoz
         pH0FmuZzYHsB8SCpQe6t5sfFPX3RMS2g9dJi5/rt7mQ6jZ6X1o1r6927sDFmWZREWf
         iS9nh3zRS/y4Q==
Date:   Fri, 2 Dec 2022 00:03:03 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     christian.koenig@amd.com, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, thierry.reding@gmail.com,
        Zubair Waheed <zwaheed@nvidia.com>
Subject: Re: [PATCH] i2c: tegra: Set ACPI node as primary fwnode
Message-ID: <Y4kypxegWQVXW0aQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        digetx@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, sumit.semwal@linaro.org,
        thierry.reding@gmail.com, Zubair Waheed <zwaheed@nvidia.com>
References: <20221117100415.20457-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Aw7De+0seDuzblOk"
Content-Disposition: inline
In-Reply-To: <20221117100415.20457-1-akhilrajeev@nvidia.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Aw7De+0seDuzblOk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 03:34:15PM +0530, Akhil R wrote:
> Set ACPI node as the primary fwnode of I2C adapter to allow
> enumeration of child devices from the ACPI table
>=20
> Signed-off-by: Zubair Waheed <zwaheed@nvidia.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Applied to for-next, thanks!


--Aw7De+0seDuzblOk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOJMqcACgkQFA3kzBSg
Kbb5jQ//QiuIXH9cEYMtDfFKwh2KY7XFmNzJ2ysXSmelbG0UvgO0Bvwv87hqNdLL
X5vPuT9TEbCNdXzMqRZVNBa4mvFwQXh44rePjgxUC6SAVuwbE8A+mS0YyC5gVL5p
yRokFNHCZBsfGZLIzKAA56h1AiJJWM80+lCeLvplfbqhH7SGXY2VkNx1B1/CwX7x
MCRUwsuH8SArDtyYsjN+u12bH6aTIbw+sT5dd2jX3w2UVLecwfZhBtVfOmYH/dhE
77N4fuqnGiryAdkUmUTBivWnh+ha1V5AYCdpzgqsJjRJN+ePhDPGtJu17U2r7e+y
mOUeYT3HdhT4LvwmO+zAdFxF6zVXz1e32ahK8YKsNmnfjhavNKgmqQqUWOY/X76M
urzxGYX2kp4WkSE5TJMn1O845aiiTQj4MvfQJ5F+s6x40DQosS5ORD5iodHDC1SP
iO765ONPcsa1DVjR7urKmQ80CApFrw6kl8po/KQoRxolKjlhskcDwm7gS7mlAlZ9
xc9cipqXWOxNfrGR4BOFM3pWg1Xr0Rwp8HmmzNTQ6Rmzkj8WfiYG8tmX2dllCD0o
DecYOw47DVMJANsZmfVde9VRX/bBXBQgniA9soR4hosRu7KFM6XIDaP4cVH2zSKf
CaqyB9vPoSAKZtL/vrUEabrHarh1N+DsvF6UCXhXYmZ64k+jOvA=
=vjKv
-----END PGP SIGNATURE-----

--Aw7De+0seDuzblOk--
