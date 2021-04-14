Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C6935EFB0
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350066AbhDNIdu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350061AbhDNIdu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 04:33:50 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF13C061574
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:33:27 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id mh2so8568210ejb.8
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xtZyGhp+r8KyQsgdY6dvRyvGM+PA3hhprK2XIk+e5iI=;
        b=Zj9BoZa5Uwmd4GL7iOxvoxDCYIDkBLMsPKxvvHMbB1HNmv7WTmCQn98J+/uaMsrcRq
         ZkPgT5N6ZWiEAm/ALL2zIJbRgOCD3jUZSCo0w77xt3EC23R6OxD3yVjXnb+G/tw2+42i
         qFplRAZA5uspzQg+9yeCYCVXTjXM5ktK/JbEPt7Lqvu6MLC1UjSyHAxqo6UkdHabLFGz
         JOkI6DJfOha1nxKrD7Ej2L2jw/w+iOJJjgsxXz43d6iqWkO5l6Z5Re83zyy204g4hQCM
         fTlELbrJbjxTtFUzWjNIQvP4CshhLLgT2Jtffti0KJfMGP36JZuenngJ4bQqW7GgqbTn
         /qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xtZyGhp+r8KyQsgdY6dvRyvGM+PA3hhprK2XIk+e5iI=;
        b=Tvrx/DpFPX8NPaqTvSIuoGJQV6E/uSOc0plJCpnSFMYX9YT2DNypX9HqySnSOJ+WtY
         kGI5KAlc4w062o0RKYRSXAWudYOMT493GRBaoAfSnNsnPUMsfe/Yw4dXLIlfZWXmI3SV
         7rqCY7WT/l6aIE6eAUNmVwuBKg4MBVuvaHRvoeo4FeOCHbhnO5vadifvFYo0YG5d3Vwo
         9qO70LznNf57oeGWAJiS67BNrBJsDDml31AjKV5MPwOpeaxYiG0dI8NrLrpamPuq/8/e
         C41LjC3fcKtcxkAYFj2H4/exCUnuxnFhDnWYGwoFjbtbUITHGz76El+AljnWtTe7N8Ix
         RxVw==
X-Gm-Message-State: AOAM532BQvwlCSaQca+1Sphcc6AtM2o/7UlkasV/kVs7IVDQOodgC8sS
        rDuL3A50Cz5Cs+4orN3i4HOAdA==
X-Google-Smtp-Source: ABdhPJyyf637F4yQJ1Y0LSg5vfXoU2bVseY3Mb+2LCpWkgQmQAK501PeDMSQhDbEtOeAXEcGERd00Q==
X-Received: by 2002:a17:906:86c2:: with SMTP id j2mr25434581ejy.257.1618389206394;
        Wed, 14 Apr 2021 01:33:26 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id ga27sm1577044ejc.87.2021.04.14.01.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 01:33:25 -0700 (PDT)
Date:   Wed, 14 Apr 2021 09:33:24 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/2] mfd: =?iso-8859-1?Q?int?=
 =?iso-8859-1?Q?el=5Fquark=5Fi2c=5Fgpio=3A_Convert_I=B2?= =?iso-8859-1?Q?C?=
 to use software nodes
Message-ID: <20210414083324.GE4869@dell>
References: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
 <20210331154851.8456-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210331154851.8456-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 31 Mar 2021, Andy Shevchenko wrote:

> The driver can provide a software node group instead of
> passing legacy platform data. This will allow to drop
> the legacy platform data structures along with unifying
> a child device driver to use same interface for all
> property providers, i.e. Device Tree, ACPI, and board files.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/mfd/intel_quark_i2c_gpio.c | 41 +++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 15 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
