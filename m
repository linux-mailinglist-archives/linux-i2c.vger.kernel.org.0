Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC58141CD38
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 22:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346226AbhI2UNF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 16:13:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:49924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345863AbhI2UNF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Sep 2021 16:13:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41C5161504;
        Wed, 29 Sep 2021 20:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632946283;
        bh=vC14xBQVtJOaX6NoZAE0dQUWgc3qkYW+Rpycvr13kBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=feGk8bH1URDw7lK++M3NLAxfHeYYUcLhJbCbPx2rL3JUyvjg4AZPbfNnmkL2qbLFe
         Eo0/o2ewwOUAlpkEgizQ7sHHwStmPkwSQPSFHzOHadPDX/h8DAD7nCG+R8Qi84443T
         682a566OOzG3bHLjkPpb6OaWgBlVBNBXL7yFM+UHmZ5FxO9Alx2RcJW9zUQclYXCpV
         kv7bzU9akz21DW4xWJ9VTxl2yPVdjlJmXazgGqSIQxHykWsK8V11qHYFipnUAsufeb
         zw/Vw+LKEzJwB2L0p8x0OUC7OwZ0+mLVcB8JaXWoJa+42PKDCz47v/N4u2gDZPkJSb
         POLeHQ6Ho87kg==
Date:   Wed, 29 Sep 2021 22:11:20 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 8/9] i2c: i801: Improve
 register_dell_lis3lv02d_i2c_device
Message-ID: <YVTIaJzdrNCYKgwV@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-i2c@vger.kernel.org
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <3ce2ea87-809e-5999-e920-07ddd5fcc035@gmail.com>
 <YRPyUM/nGD3dQv9C@smile.fi.intel.com>
 <8ba091fd-b6ff-e800-1c46-aaf9992f1e03@gmail.com>
 <20210827182135.1d9670c0@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m2+bdDTuwcsbvdgY"
Content-Disposition: inline
In-Reply-To: <20210827182135.1d9670c0@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--m2+bdDTuwcsbvdgY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I stand on my original position, let's stick to dmi_get_system_info() +
> strcmp() as the driver did originally. In other words, don't change
> code that has been working for years when the alternatives bring no
> clear benefit.

So, I can skip this patch and continue with patch 9?


--m2+bdDTuwcsbvdgY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFUyGQACgkQFA3kzBSg
KbbJNw/+IzVkujCpa5kAVkpKzd3SPlnkK9CCyVUNiW0g+uKdJ/MGOHc4obM0ZQ78
tkYEbWPfPGsmcMKvXeVJOMmPHyA8u33UvkHfjLs8QuECIEUai2ysfe7kc53zY87i
erzp0N840mA6j83eLHXq/y50DP1mzmXfoH3EgCLqadjOjh3YY5pMt6jGM1QvRICJ
HzjR4h8g4XaoZWN1vol6i9XedVSe0FMsQCW2WSjIe/Bv99w4dGd2jhCeLWi0LxXw
SeabRgfin/gTOsiMAAr4lMxnuYuMP5gf+vjxUa8OaiU8gEHcSCFGoHFl+81NHNXT
oXUo+IJ//54K81SwjqZx7VyETIVUuAqx2O1k5vElarLlbSc7iGJE809Tnr7KSQBG
upA1yPjRGkS/sMV2fDz/LPWRSA8JvnkbGxgMpDZpBA3Y28Hq9NzveGr56wCAF0Nt
TRHKHNls8qVIGnyzZh8dL2FakEHqwp5hU6Jxe/0BAf2jnqphxFnOwtc66zZYW0KG
wX19Nbgxli+lQWcVRzvMFIrCfzTPEOLrps3+9vDwKWFe1bEDDCJiz+LujygsveZK
BzFvnj2g837U3jKGWkGfdXj9KtnBszZAHOkAfn/zDdSfZy3FtWpADDbjeWQF+veS
fzwwngxXtIw3m1jdg6JDifepczi8vzXO8N9OqG8Yca86fcXeUa8=
=oXU9
-----END PGP SIGNATURE-----

--m2+bdDTuwcsbvdgY--
