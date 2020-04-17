Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDDD31ADACC
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Apr 2020 12:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728915AbgDQKNu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Apr 2020 06:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728916AbgDQKNq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Apr 2020 06:13:46 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434ECC061A10
        for <linux-i2c@vger.kernel.org>; Fri, 17 Apr 2020 03:13:46 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id u13so2422652wrp.3
        for <linux-i2c@vger.kernel.org>; Fri, 17 Apr 2020 03:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Si8xNa2PRt0kIhccFd8IRCrcCliJZGdfrQl0M6nEdTs=;
        b=utdWXHRDGLukUPDocwW6Cm48BY6bvFz80fFjJC3jpN5iRv2FnVhpn5i7lNKcBhS8sJ
         xHiQQO2Jbegs0tzYojnLQ5M1vDah1L2xgfi1BzmqHjJKC0wTjgKJPL4ZiXUtHDEeWApp
         G5pEAeVkba955wVhuY3VoZCj8teWpA60tuCqiu7FfOrsGWO49JAro14aLJNAoX+NQSD1
         ncHthxk6aHwtjwlI2DB0JBVkqCBjdu3aXRQMKmFTfMcYQNw3MmhfDE8LHt2N8SOyCPsw
         CAPXYAV9p4XxXipAbMvRb+N7NHpA6NGbsoM95P6IjYP1DspabfxVh/PdyVMd4UDDKbs7
         uOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Si8xNa2PRt0kIhccFd8IRCrcCliJZGdfrQl0M6nEdTs=;
        b=CVSoiy0TniwgiwmBLEAoUmHuSMPWfnXf/3SHSJmlQolg1VFjUVhOc2HXyKPUUMHgy0
         zIbhrxdI5E7shAU4NThEoKF4qr6H6Hobwds4Mw1yj7eEdNWQuXXh0ECDo5fGj9/6rNuJ
         2Cq+KiK5WfaOwf4eCY9WnTcwL6ZfG+J2C3auubAQL7a6W97fXAo+y8kIkjDrIGQl6N7C
         Vc27/y6SL9+4X1zggctj0A8/qW8XPggDqgscN5fd6QoGmV9iKans1+cVOsTtEZyYRZaQ
         eqHE+j56blof22ZEP49pQXgmccnyyqNDkORc2gLwPToqm01JYIEfxerc3r8lPgvZGv49
         tpXA==
X-Gm-Message-State: AGi0Pua4ibnjbbyy3D2w7egMBJb2fOYojSCcrVR73WFdGSkweuhoXTV5
        suDDdb8XhMssvAifHJ+tLwE7F1bX2fY=
X-Google-Smtp-Source: APiQypJJoXQEbutIxLdmsu/x/STiUGWe4/3crlmEFrGGKFCFPbSIFAprP4Y9woxirt4trOT8/ToViw==
X-Received: by 2002:a05:6000:8f:: with SMTP id m15mr3108271wrx.19.1587118424935;
        Fri, 17 Apr 2020 03:13:44 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id o18sm4886743wrp.23.2020.04.17.03.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 03:13:44 -0700 (PDT)
Date:   Fri, 17 Apr 2020 11:14:46 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] video: backlight: tosa_lcd: convert to use
 i2c_new_client_device()
Message-ID: <20200417101446.GB3737@dell>
References: <20200326210959.13111-1-wsa+renesas@sang-engineering.com>
 <20200326210959.13111-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200326210959.13111-2-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 26 Mar 2020, Wolfram Sang wrote:

> Move away from the deprecated API and return the shiny new ERRPTR where
> useful.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/video/backlight/tosa_lcd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
