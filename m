Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFB63AE2C1
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jun 2021 07:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhFUF2h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Jun 2021 01:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhFUF2h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Jun 2021 01:28:37 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63776C061574;
        Sun, 20 Jun 2021 22:26:23 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id c7-20020a17090ad907b029016faeeab0ccso965292pjv.4;
        Sun, 20 Jun 2021 22:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U/MHR9YQ2Ua8msJh3uQYWhxg2F3CX/5avj9hpJqmUuI=;
        b=kPepjuHRyKGF1csJZqMnCdsllAVUrpMaotDpdWrHJONmwtFupcYDDbVl+cN1oVlFIu
         pNB54Y6KuIZhcBLxMoiIykrjovHO3lGe566SlR8decSJR9D0X9jwZPp3iPx0QRJZezRR
         lZC0Lf5IzsscifnVT5s9FTZUFcrNHeiH7jeytpe6D7SYMNNcVYBoKX1s5HQxWiTKXfdb
         NLckMyJg4UiiMmmuw48jim3vNAaspVjKUBnIeUrLxgSdXsLqVeFQx1kRkoissePntHpP
         QVQulsDIsJLEgQsOYVWZfL43PhwBZTI6KRsw2DFM5V9az7rOVyxAAr/oQbhBtM2wCahP
         UT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U/MHR9YQ2Ua8msJh3uQYWhxg2F3CX/5avj9hpJqmUuI=;
        b=QHGhGX3wI0s+SJExvRHKbtJmdAAdwI7K0bLgmJH6CLVzwhSZu+MUblZ8+ihT+psgxd
         TjN86IWJN/q4x7DFTg1Yi3kyven0ohrPrQiCb7rJbby0eIanTpwLdBnMAZCX9NLKLagr
         che4aQhLn+d0aZUXrKEUMceoVK1OX5R8mK9YWuGVat7drOA0tOtJX0e8GW34Ux6Y+eDX
         9Pt8qVBWS2LV3QxtrtmNNB7Ze7HN8py3wanojuzaxzIjZOkKudwsomtcCeAFJ1fMFfLJ
         rFa6CZnfpqAJYxarBhAHWAP7hNn40MSgZsTexlcC4btayHFWiZRHpMwXOzcFZrIhKztj
         HZmQ==
X-Gm-Message-State: AOAM5335j8pohb3AihQihkRi5nETV4+fadNDgMcq6kpRMOcPiUPQFU6y
        A1EKF6MUXtvkHAO7qeShwi0=
X-Google-Smtp-Source: ABdhPJzfdE3KCuEjVA1qRn/qPCk/koiZcWwZYT7Bl+rfeX748SxkFbZl01BxOO5mV3MuM+2A2EkJSg==
X-Received: by 2002:a17:90b:4b49:: with SMTP id mi9mr35300122pjb.219.1624253182897;
        Sun, 20 Jun 2021 22:26:22 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:df5a:b40e:40c9:a3e7])
        by smtp.gmail.com with ESMTPSA id c5sm2155806pfv.47.2021.06.20.22.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 22:26:22 -0700 (PDT)
Date:   Sun, 20 Jun 2021 22:26:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] i2c: core: Disable client irq on reboot/shutdown
Message-ID: <YNAi++CNZbZLuJRO@google.com>
References: <20210604232744.1259150-1-swboyd@chromium.org>
 <YM+tV9zH9SC+TQcW@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YM+tV9zH9SC+TQcW@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jun 20, 2021 at 11:04:23PM +0200, Wolfram Sang wrote:
> On Fri, Jun 04, 2021 at 04:27:44PM -0700, Stephen Boyd wrote:
> > From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > If an i2c client receives an interrupt during reboot or shutdown it may
> > be too late to service it by making an i2c transaction on the bus
> > because the i2c controller has already been shutdown. This can lead to
> > system hangs if the i2c controller tries to make a transfer that is
> > doomed to fail because the access to the i2c pins is already shut down,
> > or an iommu translation has been torn down so i2c controller register
> > access doesn't work.
> > 
> > Let's simply disable the irq if there isn't a shutdown callback for an
> > i2c client when there is an irq associated with the device. This will
> > make sure that irqs don't come in later than the time that we can handle
> > it. We don't do this if the i2c client device already has a shutdown
> > callback because presumably they're doing the right thing and quieting
> > the device so irqs don't come in after the shutdown callback returns.
> > 
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > [swboyd@chromium.org: Dropped newline, added commit text, added
> > interrupt.h for robot build error]
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> I think this is for-current material because it fixes hangs. Or better
> for-next to check for side-effects?
> 

We lived with this issue for many years, so letting it cook in next will
not hurt us IMO.

Thanks.

-- 
Dmitry
