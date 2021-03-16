Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C107D33D136
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Mar 2021 10:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhCPJy7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Mar 2021 05:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236418AbhCPJyo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Mar 2021 05:54:44 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9080AC061756
        for <linux-i2c@vger.kernel.org>; Tue, 16 Mar 2021 02:54:43 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id o14so6302422wrm.11
        for <linux-i2c@vger.kernel.org>; Tue, 16 Mar 2021 02:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TP1HV3NWFU9A1fInCeM4u3y5tCPNsxpAVXNKL5e46ik=;
        b=Y5QeeLKgnZZ/6kkOd3l2dwrFCg8dPhfJJhbP4AyjILyn+gHYT0OgW74fE8FkDBjq+7
         vH0hRKMLqEFfkZerRFuNIBfpeW7obvle3bWfiRDE5BsytEuzSQLDSBqXQTguLD0x1dDL
         aZONvtP6w7S4Pxt3XioegS8L5xNELIFqMrEA+HRA58kW1OPsi/k1AZ14gcIWSZ8xWubO
         ep7nvAgV17IkhAE081tHv1dPIqZWD5kNWUNDI0vZLo30mIV+akbYobEdY9NT4jjuLb1j
         oY36wqLbu3RX6Swrpyir5cwT2vbyu8yHqTBcWmv/ei8RVW2Sg3NIr40CP1zEEtqbjudi
         2aWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TP1HV3NWFU9A1fInCeM4u3y5tCPNsxpAVXNKL5e46ik=;
        b=H9ExgSd0cLA/29vELsjqiHe/7UA47OAD048Y4EtW/VCmqjD5QLphTBmGBq1R/wP4tO
         l0UXWoISEFNmViZ+7CPQ/2CjRHIAPbBRGdMphrpimeceGImt9cEaEYOMt0QUnLIxZMFF
         hCt6UE+Xm15bJb8QqRhnf0wBfTSJjW4HR8tpKWrwqCXbU9gqqn4TeWKoQ+w5M2bq7eak
         tqWEntPdWr8DmEEChEhqgH+xOvqPxTTlCCcuEhv9FLy5jeYJYf7P1gyUTv26l0J2jiHV
         tysQbVlKK33bhzZzNuA8nPkEZDJ7nG9Gh6sY4YO0Zn3/W5dTqE5Hd34CWFyim6X+2MN8
         bQmw==
X-Gm-Message-State: AOAM533yEdSpZ+6C73fCD5v9OJupTPljMdUhw9w4ycSZvc9WLq/cv4p/
        WQM0u3tXIgO3EaHiJrdXhCV98A==
X-Google-Smtp-Source: ABdhPJzVBfkalssVZd1bfrcytFJCBHTuOVyqBg7rHMzb9c5G1qULi8IycGBXrg36LjwgmYacsrcIUQ==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr3949198wrv.10.1615888482369;
        Tue, 16 Mar 2021 02:54:42 -0700 (PDT)
Received: from dell ([91.110.221.243])
        by smtp.gmail.com with ESMTPSA id f22sm2618973wmc.33.2021.03.16.02.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 02:54:42 -0700 (PDT)
Date:   Tue, 16 Mar 2021 09:54:40 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Adam.Thomson.Opensource@diasemi.com" 
        <Adam.Thomson.Opensource@diasemi.com>,
        "stwiss.opensource@diasemi.com" <stwiss.opensource@diasemi.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>,
        "Streidl Hubert (BT-FIR/ENG1-Grb)" <Hubert.Streidl@de.bosch.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v5] mfd: da9063: Support SMBus and I2C mode
Message-ID: <20210316095440.GC701493@dell>
References: <20210315160903.799426-1-mark.jonas@de.bosch.com>
 <20210316072143.GA701493@dell>
 <4dbc130e769547508be811e61a348255@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4dbc130e769547508be811e61a348255@de.bosch.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 16 Mar 2021, Jonas Mark (BT-FIR/ENG1-Grb) wrote:

> Hi Lee,
> 
> > Code looks good to me now, thanks.
> > 
> > However, this doesn't look like it would pass checkpatch.
> > 
> > Have you tried to build with W=1 and checkpatch?
> 
> Yes, we used checkpatch.pl.
> 
>     $ ./scripts/checkpatch.pl 0001-mfd-da9063-Support-SMBus-and-I2C-mode.v5
>     total: 0 errors, 0 warnings, 25 lines checked
> 
>     0001-mfd-da9063-Support-SMBus-and-I2C-mode.v5 has no obvious style problems and is ready for submission.
> 
> Using the option --strict we get a check hint that the broken line of the regmap_clear_bits() is not aligned. We tried but were not able to make the tool happy. This matches our experience with this check hint and previous patches.
>  
> Also compiling Linux 5.10.14 with our patch and W=1 does not yield a warning.

FYI, you should be using -next for upstream development.

>     $ make W=1
>       CALL    scripts/checksyscalls.sh
>       CALL    scripts/atomic/check-atomics.sh
>       CHK     include/generated/compile.h
>       CC [M]  drivers/mfd/da9063-i2c.o
>       LD [M]  drivers/mfd/da9063.o
>       Kernel: arch/arm/boot/Image is ready
>       Kernel: arch/arm/boot/zImage is ready
>       MODPOST Module.symvers
>       LD [M]  drivers/mfd/da9063.ko

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
