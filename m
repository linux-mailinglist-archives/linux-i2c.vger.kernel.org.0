Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3693264A2
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 16:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhBZPXG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 10:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhBZPXE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Feb 2021 10:23:04 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB6BC061574;
        Fri, 26 Feb 2021 07:22:23 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id f8so5467137plg.5;
        Fri, 26 Feb 2021 07:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N+8bSP4jmKRK45sk0elNZOZAzDCg0/KrbuIhk6AYYpI=;
        b=of6GrdclCGu6wWKR3lfeZTkk193cw4Pc/er951ZhLuVJbFJ+Q4X8ib+ietQkvWsuEg
         V7Mn/cpu1wKOZpPuAIlLcXKCu142LRz0FezFPS+CZkcmjOYofO1MpCdPmS+3hqb1k0pE
         Tq3VHW7wcuTh4y1GeinZeoFlSRqFhwbrvxoFNdcHE8/6AhjOss2yS+ltfOxQ8for4sr1
         xfqqFbK4IUnq2ZiKZNXlNY1VjmWsKbmHrXk84zvGxhgqw7P2janJ4zGkhN4bXXNjo5II
         TrXvgZW0/JxUebyaCNZKD0YM/N3mnvxTYMZQKN29/MVecbOnHIF9SX1SUQqHEFO9hn9z
         sB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N+8bSP4jmKRK45sk0elNZOZAzDCg0/KrbuIhk6AYYpI=;
        b=JLTasXmVvehLKnj49qjNbFZYDzxfoF4MVQnCaHmIvJ6beYlb8+6C9RxklQyGGVFop/
         CDvt623ZP7F0cgpLikfZjkUCxPaFBVOhmFAzIaYo3ATot8P+Fp5rcPYMfu3U6JZsk0q/
         SiaPz7zkUfQMWdy6q6zEKWPPgTgP+dbaHIAIFJJ8g0N7MCETwBTR5fhkVMRBmQEYu/Fw
         ZphGeCe3ePFMNeWeRZ56eIiYg8CcvJoBcHkaiit/NZ/lIJuzzWY6aZfcHw+6xohsWEWe
         NmX1aeHuJc/v08355F2ZyYXKKngJdEcw0+9nIN4vnydYuOLgn2xm03b3+oiVPSigWaiC
         gsVQ==
X-Gm-Message-State: AOAM532JUqVXP9lV0w3o4PCPQUdnZ8cAQZ7FtMtslJgEtPQ32Fyi7NSx
        SQJy3pRYLGJdhcJQsXzscKh1NrZ1pOGh4g==
X-Google-Smtp-Source: ABdhPJxhJNQFy77Bza8Jh3C1dv53eJTpmV0dwial77CDPlDY1jQvGL2YNRo4nRBr0bPrIAP1L7+nbw==
X-Received: by 2002:a17:90a:13c1:: with SMTP id s1mr3878764pjf.60.1614352942649;
        Fri, 26 Feb 2021 07:22:22 -0800 (PST)
Received: from localhost (89.208.244.53.16clouds.com. [89.208.244.53])
        by smtp.gmail.com with ESMTPSA id gm13sm9401596pjb.47.2021.02.26.07.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 07:22:22 -0800 (PST)
Date:   Fri, 26 Feb 2021 23:22:20 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Robert Richter <rric@kernel.org>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <20210226152220.GA1053401@nuc8i5>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
 <20210218150458.798347-2-zhengdejin5@gmail.com>
 <YC/NxfsQn2RKkrp8@rric.localdomain>
 <20210219164649.GA814637@nuc8i5>
 <YDONyMSHO9FDeY69@rric.localdomain>
 <20210222151415.GA896979@nuc8i5>
 <YDS2rkJu7PTJJiZr@rric.localdomain>
 <20210223141435.GA912403@nuc8i5>
 <YDdvAYLckBHi7qSe@rric.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YDdvAYLckBHi7qSe@rric.localdomain>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 25, 2021 at 10:33:53AM +0100, Robert Richter wrote:
> On 23.02.21 22:14:35, Dejin Zheng wrote:
> > On Tue, Feb 23, 2021 at 09:02:54AM +0100, Robert Richter wrote:
> > > On 22.02.21 23:14:15, Dejin Zheng wrote:
> > > > On Mon, Feb 22, 2021 at 11:56:08AM +0100, Robert Richter wrote:
> > > > > On 20.02.21 00:46:49, Dejin Zheng wrote:
> > > > > > > On 18.02.21 23:04:55, Dejin Zheng wrote:
> > > > > 
> > > > > > > > +	if (!dr || !dr->enabled)
> > > > > > here checks whether the pci device is enabled.
> > > > > 
> > > > > What is the purpose of this? The device "is_managed" or not.
> > > > >
> > > > The device is managed or not by check whether "dr" is NULL. And
> > > > check the "dr->enabled" is for the PCI device enable. I think it
> > > > may not make sense to apply for irq vectors when PCI device is not
> > > > enabled.
> > > 
> > > I don't see how a disabled device affects in any way the release of
> > > the irq vectors during device removal. dr is always non-null in case
> > > the device is managed, a check isn't needed for that.
> > >
> > Yes, the disabled device does not affect release irq vectors, But
> > the disabled device affects apply for irq vectors, It is wrong to apply
> > for the irq vectors when the device is not enabled.
> 
> What is the scenario you have in mind here? What does happen then?
> The typical use case is to pcim_enable_device() it and then add the
> irq vectors. It is always enabled then.
> 
> Even if the device could wrongly be disabled, it does not affect the
> device's release.
> 
> Also, how is this related to pcim? There isn't a check in
> pci_alloc_irq_vectors() either for that case. 
> 
> > Add this check can
> > facilitate developers to find problems as soon as possible.
> 
> No, there are many ways to shoot yourself in the foot. We cannot add
> checks here and there for this, esp. at runtime. If there is a valid
> reason that the device must always be enabled and we cannot assume
> this is the case, then we could add a WARN_ON(). But I doubt that.
>
Robert, You are right, I will remove the enable check. Thanks!

BR,
Dejin
> -Robert
