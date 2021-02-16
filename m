Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 811F231CC48
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 15:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhBPOmt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 09:42:49 -0500
Received: from mail-wr1-f45.google.com ([209.85.221.45]:44587 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbhBPOmj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 09:42:39 -0500
Received: by mail-wr1-f45.google.com with SMTP id g6so13313391wrs.11;
        Tue, 16 Feb 2021 06:42:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T+R53kBfiM2Dunbsl9GF1repMwEJ2p019P6fQ6CT85k=;
        b=C9qXGH9c95lXGlx9+hTfZY92Iod0oGM9D39C6164mEPzdgS+0HUfAEXcwqZE6tamew
         wSeKJZRWJghmutDMSIt7We5qTv/rTwOz9TSrt2H76iR76iktBmBocetQ2qqa3CZFXTbf
         hpJHac+u/5dCtG0Mugngqt32UuprZDxEap9WvkhyQA/y23ekDXMnmOudYwx7qt4bpca0
         1nJlgWD6LfY2IGXNZie145oRVLdOhSU+uIRpDzpNntHyINLHRnidahileN9vuIshdd4U
         Wp1HHRk+vX0sElJ2SWLVRGAUXDvEltVBt/HhoYIDxd6J80m2Q3lsrAgrGUrWmqeceh2O
         N6mw==
X-Gm-Message-State: AOAM533Ts2LCmBBjQdCDMXdlNMocpHGNlgdpi3FInj/wu7H19Zayc2DW
        +kXqKbmX0plqNgTRuFD0hUM=
X-Google-Smtp-Source: ABdhPJx51sGzI9LMQWwz+JsiwqDvw64MwFP12NZApeTl/Z4weApGjxHX4ZEzXp0753Qa12IDxBkz0A==
X-Received: by 2002:adf:fad2:: with SMTP id a18mr2980550wrs.147.1613486517355;
        Tue, 16 Feb 2021 06:41:57 -0800 (PST)
Received: from rocinante ([95.155.85.46])
        by smtp.gmail.com with ESMTPSA id j17sm3674336wmc.28.2021.02.16.06.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 06:41:56 -0800 (PST)
Date:   Tue, 16 Feb 2021 15:41:55 +0100
From:   Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        helgaas@kernel.org, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YCvZsy+TXXz6m4iM@rocinante>
References: <20210215181550.714101-1-zhengdejin5@gmail.com>
 <20210215181550.714101-2-zhengdejin5@gmail.com>
 <YCrfqungNSSxe5lK@rocinante>
 <YCual+Fq9mcnxbM4@smile.fi.intel.com>
 <20210216142626.GA747814@nuc8i5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210216142626.GA747814@nuc8i5>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dejin and Andy,

[...]
> > > Question: wouldn't you need to call pci_free_irq_vectors() somewhere,
> > > possibly to pcim_release() callback?  Although, I am not sure where the
> > > right place would be.
> > > 
> > > I am asking, as the documentation (see [4]) suggests that one would have
> > > to release allocated IRQ vectors (relevant exceprt):
> > 
> > It's done in pcim_release() but not explicitly.
> > 
> >         if (dev->msi_enabled)
> >                 pci_disable_msi(dev);
> >         if (dev->msix_enabled)
> >                 pci_disable_msix(dev);
> > 
> > Maybe above can be replaced by pci_free_irq_vectors() to be sure that any
> > future change to PCI IRQ allocation APIs.
> > 
> > Yes, I have checked and currently the above code is equivalent to
> > pci_free_irq_vectors().
> > 
> > Dejin, please update your patch accordingly.
> >
> Hi Andy and Krzysztof,
> 
> I have modified it and sent patch v2. thank you very much!

Thank you Andy for double-checking!  Much appreciated.

Moving to pci_free_irq_vectors() directly looks great as we are also
removing the surplus checks that pcim_release() is doing - since both
the pci_disable_msi() and the pci_disable_msix() are doing internal
validation to see whether MSI/MSI-X is currently enabled.

Thank you again, Dejin and Andy. :)

Krzysztof
