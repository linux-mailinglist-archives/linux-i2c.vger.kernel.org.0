Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17CBD393E47
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 09:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhE1H7q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 03:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbhE1H7p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 May 2021 03:59:45 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D727C061574
        for <linux-i2c@vger.kernel.org>; Fri, 28 May 2021 00:58:10 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id n5-20020a1c72050000b0290192e1f9a7e1so1861545wmc.2
        for <linux-i2c@vger.kernel.org>; Fri, 28 May 2021 00:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=J8h+yFVl6+gCK72TQ/wrXM/Zn2HyvnRokyOnyrHJCmY=;
        b=e10BoW9b9Oh70+ncmEXa9Eo2Di9Q6o1FwGRs0YgOfwsVqDuEm3XXLEuroy53nucqde
         x0OR4DH3FIub0gIu4ItskClAA4PX2VIaTgMZ+PcjATm1Qmsqowcr+M0HngT4nnpN+TY5
         6X4IoU214k7xsB7ahJeXUNWLeEXYAXEZ+7YlLR6exsMF8JbtuDJZgtgmf816FhllytI9
         nWxUmefZOA3e66ysnVIuNSVf3RE93nZMAu0vQ0xyYrJzBSmG+i64f/E2uaQ6IG1mR/qa
         rd6LQ7VUqoO9BXTUeM7QsBGXJG9kSZefIIdbKizXCtcKQ0tJpTqqrowJ1PaFKLHkV9JF
         iUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=J8h+yFVl6+gCK72TQ/wrXM/Zn2HyvnRokyOnyrHJCmY=;
        b=t/2TTPOTII55IkzTn/efT3KTMGQDqA3/Az1p4Y57zqH+XJA+3/+qb7JiUz+eiV4yHj
         ca6e6SKctcwNECO9RNWHcyn4+AgR+l5FUqou2WQmnfwEGQfwiV5ybIk2iPDN9bmhz+v6
         Tr4SHg24xulmp3Xl8nWO4oCligAR8jnQgKco7+gqfmoB1grwD5pdjcwbK0od4zkmB++2
         us6RBqEPzn2ZyO/Iq8vN/RQ1g2HDx0hNqojxZmNpo0BC8jVkwVaumpiGdZRfJaY1AqQG
         gw+CbD3z2Gb8khePibLRclSBIDVHissnOXoAd/nMkuyDV91GBuVxTKqcYA8I8Tl1a6pT
         Afmw==
X-Gm-Message-State: AOAM533eIJjoFlcL00qXqs5+0fQSJ8NocTj8Sakp3pZVEuIwie93wgcE
        DxiR/hgRQdpkhhETy6gResUqmg==
X-Google-Smtp-Source: ABdhPJymjtlrG22+gwhoT1VXIV/D4JKTkswUDAuInEGKJfFD/yuMx3EgDcdgEjS01C4DdE59TX4mYA==
X-Received: by 2002:a1c:b087:: with SMTP id z129mr11829782wme.67.1622188688963;
        Fri, 28 May 2021 00:58:08 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id a77sm743427wmd.14.2021.05.28.00.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 00:58:08 -0700 (PDT)
Date:   Fri, 28 May 2021 08:58:06 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
        Sachin Verma <sachin.verma@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 01/16] i2c: busses: i2c-nomadik: Fix formatting issue
 pertaining to 'timeout'
Message-ID: <20210528075806.GM543307@dell>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-2-lee.jones@linaro.org>
 <YK/yyypWeOnBNc4K@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YK/yyypWeOnBNc4K@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 27 May 2021, Wolfram Sang wrote:

> On Thu, May 20, 2021 at 08:00:50PM +0100, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/i2c/busses/i2c-nomadik.c:184: warning: Function parameter or member 'timeout' not described in 'nmk_i2c_dev'
> > 
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
> > Cc: Sachin Verma <sachin.verma@st.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-i2c@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> Applied to for-current, thanks!

Thanks for these buddy.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
