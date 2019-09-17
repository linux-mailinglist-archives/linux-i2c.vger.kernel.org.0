Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D712B4E84
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 14:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfIQMwo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 17 Sep 2019 08:52:44 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38247 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfIQMwo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Sep 2019 08:52:44 -0400
Received: by mail-ot1-f66.google.com with SMTP id e11so1761990otl.5;
        Tue, 17 Sep 2019 05:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cGu+OKqa8P9FhmcrfusKIEOBVN7wjkZzGzIlcpxnAM4=;
        b=YDGHOiH8Z2ke//JikJFiTQ4b+CXgil1DYPxcbgdq0fkW34HGDqEwrkiZJPiVsYWIHu
         8/ss3Jmsnr3Et0gzx2GCOMuHXT5tPqjCyELSeuzuJ42j3HZuuO7Vi3nWowO7psxK5/oW
         1GV73nRMwcjDbCj+7CPfIgTAwfLsGRtpCwTAAZvFbpkAcN0V+A2C82tZnAZ5dqQDHwdM
         PngDPryYsnZLrqDXhS8iWYVLIvb7tOC1pTlXGe+0ovnOZrainDfkPCo2HdsGp6UnNwOi
         /8z5ASbhbXjWXwO84ZSkROA+IrsAq4kph4eyb5pygXufmgfwb5pUyyll1KM/EoWRIU07
         qMIw==
X-Gm-Message-State: APjAAAUOIsG/ZD3xV9QLOI5PG26S7lQBnUeYNY0t1LXU+8T4AqXKUEQ6
        bbilXmhC7wi36l4yQS8Llug0NK6t/430rUNQ9us=
X-Google-Smtp-Source: APXvYqwF7djb29BU4JOekDq/w2ATaouFkjTZStu1zawPVEUhoivXp7Jzh/X/ybbkO0GGmU/IOqDimmtEJFBAiFablnE=
X-Received: by 2002:a9d:5a06:: with SMTP id v6mr2514884oth.250.1568724762614;
 Tue, 17 Sep 2019 05:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190824132846.8589-1-u.kleine-koenig@pengutronix.de>
 <20190824132846.8589-2-u.kleine-koenig@pengutronix.de> <20190913215809.GA11833@bogus>
 <CAMuHMdV+pwoAA0zH_vQf2nKqzrgHP8rcMStyJbnuu2qviFC_qg@mail.gmail.com>
 <20190917101303.t5otztdus7y3ayau@pengutronix.de> <489c90fb-a135-4fd8-ecb9-46404bd3c234@axentia.se>
 <20190917122530.3xy7sut3xdvzlomj@pengutronix.de>
In-Reply-To: <20190917122530.3xy7sut3xdvzlomj@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Sep 2019 14:52:31 +0200
Message-ID: <CAMuHMdXk5uSk-v4vYVR1YO46gQd0mRYy5eEM6wOHqgkRTfyn-g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] of: Let of_for_each_phandle fallback to
 non-negative cell_count
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe,

On Tue, Sep 17, 2019 at 2:25 PM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> On Tue, Sep 17, 2019 at 11:25:46AM +0000, Peter Rosin wrote:
> > On 2019-09-17 12:13, Uwe Kleine-König wrote:
> > > On Tue, Sep 17, 2019 at 11:40:25AM +0200, Geert Uytterhoeven wrote:
> > >> On Fri, Sep 13, 2019 at 11:58 PM Rob Herring <robh@kernel.org> wrote:
> > >>> On Sat, 24 Aug 2019 15:28:46 +0200, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=          wrote:
> > >>>> Referencing device tree nodes from a property allows to pass arguments.
> > >>>> This is for example used for referencing gpios. This looks as follows:
> > >>>>
> > >>>>       gpio_ctrl: gpio-controller {
> > >>>>               #gpio-cells = <2>
> > >>>>               ...
> > >>>>       }
> > >>>>
> > >>>>       someothernode {
> > >>>>               gpios = <&gpio_ctrl 5 0 &gpio_ctrl 3 0>;
> > >>>>               ...
> > >>>>       }
> > >>>>
> > >>>> To know the number of arguments this must be either fixed, or the
> > >>>> referenced node is checked for a $cells_name (here: "#gpio-cells")
> > >>>> property and with this information the start of the second reference can
> > >>>> be determined.
> > >>>>
> > >>>> Currently regulators are referenced with no additional arguments. To
> > >>>> allow some optional arguments without having to change all referenced
> > >>>> nodes this change introduces a way to specify a default cell_count. So
> > >>>> when a phandle is parsed we check for the $cells_name property and use
> > >>>> it as before if present. If it is not present we fall back to
> > >>>> cells_count if non-negative and only fail if cells_count is smaller than
> > >>>> zero.
> > >>>>
> > >>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > >>
> > >> This is now commit e42ee61017f58cd9 ("of: Let of_for_each_phandle fallback
> > >> to non-negative cell_count") in robh/for-next, which causes a lock-up when
> > >> booting a shmobile_defconfig kernel on r8a7791/koelsch:
> > >>
> > >> rcu: INFO: rcu_sched self-detected stall on CPU

> Oh yeah, you're right. I'm a bit disappointed that I didn't spot this
> myself :-|
>
> Untested patch to fix this problem:
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 2f25d2dfecfa..26f7a21d7187 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1284,6 +1284,13 @@ int of_phandle_iterator_init(struct of_phandle_iterator *it,
>         const __be32 *list;
>         int size;
>
> +       /*
> +        * one of cell_count or cells_name must be provided to determine the
> +        * argument length.
> +        */
> +       if (cell_count < 0 && !cells_name)
> +               return -EINVAL;
> +
>         memset(it, 0, sizeof(*it));
>
>         list = of_get_property(np, list_name, &size);
> @@ -1765,6 +1772,18 @@ int of_count_phandle_with_args(const struct device_node *np, const char *list_na
>         struct of_phandle_iterator it;
>         int rc, cur_index = 0;
>
> +       /* If cells_name is NULL we assume an cell_count of 0 */

a cell count

> +       if (cells_name == NULL) {
> +               const __be32 *list;
> +               int size;
> +
> +               list = of_get_property(np, list_name, &size);
> +               if (!list)
> +                       return -ENOENT;
> +
> +               return size / sizeof(*list);
> +       }
> +
>         rc = of_phandle_iterator_init(&it, np, list_name, cells_name, -1);
>         if (rc)
>                 return rc;

Thanks, that fixes the boot for me!

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
