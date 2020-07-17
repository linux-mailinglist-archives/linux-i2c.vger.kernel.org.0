Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 017A8223F1C
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 17:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgGQPGb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 11:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbgGQPGa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 11:06:30 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DA1C0619D2;
        Fri, 17 Jul 2020 08:06:30 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id w2so6787821pgg.10;
        Fri, 17 Jul 2020 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/55xejbSKs5P2qZfoxI33J7Lj9nDih8aJt+Pc7uME3w=;
        b=L5K9EFCe1MPCuvD36c2gIhoIKa4A+0rKa1Gi9Hk62t0mYU7AYE/GnZ4/a8zwdmEfDe
         Ikd3UzGXEYoHg46w9nROcTeIXoVBaJ/j4iQo6vv34QgCDi1Qrd0TRBy/40VCsYGQTAb+
         ddfH1YWY0GhaBfBcI+3EI22VIBBfo4T7XLAUtiu8SoDWz4NYbaQ3CvzE10jGM30zp7uq
         ko387szjjT9IIliX+ruAfmt37EEI+J1K6XUiutTYK48kHKMuTdiQDMSVUYvAyBXhjp7Z
         GxqbAe2kyEz48+yYOYA4l2KON1GDXyDctOXkL/AjWhAUYUVWzlwNiNYH0iySsBUrMiNS
         +ZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/55xejbSKs5P2qZfoxI33J7Lj9nDih8aJt+Pc7uME3w=;
        b=dNt1PGl0xyZWdsHBfPIgdPI1jTG0Gh3zZNsC4ZAku2cpFhVBh1RntejthSs04+zg20
         C2R8VbGufxU+qI7RXWWq72co9nxAlBjcNOPGVe4bGtnvvp9ys/TxEWPAdw749PDJ2Hwl
         sJFbJiegWHa44Ql2VqraeukBnjy42zwTej5f7CLbyVx49dHW8cxECplLgCqK9nHzL29e
         ANL2kto5Q3S7mC3NzIXLgBMOYGywor7TI6ZzEsL7Rg1ppNEf2M2RLPHS+WTr9rbP8Gac
         2rO99nJe1gH2iGMGUdkyxrIPFQuZMgaOwgzLTiEwmhvPRmek2ISp00oVw49ccNb5RXA4
         xAVg==
X-Gm-Message-State: AOAM530/xVlXd5tN6ozXeHsjAX4xkAIHXjv3HzcuHiGYu/kbU0VPD4DQ
        cQYufxFxbfdNtWKFQ3dKndcnl+bR
X-Google-Smtp-Source: ABdhPJzGLDOJwDXXJwn5K0ilD1hGIdyKv676ZxeyxRLhx+5muDSP2CJ7RmxWK8kgropg5bT2I+M+VQ==
X-Received: by 2002:aa7:9422:: with SMTP id y2mr8627037pfo.211.1594998390253;
        Fri, 17 Jul 2020 08:06:30 -0700 (PDT)
Received: from localhost ([89.208.244.139])
        by smtp.gmail.com with ESMTPSA id t73sm8144973pfc.78.2020.07.17.08.06.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jul 2020 08:06:29 -0700 (PDT)
Date:   Fri, 17 Jul 2020 23:06:25 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     corbet@lwn.net, michal.simek@xilinx.com,
        wsa+renesas@sang-engineering.com, linus.walleij@linaro.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3 1/2] drivers: provide devm_platform_request_irq()
Message-ID: <20200717150625.GA26342@nuc8i5>
References: <20200527142611.9006-1-zhengdejin5@gmail.com>
 <20200717143030.GB25998@nuc8i5>
 <20200717145946.GC3008378@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717145946.GC3008378@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 17, 2020 at 04:59:46PM +0200, Greg KH wrote:
> On Fri, Jul 17, 2020 at 10:30:30PM +0800, Dejin Zheng wrote:
> > On Wed, May 27, 2020 at 10:26:10PM +0800, Dejin Zheng wrote:
> > Hi Jonathan, Greg, Rafael, Linus, Michal and Wolfram:
> > 
> > Could you help me review this patch if you have free time?
> 
> It's not anywhere in queue, sorry, please resend it?
>
Ok, I will resend it. Thanks very much!

BR,
Dejin

> thanks,
> 
> greg k-h
