Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6960F1FEE00
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jun 2020 10:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgFRInb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Jun 2020 04:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728706AbgFRIn2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Jun 2020 04:43:28 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F946C06174E
        for <linux-i2c@vger.kernel.org>; Thu, 18 Jun 2020 01:43:26 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id r7so5154895wro.1
        for <linux-i2c@vger.kernel.org>; Thu, 18 Jun 2020 01:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=brvq047GWmZAo17C69Xj/1QyaxG1QhV4W0ODi9tBfK0=;
        b=um1VtIz1ojnFmyHyfDbAw2jjevGBCC8F6ig4HMD39gp1CU8SuAqgkEg2NNJrCMIlYg
         bTAKUY8zbGgzauDwHSuE8FMLJXz9oHLaky+S7ULuR8DSp7FoHTWLzDQPK5n8NZIbN4HD
         U8JaZFLsXXpirT5E6C+ILXnjHBr9vo2TrmvSuEMBXLRQAxUWwhbk4oqfcLy1zYEFtmNm
         sCyz2jbHn0MVC4fgCQVF2/opm4xl0QIW4ZNfAaHTMk3abaiS0AMtJBqyMu6O8SCZonvR
         LBC2yHgo9CMo2FitN56vSOJN12whYQmlZkS5w29LFRQdvc4D5SoIAou4DHoUI8kRUArn
         FTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=brvq047GWmZAo17C69Xj/1QyaxG1QhV4W0ODi9tBfK0=;
        b=tzQ7eZKakBBHMEIfgNS9RZSWh87hoaLNMjBo53x3R/roTolr+cz2mCneeQmXQzuik3
         nbEWbvMCV00zlXGabm/gavAOuKddkxsUACOad05zwgqrnd1WXDj+0nX/8+MH3qOZnBMe
         cTs+Sq4u1qjUIiJuh4eenpa+6wJFDz3Zt1pL1YZ8TyPgg0lzPUysVFNnFXnwkHlWcvMk
         6JAocktKdFhxsIk8xdaTsKebLEZmNz7Mu2QBXvFQ9tG8IUfdZWhTuZDTkiFD2i3bpocd
         gagVyPZ+JV3VBxS4lHWLyw17004z0sTiCZkBGyfOuw5Eocr4SsEKHLjtpLqEAfbC0FV7
         kH4g==
X-Gm-Message-State: AOAM532mMlb4mCh9zGZjeKIsGuUBN1sdrpyQaF8ZyNc930nnDrEKFSQK
        8XjZZ4KIZNPa6eDtnX6IbY0MLQ==
X-Google-Smtp-Source: ABdhPJzmV6kItaKJaH4rcxOjvDp5gt/F5ZQIJ2li/nrZlhjEurHChGdTsVGmEdRqHfl2f10IQgFFOQ==
X-Received: by 2002:a5d:5084:: with SMTP id a4mr3499044wrt.416.1592469805280;
        Thu, 18 Jun 2020 01:43:25 -0700 (PDT)
Received: from dell ([95.149.164.118])
        by smtp.gmail.com with ESMTPSA id e12sm2656213wro.52.2020.06.18.01.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 01:43:24 -0700 (PDT)
Date:   Thu, 18 Jun 2020 09:43:23 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] video: backlight: tosa_lcd: convert to use
 i2c_new_client_device()
Message-ID: <20200618084323.GB954398@dell>
References: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
 <20200615075816.2848-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200615075816.2848-5-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 15 Jun 2020, Wolfram Sang wrote:

> Move away from the deprecated API and return the shiny new ERRPTR where
> useful.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> 
> I'd like to push it via I2C for 5.8-rc2.

Go for it:

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
