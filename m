Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF5A30726E
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbhA1JQP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 04:16:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:50742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231975AbhA1JNq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 04:13:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAB2D64DBD;
        Thu, 28 Jan 2021 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611825185;
        bh=nCoc08hyKcJ5vfOd6TzDee2uuvisAAk6p0qjWq14A2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kzlWs2Dcyzckg43G6RflwpFzr0VJqgFzXsVPvlb8RNe76r9kWJudG65uiq+lraOdc
         G9g2Z3woBHci3VOmC6wOEUfwNUzjYtKCkHkPmEOvZ8TvJYRzMtwTxCbW60JZEW7AEY
         /fdFNCGGBdR75gw0Yj7UyPfah1Z2hQQ9wwCEDyQxujoesiGAZNVgpQ0HZfTD1M+EiI
         zKJCg5FsSlODr9FwmmCZ1fsPQXPhxQVSgpZVGShuEhIsuommTcA/WJt6/JY5CvC9Vz
         0yFhbAK8s+5psQXd1xSpgO4oxjffyvvPTENStWhlNtEGLMWWjz/d/cCmELYsMXLJqa
         B4hTktMgNxSuw==
Date:   Thu, 28 Jan 2021 10:13:02 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] dt-bindings: i2c: qcom,i2c-qup: Document noise
 rejection properties
Message-ID: <20210128091302.GG963@ninjato>
References: <20210114180415.404418-1-angelogioacchino.delregno@somainline.org>
 <20210114180415.404418-4-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gm5TwAJMO0F2iVRz"
Content-Disposition: inline
In-Reply-To: <20210114180415.404418-4-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gm5TwAJMO0F2iVRz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +  qcom,noise-reject-sda:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Noise rejection level for the SDA line.
> +    minimum: 0
> +    maximum: 3
> +    default: 0

What does this u32 describe? I wonder if we can introduce a generic
property instead of a vendor-specific one.


--gm5TwAJMO0F2iVRz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASgB4ACgkQFA3kzBSg
Kbav/BAAoZZxCeFm2JgyZX5Iyv10zaVI7zevlrKrhcHrYWLaAQux2y2c+b4UCz7r
nR2SLFgjRWELz2oomSb25ckMaNtBohgQurjk+lisKJoaar41C9mkFxFiQpWuFm8r
QnTuwScs1CXAxK2zETbZNRrkoHtC4zSeVM9ut6q0hMl2Apfz8NDIZnySrz13AAjC
UDGlZi3aqaa0iypPeRiuqABOlJ+0IGz72ZzlicH3RDazX4u6s51paxM59XessQQ5
QnBMWpcO8H1aeLGhFsuJtk8LH8wx7PP5jxl1dq8h4JpGRX84ge1itFytwBBfiBHl
q14hxVGg1bmCyTjJfnhWOANxi/wSdfYhnR/IVILAqJtjhxVeZp3Ry+QjqQpZBzHb
uTwUF+mz6MtK3a0bsl57d7z76519Lk4Pdh0PyXUm2s8IAjpjSmMiYUZP/GkSNf2a
7CZ0VjcqYA8RXs4nszb35HEY9hRCR3of11ZDDWtDCfm9VQonIYt1xTqG9mi+cTAy
AylaZ+4rsKCLbp52Ik38uFGwwsdLw68TkLI5Teq5gXnQJZSpQz6Otdrdaxb6/K0f
GZEQxOfFzoAiL08ejQ0vYub4vloDorZFVRLRCoYyDPtClIBcxkj6eNHR7KXqR26v
Ij/6kxBNFSu6cZxtfwjXHa5NF6J+Sv8dvJ1C19sN6xrt76HnWjM=
=dkAk
-----END PGP SIGNATURE-----

--gm5TwAJMO0F2iVRz--
