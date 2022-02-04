Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C60E04A9ED3
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 19:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244802AbiBDSSp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 13:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238169AbiBDSSp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 13:18:45 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E0DAC061714
        for <linux-i2c@vger.kernel.org>; Fri,  4 Feb 2022 10:18:45 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id i62so8439554ioa.1
        for <linux-i2c@vger.kernel.org>; Fri, 04 Feb 2022 10:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B0ahm0hdwmzp8LcfxQ8+kQ7YphowIvmbdFdhXbcRawU=;
        b=YuuKVwxWhqjqDGM91SbOGfO5jk1lvcH2xOKu9SdTS/0AtcSSu6Z74v9BI75XsPuQNQ
         6voOghPWwZ0DFtuWnIayytbcUYvQLdpxYUw/+iekyW/DRrXWz5L3T9qUdSP4JAL0wOB2
         AAuLy72nClt9QPT6wEIYZ/WM76WScoUHkqOnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B0ahm0hdwmzp8LcfxQ8+kQ7YphowIvmbdFdhXbcRawU=;
        b=OGcAmvJQHGr9cU1rxaPIC1/HePgeKljV7eexKfbckBorPQqzMrrXt4uRlw/tfbPUin
         w8BcizMcjq3TZ2ZmsZm9HA3d5xvCQY8MXg5bouQiPni+E+kgS/0KJ8ZcvMq6HswchNxt
         KBqkCjN0KosovBytr663QVo7oMt8RACk2mhOs9iYYkYQKEovhajn6STTlhpucuEVWAz5
         LRbWzSpyhb8zqh+CFUemW6Jx89no7/U20ZmkoNmluovUl/usIePV3UoxoNeKp3vswLOQ
         fFXs11pE9vJeEHxDid95gKqLbmlXPontWe2c+eRTPNwAkFI47jwLsPxpriL7zAMHPanJ
         wduw==
X-Gm-Message-State: AOAM532Bhru1VcmRjgVFi2urCUiqbrGt2jqG7sz9AfCr16HfYf53b5NS
        ip9nMi2B5gl29sruXSuNrRT3lvIvxvyxfE9g6EemuQ==
X-Google-Smtp-Source: ABdhPJytny1SyvPfpAVIt5yuyPMy85jb9OFiLTaA6qhpI02J9cXH4cGVPLFMJsAR4d38qn7L7cix9j7++UZ9EJEbmaw=
X-Received: by 2002:a6b:f218:: with SMTP id q24mr174468ioh.55.1643998724641;
 Fri, 04 Feb 2022 10:18:44 -0800 (PST)
MIME-Version: 1.0
References: <20220106122452.18719-1-wsa@kernel.org> <Yd6gRR0jtqhRLwtB@ninjato>
 <98ed8d6d16a3d472d9432eb169aa2da44b66b5cc.camel@yandex.ru>
 <4dfbee97-14c2-718b-9cbd-fdeeace96f59@yahoo.com> <CAJMQK-h38XdN=QD6ozVNk+wxmpp1DKj21pkFZ+kY31+Lb8ot6Q@mail.gmail.com>
 <6121a782-6927-f033-1c09-ffe4ad7700ae@yahoo.com> <CAJMQK-j5YYqen78Vgng_5jhja-YKSTRut7f7vJ4wWufVfbZy6w@mail.gmail.com>
 <363432688.323955.1642272250312@mail.yahoo.com>
In-Reply-To: <363432688.323955.1642272250312@mail.yahoo.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Sat, 5 Feb 2022 02:18:18 +0800
Message-ID: <CAJMQK-jx+z974AT_p+-AVAbMQQ33V-XU9NKmy-i6nbS5zagHBA@mail.gmail.com>
Subject: Re: [PATCH] Revert "i2c: core: support bus regulator controlling in adapter"
To:     "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jan 16, 2022 at 2:44 AM Tareque Md.Hanif
<tarequemd.hanif@yahoo.com> wrote:
>
> Hi Hsin-Yi,
>
> The issue still exists. I reverted a19f75de73c220b4496d2aefb7a605dd032f7c01 (the commit that reverted 5a7b95fb993ec399c8a685552aa6a8fc995c40bd) and manually applied the patch (tags/v5.16). journalctl attached.

hi Tareque,

Can you apply the same setting[1] again and with this patch to see if
the issue is still there?
https://github.com/torvalds/linux/commit/6dc8265f9803ccb7e5da804e01601f0c14f270e0

[1] reverted a19f75de73c220b4496d2aefb7a605dd032f7c01 (the commit that
reverted 5a7b95fb993ec399c8a685552aa6a8fc995c40bd) and manually
applied the patch (tags/v5.16)

Thanks
>
> Regards,
>
> Tareque
>
> On Saturday, January 15, 2022, 11:27:07 PM GMT+6, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
>
> hi Tareque,
>
>
> On Fri, Jan 14, 2022 at 6:09 PM Tareque Md Hanif
> <tarequemd.hanif@yahoo.com> wrote:
> >
> > Hi Hsin-Yi,
> >
> > On 1/12/22 16:58, Hsin-Yi Wang wrote:
> >
> > Can you help provide logs if we apply
> > 5a7b95fb993ec399c8a685552aa6a8fc995c40bd but revert
> > 8d35a2596164c1c9d34d4656fd42b445cd1e247f?
> >
> > Issue still exists. journalctl log attached in revert_8d.txt
> >
> >
> > > after apply 5a7b95fb993ec399c8a685552aa6a8fc995c40bd
> > > 1. delete SET_LATE_SYSTEM_SLEEP_PM_OPS(i2c_suspend_late,
> > > i2c_resume_early) and function i2c_suspend_late() and
> > > i2c_resume_early().
> >
> > No issues. journalctl log attached in test1.txt
> >
> >
> > > 2. delete SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume,
> > > NULL) and function i2c_runtime_suspend() and i2c_runtime_resume().
> >
> > Issue exists. journalctl log attached in test2.txt
>
>
> Thanks for the testing.
> Can you help us test if applying the following patch on top of
> 5a7b95fb993ec399c8a685552aa6a8fc995c40bd works? Thanks
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9eb4009cb250..6b046012aa08 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -484,7 +484,7 @@ static int i2c_resume_early(struct device *dev)
>         struct i2c_client *client = i2c_verify_client(dev);
>         int err;
>
> -      if (!client)
> +      if (!client || dev_pm_skip_resume(dev))
>                 return 0;
>
>         if (pm_runtime_status_suspended(&client->dev) &&
> @@ -502,7 +502,7 @@ static int i2c_suspend_late(struct device *dev)
>         struct i2c_client *client = i2c_verify_client(dev);
>         int err;
>
> -      if (!client)
> +      if (!client || dev_pm_skip_suspend(dev))
>                 return 0;
>
>         err = pm_generic_suspend_late(&client->dev);
>
