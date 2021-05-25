Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93E739098B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 21:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbhEYTYB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 15:24:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:48542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230029AbhEYTYB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 15:24:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74FF2613F9;
        Tue, 25 May 2021 19:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621970551;
        bh=WNXCsny2RCHObuthw2EADUIfUrtcdPzIFkEJVokSliE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M1+FHRbf4nJcJ7uClpGPZP2H4rs4bO7eRu39nr4NQVLT49+4iEp96YhkFbkiyV8+h
         16ae4fMV5LiYWt8MGdhUV+dE0ca/hy7Cc4WULLsMfZ49GhyW7G6lgDKjrDUZzPtOo2
         WevIhRrCTcMZkSYTpjQ9M2kaIQjRCbuIh055TWJ9qY+4ohnU2dEfRqhdxuCSHbBu8y
         muvFfUreJvUYPrUTplZxo5bSgI9G1P8QU8UybT5lNP4zr72l9Jc8Csg9XuQB3ZGaj/
         if4icxsI+tj6u7duxUXkblC7h/nW7kUTfz/JvcV/MIIPcucfsmQQuaDC2v6EXGiZec
         7Fs/nFM1eoChg==
Date:   Tue, 25 May 2021 21:22:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Colin King <colin.king@canonical.com>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: fix spelling mistake "unepxected" ->
 "unexpected"
Message-ID: <YK1Oc2wVZ7Y7qgya@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Colin King <colin.king@canonical.com>,
        Alok Chauhan <alokc@codeaurora.org>, Andy Gross <agross@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191103212204.13606-1-colin.king@canonical.com>
 <74e71d14-9f27-6a44-f253-4756ba124695@codeaurora.org>
 <ee839cf4-6310-aa4e-6ed2-322f20343953@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nCkcUKPtdBEoVDN0"
Content-Disposition: inline
In-Reply-To: <ee839cf4-6310-aa4e-6ed2-322f20343953@codeaurora.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nCkcUKPtdBEoVDN0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 01:28:56PM +0530, Akash Asthana wrote:
>=20
> On 7/27/2020 1:25 PM, Akash Asthana wrote:
> >=20
> > On 11/4/2019 2:52 AM, Colin King wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > >=20
> > > There is a spelling mistake in an error message string, fix it.
> > >=20
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to for-next, thanks!


--nCkcUKPtdBEoVDN0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtTm8ACgkQFA3kzBSg
KbZgKRAAnyWAZ+jU7Wvk4KvlmkOuniDeoaabLpp7+s4m0cOKT64cmGkWj/lrHhgs
vsxQ9sshWV67CM3OojdPUcMh7lrz9RDQi6cS11HTgvAsWWJm2PTtJVGtjzS0CoBv
WX0k4i285ErYVKwmLXjcxTfEnATiBlWwp5JqiC4+PNiM1KWWZiSWUUiUAHBEWwlO
dwT3uPg2c+T690QHn2eGxVenIN6nrjbSnBK8/3x8Kyy05+m80XLN99Dy7LdFK3js
VO69dug210Y3Ms5JPBvyV8nbmlNFuJ5S4PvsJ3i8YJigaAgECAv0nX6+RON0DI9J
qrjBKVfgTX/KK/gZHSzHkCjBabmImcVrND9xhd/cGmYCKxSfNQrTs1e59uiJrTkm
fAsooNSnZSaI/N3xpfqY3npa+uk+RlSoCkYeKF9VCHNAIApAPFYNW7y3GAVUNLBF
uppFxZ9L7k4/ZsGtqfpSla/nOyEhjQMB1JG/16wsb24CkB0Ocq3wePtxpq1VkKtR
j0NACJ4FrXJPDzloP5L+1FbI5QTGmPnDnT5sZmCOtGcXdsDbch7Vd5M65Dzm9ffF
b5O8b8exhdTP5Yi/7RTCL9N5Je2k+JvVBVhZxMn3yfZ52m9AHtdmaeuNr4L4ZPtX
mzPuFUXNLRjYeOoudy5+i9zam2ZbP5XuWoLoSuJ3MLg5FeNyEGg=
=xvMw
-----END PGP SIGNATURE-----

--nCkcUKPtdBEoVDN0--
