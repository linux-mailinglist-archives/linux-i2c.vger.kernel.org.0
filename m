Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09545222055
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 12:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgGPKOb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 06:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgGPKOb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 06:14:31 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03868C061755;
        Thu, 16 Jul 2020 03:14:31 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t15so4421575pjq.5;
        Thu, 16 Jul 2020 03:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZutxaYEpmEySv3UmHMi5+FROX85B8I1ijTI1ru6Ewl4=;
        b=hIKvHRB/cueR0iOI58m532legrB8eMWxHzMvO9fAmlo5ViRbW3bpLZG1OXuUlO06LQ
         f3swevYFeW3+p1KoKjcbf7Vf2lggHFR/IU00Kg6IStQAzvP6JbqSGWdOPNHA0AdWuieg
         ZABrV/DfkxDoYNctqxtJU6D3jKvatjTZHKv+Ka0t8KkT4m0YjyOKE7E0bw9rCNgnMBxJ
         vdnT3BjodKSYR3M911mzpQJlNGIHM+VWZya4n19X/Q5cdEEyPXar5a2V6K+82CagGNKm
         BxuP2QghQ//+98N+z21AkJglg+Isb0WDFbwsmBKvpdVOfiT1g9e4wwXwEFCHEy/U2E0y
         VryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZutxaYEpmEySv3UmHMi5+FROX85B8I1ijTI1ru6Ewl4=;
        b=kvhj5dldhOpdBIJlmFD5gj8eC1RUnc2aqAGqXqaTBoPMVUkYWxGurdIHPxXh+5eIhU
         s7mqET74hM4HPyeDhiqJeQWk3hGQ5226aoAYX/NlBRV2pDKrJ1CZj2p235Qh34PFZNzO
         8JFdle52vmefmy8B3bHDem1IFElqLMHqM+i3z0jtEoIc7djQZDuXM3MCc+g2VHzaPVEK
         eJxJSmW9ChSckdgfuDvD181tnpun3BajJS3vDnE3fhjweUdBbizfKA83UCIZTPrjf9Wn
         41s3g3eED00JE1g6KbQVC2arztLEvFr3oh2I1kyIUCp1KvcsLoirnT4LzSUXLbC2Xo4O
         J0Dw==
X-Gm-Message-State: AOAM532F1Yq5rPBNnXNmf9PR3WAJ8xZAK3aXzwwR1G3bF4LWnkamUuP/
        cOSPBvIYOY8BwsZW6SXhyz1KjbPVSRQnvBnYwAtBzcEH
X-Google-Smtp-Source: ABdhPJwQFoM4iZtiHWAuEwqpo/JQvqiBk0vdFRrwv7kOdg027V9PMwF0z+LQ2HpUSPOZy6PgjuOQ02qyFMJEcoYPLvo=
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr4290355pjb.129.1594894470264;
 Thu, 16 Jul 2020 03:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200716080836.2279-1-rayagonda.kokatanur@broadcom.com> <20200716080836.2279-3-rayagonda.kokatanur@broadcom.com>
In-Reply-To: <20200716080836.2279-3-rayagonda.kokatanur@broadcom.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 16 Jul 2020 13:14:13 +0300
Message-ID: <CAHp75VeXBCqEhfna2mQaHv7bZKOrj+A6KkbCrMAfM=X9+boDjA@mail.gmail.com>
Subject: Re: [PATCH V1 2/2] i2c: iproc: add slave pec support
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Robert Richter <rrichter@marvell.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 16, 2020 at 11:14 AM Rayagonda Kokatanur
<rayagonda.kokatanur@broadcom.com> wrote:
>
> Iproc supports PEC computation and checking in both Master
> and Slave mode.
>
> This patch adds support for PEC in slave mode.

...

> -#define S_RX_PEC_ERR_SHIFT           29
> +#define S_RX_PEC_ERR_SHIFT           28
> +#define S_RX_PEC_ERR_MASK            0x3
> +#define S_RX_PEC_ERR                 0x1

This needs to be explained in the commit message, in particular why
this change makes no regression.

...

> +static int bcm_iproc_smbus_check_slave_pec(struct bcm_iproc_i2c_dev *iproc_i2c,
> +                                          u32 val)
> +{
> +       u8 err_status;

> +       int ret = 0;

Completely redundant variable.

> +       if (!iproc_i2c->en_s_pec)
> +               return ret;

return 0;

> +       err_status = (u8)((val >> S_RX_PEC_ERR_SHIFT) & S_RX_PEC_ERR_MASK);

Why casting?

> +       if (err_status == S_RX_PEC_ERR) {
> +               dev_err(iproc_i2c->device, "Slave PEC error\n");

> +               ret = -EBADMSG;

return ...

> +       }
> +
> +       return ret;

return 0;

> +}

...

> +                       if (rx_status == I2C_SLAVE_RX_END) {
> +                               int ret;
> +
> +                               ret = bcm_iproc_smbus_check_slave_pec(iproc_i2c,
> +                                                                     val);

One line looks better.

> +                               if (!ret)

Why not positive conditional?

> +                                       i2c_slave_event(iproc_i2c->slave,
> +                                                       I2C_SLAVE_STOP, &value);
> +                               else
> +                                       i2c_slave_event(iproc_i2c->slave,
> +                                                       I2C_SLAVE_PEC_ERR,
> +                                                       &value);
> +                       }

-- 
With Best Regards,
Andy Shevchenko
