Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEEBA4950B7
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 15:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358281AbiATO7e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 09:59:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346102AbiATO7d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 09:59:33 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6D7C061574;
        Thu, 20 Jan 2022 06:59:33 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id u18so15694959edt.6;
        Thu, 20 Jan 2022 06:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q7/Art4fi7Ys+mKvfMJYfxSvlOJsbRKucqQhRA69bnI=;
        b=aCGGxiYLTv4SVejDvxcNOhoE/tXZlskJXY4VdLXFx7mLuYAEGN0y7HJkr0NsYalnEj
         qyZxOKRhUUWEWuQ5yuX7PeLNomLeYNJ80ht2YlxtYMHiQPMx57Cr+/GnEVnrm5Hwrz7A
         Ded9EA6M5zwg/Niqvo4kPTj4BETD1QBYifj1csdmxV0LL0GTRok8pLpKEvZAxEoMpRVf
         v+21aTOeFoZVzH3cJGmg4/zxgAUrBXr96IklYlqz/fMYRt0gq4SqDWSI34Cd1t9YBWxE
         8g4DOcJGTw+2XEzikWXINsbY77/wFQvzbX88dn+RRbeL9bbJ3YH5Z2HnAQASFJZrnz8t
         g/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q7/Art4fi7Ys+mKvfMJYfxSvlOJsbRKucqQhRA69bnI=;
        b=q3bjOPX1TY689RRLrJ7rPRz/605+J+PKtX/PN4mtaNyZMH3m843zPBK1uBjBgPk0HT
         3FMM/B/lOVo98Pr0YKiN7hzUaBS8lrcOpN1jwYiHSsbM5CS/Y5o0kVxFcEcO9FN86GfP
         y0XFjapdJerNwaDtniEhKOo3adJF8oorBGe9y/SpYhswk5llfs/3Lgz7EtauOyiVWSl9
         LgmpIkSvV7wXnoz6jdWbOE0l+uXNg9KItguWl8DIfX2kYkIhwAOBdgisnOa27JqvMvgA
         3+AYr/i+JGcctXMJa0SrNTnlSqaod4PqbblVWD4seHOJfxn6QY5mwIJhlJTY275bEnbv
         OfAw==
X-Gm-Message-State: AOAM5323sNHBc6LnDJqgEexONtKZ65SJB/2lEiA/TRnhMmhuMI6VwGBb
        AJnEmalfRZjk/uirBGkIssEPZ1MjaplSWlK0iyk=
X-Google-Smtp-Source: ABdhPJwJVZLjArtFZ3WPYTSEiSnskUTscXctdXqraZCdNwhkNDk6+IBeo6b/0RhdSTM9KnC3e6bg4B5GGbj3/jTa6EI=
X-Received: by 2002:a17:907:94d3:: with SMTP id dn19mr2304620ejc.77.1642690771754;
 Thu, 20 Jan 2022 06:59:31 -0800 (PST)
MIME-Version: 1.0
References: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com> <1642686255-25951-2-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1642686255-25951-2-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Jan 2022 16:57:49 +0200
Message-ID: <CAHp75VeOvXf6twskZp-Y-s8AQEpftA0SOUJfXqO5sJ1FKNKgCA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] device property: Add device_irq_get_byname
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 20, 2022 at 3:45 PM Akhil R <akhilrajeev@nvidia.com> wrote:

Thanks, my comments below.

> Add device_irq_get_byname() to get an interrupt by name from both the
> ACPI table and the Device Tree.

This needs to be clarified (it's not and, but or), what about:

  Add device_irq_get_byname() to get an interrupt by name from either
  ACPI table or Device Tree whichever has it.

> This will allow to use 'interrupt-names' in _DSD which can be mapped to

In the ACPI case this
allow us to

> Interrupt() resource by index. The implementation is similar to
> 'interrupt-names' in the Device Tree.

...

>  /**
> + * fwnode_irq_get_byname - Get IRQ from a fwnode using its name
> + * @fwnode:    Pointer to the firmware node
> + * @name:      IRQ name
> + *
> + * Description:
> + * Find a match to the string 'name' in the 'interrupt-names' string array

'name' --> @name

> + * in _DSD for ACPI, or of_node for device tree. Then get the Linux IRQ

Device Tree

> + * number of the IRQ resource corresponding to the index of the matched
> + * string.
> + *
> + * Return:

> + * Linux IRQ number on success
> + * Negative errno otherwise.

 * Linux IRQ number on success, or negative errno otherwise.

> + */
> +int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
> +{
> +       int index;
> +
> +       if (!name)
> +               return -EINVAL;
> +
> +       index = fwnode_property_match_string(fwnode, "interrupt-names",  name);
> +       if (index < 0)
> +               return index;
> +
> +       return fwnode_irq_get(fwnode, index);
> +}

...

> +/**
> + * device_irq_get_byname - Get IRQ of a device using interrupt name
> + * @dev: Device to get the interrupt
> + * @name: IRQ name
> + *
> + * Description:
> + * Find a match to the string 'name' in the 'interrupt-names' string array
> + * in _DSD for ACPI, or of_node for device tree. Then get the Linux IRQ
> + * number of the IRQ resource corresponding to the index of the matched
> + * string.
> + *
> + * Return:
> + * Linux IRQ number on success
> + * Negative errno otherwise.
> + */

As per above.

...

> +int device_irq_get_byname(struct device *dev, const char *name);

Since we don't have device_irq_get() perhaps we don't need this one
right now (just open code it in the caller). This will satisfy
Rafael's request.

-- 
With Best Regards,
Andy Shevchenko
