Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F1A358EB0
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 22:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbhDHUsk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 16:48:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:54012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231676AbhDHUsh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Apr 2021 16:48:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 572E0610FB;
        Thu,  8 Apr 2021 20:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617914906;
        bh=EvhIj/2RXJW7QqkfUJFRLLkEZQFYaeVGhuEU5JXn2Dw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RHsMMBhsbatwq/nknt4RPwlmZZr0SS3d4sqtL0V9CAoGQwT7JJAIPmFSZqPrBOz6X
         Au0Rv1u5NkrZEuHdi7nZ0irKpkvxRbU35NFkbT/DzHS8rSb6DMmqHbhOOA2dqXjGfd
         0jUnYkj5sACB88AbL+eLS95qIQf6E9Eb7g2DoeCSbr2PKtLdH5z0o+4F3V6xB8ejpY
         5qmXHt5NIMNL5ANF9GuDwWQdKSCxC7bE+Ww9G3lp0DV+RKVlmLV9/ZieiFLUQeG30r
         B7sbslO7FFB+7xl4EEceuPrwpuIB6cYGxtHETX9tbwn5UXRfMGysTqqgiIwX9Ic/iq
         FghNYcjFl634w==
Date:   Thu, 8 Apr 2021 22:48:22 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Sanket Goswami <Sanket.Goswami@amd.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next v2] i2c: designware: Fix return value check in
 navi_amd_register_client()
Message-ID: <20210408204822.GC1900@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
References: <20210407031137.2750993-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline
In-Reply-To: <20210407031137.2750993-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 07, 2021 at 03:11:37AM +0000, Wei Yongjun wrote:
> In case of error, the function i2c_new_client_device() returns
> ERR_PTR() and never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().
>=20
> Fixes: 17631e8ca2d3 ("i2c: designware: Add driver support for AMD NAVI GP=
U")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied to for-next, thanks!


--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBvbBYACgkQFA3kzBSg
Kbapyw/+OpvB8xYyjrrq+QCB5Fo+geIdY/vQeaKYtls1gPiCMeB+9LRVcOiaoE48
tgdcqcrriHMEPqRJ2PArI6phuJoJxMb4vp+KW5g9A14FHvLpCS5Z3L5KJrhp+Ssk
O6FtuTiazAb45vvo2jFUWXZfyqktXG+6pUuqlXCMnmq03UGgGOSqfLCnnE71gS59
VAa29h5rSBCO4nkbemEGG23g7meClpecAhXq1lzNvVMDV6FXTPivAqsDAnY3N+sB
/TKV5G7rUWERdtkEJtAy92xh+pNQhjV8Qt91Gnqy1ngFRo71K/P21f/mzOfM6lsl
YBJTU1A6ygBt4DS9bSR9qNB5uznhoesQ+S1l/xhxHr6/qnNnQOd0BoM9+pfPpdeT
vgRuziZmgwYWZWY7a2Nns3RYGENAUBYyDERE8fr+g+KjwWVgfpXb4Ywf0RNL8pV/
YR0FMMXFIM2MwU0ujT5hqeKdTkF9fbZuB2f84ifMEuKaQfkLj8dIPjIFkGyuRWiN
2UJBKa3ST/omKKVgoH1j71KSYV8KQYoyVdJGS9CtVuJpw/W4hBgmKb11DD7EPpVU
L5K+52n+Ur2NQ7jJYvEC6oEHhxK+anlAmI9xB4AV3yQbIl8kFmXO7V21W4dq4rxG
9G6tInjbkV0LmmCbroQnI0LR0c4zmKryFR5KGO2un9EZY1UBsg0=
=ilmz
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
