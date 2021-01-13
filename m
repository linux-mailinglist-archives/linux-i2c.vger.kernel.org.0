Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841D12F40D4
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jan 2021 01:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393728AbhAMAnJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 19:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392137AbhAMADB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jan 2021 19:03:01 -0500
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B89C0617A2
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jan 2021 16:01:39 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id g5so122119uak.10
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jan 2021 16:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X1O0kACakbx2RcXU3rpwMtnI8YwFi/QQJx5lWup4tPs=;
        b=TDD54LXJMIOHuHC7yNuKWAIpA7mi5lm/OaZT3vtTzB+EkbjAgXxIfvyiLWCvNt2eYd
         7H015wWHRDVue0tnkGew/FoTWBQN5+AKOCCqt1KtEX+CVdeCsXBTX39Zm+9qh7Cme+C7
         HYZTgCC2CbUmmy71bvcExAzSpON5Y5i8fhc5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X1O0kACakbx2RcXU3rpwMtnI8YwFi/QQJx5lWup4tPs=;
        b=sOwC1of+ucMvTuiiyxggTZn5+Yx9kbIYAd7nP4jg80D04Lddpqztt85ft9RZF2Uftu
         wOdMX1+kdMt6IOGquC5EAO+vcPMVPb21DpSq73kc9ZlUGyOcfxu8Yie2RpYuA07LOg4G
         30qwtplILNbw3JApfNyNS7U7QQPQ/6Kpq63p6q9rZr17wwgBVUF5aEJs1gkcpDmGzKKU
         MhlIjgbYWNt++kqEPESG+2vpoLa87G6WZ4QxCGbK0a8xSInGhr2Yv434zGUtpHIisLVE
         rknd9jnGmjy7jOORgG5/379VRuigPg1w9Ts6zYCD8RjAUW6tRH4pWjBJZ/2s/IiIS/3v
         PKaA==
X-Gm-Message-State: AOAM532TbvUO7Ph+4v3Y04brGKoRxDAKFiZr+rS+NXFB1NvkSawdVRQX
        xvH3NAM64pMpxcQYY5pwH32qDKwUe/hcAQ==
X-Google-Smtp-Source: ABdhPJwluMEkzj+bzTbgyTkJlTiX4+5749c0XR9BYQFezvDCLK1Doj+rIQKiXhWyJDgD0Tb7LNur0A==
X-Received: by 2002:ab0:7386:: with SMTP id l6mr1885854uap.141.1610496098288;
        Tue, 12 Jan 2021 16:01:38 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id k14sm48778uae.12.2021.01.12.16.01.37
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 16:01:37 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id x4so161515vsp.7
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jan 2021 16:01:37 -0800 (PST)
X-Received: by 2002:a67:7385:: with SMTP id o127mr2228991vsc.8.1610496096878;
 Tue, 12 Jan 2021 16:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20210111151651.1616813-1-vkoul@kernel.org>
In-Reply-To: <20210111151651.1616813-1-vkoul@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 12 Jan 2021 16:01:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XvgP5j3ikCnr2zDptFbWPRQhGGQotqyFGmN7NWNP8knA@mail.gmail.com>
Message-ID: <CAD=FV=XvgP5j3ikCnr2zDptFbWPRQhGGQotqyFGmN7NWNP8knA@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add and enable GPI DMA users
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi <linux-spi@vger.kernel.org>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Mon, Jan 11, 2021 at 7:17 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> Hello,
>
> This series add the GPI DMA in qcom geni spi and i2c drivers. For this we
> first need to move GENI_IF_DISABLE_RO and struct geni_wrapper to common
> headers and then add support for gpi dma in geni driver.
>
> Then we add spi and i2c geni driver changes to support this DMA.
>
> Lastly, add the GPI dma nodes and enable dma for spi found in Rb3 board.
>
> To merge this, we could merge all thru qcom tree with ack on spi/i2c.

It'd be super great if somewhere (ideally in the commit message and
maybe somewhere in the code) you could talk more about the different
modes.  Maybe something like this (if it's correct):

GPI Mode (confusingly, also known as "GSI" mode in some places): In
this mode something else running on the SoC is sharing access to the
geni instance.  This mode allows sharing the device between the Linux
kernel and other users including handling the fact that other users
might be running the geni port at a different clock rate.  GPI mode
limits what you can do with a port.  For instance, direct control of
chip select is not allowed.  NOTE: if firmware has configured a geni
instance for GPI then FIFO and SE_DMA usage is not allowed.
Conversely, if firmware has not configured a geni instance for GPI
then only FIFO and SE_DMA usage is allowed.

SE DMA Mode: Data transfers happen over DMA.

SE FIFO Mode: Data is manually transferred into the FIFO by the CPU.
