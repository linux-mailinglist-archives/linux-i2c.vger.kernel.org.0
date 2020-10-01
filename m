Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05E628071D
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Oct 2020 20:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730045AbgJASm2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Oct 2020 14:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729047AbgJASm2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Oct 2020 14:42:28 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC10C0613D0;
        Thu,  1 Oct 2020 11:42:28 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id g7so7928403iov.13;
        Thu, 01 Oct 2020 11:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JOQ6ZKgQ8ZCXCMKJDHTtraLaapopKYShD2phDj3Rteg=;
        b=oG0yYmS+e1T5uXRSj4TvUhNbpg2z17+BZYqeAXU1PFr0ezd/TLdNtVLR0gFCDEInD2
         kRykQ3f7aLVCcNU6G8qJB5gFVWWHBfXrTTaILxNuOzrcqIQClCj4VCveokS9QxtAw+5I
         J08dl4ZZploa2drM34LOYu6R/sxCMu21yauzWxl0pUiHFXeb5jqow9X5sOdJpk0bfWck
         s93RicVZwUPIh2q2029jiU3amvfxFsrtMgKUvAGlYNuGif/p9hFplh42EfeaaubsDrkk
         n/IBdGFtUDbJ5rqO61N/RvZEeBUILm70SKbHVXqMnxygzpA7zZPQjQh1xe6Wl4lMqhGl
         Dclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JOQ6ZKgQ8ZCXCMKJDHTtraLaapopKYShD2phDj3Rteg=;
        b=iyIU5KzTS16LrjxqHv2u0kqIn0vWwE04PgcNaqUEQRxTSK/gciKeBScqwl5HI0R6ex
         7ph6nw82ijT6O7k8gcfsqRIVekt25sv9KcEErQSRkpfFZMB78p5JzTxwdlloEY7nXWPQ
         EVo6Nphu9ZU+qSbr9/o6RSMp7h4JDwXD+9Ckv59PJI6ZkWH94Gf+TrpqEe/38HclP3/3
         n0DBK0TpIkrC+xD8Q7zAP/bM4fssbuwHtJM9kIHh6VtMzihqaZY/yVkMKvMWBW4lJdVu
         WQw9HHcbRytF3WcLopvouVhOo3/9wmH9GM4qbf6R7lkphj8AlBkqXepTzh+kHt1/rEuS
         i9cQ==
X-Gm-Message-State: AOAM530RswZwLLpZkwjbl7KImnX1bWXLZP++TsvDH/R8MjhLpI90JbLB
        qPcJkrLp9iEmHzNfftRmImPPzP311RWE1wsCQu8xzKH3+w==
X-Google-Smtp-Source: ABdhPJxwqAxk7naTnZQAbkGhosOtV695WO4v90thLhMqAJnm0go5ZPJjouBs3FLPJ/yIj6kYXag6KZe3fZRf/+L4nes=
X-Received: by 2002:a05:6638:1316:: with SMTP id r22mr7331645jad.129.1601577747632;
 Thu, 01 Oct 2020 11:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200930071342.98691-1-tali.perry1@gmail.com> <20200930093117.GY3956970@smile.fi.intel.com>
 <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com>
 <CAHp75Vc3Bw-dTpEmpeUpB4n5-8-xGPx+jm_HkB5Pj6Qr8U=CAw@mail.gmail.com>
 <CAKKbWA4gHobXFGi5CiPnawWoMOi0GFrCbzanuOFZ+Aky6=9Mpg@mail.gmail.com>
 <20201001174046.GK3956970@smile.fi.intel.com> <CAA_a9xL+qP3zOy=oKHjCuR+CvsXeoU5EX9WgEhUH0Fza2Vs5DA@mail.gmail.com>
In-Reply-To: <CAA_a9xL+qP3zOy=oKHjCuR+CvsXeoU5EX9WgEhUH0Fza2Vs5DA@mail.gmail.com>
From:   Avi Fishman <avifishman70@gmail.com>
Date:   Thu, 1 Oct 2020 21:41:16 +0300
Message-ID: <CAKKbWA62G+B7p-bc7TRoa22iJNGdTUaopQVj3S3_FHh43ntasA@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using debugfs.
To:     Alex Qiu <xqiu@google.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Kun Yi <kunyi@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tali indeed pointed our major customers (Alex represent one of them :)
that this feature must be handled carefully since it may break the
communication and they are aware of that. Nevertheless they still want
this feature, they already reviewed this and accepted it (in internal
mails)

So we will appreciate if this will be accepted.

On Thu, Oct 1, 2020 at 9:27 PM Alex Qiu <xqiu@google.com> wrote:
>
> On Thu, Oct 1, 2020 at 10:41 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Thu, Oct 01, 2020 at 08:13:49PM +0300, Avi Fishman wrote:
> > > Hi Andy,
> > >
> > > Customers using BMC with complex i2c topology asked us to support
> > > changing bus frequency at run time, for example same device will
> > > communicate with one slave at 100Kbp/s and another with 400kbp/s and
> > > maybe also with smae device at different speed (for example an i2c
> > > mux).
> > > This is not only for debug.
> >
> > The above design is fragile to start with. If you have connected peripheral
> > devices with different speed limitations and you try to access faster one the
> > slower ones may block and break the bus which will need recovery.
> >
>
> Hi Andy,
>
> To clarify, we are using a single read-only image to support multiple
> configurations, so the supported bus rate of the devices are not known
> at compile time, but at runtime. We start with 100 kHz, and go 400 kHz
> if applicable. FYI, we are using 5.1 kernel, however I don't know much
> about DT overlay.
>
> Thx.
>
> -Alex Qiu



-- 
Regards,
Avi
