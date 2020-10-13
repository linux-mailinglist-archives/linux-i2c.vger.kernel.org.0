Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64EFE28DD67
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 11:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbgJNJYQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 05:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbgJNJU5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Oct 2020 05:20:57 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A0FC0613A6
        for <linux-i2c@vger.kernel.org>; Tue, 13 Oct 2020 14:35:57 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id j15so445477uaa.8
        for <linux-i2c@vger.kernel.org>; Tue, 13 Oct 2020 14:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iiAtiRUeW6oFP6bPz2CmGroK6Abx1GWkjquROnHlI5E=;
        b=iOhvs4D5QbPHGozMtELjSwH+fm7jfhq59gfVs5kOHdGvIC10UBOAeOKfC6hI6pJyzI
         o01rKiTo8ESzBbhkq2+liiaOhIc4WW/VnpNuym0IpPjddz8GtNcHG9E50YPsRNwiTJj4
         OF1nhltURrLgqhX5DLup0PoVOfOQPaNpe5/Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iiAtiRUeW6oFP6bPz2CmGroK6Abx1GWkjquROnHlI5E=;
        b=dwFddDHYiwwDM31Ttdqo8XZaYiUCcPdiMRvxg9lJi14sfFhiUeGOxBobrW5Hb4Avr7
         DEDT0yDiR9MAiVIvOXYZLm94XaX/nqqjLtK/XJBgQl4KyGRygu/pXEhpGimh01c7M7k3
         i9nGbp3GE4+N4NkCiaZYaMzhsDabhaDQT7pPBd7juf70pmwl82yn2a5TRprZTXrygyzf
         bZxFmzXoLdw3vMA3nqk0C5OMwQay91zjYVd4i2lh2T+XuXyLReEr0axK1bauVDH/JbMH
         u6XjsjaQ2mlmst/Nudzy9UKh4iAc37I3Eq3WGiVGZz/PArnxDvaJuzNl4QmRysgUCUQU
         /sxg==
X-Gm-Message-State: AOAM531P4P1e+GcbjJXsNOwnMymQtu6qErUokxeaBSkTbgjKQvfCYO3o
        3xidAKkV6ef+mfX+sKXX01JOLmXf0XDutQ==
X-Google-Smtp-Source: ABdhPJwhalAbk6G6phMHlbo3OSGY8TqdyHLCBHhfTepO7ZNRNGUODrc2HS+DEZqNjxqRDFWytxU2iw==
X-Received: by 2002:ab0:76c9:: with SMTP id w9mr1570729uaq.115.1602624955858;
        Tue, 13 Oct 2020 14:35:55 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 89sm119280uaq.9.2020.10.13.14.35.54
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 14:35:54 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id v23so893930vsp.6
        for <linux-i2c@vger.kernel.org>; Tue, 13 Oct 2020 14:35:54 -0700 (PDT)
X-Received: by 2002:a67:eb52:: with SMTP id x18mr1584898vso.34.1602624953624;
 Tue, 13 Oct 2020 14:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201008225235.2035820-1-dianders@chromium.org>
 <20201008155154.1.Ifdb1b69fa3367b81118e16e9e4e63299980ca798@changeid>
 <160229038385.310579.7502548054994849649@swboyd.mtv.corp.google.com> <2ccc26a0-5d54-e06c-5a73-7eb353c393d2@codeaurora.org>
In-Reply-To: <2ccc26a0-5d54-e06c-5a73-7eb353c393d2@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 13 Oct 2020 14:35:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VWPqswOXJejyXjYT_Yspdu75ELq42cffN87FrpTwPUQg@mail.gmail.com>
Message-ID: <CAD=FV=VWPqswOXJejyXjYT_Yspdu75ELq42cffN87FrpTwPUQg@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: qcom: geni: More properly switch to DMA mode
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-i2c@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Mukesh Kumar Savaliya <msavaliy@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Mon, Oct 12, 2020 at 2:05 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Hi Stephen,
>
>
> >>
> >>   static void geni_se_select_dma_mode(struct geni_se *se)
> >>   {
> >> +       u32 proto = geni_se_read_proto(se);
> >>          u32 val;
> >>
> >>          geni_se_irq_clear(se);
> >>
> >> +       val = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
> >> +       if (proto != GENI_SE_UART) {
> > Not a problem with this patch but it would be great if there was a
> > comment here (and probably in geni_se_select_fifo_mode() too) indicating
> > why GENI_SE_UART is special. Is it because GENI_SE_UART doesn't use the
> > main sequencer? I think that is the reason, but I forgot and reading
> > this code doesn't tell me that.
> >
> > Splitting the driver in this way where the logic is in the geni wrapper
> > and in the engine driver leads to this confusion.
>
> GENI_SE_UART uses main sequencer for TX and secondary for RX transfers
> because it is asynchronous in nature.
>
> That's why  RX related bits (M_RX_FIFO_WATERMARK_EN |
> M_RX_FIFO_LAST_EN)  are not enable in main sequencer for UART.
>
> (M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN) bits are controlled from UART
> driver, it's gets enabled and disabled multiple times from start_tx
> ,stop_tx respectively.

For now I've "solved" this by adding some comments (in the 3rd patch)
basically summarizing what Akash said.  I didn't want to go further
than that for now because it felt more important to get the i2c bug
fixed sooner rather than later and re-organizing would be a big enough
change that it'd probably need a few spins.

Our bug trackers don't make it trivially easy to file a public bug
tracking this and assign it to Qualcomm, but I've filed a bug asking
folks at Qualcomm to help with re-organizing things after my patch
series lands.  This is internally tracked at Google as b:170766462
("Rejigger geni_se_select_fifo_mode() / geni_se_select_dma_mode() to
not manage interrupt enables").

-Doug
