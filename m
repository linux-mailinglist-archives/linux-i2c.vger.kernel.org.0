Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD0539B607
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 11:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhFDJek (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 05:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhFDJej (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Jun 2021 05:34:39 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D177C061761
        for <linux-i2c@vger.kernel.org>; Fri,  4 Jun 2021 02:32:53 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id f17so4975217wmf.2
        for <linux-i2c@vger.kernel.org>; Fri, 04 Jun 2021 02:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Sgf8szZUYWmNdrKI3gu3zwX9+OcqC8hdJRxUX8YspKE=;
        b=ZhHicDonPK793RF3tGNKrCQeIkcZFXNOLCRYXlX8yud0qwKlysDjeRjN7Qe+g1GDlJ
         IeyoYr+r/6M7FWCFe01ndehC7dwAiOsYfP9oI6w1Q7ZockOREvsRFO5pGmwqgAFzD0TF
         cdRUuFj4+69l0xCz6pn1wRbq7HcPhds2qEHu4VpCz0/EM8wcwNDwtfwJ1LYz8rpuWase
         /1eNtPyfxoXy5QpzxMDo4gQVY6yl5a43hPUoDGtJc74rL6esBZ2StdxfkNV8JyDFu0NV
         2PX1cSoX+yeqF03Q99nNzBScFc5dnCyBTylT+ToGB+Vkc2W3EUCl63lpYdWhSUGWF5kF
         ofbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Sgf8szZUYWmNdrKI3gu3zwX9+OcqC8hdJRxUX8YspKE=;
        b=Z1CRa+o7eKqXePw4QoYiLyLuP2pwWSIUsxjhtzW9RUIvrH9qask7ND6ckutEfYWHaI
         Hc4ioF9qMt+bZKi6frevYdfD6nqBwIKc0u70R01W9y2ktiWVwAAtrtqwB8WQ3qznF2+u
         jqQ4h7HN6Md0nQOoQn17ylaGTDC49gxyOoOhBc23awAMTYYYJoyWh0HswAeuHb5u88/I
         gy/HYwG3xoS+F0/MTewoc9qSrsyJaM/utBd9mGEmbCo3m41KeAoHmUjyLp+jjP+e8o2A
         QAAZb5gbauoXFDRcD0ua33SIJSEkTxQJr+LLPkJsN/CD3T4JBnGwrnQv9OHpr66FoVKW
         C5lA==
X-Gm-Message-State: AOAM533zMQB3pDtxlpER/SeDAr7Iv58dHaRDLPlbxl0TrW5YuGSs1svi
        jjbhpVVPqUlm3gGhQ+3mjwMPhA==
X-Google-Smtp-Source: ABdhPJwrGUtb3zQRg7xmpqDvHIEgG86q9JUwoEBt74fFLO2diZMwKdaQTe5jb8kPLbqb6FCB7xE0VQ==
X-Received: by 2002:a1c:dd09:: with SMTP id u9mr2706969wmg.58.1622799172164;
        Fri, 04 Jun 2021 02:32:52 -0700 (PDT)
Received: from dell ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id m65sm5244301wmm.19.2021.06.04.02.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:32:51 -0700 (PDT)
Date:   Fri, 4 Jun 2021 10:32:49 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/16] i2c: busses: i2c-mxs: Demote barely half complete
 kernel-doc header
Message-ID: <20210604093249.GJ2435141@dell>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-10-lee.jones@linaro.org>
 <YLk7qcWTZnQmLGkW@kunai>
 <20210604084710.GG2435141@dell>
 <YLntC+Sl8MaFFZw4@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YLntC+Sl8MaFFZw4@shikoro>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 04 Jun 2021, Wolfram Sang wrote:

> 
> > IMHO, we wouldn't want to foster the impression that it's okay to
> > provide a non-determined effort, safe in the knowledge that someone
> > will come along later and finish the job for them at a later date.
> 
> Right.
> 
> The first lesson from that is that maintainers should require
> documentation of the fields when they get added. This was my oversight
> because it was back then not reported by checkers, probably. I am sorry.
> It annoys me, too.

Sure.

When I started this work, there were 18k+ W=1 warnings in the kernel.
Now there are more like 3k.  I don't think anyone is to blame per say,
it's just something that people haven't particularly cared about up
until this point.

One of my main aims is to clean-up W=1s to the point where enabling
them would become normal practice, rather than the situation we're in
presently where enabling them just dominates the build-log, making
them more trouble than they're worth.

> If I notice that someone updates a driver which doc-errors, then I ask
> if that could be fixed by this person, too. It usually works. Not for
> drivers without attention, of course. But this is why I don't mind
> doc-errors to stay.

I'd rather they didn't say.

This would void the main aim of this effort.

> If this is considered problematic, then I'd suggest to remove the kernel
> doc headers like you did, but add a comment like:
> 
>  * FIXME: add missing fields and reenable kernel-doc
> 
> To make sure, it is obvious even by glimpsing through the code that
> there is work needed.
> 
> Can we agree on that?

It's the first time this has been requested, but it's your train-set
and I will do whatever you ask.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
