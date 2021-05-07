Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B711F376B0D
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 22:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhEGUKX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 16:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhEGUKX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 16:10:23 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B524C061763
        for <linux-i2c@vger.kernel.org>; Fri,  7 May 2021 13:09:22 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso8921778otg.9
        for <linux-i2c@vger.kernel.org>; Fri, 07 May 2021 13:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=r1kPto3KzlNbAX0lDy+fl0HZN7GLrSQn6mvGXMGR828=;
        b=oNy6r+suTKQ6IrZyOFUnSIXNr8ggFi3mCsRTPsy9sJPYKtAWUVzfbztR29TBqVsAxb
         /G4Ac8umSTo9PlhWtWoYkKZt552l80dDgB7oqf//7tWNlU+1WCu5JTQQsybILeF7Zcsj
         DrP/vJDQ+kqU47Yv1cEL7MpZRHQmwD8NE6ONE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=r1kPto3KzlNbAX0lDy+fl0HZN7GLrSQn6mvGXMGR828=;
        b=Ai/x099QDggVLg1uclH6fRKW0eIlfiHVlJc0ZUdYhIyGyueMsPZfBbMjWRErsAN2YH
         D4+yPORF/L+gLhGx/xJUh8daxwW2POEyYNXpJmDA48KOhgJlD3m1WBzIqmhFiANfd5FY
         JdBzko/lz8HZoXCVKrei4CuDer5blq2V7ZMfMBWn1EztoSj8YDMNbFYhayPjOPKIQVQC
         j7fDEWI3rrRFP5T4TNqFPus5utkHEZRp3GEbD1USVPCbQ/UOWgayzcySx3d357LYFZNi
         YHpc8+z9o1qxiRzWxlkxP6/0UEPi2OHeNu2DbUzlNFyNlw66PmfcZcP4C/41Z/vsSNvN
         DVqQ==
X-Gm-Message-State: AOAM533INw5n2WsAwJtzmMHl9/vZE+wok9lsFIRZ47EsknnHyXP1JU56
        g/aeULNSM7bWjCLeSKAtiAxXq1s6IYXWkHN64ZmUKw==
X-Google-Smtp-Source: ABdhPJxZ061OkNR2+KyMC9fMqg6AIYlmIWzLNJjFE2lr/X9A/aJT0ru5fvuT3lGqLqrk9nSCuasHw9RrjklcTKZIICc=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr10001438otn.233.1620418161680;
 Fri, 07 May 2021 13:09:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 May 2021 13:09:21 -0700
MIME-Version: 1.0
In-Reply-To: <d23263dcb0f1535275ff37524b0203b2@codeaurora.org>
References: <d23263dcb0f1535275ff37524b0203b2@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 7 May 2021 13:09:21 -0700
Message-ID: <CAE-0n51YQf=NZxnw9+FLU=PSG8di7Ztp5pP03JdLXgEWGM0AZg@mail.gmail.com>
Subject: Re: [PATCH V9] i2c: i2c-qcom-geni: Add shutdown callback for i2c
To:     rojay@codeaurora.org
Cc:     wsa@kernel.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, skananth@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting rojay@codeaurora.org (2021-05-07 03:07:42)
> On 2021-05-05 07:08, Stephen Boyd wrote:
> > Quoting Roja Rani Yarubandi (2021-04-20 04:13:55)
>
> > In fact, where is that code? I'd expect to see i2c_del_adapter() in
> > here
> > so we know the adapter can't accept transfers anymore. Maybe
> > i2c_del_adapter() could be called, and then there's nothing to do after
> > that? This whole patch is trying to rip the adapter out from under the
> > i2c core framework, when we should take the opposite approach and
> > remove
> > it from the core framework so that it can't transfer anything anymore
> > and thus the IOMMU can remove the mapping.
> >
>
> IIUC about probe/remove/shutdown calls, during "remove" we will unplug
> the
> device with opposite calls to "probe's" plug operations.
> For example i2c_add_adapter() from 'probe' and i2c_del_adapter() from
> 'remove'.
> For "shutdown", as system is going to shutdown, there is no need of
> unplug
> operations to be done.
>
> And also, I had a glance on other upstream i2c drivers, and noticed
> "i2c-i801.c"
> driver has i2c_del_adapter() called from remove callback but not from
> shutdown
> callback.

Sure, other drivers could also be broken.

>
> And actually I tried calling i2c_del_adapter() from geni_i2c_shutdown(),
> and it resulted in below WARNING trace
> [   90.320282] Call trace:
> [   90.322807]  _regulator_put+0xc4/0xcc
> [   90.326583]  regulator_bulk_free+0x48/0x6c
> [   90.330808]  devm_regulator_bulk_release+0x20/0x2c
> [   90.335744]  release_nodes+0x1d0/0x244
> [   90.339609]  devres_release_all+0x3c/0x54
> [   90.343735]  device_release_driver_internal+0x108/0x194
> [   90.349109]  device_release_driver+0x24/0x30
> [   90.353510]  bus_remove_device+0xd0/0xf4
> [   90.357548]  device_del+0x1a8/0x2f8
> [   90.361143]  device_unregister+0x1c/0x34
> [   90.365181]  __unregister_client+0x78/0x88
> [   90.369397]  device_for_each_child+0x64/0xb4
> [   90.373797]  i2c_del_adapter+0xf0/0x1d4
> [   90.377745]  geni_i2c_shutdown+0x9c/0xc0
> [   90.381783]  platform_drv_shutdown+0x28/0x34
> [   90.386182]  device_shutdown+0x148/0x1f0
>
> Can you please suggest me what might be missing here?
>

It looks like some device that is on the i2c bus is putting a regulator
in the remove path without disabling it. Can you print out which device
driver it is and fix that driver to call regulator_disable() on the
driver remove path? I'll try locally and see if I can find the driver
too.
