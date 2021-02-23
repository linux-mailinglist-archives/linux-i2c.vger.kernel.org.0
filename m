Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5312322C04
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Feb 2021 15:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhBWOPT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Feb 2021 09:15:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbhBWOPT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Feb 2021 09:15:19 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFAA2C06174A;
        Tue, 23 Feb 2021 06:14:38 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id g20so9914076plo.2;
        Tue, 23 Feb 2021 06:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NAz5oGVYcUWKWj7ilIWYVUpvhPjHG2laaguLjZqRP8o=;
        b=cW/jOvMCKFQNYCq1j9v30T1KmflQyKkOVNBaIhjMLQ2FuLE5mIOvfEzb9iWvhabInL
         uVCstuo4vjdgCZbn2RuSdKKmpzbJb68U9o6gIPYVABWjOJcG/ckPXO0Ej5i1K1z6zpBR
         SVasaDOe32gqzWtJexnI3+P5/sjuIZNakjayOJ94n9zTljy353qMcXZCLV0RC4YhERds
         LXebOSOeG26/0WO07oVoj94zAUI7FrtbXFriIulENxwG+YjKcedMaV+t6Pzi0/ja6Aw/
         VgCS0PFg8o/IXlT/xe0aAa5cpHBTThF8N+tlbaaXOZM6KKSMKhMjZLjel/xHHtu8onpO
         KC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NAz5oGVYcUWKWj7ilIWYVUpvhPjHG2laaguLjZqRP8o=;
        b=bB2BKG6CFT+AD4kG0NDQQr3W8M9kEg9E/ZCxEmjyUajvg/Eyc7zDwAdWA2Jo+ozCPG
         pdAbd4ypBfGSbPOJsDO8Kt3Ojt7Rkda0AIyAHq/N5X1iyWCg7EZxJLUXsNusb5n8EII8
         eTBF66iVbidRdSHjDHZQecDLgI34tk92u6GPy4OEOa3HOMax8sB2akqOBawwDDE98IkK
         B5W6JtB2xNOXoWziMxM/FosG7FSddzD1AJJpNKhTSaw8cbqxTutREgSTGwlCi4JvT8z4
         EeORZqmNAiviOlZHYWd/CA6xe7kp1fDHLy7KgwkJuNqmGsDVGBK9f3IoVFxTZSDI9C52
         iBzA==
X-Gm-Message-State: AOAM5306fyvoQAkDKzxWPt0LcDkx2pmdeo0XllJIaglEHWereFtagcZM
        mAUjD1/VZwf2KTMUg2WJlPI=
X-Google-Smtp-Source: ABdhPJwpDlSLX1F3x2EWuFTajfJwbY6ANFjv4aE/YYdaLn/W+WR+mid7xsWJE8V0pQOt9GEUQodqLg==
X-Received: by 2002:a17:90b:1494:: with SMTP id js20mr11740149pjb.224.1614089678426;
        Tue, 23 Feb 2021 06:14:38 -0800 (PST)
Received: from localhost (89.208.244.53.16clouds.com. [89.208.244.53])
        by smtp.gmail.com with ESMTPSA id 187sm15015544pfd.6.2021.02.23.06.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 06:14:37 -0800 (PST)
Date:   Tue, 23 Feb 2021 22:14:35 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Robert Richter <rric@kernel.org>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <20210223141435.GA912403@nuc8i5>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
 <20210218150458.798347-2-zhengdejin5@gmail.com>
 <YC/NxfsQn2RKkrp8@rric.localdomain>
 <20210219164649.GA814637@nuc8i5>
 <YDONyMSHO9FDeY69@rric.localdomain>
 <20210222151415.GA896979@nuc8i5>
 <YDS2rkJu7PTJJiZr@rric.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YDS2rkJu7PTJJiZr@rric.localdomain>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 23, 2021 at 09:02:54AM +0100, Robert Richter wrote:
> On 22.02.21 23:14:15, Dejin Zheng wrote:
> > On Mon, Feb 22, 2021 at 11:56:08AM +0100, Robert Richter wrote:
> > > On 20.02.21 00:46:49, Dejin Zheng wrote:
> > > > > On 18.02.21 23:04:55, Dejin Zheng wrote:
> > > 
> > > > > > +	if (!dr || !dr->enabled)
> > > > here checks whether the pci device is enabled.
> > > 
> > > What is the purpose of this? The device "is_managed" or not.
> > >
> > The device is managed or not by check whether "dr" is NULL. And
> > check the "dr->enabled" is for the PCI device enable. I think it
> > may not make sense to apply for irq vectors when PCI device is not
> > enabled.
> 
> I don't see how a disabled device affects in any way the release of
> the irq vectors during device removal. dr is always non-null in case
> the device is managed, a check isn't needed for that.
>
Yes, the disabled device does not affect release irq vectors, But
the disabled device affects apply for irq vectors, It is wrong to apply
for the irq vectors when the device is not enabled. Add this check can
facilitate developers to find problems as soon as possible.

> -Robert
