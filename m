Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD1D74F48D6
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 02:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238045AbiDEVvn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 5 Apr 2022 17:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357841AbiDEO5D (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 10:57:03 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC343169B0C;
        Tue,  5 Apr 2022 06:23:02 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-2eafabbc80aso135119877b3.11;
        Tue, 05 Apr 2022 06:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7A4P9kn8lX4sQ7Htb6dVWHUymvJRsd1UwLVgcXfrzcY=;
        b=1JeLcq/jxTDd964pW6ogdHlJxVr8MMS8irQgftGCWQtbPADDPFzk1Z/QbLuVHlihbk
         ov066ahR8eT3FdyBQkof0Y53tBUrVRp/p7tYyrxW7uYz+YaTJ9hlPzrHdKYf6R2rF8V+
         bS+2QrKOKwwu9ND7KOu5jxVMk+UvdRoKrnNG6JceRWXPTPGST+PyquTZPKBz6i5r4iIV
         BieZpy7L97IPcd9fi+s8ba/M2iARklmDVYgSg6zlZsGyUbrkVUCqoCID2J/4pxec+clr
         lCPF8CRghx21zTKzzrK94warG0/3MEFep0Tp07sRq2/Fv+ssX9q/ugFdSkakDqSixCTP
         9zEA==
X-Gm-Message-State: AOAM531TtsjghQFB6YL53glCVsv7OgjrTJcKMcPscZb1VFkKyQ0/bBsF
        nWKHxxRy7bJO6a/EATko2KqghU9yoRg3CHOMdV0=
X-Google-Smtp-Source: ABdhPJycfqaQNd811FMhkXgQfDqevZ83CiXYssxwULKvsQGRHFOOAMwuLYDGOU9KcjHSXp7vTAqGzq/4etcE7UXaUuo=
X-Received: by 2002:a81:36cf:0:b0:2e5:2597:a026 with SMTP id
 d198-20020a8136cf000000b002e52597a026mr2616210ywa.301.1649164981760; Tue, 05
 Apr 2022 06:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220325113148.588163-1-clement.leger@bootlin.com>
 <20220325113148.588163-4-clement.leger@bootlin.com> <Yj3SFYdUQ4r7GXqs@smile.fi.intel.com>
 <20220328162812.16deac92@fixe.home>
In-Reply-To: <20220328162812.16deac92@fixe.home>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 5 Apr 2022 15:22:51 +0200
Message-ID: <CAJZ5v0hOjaOCUxbFzKG90Db0bgfdb3q988oAvLB4kmD3-HS8sQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] device property: add index argument to
 property_read_string_array() callback
To:     =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 28, 2022 at 4:29 PM Clément Léger <clement.leger@bootlin.com> wrote:
>
> Le Fri, 25 Mar 2022 16:30:45 +0200,
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> a écrit :
>
> > >     pointer = property_entry_find(props, propname, length);
> > >     if (IS_ERR(pointer))
> > >             return PTR_ERR(pointer);
> >
> > > +   if (index >= array_len)
> > > +           return -ENODATA;
> >
> > I was about to ask if we can check this before the
> > property_entry_find() call, but realized that in such case it will
> > shadow possible errors due to wrong or absent property.
>
> I think you are actually right, the check can be done after
> property_entry_count_elems_of_size() since it already checks for the
> property to be present. I'll move that check.
>
> >
> > ...
> >
> > > -           of_property_read_string_array(node, propname, val,
> > > nval) :
> > > +           of_property_read_string_array_index(node,
> > > propname, val, nval,
> > > +                                               index) :
> >
> > Dunno about the style there, but I think it can be one line.
>
> Seems like the complete file is strictly applying the 80 columns rules
> so I thought it was better to keep it like this. However, I think the
> ternary oeprator is not really readable with such split.

So FWIW I would entirely change it to

if (!val)
        return of_property_count_strings(node, propname);

return of_property_read_string_array_index(node, propname, val,

nval, index);

which IMO would be way easier to read.
