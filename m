Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1A6D3B4DF8
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jun 2021 12:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhFZKWl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Jun 2021 06:22:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:48464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229518AbhFZKWj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Jun 2021 06:22:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D85B661446;
        Sat, 26 Jun 2021 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624702815;
        bh=FSy+KlpmSjRWFVWx9RsjfVGnLLpiY2zbpCqHHg2ENRM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PhARbZeBoWqks9C2WNP1JgnT3tQ6rTxspTbHVKNp+kSBkkSOvQ5LEe+3Y4XO1OuTx
         wo9m4tAmFi9G1ZHqKSvL8sQHnJbfaji6uCkCa2ALSxuPkI3dqGmO8hgazkY+jrxAu6
         0G7/zgKGMyfl/+HfTMPGP0CpXkYYJcs+XyNyipffZF3ku+qqkxU0Df2crY24w+Q1De
         4OOOWFNj/CffMhgVdDH972C7oT/UoWHsMjnBuVRD35udEsuoNQ3yJxLp9on3HPqg3A
         lLXQ6be5Xx/u5x7wXf207OrDTm23DY5su+UxRbtyPRoUB2kf/h6Cq7xsXAPj2nWFwO
         wzosYVGPbUIkg==
Date:   Sat, 26 Jun 2021 12:20:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhankar Kuranagatti <shubhankarvk@gmail.com>
Cc:     sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drivers: i2c: i2c-core-smbus.c: Fix alignment of comment
Message-ID: <YNb/Vj+TWxoG1rkE@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhankar Kuranagatti <shubhankarvk@gmail.com>,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
References: <20210428122755.2s56uotb225rezcw@kewl-virtual-machine>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pQGkq9g9OrWxSq74"
Content-Disposition: inline
In-Reply-To: <20210428122755.2s56uotb225rezcw@kewl-virtual-machine>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pQGkq9g9OrWxSq74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 28, 2021 at 05:57:55PM +0530, Shubhankar Kuranagatti wrote:
> Multi line comment have been aligned starting with a *
> The closing */ has been shifted to a new line.
> Single space replaced with tab space
> This is done to maintain code uniformity.

A step in the right direction but still not comments as they should be
according to the kernel coding style. If we touch it, we should make it
proper. Also, please use 'git log' to check how the $subject line should
be in this subsystem.


--pQGkq9g9OrWxSq74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDW/1IACgkQFA3kzBSg
Kbb8zQ//Q0krNyNOUNo0Ac9H+ZjZREEZFMtyp/Y3giXUQj4EMvx3JfS70lVfrOGI
ojM21qxH6hIwfFLsBLSgpJnXkKuq1BaimeJGwNa8pT4Obz2TExiJx5dM6E5+pw/7
2PQ41jU7x02j+eNFWTiSbWEOzwJX7rS87wFTiskLVdTYqYd9NBNqrH8AH9dZVFey
IS2boDEGTjJIOp7HWgwRdsQZMgKP6KTY6j4PtjNDAraIG6NjQoVCWBRKP5YD02Qd
1mi+wTSxVkbKY0rOtEKUNZTvCXoyDopF9KGKOuWYksCRXb+yVV8rvoESzLwESFm8
NuBeXSjtHrQtmuBJPvBjamTKwgIR9qEQyK3t3MwUV8WJGXxOCFma1Ysj8sO2mJR1
UUF2EHnSE4x2x+TsClcTG2xPil0cvt45gip26y50pANJygNgqgsXAKyLufCQevph
EQw2qH3yEyNs2fgzdhjQSSm6kK1b9XgNYJtu6FEheSjO92Jv1LXsZbBNoSZzXMXe
PDzSDLPNvxI6HqxBcAITxewbbsg3ufccs+vMM8/D58zK73ynH9COiKEXLnJ9YVvm
UQzw3U6anD/e4aXivJLEc/WnkDHUqajPo8dot+iA5mr3s+wxUrtQdkBPT87WLZgv
3HFFsyPqZbJ+ZDHgjGo4gDSJXdoQgI1gUa7cNV2veasGptcgJio=
=QikN
-----END PGP SIGNATURE-----

--pQGkq9g9OrWxSq74--
