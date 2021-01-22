Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17E2300300
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jan 2021 13:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbhAVJZ5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jan 2021 04:25:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:59818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727375AbhAVJRS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 Jan 2021 04:17:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31C9A238D7;
        Fri, 22 Jan 2021 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611306318;
        bh=/74bwbossxmEXhL/OtCPhlJgq4pUOpJzTqb1C+8sR88=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f1UO3T8/luJRanwVum+boxFSVXnz3nDz0/vpJyhx+7qmMR83pYSs5j9kkwga2iX5G
         IQRwrRPKEJDjYOZYIKG5k6/HsfV+j9O4lnr1BCjd3BzF7W6RnlJPJo2Pyhbu/inpC+
         cpbSqdmYuvbAsQhbJQzH3gYbl2OcfvUeWYOo4frpKL5DkmrwYhAkqt2veWHRj3nfjk
         gjxodLhGzbnWIpG/L/d9lfDX+w5Q/l+9AbF3CAX0eq7B0v6oaJo3aGSDmZn1khdj/W
         WdtAjhkv8xhMNnU8kOmPSrBDk1ANbWxX3Tw+Vrn9+a7ObzAHotRVUzupa9eR0L3K/U
         bptUehY5uqQbg==
Date:   Fri, 22 Jan 2021 10:05:15 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: sprd:: depend on COMMON_CLK to fix compile tests
Message-ID: <20210122090515.GF858@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20210117114313.141428-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KJY2Ze80yH5MUxol"
Content-Disposition: inline
In-Reply-To: <20210117114313.141428-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KJY2Ze80yH5MUxol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 17, 2021 at 12:43:13PM +0100, Krzysztof Kozlowski wrote:
> The I2C_SPRD uses Common Clock Framework thus it cannot be built on
> platforms without it (e.g. compile test on MIPS with LANTIQ):
>=20
>     /usr/bin/mips-linux-gnu-ld: drivers/i2c/busses/i2c-sprd.o: in functio=
n `sprd_i2c_probe':
>     i2c-sprd.c:(.text.sprd_i2c_probe+0x254): undefined reference to `clk_=
set_parent'
>=20
> Fixes: 4a2d5f663dab ("i2c: Enable compile testing for more drivers")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Fixed the "::" in $subject ad applied to for-current, thanks!


--KJY2Ze80yH5MUxol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAKlUsACgkQFA3kzBSg
KbYOJhAAsP59jLr9jMlMJSvC9UvXTg5KA5JTQQ+yMLtuKXNNsPv2wtPrpmbGFPaF
wuxSoUrzsQDxoQ6a9hGcq1f/Mg8sP9q8EySXygK97pWAMCJAougTrzFMKZL2w3ca
Rqx7g7dmIld2D+ftHpfW5PTKTsSy+zRT84O+MIjIbSycK/2IwMkIDZey+JDHNZcn
lL6tqPC7RNof/uhwC/gx3VKeFHJLALG0+XgrWQNLRfzKgTUytU758/DCpAnuI/y6
cU+iNm93vCjL43ZTuAfzbgOKicS9f2VsvYCc+yqDPSB6PTwoOZrYQ46seZRTW8y4
BsStdyvAimlvJMLKtIV5VXLzDKF90IFCnf5+pTE5BV/fB4skT1/Ce8POtH5YlRHE
z5EGtAHtulMiUqDteXBYMkiCF58Zi2ibfYoycImVUSRgIhgTIIkf285KYdB4pfMo
xbqE9u2hV+Gqa7aIYoXfdvMTTihxJYBYoCEi4n34TlsQkBG0nHjRD/+RD+v0HShu
v2XwNz63U220Na7D3+A3jJiHm6tDmVL2AJnIMmKs0D+ysxQgIp2G1hn6U8nO67i7
EgNl7xcw32C+vVgZNAng/1Q8Y6qA3jqIjkHr/MAkq/tHPDQTyRYPAAWFWMnxciZC
d7D578LI+qb2M+eNmtyr2gINETawOZLXjgk2ahPbgFssaiMfUfU=
=q8YR
-----END PGP SIGNATURE-----

--KJY2Ze80yH5MUxol--
