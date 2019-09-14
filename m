Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB443B2CA2
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2019 21:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbfINTNp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 Sep 2019 15:13:45 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34129 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfINTNp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 Sep 2019 15:13:45 -0400
Received: by mail-qt1-f196.google.com with SMTP id j1so25408500qth.1;
        Sat, 14 Sep 2019 12:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IAgjPYgxJuywqHP8wcgTqQvaYuKAXpQd8Aaaa0T5GSM=;
        b=FTociWALlazvY5q8JzHdwBEFo2ntDifG4bQVaLT5d23ziz7zTa0TAs8VDt4b73jl7J
         3Cmyp50CfNSM+QbiqhQebH4tEnBo2zHSVHiwdtZ+6xPzBbbwpZ23uHi9Czat/j33KZLc
         FGFsWdnpRZ0+4TrBz9oDiYH9gVOIktUo171lsF9Z8oMgIZgN4Dpmyz7LY3c92d6QRyXE
         /Er6iXO/kB84lPCJok3sicDcfe2nthKGnJvJN9u5tdgvYB8q+E9KVTCbdWxUIlTlV2HR
         5L665OPIJsyzODWGZkD6Z3HefFw4rdJidxo450oUcpaaa1u9DqaXEN1SPH5kX6eZGmqh
         eA+g==
X-Gm-Message-State: APjAAAUYdfsX8WffbxlRrai7H3bis3U4SapEnniNG25rd6qUtQFGdcN6
        wQ6eV4vLjalqdwcODfs6vGbUcbjkjOJPN1DtymM=
X-Google-Smtp-Source: APXvYqw7nKOIle6xbMusZICSNTO1mMvxG94oyioy5LP+FZetL8wQseG51/MDb9ooROfqPa+L+ao5QFEYMvit9qVM8rM=
X-Received: by 2002:a0c:e74b:: with SMTP id g11mr30779948qvn.62.1568488424396;
 Sat, 14 Sep 2019 12:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190905192412.23116-1-lee.jones@linaro.org> <5d71ef95.1c69fb81.6d090.085d@mx.google.com>
 <20190906061448.GJ26880@dell> <20190906065018.GA1019@kunai>
 <20190906075600.GL26880@dell> <20190906102355.GA3146@kunai>
 <20190906105445.GO26880@dell> <20190906183139.GB19123@kunai>
 <CAF6AEGsHOaR1dRf8xGH5sRa38=S+Y3NvNiAJ9DpMkddWoLBw8g@mail.gmail.com>
 <20190913142821.GD1022@kunai> <20190913161345.GB8466@tuxbook-pro>
In-Reply-To: <20190913161345.GB8466@tuxbook-pro>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 14 Sep 2019 21:13:28 +0200
Message-ID: <CAK8P3a2+Foj4gxxetFQ5y1jUjc+HZDT1B3Utj9y2fJQMq83NrQ@mail.gmail.com>
Subject: Re: [RESEND v3 1/1] i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, Rob Clark <robdclark@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, alokc@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 13, 2019 at 6:13 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 13 Sep 07:28 PDT 2019, Wolfram Sang wrote:
>
> > On Sat, Sep 07, 2019 at 10:56:34AM -0700, Rob Clark wrote:
> > > On Sat, Sep 7, 2019 at 9:17 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > >
> > > >
> > > > > Does this mean you plan to have this merged for v5.4?
> > > >
> > > > Only if the machine DTS is expected to land in 5.4. But Stephen said it
> > > > is not in liunx-next yet?
> > > >
> > >
> > > It appears to be in arm-soc for-next:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/log/?h=for-next
> >
> > Still not in linux-next. Please ping me or resend this patch once it
> > hits linux-next.
> >
>
> It seems linux-next is now pulling from the soc.git, rather than
> arm-soc.git, but Arnd is still pushing patches to arm-soc.git.

I'm still pushing identical contents to both, but plan to remove the old
tree after the merge window.

      Arnd
