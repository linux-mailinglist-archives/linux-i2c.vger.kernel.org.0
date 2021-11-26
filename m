Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9745B45E3E0
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 02:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238359AbhKZBH5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 20:07:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243282AbhKZBF4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Nov 2021 20:05:56 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB676C061574;
        Thu, 25 Nov 2021 17:02:43 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id p8so2039812ljo.5;
        Thu, 25 Nov 2021 17:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d5eybHUeaAVMy2um3rYiSgMu1qvMcc0ni9BDBOieeBo=;
        b=L+idWAu/GRgivG969p6gm/LH2qCEWB+i5m44beTgr6Uwa6hzdF2k4qBXhNZeLU6USE
         AChTYSdb57Vipf33dqjoqCKu1B+j/3EdyNxE5ANPzoyzy+oQH7DItcOOPiRN+nBk6eln
         8vcYABfJvDkeBwWC3fOVs5RcaHdQB0We53YH82o2z1iLmpNx7s50b0+/P9aMv7k1uYBq
         g+l7gx5pk1mJEwMf+kGfYz4+xFF4dHaybX0F6HJASGO3/nx4QKR0vbOkxR5UTV1Eq56L
         5L+D/+ft8wytUEy1smK5cMwSCidZTxDJ0slNHrk6jafsCTGdF1tbyrPZeqewO9cssL2x
         X6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d5eybHUeaAVMy2um3rYiSgMu1qvMcc0ni9BDBOieeBo=;
        b=QG6HSVvds8BapiYBrlDwJ39sLlNRbxtKE6Pd9BOBBgCHv1ZfWZe9Si4ytL90ML5w6j
         OKuPVM8gyN3luS9deN9rKZBraTUT93XlDy4EvnyFyQEk8fg5ER/I6ZT5oyMJq6MrDaEO
         spgWsVcF+X4XLnYabzu+6XKlghuT8ncCcZVhTtikv7Mmynuj3B6mJcnTIqves9eIQ9Qc
         uOmKcelQy49rKTwLhnJgeFmZ1s9m6Lf04eXCUX5a+V3PaRhYEoNWfDSLkXIG8nhTAem3
         sxDJ7J9ceyXvCC+jMaFK/1OhLmuR19gRmO4kNZTbtsMUKq8MGhMAl6JMAM2KvqSaWKDf
         14qA==
X-Gm-Message-State: AOAM532NVR4IkeAkJM2aFyZ83VAvWWfwdYjLC2Zz4IknLoSqCbrWibne
        K5pdJipheinrpj/WjI6UK98=
X-Google-Smtp-Source: ABdhPJwDlHo4lbJIQNIvxCxi52QGGUiKS4o/tEWhT6OWWbm2bP2UQs/NTgNq7wKFmXqO8NiR+HnQ9Q==
X-Received: by 2002:a05:651c:238:: with SMTP id z24mr30440552ljn.84.1637888562022;
        Thu, 25 Nov 2021 17:02:42 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id f6sm363021ljm.48.2021.11.25.17.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 17:02:41 -0800 (PST)
Subject: Re: [PATCH v4] i2c: tegra: Add the ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     andy.shevchenko@gmail.com, christian.koenig@amd.com,
        dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linaro-mm-sig@lists.linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        p.zabel@pengutronix.de, sumit.semwal@linaro.org,
        thierry.reding@gmail.com
References: <1637859224-5179-1-git-send-email-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <08781b22-2d96-6605-06ea-6911a4837474@gmail.com>
Date:   Fri, 26 Nov 2021 04:02:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637859224-5179-1-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

25.11.2021 19:53, Akhil R пишет:
> Add support for the ACPI based device registration so that the driver
> can be also enabled through ACPI table.
> 
> This does not include the ACPI support for Tegra VI and DVC I2C.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 52 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 40 insertions(+), 12 deletions(-)
> 
> v4 changes:
>   * changed has_acpi_companion to ACPI_HANDLE for consistency across 
>     all functions
> v3 - https://lkml.org/lkml/2021/11/25/173
> v2 - https://lkml.org/lkml/2021/11/23/82
> v1 - https://lkml.org/lkml/2021/11/19/393

Andy suggested to make v5 with extra patch that will make use of the
generic i2c_timings, but it should be a separate change.

This patch is good to me. Please provide the full changelog for each
version next time, instead of the links. Thanks!

If you'll make v5, then feel free to add my r-b:

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
