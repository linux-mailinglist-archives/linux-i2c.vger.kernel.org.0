Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22EF4802AB
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Dec 2021 18:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbhL0RRm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Dec 2021 12:17:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhL0RRm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Dec 2021 12:17:42 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07907C06173E;
        Mon, 27 Dec 2021 09:17:42 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id w16so64043891edc.11;
        Mon, 27 Dec 2021 09:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ra0ohVAty7IbgPGWjyDg8crVa8d6l8wg1PZczvY5vYI=;
        b=nxnhGPi9KfzyxU0RIODHbSGyYDNHt9dHMDCMyn8p2fqevaB6nLVb4tw6lH/VNLS0N4
         xuvmFXc8/X8Opwlf36KksvPEAaVxC0e5AGMUIzCA5E59U10lfv+BxvGBOQmZvyekU71f
         WvYPfAC1DSyJsAcORtN5I2RXxiNA9mImGRjWweL0FIUSH3ORWrTnYWGrnXWHzrhwa2gV
         pV64em7OZHdFyDSsSYbve1KuBowH3r9RKwMKJ3r5oXu4bd3+MymgBGHQ6cDwAlyX90X1
         0u7FNU7Se4mvkH8TFdwRm60jd6s7C3iZ3boFjhbWZ764w1mL6PXAHb9VMAG0P61g0KhO
         dY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ra0ohVAty7IbgPGWjyDg8crVa8d6l8wg1PZczvY5vYI=;
        b=6Jhi/2m8TgavOrEKWigHS4pCenKV9jm4nvHG2aoLFrgC7sgJZXMAA+XSbAH6hBH6Ao
         JZQtt5+XjrlgyIqaiXaoiHg321G3KIU8wQVDAAVN0DneusL6RoQ9yVk19+LWAJGueyBd
         iGe6IuZXQr339IEjQd1DxglTJygumL9giGw+oAhdyvk0WxHg+Kv6YFuDfCe1upsyeGuS
         I1WYzjfro4JGH7XA3jHd3Uu0z07sJWTy4Ah7nFCyUlKOvOBEj5I1RpX8AQ4z5usCXm+O
         xe/rlYuKQNYzVfjqoXTdjbqUe+Ei4Fh2srHJYFxMqUf3EhwtoLBmaHWCrUD5UogFbLWW
         RE2g==
X-Gm-Message-State: AOAM530gOLnwp5CfgCbRwcob6sxnGsMy12REjNK55ORDq5liLv4Yr+2P
        W9EsegWjl/c+c6A6ZIg8FHXlWtXdLgjFieX94Wo=
X-Google-Smtp-Source: ABdhPJyW4nZqhM2+q9hd5SYLXuvlH0XYqSjrZfdwtaAvTwexMQZJMeFU2khkvdT+1sJS2lo1pd+H5+Bo3VSzn6b55NA=
X-Received: by 2002:a17:907:76d4:: with SMTP id kf20mr14393121ejc.44.1640625460436;
 Mon, 27 Dec 2021 09:17:40 -0800 (PST)
MIME-Version: 1.0
References: <20211222162041.64625-1-andriy.shevchenko@linux.intel.com> <57ef9519-23d5-25f0-9385-7646aba52316@amd.com>
In-Reply-To: <57ef9519-23d5-25f0-9385-7646aba52316@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Dec 2021 19:17:04 +0200
Message-ID: <CAHp75Vd3DoxWrVqfHzMtjAi8P2E2xgww35ASCt5vBnkvWvwuyw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] i2c: Introduce common module to instantiate CCGx UCSI
To:     "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>, sanket.goswami@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 27, 2021 at 6:45 PM Shah, Nehal-bakulchandra
<nehal-bakulchandra.shah@amd.com> wrote:
> Thanks for the this patch series.
> On 12/22/2021 9:50 PM, Andy Shevchenko wrote:

...

> > +EXPORT_SYMBOL_GPL(i2c_new_ccgx_ucsi);c
>   it needs MODULE_LICENSE("GPL"); else if driver is built as module it
> fails to probe. However after adding this we validated and it is working
> fine.

Thanks!
Dunno if i need to resend or Wolfram can add it when applying.

...

> > +struct i2c_client *i2c_new_ccgx_ucsi(struct i2c_adapter *adapter, int irq,
> > +                                  const struct software_node *swnode);

> Here, One more suggestion if can be incorporated , instead of passing
> only irq we should pass irq number and irq type. For example in our next
> generation platform , CCGX driver is using IRQF_TRIGGER_FALLING type
> where is default hard coded is IRQF_TRIGGER_HIGH. So in CCGX driver in
> request_threaded_irq function along with passing irq number , irq type
> also can be passed.

We don't add dead code in the kernel, so when you have patches ready
just create another one as a prerequisite that adds that.

-- 
With Best Regards,
Andy Shevchenko
