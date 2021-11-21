Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1BA45843F
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Nov 2021 16:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238340AbhKUPFh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Nov 2021 10:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238337AbhKUPFg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Nov 2021 10:05:36 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E29C061714
        for <linux-i2c@vger.kernel.org>; Sun, 21 Nov 2021 07:02:31 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id i6so31354908uae.6
        for <linux-i2c@vger.kernel.org>; Sun, 21 Nov 2021 07:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ewCR+zztptKsJ8KIVGfIJqeRh+t6Nh5hBzYWdIOddbI=;
        b=DSjlOXuFLR7fltc2k0KwMobb2ttHVi01kU8LQbXxB4/ZoJNVGakI1uUnUpqRG+TQiC
         ajP4SRxqDR5m3WtzrWAJ7s64fJnWhcJ6j1U3s28rYZI5v4VqQ87Q86V70FosO5DmcEAj
         orxqnTbNjtQD41OMApZpL2I4T4qtNla09xA9fBYlOKehTJHENu9xdDRADhVYOq67FxT/
         fkeLCT1rO5Locz14W5zmawwgXQ2UaUdYzXwFhf5VD6nGF75SRP+lHeAYL7y9SPlAOZUQ
         iJofS02RBpZJEMbn5nWppRCw3gzbhuAsYv6QweIa2t30uunwUJCthDZ2HwkhfnzOFDhj
         oHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ewCR+zztptKsJ8KIVGfIJqeRh+t6Nh5hBzYWdIOddbI=;
        b=PnMT3Yrh4e3K1KYd1JI3PbKnOthc1kVFn4an1Q+6rk5fQ/ZE8qxPqEtj7UOFJg76Z/
         fxosRyKSBMpllZKNhxYGf4e2c+UFz6wNmfQ0WQKLDEj4E2sK21e4RdkcBKzC8hHAknHW
         591X91ONfBod2LxuspAj657rkdPZV0j03DMEOHTAeKfJK4u2veU+jKBYJzVSwvb5UjYn
         bvSEQdJB8MU1m0aFxhqunfs/nBhVgQ50eoNPEtLs0qJjEMHAGPNCx7uX1vPM6OSKWSX7
         1i1a7CWGgFjsngZbb9Nbr3kKmpjNX1RDIKbaDfI6zaOo7vAtRKdphQDrugHPMnwM1lp3
         m13Q==
X-Gm-Message-State: AOAM533sIM9cYiO7ECn98+aeyg8+MU9E/4FW7qyVU7wZ0LkFxUjJwWSY
        KFnYmzxEo4IxTDMi+KmMbXMbTv50db84mbT5hiKpeayhDyMKlg==
X-Google-Smtp-Source: ABdhPJyGlYS/dAMmh8S6nbKcs5k5Z/LtQK+tCLwZxz2GaoFXq8JvxOqmAYnacyFaR7rjYK52hB72Yq3KW5hpk1W2hcw=
X-Received: by 2002:a67:d893:: with SMTP id f19mr116652012vsj.39.1637506950538;
 Sun, 21 Nov 2021 07:02:30 -0800 (PST)
MIME-Version: 1.0
References: <20211108134901.20490-1-semen.protsenko@linaro.org> <b374d1a6-6478-cf2f-924e-425825731ad5@canonical.com>
In-Reply-To: <b374d1a6-6478-cf2f-924e-425825731ad5@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sun, 21 Nov 2021 17:02:19 +0200
Message-ID: <CAPLW+4mq1H9N4BEAT2zoPxa85SXN2jPHqEJA7HCgavaDDpfEDQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm: samsung: Remove HAVE_S3C2410_I2C and use direct dependencies
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 21 Nov 2021 at 14:39, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 08/11/2021 14:49, Sam Protsenko wrote:
> > A separate Kconfig option HAVE_S3C2410_I2C for Samsung SoCs is not
> > really needed and the i2c-s3c24xx driver can depend on Samsung ARM
> > architectures instead. This also enables i2c-s3c2410 for arm64 Exynos
> > SoCs, which is required for example by Exynos850.
> >
> > This is basically continuation of work made in following commits:
> >   - commit d96890fca9fd ("rtc: s3c: remove HAVE_S3C_RTC in favor of
> >     direct dependencies")
> >   - commit 7dd3cae90d85 ("ARM: samsung: remove HAVE_S3C2410_WATCHDOG and
> >     use direct dependencies")
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  arch/arm/Kconfig                  |  1 -
> >  arch/arm/mach-exynos/Kconfig      |  1 -
> >  arch/arm/mach-s3c/Kconfig.s3c64xx |  1 -
> >  arch/arm/mach-s5pv210/Kconfig     |  1 -
> >  drivers/i2c/busses/Kconfig        | 10 ++--------
> >  5 files changed, 2 insertions(+), 12 deletions(-)
> >
>
> This does not apply, which is weird because there were no changes here.
> It seems you based your work on some older tree, so please rebase and
> re-test on current tree (my for-next branch or linux-next).
>

This is strange indeed, those two patches are rebased flawlessly on
linux-next for me. Anyway, I'll send v2 today, thanks for letting me
know.

> Best regards,
> Krzysztof
