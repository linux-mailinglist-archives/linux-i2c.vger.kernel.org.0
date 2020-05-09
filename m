Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC721CC12F
	for <lists+linux-i2c@lfdr.de>; Sat,  9 May 2020 14:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgEIMLo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 May 2020 08:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726782AbgEIMLn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 May 2020 08:11:43 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6422DC061A0C;
        Sat,  9 May 2020 05:11:43 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id h12so6062976pjz.1;
        Sat, 09 May 2020 05:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/wlJFZjwuM81Jh/anwiOMAgeJWfW7ajnVCis2G3dl9k=;
        b=dKc+TMdVfruQ8XRDND37cvnLytXndIhsz15FSm3KMnB9sjom5WRjcOrEvJU+yPeS5m
         uLGz8hq/6wUQa1UkJ6D9OOEWccrMgIgPRCSIg41TqPjfkTuKUC0Ehrb+iO1d1/2GLrOm
         /fKTPoievZIameK2E1CPZF8ocqWO3Z/8TRLiqbEGadpMGPJn0yM6uLIs+CgTu4DUWr7y
         eICNRW91C5opv2i6zQ/H16dMo5H6yMCP35TW1giskIX62HHVkbyL2rmiTQ+sX9p12pPZ
         Jah2nAq0kBHiHiaNOja7ue0FFq5bhpEQjX4Ou6kmfYW07JR8EQFVw7saNPEW96vRu0/p
         8Rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/wlJFZjwuM81Jh/anwiOMAgeJWfW7ajnVCis2G3dl9k=;
        b=hBSOicqiMoRvQ1+95fkuDEIgq954Ssij6PrQLa2WsiDEGxpO/m6OCYqr/YLIK0PAhL
         9Z+ScU431BFPewKX2WzmbLkb0Oy8Dy2JHC22QJlhItxp0tFvEPHkoL44ONNZR2ukhQn8
         GM78JBbnJ+8uQGl5tOUW+q35ij9PKW2VYWKoOAgGktu7lm3JZDuQSQdoPI8JjTzKsQOa
         FBQhRkzZAM77Q/+8+m0kNzZi+zpkg01akDdrQXFJXyIVoX5iv9ciBJ1mSBzZpH/vrS7M
         339HsfyYA72cpUg+C0OlHatXNxC4OPQXHuHmEkPxgu2LslWbPI+sg02baWTVWmYmWje9
         +Q2w==
X-Gm-Message-State: AGi0PualsD2RU/X9pST9Rw80C4HX1EAELEXi8gcTxHS47/7haxh8Vlyl
        M/AnUdY0EHZN4bu4sUBvD5eCH38/8mqpoDE5SxzGgzfq
X-Google-Smtp-Source: APiQypI4sdcR01RdvjwOkHbMaSexjDF1WdE/GFMDiJPbhE1E1Lit7yy20vvFbGNhhAxdgjUqXNuG191HfxC7kMjnnGw=
X-Received: by 2002:a17:90b:94a:: with SMTP id dw10mr11427305pjb.228.1589026302658;
 Sat, 09 May 2020 05:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <1588919619-21355-1-git-send-email-akashast@codeaurora.org> <1588919619-21355-3-git-send-email-akashast@codeaurora.org>
In-Reply-To: <1588919619-21355-3-git-send-email-akashast@codeaurora.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 9 May 2020 15:11:31 +0300
Message-ID: <CAHp75Vdjz7RBbyPwZwvNq5njwb_Jc76U=3pDpswmoFCFaGtNAQ@mail.gmail.com>
Subject: Re: [PATCH V5 2/7] soc: qcom-geni-se: Add interconnect support to fix
 earlycon crash
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>, agross@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 8, 2020 at 9:34 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> QUP core clock is shared among all the SE drivers present on particular
> QUP wrapper, the system will reset(unclocked access) if earlycon used after
> QUP core clock is put to 0 from other SE drivers before real console comes
> up.
>
> As earlycon can't vote for it's QUP core need, to fix this add ICC
> support to common/QUP wrapper driver and put vote for QUP core from
> probe on behalf of earlycon and remove vote during earlycon exit call.

...

> +       for_each_child_of_node(parent, child) {

> +               if (of_device_is_compatible(child, "qcom,geni-se-qup")) {

if (!...)
 continue;

will save you a readability of the loop body.

Or...

> +                       wrapper = platform_get_drvdata(of_find_device_by_node(
> +                                       child));

...leave this on one line

> +                       icc_put(wrapper->to_core.path);
> +                       wrapper->to_core.path = NULL;
> +               }

And here is the question, what do you want to do if you find more
devices with the same compatible string?

> +       }

-- 
With Best Regards,
Andy Shevchenko
