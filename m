Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2BED2A7BF3
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Nov 2020 11:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729484AbgKEKgI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Nov 2020 05:36:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729480AbgKEKgG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Nov 2020 05:36:06 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF5DC0613CF;
        Thu,  5 Nov 2020 02:36:06 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id r10so1121318pgb.10;
        Thu, 05 Nov 2020 02:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ka5MhqGz9TFvBdNwBPCVY+dFvV8nrpAIWu8ggYe6gg=;
        b=dpzTq2vnjChKAZHjvhW2rvU+QblwjsaNr02uBN4fg7IQFFO9NlxNrR9YLhbwvi8zCh
         sbvcdLOzm5mYhEfXhZs4ztZapg52Rku7S0vlXu2kUssknV9owq5xhJYkqyHxUW1RE2Xq
         BCjT2fRU6pKIZZqNcJTPVoPHJQcT7ITAbGGbUKDSVKksacycNCaqpNLlRF56+9DnrYfE
         +yQVqwe4StXvIxP5PEUb/7Xl5hM7SB1AT16GC2OyqNeg6PTdb9Kk1Om+eWP7JPYHqV5h
         zaBQC3/FQ1Eo2/C8ISr6J05VAaue/Qjg0ld05Q+ohfdxgsV3uuHA/pkL8rBEFjbfUP0o
         Hhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ka5MhqGz9TFvBdNwBPCVY+dFvV8nrpAIWu8ggYe6gg=;
        b=ekieGVeVqt0fdy1dFXsBuGEEd9UKfJ6zUdugAG+sJYpASM7H6Gu1W7GLB8y/Koytuq
         WW7xLwwgY80YjPMqwYDvmkCxbT8js2b29NBocQq8oCGic5Jhqq2bGpUNeUrETzlAKus3
         coH8hY7ahKC9jovUx/gnSbo/OgXmR8DKQEFeduCunxjCut7RMnu+bRx3VdlpAfwiH3HH
         75Py+S712zniJmMGOmt4ITzgxgHgiS6Do/y38noaWqpY8unQGZtj7JyprmbVXXxGJGQ7
         /pJNOW4AXQhSnYt0Q1VNr0Yb29xPwKqaligvKh2aDBsH+vCUtBl+tqOyV7IUbQkdXJqz
         M3kQ==
X-Gm-Message-State: AOAM533mqFQBoiO6vqzz1dN7fJL+BprNgdoxxwjXLEUR9Grt59mHgauJ
        FtCPBGuNWf1LE22m2HLiRzefH5FPc45cXNfyhaY=
X-Google-Smtp-Source: ABdhPJxedcN3p9lMEn4aUv35HYvW3RfL6DRzta3i8HG435TEJCnIkMVICp9CyYmK5K9Egos4rL74/KPr3lKye3SuG3c=
X-Received: by 2002:a17:90a:6683:: with SMTP id m3mr1842882pjj.225.1604572566319;
 Thu, 05 Nov 2020 02:36:06 -0800 (PST)
MIME-Version: 1.0
References: <20201105080014.45410-1-hdegoede@redhat.com> <20201105080014.45410-5-hdegoede@redhat.com>
In-Reply-To: <20201105080014.45410-5-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Nov 2020 12:36:55 +0200
Message-ID: <CAHp75Vdk7pdxEMDp0E3XXj2DYhP8jvofQFnErmGJ0cADbxePCA@mail.gmail.com>
Subject: Re: [RFC 4/4] platform/x86: i2c-multi-instantiate: Add
 IRQ_RESOURCE_GPIO_OPTIONAL IRQ type
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 5, 2020 at 10:00 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Most I2C-drivers treat IRQs as optional and in some cases ACPI
> devices managed by i2c-multi-instantiate.c may have a GpioInt resource
> specified on some systems, while it is not there on others.

GpioInt()

> Add a new IRQ_RESOURCE_GPIO_OPTIONAL IRQ type, which still tries to get
> a GpioInt IRQ, but does not consider it a fatal error when this fails.

GpioInt()

...

> -#define IRQ_RESOURCE_TYPE      GENMASK(1, 0)
> -#define IRQ_RESOURCE_NONE      0
> -#define IRQ_RESOURCE_GPIO      1
> -#define IRQ_RESOURCE_APIC      2
> +#define IRQ_RESOURCE_TYPE              GENMASK(1, 0)
> +#define IRQ_RESOURCE_NONE              0
> +#define IRQ_RESOURCE_GPIO              1
> +#define IRQ_RESOURCE_GPIO_OPTIONAL     2
> +#define IRQ_RESOURCE_APIC              3

I think flag is cleaner:

#define IRQ_RESOURCE_OPTIONAL     BIT(2)

...

>                 case IRQ_RESOURCE_GPIO:
>                         ret = acpi_dev_gpio_irq_get(adev, inst_data[i].irq_idx);
> -                       if (ret < 0) {
> +                       if (ret < 0 && (!irq_optional || ret != -ENOENT)) {

ret < 0 && !((inst_data[i].flags & IRQ_RESOURCE_OPTIONAL) && ret == -ENOENT)

>                                 dev_err(dev, "Error requesting irq at index %d: %d\n",
>                                         inst_data[i].irq_idx, ret);
>                                 goto error;

-- 
With Best Regards,
Andy Shevchenko
