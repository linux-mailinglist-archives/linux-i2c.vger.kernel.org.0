Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC05D3EF30D
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 22:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbhHQUJD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 16:09:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:51448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233217AbhHQUJD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 16:09:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50BBD60F35;
        Tue, 17 Aug 2021 20:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629230910;
        bh=bdCVwDdFFIifgGlCMJNk5choGeIBgI43EMXPt0IGd/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MnE/idSJLozdB+G1a3oFl9cI5MrvU4dPQQfcYNq3+DfPa/4FjQeNhQidRbgDxscbR
         u/79eP60R8UYWxQzMPT/leRY6IJNR/VVyQQf9Qodgt7I+1PPtZ4dwWiNhff9GI2g7o
         5O3tPIXXur71VeH/T0eTcpNxkhCx1mcNV5VFfK5jI7tf4/hXCdeC+30nt4sXeZRlvm
         +4LITTXFG9HGV+hY+FDJ/zC+IjPmDpF520mDIv62A1Pn7xdsUgFz1UQp851TO6V0U7
         ITUhrlN86dluiM+1WZouspuIOZFAmy+Mj7dxOeK3lQaFiUV6dCFbMpkVNn56A9T+tE
         Y69lZqRWD2YkA==
Date:   Tue, 17 Aug 2021 22:08:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] i2c: s3c2410: fix IRQ check
Message-ID: <YRwXOzam9prm9/o/@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>, linux-i2c@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
 <771d94cf-5e82-0cb7-fb1f-5af2f0b10dd4@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Mbc6QZNm8Y/gFfoG"
Content-Disposition: inline
In-Reply-To: <771d94cf-5e82-0cb7-fb1f-5af2f0b10dd4@omp.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Mbc6QZNm8Y/gFfoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 04, 2021 at 05:45:25PM +0300, Sergey Shtylyov wrote:
> Iff platform_get_irq() returns 0, the driver's probe() method will return=
 0
> early (as if the method's call was successful).  Let's consider IRQ0 valid
> for simplicity -- devm_request_irq() can always override that decision...
>=20
> Fixes: 2bbd681ba2b ("i2c-s3c2410: Change IRQ to be plain integer.")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>=20

Applied to for-next, thanks!


--Mbc6QZNm8Y/gFfoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEcFzsACgkQFA3kzBSg
KbYRSA//dzMqhVNxFhgY/TZP1zQMt6ggNbVbeFrXz4lcY2jolYgdg1RIMHsDSFqz
h6D7MUXmsU1m8wyrpuDLg/7TaIfwDEkDKDOIYMrw3vxH39NScecCcJ7kj2cmDi2k
OISqqk4nWi+YPSLCfn1yELbfnQ50+Ercm1yYSxN1MXrbD+2Li4CVSwxE2/z2cEqL
zTns10Y+Nf+RhIT5uz886hdYjfW7oIX2+U+96xECfaNXIh8YnN8Lg7oQ5Gawyvxo
lB26mumdgLfnsJ6fGhQvcH9u5Z76LR6y339x+oa4Fxk0GpCAXxNNiuP+TXnI+d/7
OdXtgKLrprmtnKL3IjPK1p8e/XiDAImKe5Hc/G+rEqm/jnZ17yCdOX3o9FR8G1za
NOsNODp10la3tc+lM8VKJWpA4CIcV7atazsLdn+/u6QNa2vsc05r4GS4CzeiuSb5
gkd9CdWbwmZvjI+6urNLG1Bnag6TVMXE6h2kYcqVdyNQ3A37INZwYSaUYT3z1E+6
4jIxATLTuboJ+HzGUM+UWHVqXmKtSh8Icbca9T/SBbkbnn25/QO8PSfP3IsrQQPT
/cnZQiBrtfiwPM3ubxbrVtmNXdiD1c2MIHv73exlbPlg8QxDIFtO1VAD1J4EqUbN
9I47/5xHKKzBnCrUZa02bNHTJOZ98UgY/djJVS1G4lgfG5zposE=
=06GE
-----END PGP SIGNATURE-----

--Mbc6QZNm8Y/gFfoG--
