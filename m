Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC36A354EBF
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 10:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244379AbhDFIgd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 04:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244373AbhDFIgc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Apr 2021 04:36:32 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06AD1C061756
        for <linux-i2c@vger.kernel.org>; Tue,  6 Apr 2021 01:36:23 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id f12so7267713wro.0
        for <linux-i2c@vger.kernel.org>; Tue, 06 Apr 2021 01:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=krjAm4n3Rnt70NLkaNWfCxyQ3doFaMr0UZa20qd2rtE=;
        b=J59oBO2VELBcORoIjQjQOHCx0RQmxyAmhThXoVPu0WdA4ant2pnnnbkxr095eQcs97
         eIpJlZBcVU/dz7k4NWuEmfGKeWbTBv+Lh8UKzb6KfvvhtmGBywpQOCDPb7WIM7jT03rW
         +s+rNVxueQJzb/iPmJWTyj0d/0ijCJqZIAdZ2D2URnlYR6uMPA3oYuhvzv05MLmb1smy
         nbFyW0bo3zJDoRDomXqDk0hT4d2y5YwfZ1Ad/7wDwCBnNsgZdLNkHKqaafQ0iXfXO2FM
         xjLPSNXeCUrwB52pr5yobYHWrecbmmHAjenoVo01/NVNBOoWN+/SlulHplKWEfFqDajb
         JWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=krjAm4n3Rnt70NLkaNWfCxyQ3doFaMr0UZa20qd2rtE=;
        b=fsnUBp03kjY80cOAGQ+RtWZaA/3barP3DEreFfQ6monkVWmViNHRq2p6VXtDIZvjaT
         ApG+UcONaEZVU63FBssyjrtu40ldxAj+mdg/sQfn8d877m4x0f1z5cgHiLxRBihCIv+i
         egVYotDxY5pCmy9frsBqdkWts4CbV2PJ7KbYF4WnKl31RJYWufsiEODGqphxzcgBy3VX
         v4qi/syG/AtYF+gglx+eXWBHUVoSreHGXLUbwyBfYjchOGjnO3Gi0W9mtJ5vBp6xZE5J
         BEFTJaNSP87c8gqVdM3q6AOX/biqy5xyBH2KzKfcCut0ZkkHxTws/rO7RWWsSgUgSiFE
         I+7Q==
X-Gm-Message-State: AOAM5329eYC8BOphFYdxasYOuIq60z14gwq6xI7glBydVvr+T1iTpqf3
        t2IlJZFkJuwhY4R1XVs8AimPBA==
X-Google-Smtp-Source: ABdhPJy003W91hWNgbbo6oxoleK1/QXTVfHjUu8gALMBCd+eezArxHj1A3ZYOv1QqBgEcZZgK/rFIQ==
X-Received: by 2002:adf:ff84:: with SMTP id j4mr2783587wrr.271.1617698182609;
        Tue, 06 Apr 2021 01:36:22 -0700 (PDT)
Received: from dell ([91.110.221.193])
        by smtp.gmail.com with ESMTPSA id y22sm2383984wmc.18.2021.04.06.01.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 01:36:22 -0700 (PDT)
Date:   Tue, 6 Apr 2021 09:36:20 +0100
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
Message-ID: <20210406083620.GP2916463@dell>
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

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
