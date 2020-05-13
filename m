Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C1E1D0A4E
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 09:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgEMH5F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 03:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgEMH5E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 May 2020 03:57:04 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD94AC061A0E
        for <linux-i2c@vger.kernel.org>; Wed, 13 May 2020 00:57:02 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j5so19628904wrq.2
        for <linux-i2c@vger.kernel.org>; Wed, 13 May 2020 00:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iYHNaCXW5xjfs5mLItCWmvqIS4ihxQJ2Bn4CeqPsH0M=;
        b=HNYQG4jI1ZonR9N0hRjeYQIx4jJh5bPkZLAC5SFCjUeLcQPlnBkPok16B3r7ijsSTv
         1m6ULiyNFPlg0FsX3HwxyvhN8Nf/ucUDTCrwQs01FAn9FPADclQZtUKgfC2ZVrSM31Ia
         fLn6C77rm+T8c9RwUZUjgZi8XNWyiQjikc4qaI+/LMZerKnQGaeDLn8C+eJMdqwFKjKk
         rgs8zPbvDzLBv0pQmTY+pqC5kAWS2WqU5iY4kW2oU+JbZWMdSPMGXUCn8fd9mLbGxoQv
         j4XtjN6+LscH4YCqCw/Wv0FNuRCmiHilik0gYb1rjJhLJmYejyx4v2vzoHB3wzGMZa0I
         UUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iYHNaCXW5xjfs5mLItCWmvqIS4ihxQJ2Bn4CeqPsH0M=;
        b=k/WAKdKaebT6NkdPbkKcNGa8/8EDt90wzSaULOe28pcV0TsFOku45LGGxeVQBfdUer
         Po1FLpjw44QBHUz/9zJA57aMm3fLoLEsapjfYwTfkZz87vEZETmXZ269hkQfLTb6XAwE
         w4RhVMs7Rf0wZ68esXmNiUBzIWoxtQDsWHfaviWycro+NLeRfdBVKyitgZPJFuVuHM0x
         MD+YkZMls2xFQDSojbOZnz1Xp9d6GTQ8kSecch58twxWDTN23Uqx+KQ3k+plRn0YyupY
         SsPvdMcFBCcw4Tjqtvpy8hMEVKEeSzt2fSnMhP5BzSOMmNOH0lrkfSo3zqE4pYjcaHtd
         ucAw==
X-Gm-Message-State: AGi0PuaoeR3L/JrEs4wqsnDTKyp/BBz+Fn6wB/T9G1wpucR0wOLK+afW
        vJXGI/zJeBLCvEOLJAxU6Y09BA==
X-Google-Smtp-Source: APiQypKytjYXAnWxVYoUZ2gASPzYBFaN3UWDb05NVTvMTImqDvDQXkq5z+XtTNGEijCBcww4IUmgqA==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr30337488wrj.237.1589356621447;
        Wed, 13 May 2020 00:57:01 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id g6sm26294797wrw.34.2020.05.13.00.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 00:57:00 -0700 (PDT)
Date:   Wed, 13 May 2020 08:56:59 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] mfd: htc-i2cpld: convert to use
 i2c_new_client_device()
Message-ID: <20200513075659.GC3548@dell>
References: <20200326211009.13411-1-wsa+renesas@sang-engineering.com>
 <20200326211009.13411-2-wsa+renesas@sang-engineering.com>
 <20200415110442.GK2167633@dell>
 <20200512162602.GH13516@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200512162602.GH13516@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 12 May 2020, Wolfram Sang wrote:

> On Wed, Apr 15, 2020 at 12:04:42PM +0100, Lee Jones wrote:
> > On Thu, 26 Mar 2020, Wolfram Sang wrote:
> > 
> > > Move away from the deprecated API and return the shiny new ERRPTR where
> > > useful.
> > > 
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> > >  drivers/mfd/htc-i2cpld.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > Applied, thanks.
> 
> Thanks! I don't see it in -next, though?

Haven't pushed for a while.  Should be there when -next is rebuilt.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
