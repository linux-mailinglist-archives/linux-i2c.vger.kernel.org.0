Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04A5049ED6B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jan 2022 22:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235848AbiA0VcB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jan 2022 16:32:01 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:36712 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234277AbiA0VcB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jan 2022 16:32:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 296F2B823B4;
        Thu, 27 Jan 2022 21:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23061C340E4;
        Thu, 27 Jan 2022 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643319118;
        bh=YwK9akSpFjl30yk34HJst43Rlm8DajT1e6Wu6ffaX7s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TcAqK8kKFbHS7IMA2o31ZIp4Y8VsbwAS9VnZJU/kiL/hi6Yul6vFW8An4+vX0exH8
         f5SvifVgJwP4ibtaCfn3/BJv7byPsbCyZgeexpZtuZatOBMcwtgskJIA5xX89kr+MB
         NLd6ake5RhJ2E4XJOvmn9sWiIe1f5PGvINfDB43ARoa+zp/qPSeK71M4WyIuGDgRmj
         zO3Ar6FfbTndfh+KHOXdvWyMkdpDESbW5wYNGiu2mBotVhhAO5uOwoZZ5Ss1EMox8I
         wGwEAg5CXVfjrokpMWD6i2fFT9xBc2ryULsx2aF5GOWT0yuUNzQGwWBseijnO9DkBb
         DLLw3yO6sWVoA==
Date:   Thu, 27 Jan 2022 22:31:50 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: tegra: allow DVC support to be compiled out
Message-ID: <YfMPRj8H8nT4rFZb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1642535860.git.mirq-linux@rere.qmqm.pl>
 <ebe847bb25016e743c28bd38a10c966b04b06cc8.1642535860.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kSuXyQOCCZh8UNsS"
Content-Disposition: inline
In-Reply-To: <ebe847bb25016e743c28bd38a10c966b04b06cc8.1642535860.git.mirq-linux@rere.qmqm.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kSuXyQOCCZh8UNsS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Micha=C5=82,

> ---
> v2: remove KConfig symbol as per Dmitry Osipenko's suggestion.
>     (Assuming that for Tegra20 the DVC part will be used anyway.)
>=20
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

Your SoB should be above the "---" line.

> +#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && dev->is_dvc)

'checkpatch --strict' IMO rightfully mentions that 'dev' should be in
paranthesis when being used.

Both comments apply to patch 2 as well. Otherwise looks good!

Thanks,

   Wolfram


--kSuXyQOCCZh8UNsS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHzD0MACgkQFA3kzBSg
Kba05Q//aApAEPO2ippzR1+1dZRRovc97ePxoYqtSHbgz5J5WKE3sRjWHzqU2XQJ
WzF2YVS/RNtyDbAE/DN7zQamQ2ch9YwCguaNQPLaefoSr0EhShIUVdysR1+MeMk1
XPFr9eIJ1oxApaLfGo7TWCrpdV5jMjZ0lnvTPAkPaIvDygaygcozhFqPB6O5z3MS
EFOzpFNeu7O8t2ZD5muO6Yxk7i+CUqeVYmJFKMQuFPYORben3j7/ZB8/L22AqS79
o4+L7oxzddcKLyIC1L3kzydCc/2zrnV8k9+7l4cq7TLqBr+msd6VGJzakUP/OXRI
1FaIL3FHtoQbuxmUqGywgdNiu5gl2jRtyEKkfgFd3LuY5+yLhBxkZvhy2i8S73hM
wFbCL8GgPh1GXKtQEqdyK6BCvjpdKlUId78fCl+RvviCYJ1YOk95q2Dgk85jcIIG
C9HNl/VhKkaUG4uwdRgFSXdFkm1a6Kz7yJDLC4VVMqeKXxsyGCEXru3mwW1K/ndV
7pBhJED8+PUixjd0j3yeA4fUZIMTLLRzoR+SW36mWI+gF5CQGKfKzTM7dOjJBtrF
0Cu9vNnlxouVf/DHYuFM5mu0Hp8SeRCNrIAMZjxZ+r+7D0TFOnV2NGCd2WN0zto0
JWMN9Bz+q02DVHOPuHz7beYHF/zpc6f9istwbL2T/ULRORVaHBk=
=x6er
-----END PGP SIGNATURE-----

--kSuXyQOCCZh8UNsS--
