Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7308981D
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 09:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfHLHqt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 03:46:49 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54720 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbfHLHqt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 03:46:49 -0400
Received: by mail-wm1-f68.google.com with SMTP id p74so11232772wme.4
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 00:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=lrPgrszRi4y8yAbGcnuUhC0Hrlx2Ru6O0e/W/S4/MlY=;
        b=WWCwWP0grDhwslIWs2KnZ305qgob3XPk9M3sgO2mmvsSMESNX50WyFFIdfCAavlUMH
         QUXwu5xTll63Dhi5gzDBOqnz2fKZ09uhbBM7PsFpyJJv4udGfsPDLiAi6kFA9etRHhU2
         oYFJXthPuh/7zEEai/vSsN/irH81rGOPt3VYhJO9hXUYvXcp2Wp/EIHL1O+59l6QCn3T
         WhCj40TFuobw00GGjhf6KEfuSneGeGlnP0txRQmSCTssXJgruxNcZXFbfM5P2lGJIXRV
         wI81cpRxIVSOFODIOKxzA1QgzrRkCD8vayvaHQ8v49PdIfHzBfaKAGRNACqneqeAzMfp
         DenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=lrPgrszRi4y8yAbGcnuUhC0Hrlx2Ru6O0e/W/S4/MlY=;
        b=KJs/LlpTXIEuPrENMR91R2PpQNjOrgmtQc6GQg2y/AgaL1vZEh/USgmwNaYZj53UwJ
         JDHhevy/3zxDfZwt2CmU5XIFDfiiPpXA8mvR7DziT2Lil8N5nMq5j3QEKScB1bY73cjJ
         60HitWJs+U1Tl657c4WSn4ZtUvLuMSrKwL/P9sOIWJ3Jh2LGp4811Rs7pHMMFqKdkOz+
         0D54Q5bl8IoQmeb2gUIlODfD3VbxGuyt26jRFTlePJ3GwsFLVwCUdB21+Gk/ahwZQ5ah
         zSYQYBOJPAvro1pP2y0CTqDXKAG4CdW7SnaRPfG4XkSqqeNUPwdgULXbmYPQopHeqOKZ
         FJPg==
X-Gm-Message-State: APjAAAXvCdg9ezeqBcImWX5gJVHkYwUibbjf+sPyEpXx0cemM6foyJ+l
        d/v0h1BbnbjGeXj9yDbNa5PIBw==
X-Google-Smtp-Source: APXvYqxiQGXbmZVhHNJQeBSroRneZRbmavKdwsrCkohTxJN0/4x1INuaopF398ew3A/xpu/Mmh8IkQ==
X-Received: by 2002:a1c:9c8a:: with SMTP id f132mr26130638wme.29.1565596007143;
        Mon, 12 Aug 2019 00:46:47 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id f17sm18136349wmf.27.2019.08.12.00.46.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 00:46:46 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:46:45 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/14] mfd: 88pm860x-core: convert to i2c_new_dummy_device
Message-ID: <20190812074645.GT4594@dell>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
 <20190722172623.4166-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722172623.4166-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 22 Jul 2019, Wolfram Sang wrote:

> Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
> ERRPTR which we use in error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.
> 
>  drivers/mfd/88pm860x-core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
