Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F01935EFB2
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350100AbhDNIeY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350071AbhDNIeL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 04:34:11 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA9DC061756
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:33:50 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id u17so30153569ejk.2
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qSiJYf3A2Fi5kx6d1IoI5ylPeQlcrj7WDE0UtDI/T9M=;
        b=NVKgLCEa/kUmT94dLFGWjNYqYTxUpnckJeuoB0RtbjEiyMoij9lcgbD2pmw+XkAlm5
         4WJj6HQQRtQ31QsibMON5MI3LuDnBqt0ROBDX8M8zXfTAsAI3E9DkdSDw97JezTHl4Kk
         frfxa+mH3UpyJGba384YN+2naMDSA5s9BHUACJpEqQv1IqPwFpbjjqo2tAiviEBXg/q6
         jMyPfaWxBEudIOypVPqPokkcpZ83EbJqV0m4bP5IBAMIUPTwy1GhLNYsDWds5zNgQ1Ru
         myR0mXb4MyEN0GvdOjUo0Zeja1CSibSeJyZFzOtmNaSjEzd7teM2s99d8KhaJ+aM11hP
         a0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qSiJYf3A2Fi5kx6d1IoI5ylPeQlcrj7WDE0UtDI/T9M=;
        b=T5ecrWgMY+KIER9f7wsBOyvPF07la1TEzh/ZDkyzSYbkLXIGkuO9ueVz8ZyhY3PPHP
         81MrN/fgA5zR3oPGA1mGFbr4RPJv8JNed25/1oAaIi8wUVlP52LAaKJMRfkjpCInVI0s
         nyHxc0PJTBj3KZYFJsYnsWPulXgJiejbPup491x8+/an6UXaHqh6GFpFmXRP66QY8kmN
         TQwcysn9C4IPHBePRmO9WFc/P838CpQzWnHvoGc0Hi6ds73WyoO1oLjHTu6LXnG+JyFO
         fFOG2vPe2JueG6glbosz0uD99An1s7vCwhrDQ0XLsTmMglcEcko2l898ZQEXo9Rfgo08
         oYDg==
X-Gm-Message-State: AOAM533Vu7knqfhomWF515FXjp8A7WRmPykHQPaOIHizgMdYgbxi2Gwc
        nEr0m0jWwQY6cq3fTLbEYxV4rQ==
X-Google-Smtp-Source: ABdhPJwvyKNaGU/rGQvKSNO5QyhKOwXYbkM7S3LR9Ab3EcHUuLOvvmVWdqXKB1BNHim/u0zW8JR5iw==
X-Received: by 2002:a17:907:3f20:: with SMTP id hq32mr29477536ejc.226.1618389229144;
        Wed, 14 Apr 2021 01:33:49 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id mp36sm9138695ejc.48.2021.04.14.01.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 01:33:48 -0700 (PDT)
Date:   Wed, 14 Apr 2021 09:33:47 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 2/2] i2c: designware: Get rid of legacy platform data
Message-ID: <20210414083347.GF4869@dell>
References: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
 <20210331154851.8456-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210331154851.8456-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 31 Mar 2021, Andy Shevchenko wrote:

> Platform data is a legacy interface to supply device properties
> to the driver. In this case we don't have anymore in-kernel users
> for it. Just remove it for good.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-designware-platdrv.c  |  7 +------
>  include/linux/platform_data/i2c-designware.h | 13 -------------
>  2 files changed, 1 insertion(+), 19 deletions(-)
>  delete mode 100644 include/linux/platform_data/i2c-designware.h

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
