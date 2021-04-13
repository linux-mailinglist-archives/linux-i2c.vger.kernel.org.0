Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A8F35DE8E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 14:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240213AbhDMMVg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 08:21:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:44876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230025AbhDMMVg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 08:21:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFF88610C8;
        Tue, 13 Apr 2021 12:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618316476;
        bh=tbqVv8Jnr1JaAfHvLirC2gV+qobKlzu7qyT6j41ne1s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AhfWJTgW5qvBi2q8OYRlKbe7GTJc4cSCkXZfqPZs82YapJJcBHyYQmxYNAtwfcfB2
         NP+xPElEug73KFr1AW21D0rKMu2TpVnYGnnROxmy3/F8ibEAg3Em7UEKl+p8f8Fy80
         XGKH8H31FHdpD3OzhcX1VBozLUOteKNuFzYWpTdQN9uYBNskl74hWsx/Z6A57bkyZv
         DU+il5Si7i0mqVscuPHFaPIejY1rkVOpGSX0M6cb61Z6OXZgf/lkXkVd3D4iLVOCMy
         /0lV6Bc53dKrrKoAd8sluHp2TjbgcUrQsLwRzXPasFHcmYbk6pISkYEOiDgoBfpvCw
         QIcmznTbswWSg==
Date:   Tue, 13 Apr 2021 14:21:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] i2c: mpc: use device managed APIs
Message-ID: <20210413122113.GB1553@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
 <20210413050956.23264-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <20210413050956.23264-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>       Yongjun[1] into the original patch. If Wei's patch is applied on top
>       of whats already in i2c/for-next then this patch can be ignored.

I applied Wei's patch instead. It was easier.


--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB1jLkACgkQFA3kzBSg
KbZ1zA/9FEC1wzNTZzRPy2y3sj5tni8iTspeEAlMruTnCBYv/lcQ2D8kY04Fmk60
7ErA+1R/RDIKE1DIqKNIlaM169wsKSCga6U2ZNBzGS79E1ri8ngFivDqHOc9Ef1f
9o1QTI3UdjjTyd1Myk/rWfg0pH8BqJeBnGkjvQWMJ4Vijw/Dy3Y5DEOQOFZoOlCY
k9u9jNhQPQqClIJDPqW3xsGEMh6uMCSsVAHlFvod4XGQ7aqdefkWoR5+2hrY5Eh0
O8kvxKNc5QgpZ5JQ5fYJebWVFcTsmfvFYGncG/MSgBl8WjUuAVTN1VJAdwDMn4Bf
un5Nni37UMQt+iimD5SY93UHcpPKY8f/nzDGm6aNqSrQZz81Va8JzpdMnMCxsj5l
n1LDMokfyLQh0hPtlRrBTrsPAkbqA2ByAuTBdescBlWlRkCtWCnUZSuJheCsq/8A
7xBENgtPhbpcJ4NxGdnt0YKM+bPOH8WECuTXnCT4EF9RKzetvvnS50UwsQ9DRb8i
CkHVIrpW4BmY4skxyk2h3rzJrZuNjTPs3EWd24LBnHy4jiDBXtAawSfR7KYJpaIZ
KXVW2SOA3Ouugu7hykWbAagjLp7yAueiG5V2ZKGy32clk9WC+HHIsXis/GfqIVIl
mdSmsiHX0+6IEKRY4Dto0ofCkfY4yhByB0kfz8UYiwaWVpTSagg=
=Y/zA
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
