Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3C339F8FA
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 16:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbhFHO0g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 10:26:36 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:33340 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233220AbhFHO0f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 10:26:35 -0400
Received: by mail-pg1-f177.google.com with SMTP id e20so4691977pgg.0;
        Tue, 08 Jun 2021 07:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AY6lStx8IvJJTinWVzlaubjc28iru7pvjmXtwIOc384=;
        b=sWNsP8BIeVhMMdC/38iOhQQcoJRNKxXK+1Rqkq2Ykx7cijY3X/AxV5qNXsaaG5ZQIf
         1wUIUyFlWR2c5ziHCftKI2gD9D+135nI8xlM0UNwMcimAmrvxJbetNO8nop9WgPW2XkZ
         45caja5UTDAsV9LEg3KcmAVlQFXekm0CnhJ01k4SlQqWSwG0jNm9uMbeLXJoHwr8ULIB
         XNyOnNbPK/M82QKjQOcKMyJhM8EX+U/Mgw/FSU7DgfxMzQykW6Sa2I5iwoC/5fHldd/6
         3lQHWej1y2H4jBlr8Ri0/M8+FIeqkeB5jK2VCEu2yH/86b+1gKotPS2+Vf77D9CigjVO
         opsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AY6lStx8IvJJTinWVzlaubjc28iru7pvjmXtwIOc384=;
        b=DTS6AMM2f8cFVRlnYE9mr8/B6g8OyzGJAeEeSW9r9uGQZByHuY/H+OP9VsObFC1hH8
         ZQ6tVMaQhTjV+X1tKWcyX2uQRYFrs4DYNrWJnT4WF5vFRAgZnc6HaeS1tFGlJ0wxYq9K
         xYLkD50qZXWWRbjzeemgmmMlK5blb/q4PUznDKixCTVjwM6Y3DQtShIib13234O20qXH
         CUAn55L1hfAIu3Fx28JxJhdeQDAVe1c9U8SMMzDw/c5R+cQHw2GRqUpSmNVju34ciRC5
         T+KZvqgjMT7Bi4VwLjvUHDxrcO6Uaef6/UVPlA+bGrULx8x8RsQS9qgoM1Q8pHDV8t2I
         Xf8A==
X-Gm-Message-State: AOAM5310Jf4VY7ySqPdHU9NR/WOYjaDmx0SKLkPTMroAWv+h4b0hFHZ2
        sJJe181y1McPsxKtj9otbiQ=
X-Google-Smtp-Source: ABdhPJz8zUoQhEIBV01BhCslFdLJaI+QfNzP0GAPOgM41cSlY9OBAyMV3W1Sj3ig1Y2d+/dUtD2mxA==
X-Received: by 2002:a63:d347:: with SMTP id u7mr23205468pgi.434.1623162222347;
        Tue, 08 Jun 2021 07:23:42 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id s11sm2692034pjz.42.2021.06.08.07.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:23:42 -0700 (PDT)
Date:   Tue, 8 Jun 2021 22:23:38 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        bhelgaas@google.com, wsa@kernel.org, Sanket.Goswami@amd.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <20210608142338.GB1030842@nuc8i5>
References: <YL5FcivbsIBnVvo0@smile.fi.intel.com>
 <20210607171451.GA2507298@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607171451.GA2507298@bjorn-Precision-5520>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 07, 2021 at 12:14:51PM -0500, Bjorn Helgaas wrote:
> On Mon, Jun 07, 2021 at 07:12:34PM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 07, 2021 at 11:39:13PM +0800, Dejin Zheng wrote:
> > > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > > pci_alloc_irq_vectors(). Introducing this function can simplify
> > > the error handling path in many drivers.
> > > 
> > > And use pci_free_irq_vectors() to replace some code in pcim_release(),
> > > they are equivalent, and no functional change. It is more explicit
> > > that pcim_alloc_irq_vectors() is a device-managed function.
> > 
> > ...
> > 
> > > When CONFIG_PCI=n, there is no stub for pci_is_managed(), but
> > > pcim_alloc_irq_vectors() will use it, so add one like other similar stubs.
> > > Otherwise there can be build errors, as here by kernel test robot
> > > reported:
> > > include/linux/pci.h: In function 'pcim_alloc_irq_vectors':
> > > >> include/linux/pci.h:1847:7: error: implicit declaration of function 'pci_is_managed' [-Werror=implicit-function-declaration]
> > >     1847 |  if (!pci_is_managed(dev))
> > >          |       ^~~~~~~~~~~~~~
> > 
> > This is rather changelog related material. No need to pollute commit message
> > with this.
> > 
> > ...
> > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > It's new functionality. Why this tag is here?
> > Use comments (similar location than changelog) to give a credit if you wish.
> 
> Agreed, I'll tidy that up, so no need to repost for this.

Bjorn, Thank you very much, you are so nice!

BR,
Dejin
