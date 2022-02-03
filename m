Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7184A8AA6
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 18:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242890AbiBCRuL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 12:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbiBCRuL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Feb 2022 12:50:11 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99A5C061714;
        Thu,  3 Feb 2022 09:50:10 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id w25so7599855edt.7;
        Thu, 03 Feb 2022 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DlHF1ezZsVyyLw16v2PxMSWN/nd7gwtKLelkVX/tiX0=;
        b=ByMXCyiJMiEqRQ+FEL4KhRZcgt0woCBUqDhuf335ndRQUq+VVT0KBKC9ARSbobSlow
         EhlODK+uE5wAZ78xmgHSvNH3HMfUjoO0l7XCBapQlmHaJ4R0tzNKmZjU39DUqtECBY/Y
         lMMUqORd3U+s37MGuvTrdwUTQEvpZMQqyYq5I6Zz2KMnaz00VF1LVxpQlyOUKsRnS5kP
         r8MJGff6CNUi4ITPpoGJR9yE2qo+Ab6J3w+9WRhODjhiYkkxpOFDrWil94dAK9UMGmql
         bwej8hONl1blIKeOO6uF7dclZG3RdUdixRL/O2xwKq9s/IBtKambkPYVOplcFFV5ybb8
         AQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DlHF1ezZsVyyLw16v2PxMSWN/nd7gwtKLelkVX/tiX0=;
        b=ieDV4GtgbpMD++wnF8fNHhIikO75PGRjjEJvTIdtRZw9++ga+kjgtngxzwmc7TbG7p
         j2PxSArZcMTRcnTxy5RzIKZzUOPAIkDB913XNgUm6NSQn7jPFUcWzWsBNnkXLHPYelNf
         lvREbx05LM4e9FebWOT/QKMK6pLn4I07QS3xp4vrGMNxmbeE2RXWlzK7AZ80H/0C6fOg
         6jDGpiCFNjkyldCwfMUUn74+o7o84Klh1oelnASiHkJwNpsnnOm29/a5N5ea4/Zt/dpG
         Hbd/F7rcQstinfDGoWadC0dWu8MrRS7UFl19ppOasN1nXqAScGsWLEuNH7W2Uk1bRsNQ
         sHXg==
X-Gm-Message-State: AOAM532zF0rPE61OUz0JUagTfvbDOP2SINpcMAccihEKWrkAG6tAfhAw
        1Hnq3A2BE/Snds2MEbENS+o=
X-Google-Smtp-Source: ABdhPJzdxlCUVDtjmB3ENX5mKOqOonAT9GMGhVa+oTeOAuEEbGMNDuDWfBrWS+tw0rV3CDLh3UnogQ==
X-Received: by 2002:a05:6402:1612:: with SMTP id f18mr14801649edv.454.1643910609310;
        Thu, 03 Feb 2022 09:50:09 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id h8sm22578309edk.14.2022.02.03.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 09:50:08 -0800 (PST)
Date:   Thu, 3 Feb 2022 18:50:05 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     devicetree@vger.kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        mperttunen@nvidia.com, robh+dt@kernel.org
Subject: Re: [PATCH v3 0/4] Add I2C and PWM support for T234
Message-ID: <YfwVzVHZ6SQhKpLF@orome>
References: <1643023097-5221-1-git-send-email-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ruUbb3Ly1noXTLRH"
Content-Disposition: inline
In-Reply-To: <1643023097-5221-1-git-send-email-akhilrajeev@nvidia.com>
User-Agent: Mutt/2.1.5 (31b18ae9) (2021-12-30)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ruUbb3Ly1noXTLRH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 24, 2022 at 04:48:13PM +0530, Akhil R wrote:
> The patchset contains driver and devicetree changes to support I2C and
> PWM for Tegra234
>=20
> v2->v3:
>   * Sorted clock and reset based on ID
> v1->v2:
>   * Reverted changes in i2c-tegra.c. using tegra194_i2c_hw for tegra234
>     as the values are compatible.
>=20
> Akhil R (4):
>   dt-bindings: Add headers for Tegra234 I2C
>   arm64: tegra: Add Tegra234 I2C devicetree nodes
>   dt-bindings: Add headers for Tegra234 PWM
>   arm64: tegra: Add Tegra234 PWM devicetree nodes
>=20
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi   | 133 +++++++++++++++++++++++=
++++++
>  include/dt-bindings/clock/tegra234-clock.h |  35 +++++++-
>  include/dt-bindings/reset/tegra234-reset.h |  16 ++++
>  3 files changed, 183 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--ruUbb3Ly1noXTLRH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmH8Fc0ACgkQ3SOs138+
s6GGCg/8CfokZvYlAjOMxpDQHvkgL6CKcSSOuY1KlwkyLC39mJ/NqFzh8rQO7YFe
9YxInRWkjk0Kjf7uzyQMYIozXS6V+zdqmaPLPCvNyh6wgGlkc4IOuSshJQIyo8V5
rAHjLtrJvdiw395TQn89XhXPPledVwYfjqE/jfRiVF9ZFhdwkkOmzdcznhPuFBrT
Ud5fsxhidf8msw6GgEc9CJEwkWM2QIFhx5lZnPh0dMgqNs8DfNzMTYGdc+VjFvYP
Yxo4TlMqurS4A/qr0a4mFG4FwNcKQEc1W5nNSlJQ8K8psiEk6lO1/MB87G01/uLe
HYGhXLmo/ZtClcHjNsGuyiFJeevat+nZQd0JizmcCwcqX2zyhnCpRtgW/4dzXP1q
f4cXtz+SkFuWJ1XXmyI30TySCOBcYPcN/xYE2jUma4lOJzRLhSO31Zdj26Q6pv38
gKtxBJ37cEv8ON8fVx/mGWbnYgw/H0QMjbavajUJxSoDwh0j9X736mcsIKSX6/PK
MSfaIuxvOi5gc3hPmVqgg4LO1k76dR3dLESq81fuplGWZROwoyuD8nIpENaH8/bS
vH6eMoHiFICbNEaV/T73Wr4g8GCY5rQa8gPOp73rQC++7JT6CpOX8CtHDMojnf7R
X8qR+wQi6uPqwa0BIFMBXlN+D2HioRJY3CUdKqileg2HFgWycuc=
=v0Xn
-----END PGP SIGNATURE-----

--ruUbb3Ly1noXTLRH--
