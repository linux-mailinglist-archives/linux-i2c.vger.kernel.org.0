Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0EDA1A9BB7
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 13:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896715AbgDOLFu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 07:05:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408842AbgDOLDn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 07:03:43 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E473AC061A10
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 04:03:42 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id h2so16882964wmb.4
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0+mvRsViHtX7K9QeV8vxa3vsUkNlZfKOjncMUliYwFY=;
        b=xBGqeqRbPXVWiiUbxgEhXzqhm8+4utoknFiMQ2GeDoSoaq957UF0r5Ozhe/ePFxylV
         grOY7YQfUk2VucGAYiFwQCYWegigxHFgD+PUetMbxEgta+wz4wP0G35R0++BYc1bbvsn
         hG7GWkJn884XbfqytX4RFrFw5VSp/Ekt1aYTGKOzPqkeMR7Km73j1Gpb1gvcYG0QnqX1
         mhlUBbYGEwQGSs4bRkTeacdvsq1UBtgangAcQSnvQdJNbdyUkA4RsHnYBhyrr+6VMCqq
         4MoCPuQZclf/dkJJDRe9T3K3KS5EEjo7EbqK1YwZEEGkbnhaN344JYz9yKgl7BhKnGTW
         rrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0+mvRsViHtX7K9QeV8vxa3vsUkNlZfKOjncMUliYwFY=;
        b=nWwmSC6tw+eKw//xk6jnmcUe+7U8h/fY3sbY9dEEm+ja3y653BFxuTx60ONRgOOWJT
         eJQIiGh1TBLNqqrtSH+iftqtSbA72Kw0MaQRSXzid99tr0fqIdegZoqS870nmdXVfhsI
         hfnV5TyY8SyfZM0YQCdiCWSKODGt3VzmZmtEAvVqAJTsSiZAirshU6Btwu87f1FEgvUH
         c+hS1acdyum+GeacEK+F4UgvM33Ie85A+lbkdJrRpQ1G4Fmp4MBeN18rEyplIzeTQGvT
         GzeuMiD/Du023VaEXUmddS0feYsOjSXMC5FcFNo+aP51YS7bkReg+ZIZ9fvTzDbLGSD6
         fRng==
X-Gm-Message-State: AGi0PuYl2ds1G07eVVgNPoIHT2y51bs2Qq6rcwOJRhP74jFno4n7Db42
        eCV+Hr39Cph1aGwC8zmBM9TuCtK/HQE=
X-Google-Smtp-Source: APiQypKYzMGWG+zMXscvJ4uCuaA8QuvLPgqp0ZkOm8oeOQzmEuU0a08KKg1p2ijuDQzlljeF//y0+A==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr4716740wmf.77.1586948621597;
        Wed, 15 Apr 2020 04:03:41 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id u30sm2531311wru.13.2020.04.15.04.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 04:03:41 -0700 (PDT)
Date:   Wed, 15 Apr 2020 12:04:42 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] mfd: htc-i2cpld: convert to use
 i2c_new_client_device()
Message-ID: <20200415110442.GK2167633@dell>
References: <20200326211009.13411-1-wsa+renesas@sang-engineering.com>
 <20200326211009.13411-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200326211009.13411-2-wsa+renesas@sang-engineering.com>
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
>  drivers/mfd/htc-i2cpld.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
