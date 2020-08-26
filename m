Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F128F252B56
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 12:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgHZKYQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 06:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728106AbgHZKYP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Aug 2020 06:24:15 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91769C061574;
        Wed, 26 Aug 2020 03:24:15 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k13so680242plk.13;
        Wed, 26 Aug 2020 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5/NpOs5u5tmfQLeBud9bsc+4lQGsVxxZ9VcmcytOVJQ=;
        b=MgkjBV2adrvmv2cl0Xz8LrlYkGluR7lpPpea3uTiESMRc1CpgEii2Me2zoBqgi7yzc
         TxGSuH6sqgED32Irh5ORThOvqlHLH8bqB6IfgNoEKFBrj+1jjr4UfZgBTipQMzumZQbl
         EXIQLrb8ew+dWdHFyBvMBpxGhyHZz8oB+w31D8ZaiWwupHe7cXox12L+QRXCFaBCVvhE
         nemAVyzWjNsuklgROPRRf4nggMZwLB7Tj/a0gUnAdcOPZJR5EtbmYSAgSYaYxdD4ibBy
         N493zYSlm+19+EIRGEcB4DFHEkcZkDRUR3+CZRAMSnH5yfKN+qs1hjwrcg5aKiu0zgrL
         zEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5/NpOs5u5tmfQLeBud9bsc+4lQGsVxxZ9VcmcytOVJQ=;
        b=tyyrMT5IVo6POfUt1+EFIlgdHPkavKEmzJXS8SnuJaCqd4siAMEMAtoS3UH8/Qhq0L
         r41kjglkptiiexnQYDgRI7iREhsOo22eel+N5LrJRC1btreMeVZioDwyebFQM8uiH0jf
         Rhf65AYYYX+tu6x0GQB4Ey51yS63DI+kcO39YCBnXJqfl+nbwHwa+zLZf/XhCoJce9H9
         xP5pa3TF7mXxS09irwyALwV10LTZHOKwzK7iq9OX5hNgTo4q7yuF/hDH1U9vpx6SwDlT
         sbSQZjvR2qiknNWqxV1WYM1S+UPsYelGFurEWYi+DuONSUEE6hQb1Egpq2RC3A7QoMmK
         FZng==
X-Gm-Message-State: AOAM5314JXhNkZWjVr54L8MmROavfJaEIv+vBMwvMygAmau+TTBkP3BA
        ZVaVY1Veocm9WmI4FyFmYr02JjkMPUE=
X-Google-Smtp-Source: ABdhPJz0uGq544B3rAB+RS/l5kz82GMKrc//WA2qREWsaEFzrypBkULzfCS//kDVVXF30Q4Q3bufqg==
X-Received: by 2002:a17:90a:be11:: with SMTP id a17mr5254867pjs.167.1598437454883;
        Wed, 26 Aug 2020 03:24:14 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id x13sm2504102pfr.69.2020.08.26.03.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 03:24:14 -0700 (PDT)
Date:   Wed, 26 Aug 2020 19:24:11 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: consider devices with of_match_table during i2c
 device probing
Message-ID: <20200826102411.GC8849@jagdpanzerIV.localdomain>
References: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
 <20200826050851.GA1081@ninjato>
 <20200826052544.GA500@jagdpanzerIV.localdomain>
 <20200826095356.GG1891694@smile.fi.intel.com>
 <20200826095617.GH1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826095617.GH1891694@smile.fi.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On (20/08/26 12:56), Andy Shevchenko wrote:
> > You probably meant simply:
> > 
> > 	if (!i2c_device_match(dev, dev->driver)) {
> > 
> > >                 status = -ENODEV;
> > >                 goto put_sync_adapter;
> > >         }
> > 
> > On the first glance it will work the same way but slightly longer in case of ID
> > table matching.
> > 
> > Send a patch!
> 
> But then the question is why we have this code in the ->probe() at all?
> ->match() is run before probe by bus core, no?

That's a good question.

There is also one more .id_table traversal done right before ->probe()
call:

	 driver->probe(client, i2c_match_id(driver->id_table, client))

So in the worst case we can end up doing 3 .id_table lookups.

	-ss
