Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 284AC393E9A
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 10:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235690AbhE1ITZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 04:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236071AbhE1ITZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 May 2021 04:19:25 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7A6C06174A
        for <linux-i2c@vger.kernel.org>; Fri, 28 May 2021 01:17:48 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so4039757wmf.5
        for <linux-i2c@vger.kernel.org>; Fri, 28 May 2021 01:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=AHWFtZ4JtVb0qrwTUD5lBPRsvkcKEz5Qmj3nhhGehuo=;
        b=BkAhcBwQsg5TOd1uYuKBkMFFqIq3uka7Hrkjmgn43dyehF2KDMqvOzcDwgQOlZReFv
         RQVYSR9jBmRP5NWzQTw2oRhydDHPg0jsVmnA9EC5JZGySoMyNKJFXPQjxja3G1O12JBl
         QVLS9bfS6DAJfDEheF2GedEsunvRR800RrCtoQqdX38bb1LRzqGcErYigDnbTtSBWXSj
         9v4ohQ1vt3ekfBiiqCCRaQziW5/YBr+rlSPpkTpy5b0B8TH+Yhxr9wCsakTVoeyEWGQ0
         lEDrUVvzpSySN9F+xaMY1Y4YeuMdBjKPScLg0ww5FN2Ow7zrWp4dVmxV0Tnngouex975
         JnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AHWFtZ4JtVb0qrwTUD5lBPRsvkcKEz5Qmj3nhhGehuo=;
        b=mYKIMv5200lr901ULBUje2dXxMuWbyvYNoPLA5i/SSlCcgOahFi3MAcTtxWrwDhYD/
         aA0mzvSqYMvcL2XxRNeVjpKc9FizXbOa/2AWiIyucPIZfgzkcuxBsFN5CjsNTVuUOh2J
         mZQit27fu8dv4ZnUIbCaiHtm/NVDMQHgLVcNgwW7ws2FMQQL0gHHbgCeNP1fGKHqywIm
         S8Yk51oTAq5O3sMcYLg++XS7waGkCtNJR/hjKxmJ6RHNsc+/HiU2nftdW19eQ3SwZsow
         IxBfxHZWFLx8YYpXUBkOSJIQLV66qu9zOkiYMvOCDH9e3fyoF1LpVvAsJ5VDgb+HEaws
         FyWA==
X-Gm-Message-State: AOAM533kgnyFTTAggAvDs1hdLzbpR8V/JfIUrZEh5Bo/y7XaSJpNSD4n
        cFZiLK1JQYo1WqUEEVjgbrqqoQ==
X-Google-Smtp-Source: ABdhPJy6PzNqD1BYPWB5auyCe89oOV8OLtsOqwTIL8Kb/M2+C88LJBE3wznE13EspYbEpENySQDPoA==
X-Received: by 2002:a05:600c:2dd7:: with SMTP id e23mr12339222wmh.186.1622189866195;
        Fri, 28 May 2021 01:17:46 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id q20sm17559400wmq.2.2021.05.28.01.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 01:17:45 -0700 (PDT)
Date:   Fri, 28 May 2021 09:17:44 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
        Sachin Verma <sachin.verma@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 01/16] i2c: busses: i2c-nomadik: Fix formatting issue
 pertaining to 'timeout'
Message-ID: <20210528081744.GN543307@dell>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-2-lee.jones@linaro.org>
 <YK/yyypWeOnBNc4K@kunai>
 <20210528075806.GM543307@dell>
 <YLCjDHmAG0FcePyJ@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YLCjDHmAG0FcePyJ@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 28 May 2021, Wolfram Sang wrote:

> 
> > > Applied to for-current, thanks!
> > 
> > Thanks for these buddy.
> 
> You're welcome. The rest will also land in 5.13, but I want to give the
> driver maintainers one week more time.

Understood.  There is no rush from my side.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
