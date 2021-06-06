Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFEA39CDBB
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Jun 2021 08:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhFFGyV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Jun 2021 02:54:21 -0400
Received: from mail-pf1-f171.google.com ([209.85.210.171]:42773 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhFFGyU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Jun 2021 02:54:20 -0400
Received: by mail-pf1-f171.google.com with SMTP id s14so9818978pfd.9;
        Sat, 05 Jun 2021 23:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GSJgNOcL/Z+5ft4U7oxqLqn4lSGnAiuWQnkxsMTyq3Y=;
        b=KH/cH/QrIKfjMmlZXQM5lBBhOkfuZqBTCiMqS60oqkYGg8yV3BxbtR9+8yNMONe4UF
         aaTQHUMcgSobcV1Avvv3oV1ssixF6Fc4FmyILu48D/ViADGPVdyYic452w1FJjUcmII8
         VY2LvrUHZdsG0pwmtYXg7r427BPR9GY7qY9ScMPUgqhg7BMGkizqASlY59d7nDEvujLj
         RrUAEeXdHvc9mNdjk/Z7xDFZUfZYQiQywpNnL+VSezEnxsCwM4XPLyKbi6027JGLt4+j
         Ca/WRfXbeoAWhwuZORpV6zusC5sCjWZ939jkV19wMaXtc11ux+efnPdBjvGDG2ex6L5n
         7DHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GSJgNOcL/Z+5ft4U7oxqLqn4lSGnAiuWQnkxsMTyq3Y=;
        b=Tv00LtXujVHsLhBdZ6LLXtqkRtbseiaRTuGA9yvDbGzU9Bp8r9MGirfCmX4YjrajF0
         omUjXbszuHtyd0NbVFjnZbfM88cwE5EjU2ldXkvKNAwUDc8mxQWWQVpNlXxbzahrrXAA
         G8qzvgOENYRVXRNJ2Gk3ZiUsNrzDbhPT+8mxoCEGWFQyqWJu6Z/3XxxX+XK0gkyzyvpm
         SxZjtwgA3ucbLfP7L9BA9Q4P8JTcq3rSplkYARmhUrFBmEFfzBDyXk/HDzif9FNONXFe
         RO2fQ1XFD4LPiFYEkq7IhFJecATXcm9qOtJbsLS7CXgtEky3l9A3cNz9MqxE8RMiyPi+
         YV3A==
X-Gm-Message-State: AOAM531kkdmey9H9ZwbISmBZXyW7e4he+odB6ylAt9IulZK+q+3kVqKg
        OwmxVSJ2GyAAeDMDah/fHevc5NxGSVYrXPm0
X-Google-Smtp-Source: ABdhPJxef16XBir6T5Jyl/5LZnWZt3EJcUJP5zUhUp38ZYmYZtuJx6WmecvjlVLp1TKM/QmBJGu3Lg==
X-Received: by 2002:a63:e703:: with SMTP id b3mr12854701pgi.36.1622962291645;
        Sat, 05 Jun 2021 23:51:31 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id e188sm5114990pfe.23.2021.06.05.23.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 23:51:31 -0700 (PDT)
Date:   Sun, 6 Jun 2021 14:51:29 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>, corbet@lwn.net,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexander Gordeev <agordeev@redhat.com>,
        Jonathan Derrick <jonathan.derrick@intel.com>,
        Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
        Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v5 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <20210606064805.GA778208@nuc8i5>
References: <20210226155056.1068534-2-zhengdejin5@gmail.com>
 <20210323224710.GA610170@bjorn-Precision-5520>
 <20210505162716.GB1851@nuc8i5>
 <YLdGfmrk6+FbTbNN@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLdGfmrk6+FbTbNN@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 02, 2021 at 11:51:10AM +0300, Andy Shevchenko wrote:
> On Thu, May 06, 2021 at 12:27:16AM +0800, Dejin Zheng wrote:
> > On Tue, Mar 23, 2021 at 05:47:10PM -0500, Bjorn Helgaas wrote:
> > > [+cc Christoph, Thomas, Alexander, in case you're interested]
> > > [+cc Jonathan, Kurt, Logan: vmd.c and switchtec.c use managed resources
> > > and pci_alloc_irq_vectors()]
> 
> > > On Fri, Feb 26, 2021 at 11:50:53PM +0800, Dejin Zheng wrote:
> > > > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > > > pci_alloc_irq_vectors(). Introducing this function can simplify
> > > > the error handling path in many drivers.
> > > > 
> > > > And use pci_free_irq_vectors() to replace some code in pcim_release(),
> > > > they are equivalent, and no functional change. It is more explicit
> > > > that pcim_alloc_irq_vectors() is a device-managed function.
> > > > 
> > > > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > > 
> > > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > > 
> > > Let me know if you'd like me to take the series.
> > >
> > Hi Bjorn,
> > 
> > These patches are still invisible on the mainline, could you help me to
> > take it? Thanks very much!
> 
> I guess you have to rebase them on top of the latest rc (or PCI for-next) and
> send with a cover letter.
>
Andy, thanks for your reminder, I will do it.

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
