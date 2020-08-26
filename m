Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D8625268A
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 07:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgHZFZs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 01:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgHZFZr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Aug 2020 01:25:47 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA63C061574;
        Tue, 25 Aug 2020 22:25:47 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g33so476322pgb.4;
        Tue, 25 Aug 2020 22:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z3LGnTCr/eYWP2X66RzavN5L3cyXT8al4eEGOaizoiY=;
        b=TfeqLHcwx/4LJP7jMLoGi1fx+AaQXjeW4/KupkajuYLiaHsKTrpKRVYKr0xecpkpFY
         Nao+/2wENu1uePJFif1Hfid7aqHP/XwcOWUboXGwabAXASPUdKnrQvsnaYp/ZAh8DzMz
         lUB4V+Wc6PPGBdmkiNMgRK63PZouA3S0xfADC2JlTXPpxai7atEoe2xNYI/1Gu+Zce4N
         cyYmzqU5VLOI5uTX72dDOXCJQjtYaFL2Q6OOKKE/PJELZvwZu59thE3ez9Yp5empA0sk
         OAsVsGDLxDgMX1wVkxgeY8fgEgrVC9uBeIYdvBKVTuWp1jZywsYOo7dIhQBrBh/Jm8QC
         vVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z3LGnTCr/eYWP2X66RzavN5L3cyXT8al4eEGOaizoiY=;
        b=YMYHDGDc2McL++WNvRvBf4Gon43JIN0htMzEWd88FOaKM8xcaa3gImC3oR2Bm7i5CS
         Q/l/DdAYXQFd6JzwEC1llnTj1ueLfAzTNQ/5Vfuz32EZVv7CDUWWqOLAi7WC47GEUeQY
         P4u7XAPQcgFrDFzmbEneN91OHWjccdPyyeAFShucKpYFB/NnEQ7L40J51ySc3Ml17JH8
         yRn4/dbFGQ/N42m4ODQH/btWBaUSCpQ43Q/5ibbWo10xwF/WrJYyofw4KtM+J+aas8Wk
         rlRrC6XWtQU6NQ2fSzMI3tJW076/pzgY7hcUQ5PbyTqDcrLFrPQnsXInt0g/AvER2G/+
         Vf3Q==
X-Gm-Message-State: AOAM530Y34GU3qI60Xdl+FemeR67xwrzmB/o+3ZyYL+MQBho4q527O44
        lSU77t0MGJeXiWCHLudvnI0=
X-Google-Smtp-Source: ABdhPJw+ftD1vGst9Sng0HcdiMUhLsCbU70lfP1v2eg95myGqO9IKgxambJjK/6cp0fcI+4QzO0c9g==
X-Received: by 2002:a62:2903:: with SMTP id p3mr4044358pfp.83.1598419547097;
        Tue, 25 Aug 2020 22:25:47 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id 19sm790409pjk.28.2020.08.25.22.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 22:25:46 -0700 (PDT)
Date:   Wed, 26 Aug 2020 14:25:44 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: consider devices with of_match_table during i2c
 device probing
Message-ID: <20200826052544.GA500@jagdpanzerIV.localdomain>
References: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
 <20200826050851.GA1081@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826050851.GA1081@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On (20/08/26 07:08), Wolfram Sang wrote:
> On Wed, Aug 26, 2020 at 01:29:37PM +0900, Sergey Senozhatsky wrote:
> > Unlike acpi_match_device(), acpi_driver_match_device() does
> > consider devices that provide of_match_table and performs
> > of_compatible() matching for such devices. The key point here is
> > that ACPI of_compatible() matching - acpi_of_match_device() - is
> > part of ACPI and does not depend on CONFIG_OF.
> > 
> > Consider the following case:
> > o !CONFIG_OF system
> > o probing of i2c device that provides .of_match_table, but no .id_table
> > 
> >  i2c_device_probe()
> >  ...
> >    if (!driver->id_table &&
> >        !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
> >        !i2c_of_match_device(dev->driver->of_match_table, client)) {
> >        status = -ENODEV;
> >        goto put_sync_adapter;
> >    }
> > 
> > i2c_of_match_device() depends on CONFIG_OF and, thus, is always false.
> > i2c_acpi_match_device() does ACPI match only, no of_comtatible() matching
> > takes place, even though the device provides .of_match_table and ACPI,
> > technically, is capable of matching such device. The result is -ENODEV.
> > Probing will succeed, however, if we'd use .of_match_table aware ACPI
> > matching.
> > 
> > Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> 
> We have currently this in for-current which is even removing
> i2c_acpi_match_device():
> 
> http://patchwork.ozlabs.org/project/linux-i2c/list/?series=196990&state=*

Oh, nice!
Can we go a bit further and use i2c_device_match() in i2c_device_probe()
instead of a mix of APIs from different subsystems?

E.g.

        if (!driver->id_table &&
-           !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
-           !i2c_of_match_device(dev->driver->of_match_table, client)) {
+           !(client && i2c_device_match(&client->dev, dev->driver))) {
                status = -ENODEV;
                goto put_sync_adapter;
        }

	-ss
