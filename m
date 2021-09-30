Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9E3F41D32A
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Sep 2021 08:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348268AbhI3GVe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Sep 2021 02:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348217AbhI3GVd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Sep 2021 02:21:33 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F0B1C06161C;
        Wed, 29 Sep 2021 23:19:51 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id v10so17921383edj.10;
        Wed, 29 Sep 2021 23:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Me+CypaQEW1A9ZmNwSVkeAJXs+kFTcGj6Je4oGvEpp8=;
        b=VSlWbYDwdV+bDqODUyyZ65a2NRiXUQtlTj0JMC1CWofvsrYLCcHYvvyf8Td9q+d49v
         k2zOEDBFvUNnc2UZzk6ZFUrnvscESgWvIS7m/ZR6bMCATPgGQWzO7dPeI76QkpZ5f8oX
         5hoQuAEkHAB1LFLb77pzKP7tDK6jSlk4x1Ga0YWGBN+Zgf6Q4TRYvXqh2ibcPr7baX5f
         T7j2BbWD2fCfVaGeoiJRTz51KJzscA4pPfdrHgU+ht1NzLXwypbjPY9OIlAyHJZrXSgv
         HQRjWhrELX4dauh41sHFWMMhWrVzX0Fv0kXC1APNxoY+L9vZHMxzms1uDZMGYoNGfGz6
         2Y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Me+CypaQEW1A9ZmNwSVkeAJXs+kFTcGj6Je4oGvEpp8=;
        b=GvbySsFL58iO/QVC8/oPvWBSosxHu5Mzy8yu0HfB3dk/sDTGWujEiUCto+C9WPve3k
         kIOmw1yfEmOmbINJ3Z05Yl7bpa6IbhipkJgibAF4r/Pyqxj0C7RxsSohUBA3FlAicJqs
         9Or1EndV/1/yEzS/X7c30aCDfUeecWTlIr5qprWReqyB5yU+01ieGw5eAf075yCUlKma
         QDvQ12dpGTUF7NSQk26M7p/Kfx4Oij+nIEcGBz7wIwBmfddZZBrb1HIIIFtwIQ0Ycg+x
         kSMD+Ddcg+S53mwm64oCZ50d3KfGjX4fjpGFwsoVJnbByIE48lpqoa0W9lNS0nTYCDXx
         4jRA==
X-Gm-Message-State: AOAM53333I+kzFmD8Ov8nsz188wYUh3nwrAc4A5V8KabGm8C4RlgEgYL
        9W9fCin0Rr/jFp3bovgilKnuWOW+siE5RxEvmTE=
X-Google-Smtp-Source: ABdhPJyJVhRMUtc6me6FDKagvX02NI44aiDbK2jMJ3rz1OdWn6rl0IjdVB4MTyfJeWIbjBK1NZivmN3S+CyL4DpHpcs=
X-Received: by 2002:a05:6402:358a:: with SMTP id y10mr5052373edc.238.1632982789960;
 Wed, 29 Sep 2021 23:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
 <290741faab199d3e43b6255bf2282075@dev.tdt.de> <YUrO5ajlS9wS6xYU@smile.fi.intel.com>
 <YUrg6TfVhk+TIxDz@smile.fi.intel.com> <d84fb798722762862a7fb08f1e343b6a@dev.tdt.de>
 <CAHp75Vcc_6mcR4gC-MzVTjTBpuozMJMFTosQjpXN8A25pndNpg@mail.gmail.com>
 <e221dce908c5ebffa2970c918b45428d@dev.tdt.de> <CAHp75VdALPTzQE-tKj40Ft2b+13AyQKh-Scia_EjYyp54mJtPA@mail.gmail.com>
In-Reply-To: <CAHp75VdALPTzQE-tKj40Ft2b+13AyQKh-Scia_EjYyp54mJtPA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 30 Sep 2021 09:19:14 +0300
Message-ID: <CAHp75Ve4HeJNP3oZB-UMQ7HjGBJcxX=1zF0-ijaWr_Tj2KestQ@mail.gmail.com>
Subject: Re: Add a SSDT ACPI description to recognize my I2C device connected
 via SMBus
To:     Florian Eckert <fe@dev.tdt.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Enrico Weigelt <info@metux.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Eckert.Florian@googlemail.com, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 30, 2021 at 9:15 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Sep 30, 2021 at 1:40 AM Florian Eckert <fe@dev.tdt.de> wrote:

...

> > > 5) as Mika suggested, have you checked the kernel configuration?
> >
> > I have now switched on the suggested option
> > CONFIG_ACPI_CUSTOM_METHOD=y
> > CONFIG_ACPI_TABLE_UPGRADE=y
> > CONFIG_CONFIGFS_FS=y
> > CONFIG_ACPI_CONFIGFS=y
> > CONFIG_ACPI_DEBUG=y
> >
> > But this did not solved my issue loading ssdt during runtime.
>
> It won't as explained in 4) above.

It won't _alone_ solve it, i.o.w. it's required but not sufficient.
Means you have to keep these configuration options enabled.

-- 
With Best Regards,
Andy Shevchenko
