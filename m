Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA1E633DA47
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Mar 2021 18:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238426AbhCPRHy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Mar 2021 13:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239022AbhCPRH1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Mar 2021 13:07:27 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6166AC06174A
        for <linux-i2c@vger.kernel.org>; Tue, 16 Mar 2021 10:07:26 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id g8so10519114wmd.4
        for <linux-i2c@vger.kernel.org>; Tue, 16 Mar 2021 10:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XetONy7f5rPbDG8ORoDEXi5JIE3d5MGv+mu0qzlx9mU=;
        b=zAi29rQWRNTyTTFH87GKtg+zv7puXL2uzBxaHxJRWb2XH3ODL42uv/9bJxycDIsyvy
         Gmpn448fpQWkV2871UL3deWGLKAoIFM9S6GKRHBXA97MdkhH9AMK0tutgco0N2On/vek
         LSLOSBfv8qAureelkeGouQlhhLV9rEi56n3L66sHAfGqxjDBWr+0uQV39MBThHd6WibR
         66xED5jPt+Ryf/efUQWwwVnr5PzGCLbXCwmCsFGjRprsmnLvwN9J/83pKP2oY1JAen+A
         P2ormHDUc2XkLP62tK1Arqi86l3egY9hEdHfbmJjHFFNC/Wgicgu+GhaMG0fp0QiRa9C
         mOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XetONy7f5rPbDG8ORoDEXi5JIE3d5MGv+mu0qzlx9mU=;
        b=oP/yk4casH2UGekpvffwU5lupmIUUXZKHsqei1hPdf5eeyMRVvt9ncbc96XkIXG/bU
         vg3c0fJaTqOfwElnh4lh28lcirts3qRD4Jb86aQ/uTzkgm/etLX9CbK2kcCDKGOSuqQk
         DJte8v57Heht+PuErWcZbYAlv7FTn415T9UYkPI7MhU5HmVfHI239UjhMmljaRBnzuqr
         3GmLoc8xgaSydX0QR0RIpCVbqmrm0rHoR3Ckyw7pdrxNYCmH0+xGGov96yN6939QcBNG
         FqiRvTXLG0HBNxw444uqwHVRlnHnPd0TRTlw+hUMZXYFATlU+g1LhoWjOSkz71bSm/vF
         p7mw==
X-Gm-Message-State: AOAM531ZHjO1cJt9Th0Mm2Q1Fvh6VoyeakSBs+3NkorD0OAjYWeC4zpG
        hDg8HRuD03tf+PsVa/8pxyBolA==
X-Google-Smtp-Source: ABdhPJyebnHaazttt5lWjDJ4csWwfv8ozGVysi047E1gaNMwwkFol59VV7lH1+Fij3NHx/NNuSuUnQ==
X-Received: by 2002:a1c:7905:: with SMTP id l5mr31655wme.181.1615914445041;
        Tue, 16 Mar 2021 10:07:25 -0700 (PDT)
Received: from dell ([91.110.221.243])
        by smtp.gmail.com with ESMTPSA id z1sm22520232wru.95.2021.03.16.10.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 10:07:24 -0700 (PDT)
Date:   Tue, 16 Mar 2021 17:07:22 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mark Jonas <mark.jonas@de.bosch.com>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Adam.Thomson.Opensource@diasemi.com, stwiss.opensource@diasemi.com,
        marek.vasut@gmail.com, tingquan.ruan@cn.bosch.com,
        hubert.streidl@de.bosch.com, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v6 1/1] mfd: da9063: Support SMBus and I2C mode
Message-ID: <20210316170722.GF701493@dell>
References: <20210316162237.877436-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210316162237.877436-1-mark.jonas@de.bosch.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 16 Mar 2021, Mark Jonas wrote:

> From: Hubert Streidl <hubert.streidl@de.bosch.com>
> 
> By default the PMIC DA9063 2-wire interface is SMBus compliant. This
> means the PMIC will automatically reset the interface when the clock
> signal ceases for more than the SMBus timeout of 35 ms.
> 
> If the I2C driver / device is not capable of creating atomic I2C
> transactions, a context change can cause a ceasing of the clock signal.
> This can happen if for example a real-time thread is scheduled. Then
> the DA9063 in SMBus mode will reset the 2-wire interface. Subsequently
> a write message could end up in the wrong register. This could cause
> unpredictable system behavior.
> 
> The DA9063 PMIC also supports an I2C compliant mode for the 2-wire
> interface. This mode does not reset the interface when the clock
> signal ceases. Thus the problem depicted above does not occur.
> 
> This patch tests for the bus functionality "I2C_FUNC_I2C". It can
> reasonably be assumed that the bus cannot obey SMBus timings if
> this functionality is set. SMBus commands most probably are emulated
> in this case which is prone to the latency issue described above.
> 
> This patch enables the I2C bus mode if I2C_FUNC_I2C is set or
> otherwise keeps the default SMBus mode.
> 
> Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---
> Changes in v6:
>   - Fixed checkpatch check 'unaligned broken line'.
> 
> Changes in v5:
>   - Restructured according to feedback by Lee Jones.
> 
> Changes in v4:
>   - Remove logging of selected 2-wire bus mode.
> 
> Changes in v3:
>   - busmode now contains the correct bit DA9063_TWOWIRE_TO
> 
> Changes in v2:
>   - Implement proposal by Adam Thomson and Wolfram Sang to check for
>     functionality I2C_FUNC_I2C instead of introducing a new DT property.
> 
>  drivers/mfd/da9063-i2c.c             | 10 ++++++++++
>  include/linux/mfd/da9063/registers.h |  3 +++
>  2 files changed, 13 insertions(+)

Applied with Wolfram's RB, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
