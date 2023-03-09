Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE98D6B2694
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 15:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjCIOTK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 09:19:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbjCIOTH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 09:19:07 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000B682362
        for <linux-i2c@vger.kernel.org>; Thu,  9 Mar 2023 06:19:05 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 82so2053470ybn.6
        for <linux-i2c@vger.kernel.org>; Thu, 09 Mar 2023 06:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678371545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tLvCubDHtLXzRl1IB4R+5cX+IATCnrUj/NCGVu3+49g=;
        b=ODb17lyYgceJ8hJQOvFCiBYgbAlIb1Q4guIHwQV4FRfNfYHATgSOLVUgVWEW+X5QUU
         WyGPGW/8LY9gvGzlCBahnj3haJF95owmXDgCz+RLPvpbvRiPLwN0p2qmBv6moP9UwqFL
         lQIGife5Zzs4m+Y+CdgAH50FcRcS+5DeZQbcFnS0KGoCj87XUOZWWpZFySNWHUkKQiYj
         +whvWVgjervQXjUtxJn1/qtGq6VT7d1FlVvIEf4UWB7x01AqVzt3zEiQ8xpt+uLoTkrQ
         2kSJA5Bu8mpSzXqE4m7FvR2qla0gdogw5I2rs1lu3rJxYBZwbmAy81e1xrm6TrNQ5twg
         giWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLvCubDHtLXzRl1IB4R+5cX+IATCnrUj/NCGVu3+49g=;
        b=JnK/T5dnX1UdKYBcQVELeyoMgH7YSBfltWS48YmrcmPEKnqcstGdRoEsn3WaiyMh5b
         wn+ab2TQ3a7XWPIaYXTU3MQccyRczaChzZtIOxKeq31b2lVeS/xYti1k/HXXHtXJlfi5
         dDafkIL10AoYeZC58sJgjtv3uUEPpo0oi4dVakYuaKT/YDyEbUq7SjdfBDCwb6YdYeTS
         f4/OTTNB9aMa5tdwJH4r3r4UQ5ZsiFBJAOzPYqA2wMCQAp40J9UZFjVopoanynMfyWV9
         1b5vdc4URPUcE8Oz1Y/XIJW+C8rPRaVOVc5zaYRHoqTEA92eAdlm0HnUWS5x3Py+5rTj
         YCXA==
X-Gm-Message-State: AO0yUKX8unSf+voYKJCRvlo2rkQw9jlPip28EjOi/1SXtpv6+NkbsP16
        4zefqMluh/ZK0gKOuZobhHRcho+y88qZYiaIOzzOIg==
X-Google-Smtp-Source: AK7set+Y2+FO7EKyemBQlIQvMTGXu2QwC2Lb/DGpGomlx4MX4TFld3XndtWd72rq8wmcJgg0FqzJqJivJhoxgyg1TaI=
X-Received: by 2002:a5b:1cb:0:b0:a6b:bc64:a0af with SMTP id
 f11-20020a5b01cb000000b00a6bbc64a0afmr13452539ybp.4.1678371545123; Thu, 09
 Mar 2023 06:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20230309071100.2856899-1-xiang.ye@intel.com> <20230309071100.2856899-3-xiang.ye@intel.com>
 <2865f3d0-428b-0df1-fc50-f6af3cb9dac3@suse.com> <ZAnku01goVDCuNM+@smile.fi.intel.com>
In-Reply-To: <ZAnku01goVDCuNM+@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Mar 2023 15:18:53 +0100
Message-ID: <CACRpkdYQfT=JXvmjKR_9O74H2dmwx1EF4QjCHM6fKAetpbrMOg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] gpio: Add support for Intel LJCA USB GPIO driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Oliver Neukum <oneukum@suse.com>, Ye Xiang <xiang.ye@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        wentong.wu@intel.com, lixu.zhang@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 9, 2023 at 2:53 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Mar 09, 2023 at 02:40:10PM +0100, Oliver Neukum wrote:
> > On 09.03.23 08:10, Ye Xiang wrote:
> >
> > > +#define LJCA_GPIO_BUF_SIZE 60
> > > +struct ljca_gpio_dev {
> > > +   struct platform_device *pdev;
> > > +   struct gpio_chip gc;
> > > +   struct ljca_gpio_info *gpio_info;
> > > +   DECLARE_BITMAP(unmasked_irqs, LJCA_MAX_GPIO_NUM);
> > > +   DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> > > +   DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> > > +   u8 *connect_mode;
> > > +   /* mutex to protect irq bus */
> > > +   struct mutex irq_lock;
> > > +   struct work_struct work;
> > > +   /* lock to protect package transfer to Hardware */
> > > +   struct mutex trans_lock;
> > > +
> > > +   u8 obuf[LJCA_GPIO_BUF_SIZE];
> > > +   u8 ibuf[LJCA_GPIO_BUF_SIZE];
> >
> > And here we have a violation of DMA coherency rules.
> > Basically you cannot embed buffers into other data structures
> > if they can be subject to DMA.
>
> Huh?!
>
> The problem here is alignment. But other than that I can't see the issue with
> embedding into structures the instances of which will be allocated on the heap.

Yups. And I think the solution looks something like this:

u8 obuf[LJCA_GPIO_BUF_SIZE] __aligned(8);
u8 ibuf[LJCA_GPIO_BUF_SIZE] __aligned(8);

__aligned(4) if it's 32bit DMA I guess? 8 always works that's
why we use it all over the IIO subsystem.

Yours,
Linus Walleij
