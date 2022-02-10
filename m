Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0644B14CE
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 19:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245453AbiBJSAT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 13:00:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243410AbiBJSAT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 13:00:19 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF3B109E
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 10:00:19 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id ft32so1456362ejc.11
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 10:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VyiRrCTCvD3kSlcteklEwF1Z7ulIFO497MFIShZC2EQ=;
        b=lDJDV3gk7vJd8epZow77aLEhctdFJiMdWg4bPXyRqV+P8SCznLTjg9qaMrl4uBKi4W
         FIa5xSqiTkfMTDDaQX3a6eOR3PULr05leKgBb7dtj1Z9aBTmqdnSEHwpCDlCePcizdIr
         RL4deMl0WEaY0Jh1Ab9JXnycY4MaE3/yjJweZ3uE1EswISDRfgGvftKiIcyY4+H4cJmx
         ksSJIN7XeO+LqnG802F/TkZsEYNXr+GmnNkQS0ZABy7zH5ImLkTkhCeBnSYlJHR3czCM
         ubCKLT2cdNKaVcXthXtuVbskMddyIIhCb3KdDg7PxHdghxxP8+GQpQM+WnSRcdvK6IOK
         wuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VyiRrCTCvD3kSlcteklEwF1Z7ulIFO497MFIShZC2EQ=;
        b=xYJAcYCnMzZZG8koQGqhl82dCtRV4OA127EPHIupMdSZV8BiHaszXPXB5hEnVlSGfa
         e+VRu1BtCMxw+x7POR6cj+Xq+YxWiHcN0kOToY0z6T+WaCk/EMwyC5ZaCr/rMaEDUYpb
         LpsSQhwz1NInbs4Bp2MRf0S9oMtfaO0xf7JX2CdNfLtJoFhp7oP3G+/Q94K6UoaUTSXG
         1nYEkKLuXQ3WvO6OOqMvt5KGNHnTdTKTe1KLwIA8NWqVyBlRm0MUBGDL60ZCDY59cPz4
         3FbHLUL8kfumgXjH6yZtiIg2RBlQqR4llkfIMJastzgdfcFvLcg4WOZDO5r1tKRZLr54
         196g==
X-Gm-Message-State: AOAM533/FkhWrbg1U2RdO3CjfGfxSiXg0VQZgwfrx6Qw4QXtcBS5X1K9
        4SVrxd2uFuxFn0s+EYSTi4P2CAblpdnHfIwFmUpVnhchqY8=
X-Google-Smtp-Source: ABdhPJxJuyhh7OCTVxsg1XD+thnzuteOezciR0odv+RtncFHrFra5L3HMOaU0zxHkSa4CRu6l4IZA/I4m8Gi0BaaQrw=
X-Received: by 2002:a17:906:7948:: with SMTP id l8mr7308424ejo.636.1644516018273;
 Thu, 10 Feb 2022 10:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20211116093833.245542-1-shreeya.patel@collabora.com> <874k56znix.fsf@collabora.com>
In-Reply-To: <874k56znix.fsf@collabora.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 10 Feb 2022 19:00:07 +0100
Message-ID: <CAMRc=MdByxO3+hJruvUkULtXAaB7aWewTd=Wv0MbWyX2vykdjA@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: Return EPROBE_DEFER if gc->to_irq is NULL
To:     Gabriel Krisman Bertazi <krisman@collabora.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Shreeya Patel <shreeya.patel@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        wsa@kernel.org, kernel@collabora.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 10, 2022 at 5:36 PM Gabriel Krisman Bertazi
<krisman@collabora.com> wrote:
>
> Shreeya Patel <shreeya.patel@collabora.com> writes:
>
> > We are racing the registering of .to_irq when probing the
> > i2c driver. This results in random failure of touchscreen
> > devices.
> >
> > Following errors could be seen in dmesg logs when gc->to_irq is NULL
> >
> > [2.101857] i2c_hid i2c-FTS3528:00: HID over i2c has not been provided an Int IRQ
> > [2.101953] i2c_hid: probe of i2c-FTS3528:00 failed with error -22
> >
> > To avoid this situation, defer probing until to_irq is registered.
> >
> > This issue has been reported many times in past and people have been
> > using workarounds like changing the pinctrl_amd to built-in instead
> > of loading it as a module or by adding a softdep for pinctrl_amd into
> > the config file.
> >
> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=209413
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
>
> Hi guys,
>
> This seems to not have reached the Linus tree on 5.17.  If I'm not
> mistaken, it also hasn't reached linux-next as of today. Is there
> anything I'm missing here?
>
> This is required to prevent spurious probe crashes of devices like this
> FocalTech touchscreen, FT3528, when using pinctrl-amd. We've been
> carrying it downstream for quite a while.
>
> Thanks,
>
> --
> Gabriel Krisman Bertazi

Hi Gabriel!

My email address changed in September, that's why I didn't see the
email you sent in November to my old one.

gpiod_to_irq() can be used in context other than driver probing, I'm
worried existing users would not know how to handle it. Also: how come
you can get the GPIO descriptor from the provider but its interrupts
are not yet set up?

Bart
