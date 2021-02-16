Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 402FD31CDB1
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 17:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhBPQMR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 11:12:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhBPQMN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 11:12:13 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3923CC06174A;
        Tue, 16 Feb 2021 08:11:33 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id b8so5718947plh.12;
        Tue, 16 Feb 2021 08:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O4BOSVZF//SD2MgB6FxC/ZePgnMl6scWXFEj2mjFbLc=;
        b=aDkMzIUgy1SLS9scUmC+Su6orAL1zTCD2Yw9xgN+b2/POclQFBzkkXvhroX6ET/lXZ
         9J4HMvdYYSs/WlS3qjSgBPG6+BCGMhdYnKz8B6HWPcfyhlXm9F9bP1o5D2vu0ZMTtVvf
         tb7BXQVdOkYGo/ncZ1F19VJhU3dpeFN9E7Zi/BYkL6ISG2IYlZTZ+AgxXZ0zYz51sKkx
         CIXKzl4CTYK/uQ26mKUjxnQrmW84tGSA0vApC3mm+M1WYpG/2xZQKnftm7IPOJkZtagS
         YC3U5oqIoksZ+X72FTwO17dcGLHbHtgxJiiLFmmYWk4+dhrwD/ciffEv81zQLEW0neKb
         k0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O4BOSVZF//SD2MgB6FxC/ZePgnMl6scWXFEj2mjFbLc=;
        b=QMvx8Dj7ypYMqZN6TRN9qrORWC2bZCrpgnFKeHtq+EPiTdixm5xqVxpiVW45RkZtOP
         +YOD63aY+F+9frs5cB6Pfmjjv0Vb6HrhxXn8IX/tny2UPYYqd1PVWzOldnaoH8XfRUEj
         d/JSwl4G1i45F2LcSC1J6hYEJ9yuHFOJ+Fu8hXeYgVjbPZ8LwVeMhn7PKk+x1bBLpGX2
         6iGYWl9QqVA2yUJfWYyT07M8db6Y4X9ilxZWxm88qsY/1BAvNZ11QZcReOyrXRNO5ZEZ
         S9rhkZ8DpeT1OXceZhzKBAB4bALMnfb1b2L46hIQ7cK9Jiub+Vh18wBPVFJl8UrlA6gK
         xlww==
X-Gm-Message-State: AOAM532O6pYKDvmTw64LM3wRvjwbNFkAwXxNPD5+bSMb4peDBFa06ruy
        wm2TD4T5d/EY5uI0bHGkEhQ=
X-Google-Smtp-Source: ABdhPJxP9MNZA1JtzW+Gu4yCVPqpOMZbT9L05YafA2kUgdGNkmtAltcNUj2Q6GTFOzCDw0WKhHv0MQ==
X-Received: by 2002:a17:90b:4acc:: with SMTP id mh12mr4951568pjb.10.1613491892710;
        Tue, 16 Feb 2021 08:11:32 -0800 (PST)
Received: from localhost (89.208.244.53.16clouds.com. [89.208.244.53])
        by smtp.gmail.com with ESMTPSA id ms24sm3228789pjb.18.2021.02.16.08.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 08:11:32 -0800 (PST)
Date:   Wed, 17 Feb 2021 00:11:29 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, kw@linux.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] i2c: designware: Use the correct name of
 device-managed function
Message-ID: <20210216161129.GA749996@nuc8i5>
References: <20210216141810.747678-1-zhengdejin5@gmail.com>
 <20210216141810.747678-4-zhengdejin5@gmail.com>
 <YCvZDTLYPOvg73lb@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCvZDTLYPOvg73lb@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 16, 2021 at 04:39:09PM +0200, Andy Shevchenko wrote:
> On Tue, Feb 16, 2021 at 10:18:09PM +0800, Dejin Zheng wrote:
> > Use the new function pcim_alloc_irq_vectors() to allocate IRQ vectors,
> > the pcim_alloc_irq_vectors() function, an explicit device-managed version
> > of pci_alloc_irq_vectors(). If pcim_enable_device() has been called
> > before, then pci_alloc_irq_vectors() is actually a device-managed
> > function. It is used here as a device-managed function, So replace it
> > with pcim_alloc_irq_vectors().
> 
> ...
> 
> > -	r = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
> > +	r = pcim_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
> >  	if (r < 0)
> >  		return r;
> 
> It's good, but now why do we have pci_free_irq_vectors() in the same file?
>
Done. and thank you for your careful inspection.


> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
