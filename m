Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9C51E3D87
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 11:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbgE0J0X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 05:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgE0J0W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 05:26:22 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D89DDC061A0F;
        Wed, 27 May 2020 02:26:21 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id j21so11518852pgb.7;
        Wed, 27 May 2020 02:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zwFUcEhN8mPdmd4qKMP8OvvgXxtYc/zSajnBBKjCQ8U=;
        b=q/yTqMxvmPzYAwKJnTLfPpdXJmlZbEDujCWf991UkxTUJq+TPjKX/Nz0yYvCFys0Qj
         jy5z2eUugCeqLX/CyCVlO78uza4cBJDB5XUQel/0kQApLhStdiH8wtvndqjj3Wv1pX06
         N7pgqJ66B5HElpnHH+hosVDy2GPEUj/LWKutSmdLNpFhBysmK8beBeB4z9KBH47zUpEB
         Ozg5HSYiavx6G+l3mvYjabO4lh9dklOXiOrD1ELDr0b+L8+Oo50xTcSzodLJSOiF6Uy6
         6nW2uIa/I/cxTYPGE7dBJYAQRXGALAUGqqdeRjhh9nIBSQaGXpnf7fSa22ve1z8Ra9ND
         5Atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zwFUcEhN8mPdmd4qKMP8OvvgXxtYc/zSajnBBKjCQ8U=;
        b=WzHGr6rwZd7r6BiCP6juhQjKeY4R6trYZl5zDTkm0rdxzswWb29XD3FoDmroG9Gj8Z
         mWygKgGD2/Lo135wa66uE8RB4nQiaYQaVH/Tsnfs3W7VGQVFqsg47BouPPOUrqqOq/ty
         6a60Zf6XsdNAEcRvDbGR6CGFsvXa1oEAtOv7QMZbdc+ippXOCgJ4aS+gmx2rHh8aEtzO
         AqH4PkT0ey6FsXuq2RbOupc9q4Xsl+9VgxQFLsY5QLvOO8ZYjosq5waVkC4bAH7qTffq
         ETMCYVkKvwg3u9m0YDfBqFchixGODZk7f5KM/aigI+FCNE8kvCQhzwsoLxt4mOk4ZRJX
         H2SA==
X-Gm-Message-State: AOAM532rRD7GGH087XyJqMyuTH40gGDbhSnxywNO2oP3FkxiyjRIXhBO
        tf24K+rtnVilt3ml0hXRIWbdsoMhitVaQ6ay2eM=
X-Google-Smtp-Source: ABdhPJwWKCa5FADvRBtyNdT9UK7w/LgCR2Ee8Xg2MpibPyvla/+8hacN0/nfAitHCcafZlTGs5TW0fi/UKcoDoJPiDU=
X-Received: by 2002:a63:305:: with SMTP id 5mr1361018pgd.74.1590571581281;
 Wed, 27 May 2020 02:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru> <20200526215528.16417-12-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526215528.16417-12-Sergey.Semin@baikalelectronics.ru>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 27 May 2020 12:26:09 +0300
Message-ID: <CAHp75Veygd2y8Tp28p+ZX8Hm_u975QdqatKbsNOG9tNz6HOCAg@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] i2c: designware: Move reg-space remapping into a
 dedicated function
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 4:03 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> This is a preparation patch before adding a quirk with custom registers
> map creation required for the Baikal-T1 System I2C support. Since we've
> touched this code anyway let's replace
> platform_get_resource()-devm_ioremap_resource() tuple with ready-to-use
> helper devm_platform_get_and_ioremap_resource().

...

> +static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
> +{
> +       struct platform_device *pdev = to_platform_device(dev->dev);

> +       int ret = 0;

Redundant.

> +       dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);

What's the point of this API if you don't use resource parameter?

> +       if (IS_ERR(dev->base))
> +               ret = PTR_ERR(dev->base);
> +
> +       return ret;

return PTR_ERR_OR_ZERO(dev->base);

> +}

> -       mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       dev->base = devm_ioremap_resource(&pdev->dev, mem);
> -       if (IS_ERR(dev->base))
> -               return PTR_ERR(dev->base);

Wolfram, did my last series make your tree? I think there was a patch
that touched this part...

-- 
With Best Regards,
Andy Shevchenko
