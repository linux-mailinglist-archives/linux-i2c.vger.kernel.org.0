Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8D73BBA4F
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 11:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbhGEJlV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 05:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhGEJlU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 05:41:20 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A8FBC061574;
        Mon,  5 Jul 2021 02:38:43 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id b14-20020a17090a7aceb029017261c7d206so8408326pjl.5;
        Mon, 05 Jul 2021 02:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N8hIsrfFLK/2fysdRAf2HmCsPkpZLqChCVq+sN96CK0=;
        b=ZfimxbTmkj7HgeUqV2zuTBqyMmPTk+kT/xnWRb5YOaRD2L0ZDEYBWaE8vAoETumG9Y
         y9bO+O57OeKB0LcBJAP3vNCzvGz+Irsgih05umjacIU665atpiU+hsUTPhrYUhxBMf8E
         WbPa4D4T1QAz0D/Ew6Zwf16xo8HjxEAi5+dQkF/W0J7ARTi6f3ObvvflVyCehgaT9J1f
         EJa2/ugXZ1Qb5t51f5GKkQ60Lsla0764LPokF4fgCHseaTSc8fieunlbik515efim5Z/
         cdkC8c7XGgACr1gDmNDCIlhVnqkeW9Ttaj9XNQo1qt1bJjfePmaLqNDXaDNZ8QAToe7F
         nn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N8hIsrfFLK/2fysdRAf2HmCsPkpZLqChCVq+sN96CK0=;
        b=MPDFbJV3V4vh1Zs6LDqXTUGebMX6T3UtuYtyDm0TffI869SmPbDPjGmIjcrC8ToF/B
         NZHOGzJ59WSYPQ1Q8hdaEb2+pUamI0Z2d8nY0ToMNsfzlDHGuraM4EwB7ZmGyMT+oC1S
         65AIhoBi3c9Ud5WHbzMNKb6lB7a7NXJC4TLLJQU0VVbj4FXwzBjUn5VJrQuuNmpjusQB
         v0OGdgGUCjxDLao2dAEOGs6MM56QKAPgWLWVF+jL4T45gksLKdVaNulxhkoMqOyN9kp1
         lQhasqDVCg71ikOWNFLFE2Yb8C13FKB96jKjxMExtkRgam9Oe4vkJuDvs01cTYLDD+RE
         tghw==
X-Gm-Message-State: AOAM530j00kzXWn3VXOIndLPBhurvkcIPPz4S9S5PQewZRqtWE9g0H+o
        wM0VdtKXZI0qh2uu+HYcQEdd12Sr2XI1lnDE9iw=
X-Google-Smtp-Source: ABdhPJzAMt+FJukCPw3nefv6guPPNvSz9T/UHEsyqI80wJBwv2O7EwFmtiaowKJfv7zFQNdH6RNCJAM+d4KMe1sStAw=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr14627083pja.181.1625477922944;
 Mon, 05 Jul 2021 02:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <8908f35a741e25a630d521e1012494e67d31ea64.1625466616.git.jie.deng@intel.com>
 <20210705080245.yabjlrgje5l7vndt@vireshk-i7> <CAHp75Vf0_8+KW_cp2g0V1miMx1cegBdjLzBjTbtpmcmdCHQJxA@mail.gmail.com>
 <20210705085610.okcvnhwhwehjiehy@vireshk-i7>
In-Reply-To: <20210705085610.okcvnhwhwehjiehy@vireshk-i7>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 5 Jul 2021 12:38:04 +0300
Message-ID: <CAHp75VeE4Du29XJV54VWR4CH4yfCEqokRUFFRY_sdMKsp1oXyQ@mail.gmail.com>
Subject: Re: [PATCH v13] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 5, 2021 at 11:56 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 05-07-21, 11:45, Andy Shevchenko wrote:
> > On Mon, Jul 5, 2021 at 11:03 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > On 05-07-21, 14:53, Jie Deng wrote:
> >
> > > > +#include <linux/types.h>
> > > > +#include <linux/const.h>
> > >
> > > Both of these need to be the uapi headers as Andy said earlier
> >
> > They are already since this header _is_ UAPI,
>
> Ahh, there is some tricky header inclusion there :)
>
> > what you are suggesting is gonna not work,
>
> Why ?

Because we do not have "uapi" in the path in /usr/include on the real
system where the linux-headers (or kernel-headers) package is
installed.

It's still possible that our installation hooks will remove that
"uapi" from the headers, but I think it makes things too complicated.

> > although it's correct for in-kernel users of UAPI
> > headers.


-- 
With Best Regards,
Andy Shevchenko
