Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB85F32720E
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Feb 2021 12:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbhB1LSP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Feb 2021 06:18:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbhB1LSI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Feb 2021 06:18:08 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD77C061756;
        Sun, 28 Feb 2021 03:17:27 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id q20so9327246pfu.8;
        Sun, 28 Feb 2021 03:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JlynXNbY6xtNwpUIbNR5mK4XzxI5oyN+o8r6CEItL0c=;
        b=GUFXQsNYhpqWZ2IIRF5cXzpN106IU3qF+Aojjjy4fRssqCVRoW7I8C5Kdn86IFLZ/4
         rlOtCDbY04DIMUK7LBwjob6vvW1QW9gSM607xspkYYm7cin8cZ7SzJjorwSk+mG0iGWC
         gUOwI9RZOtGMsOTRyKuRP5p+FJLFOYet+7wcU3kH2ZDRtmV4az4EJzKmgAov4aHFBxac
         NKUl4H2M+GClMI51wL4wpcEOyY10GcQcjN3YJKNS3ELwnEKsrjKV8R1YejbfAk/C1odc
         ESOpwIzp+xGWhGlN0xQFfZhBFk3ccPXjBhwvlGOi2WY62mM+6LlUkMhl64lWbE9mEk9S
         j6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JlynXNbY6xtNwpUIbNR5mK4XzxI5oyN+o8r6CEItL0c=;
        b=BCHrqrUSF/tc79+nwWn6L1d3WWdHJmuj9AZ6eVt9kViUoDBzqrSytQ6jScuiowo1aS
         BCqaetbDM7amccpScwoTytNt538rxe1z5+tKxNFR1HDUAsayEJvVbRXA58tDBsVDyaC8
         V1AbYeLYqBVA+8onOwDgmXav0McenIisqUiykUdIt1hDOnK6pUCFo45+KIIfbuMH5EXB
         iAWpOiWdmDqU9ZuEeBYY+qkyrmzXtnlJcO0orV931waIlukW5euiiKd0af/xWwN+QSjI
         3OIr5ZrRTebc2H2QZ5n40fz1K0LlnQFsDi/KnySF+3a0ZkgBHluILNtYWDtcquwyDJzb
         9xHQ==
X-Gm-Message-State: AOAM5326f476gDj9nG1KvdX4c4oSce/kZp6ncv68vKGYE+vbmxOfbgAk
        gZB1U0hiRmGleQr7HjJns48=
X-Google-Smtp-Source: ABdhPJx/ocMnKxd7MNvQvR5coaflictNpLOW9H8+pA8BOG4h2eqUPKSEm5Nf2JZZz5wUHfpSshllyQ==
X-Received: by 2002:aa7:9ecf:0:b029:1ee:93a1:6e2d with SMTP id r15-20020aa79ecf0000b02901ee93a16e2dmr1298380pfq.27.1614511047400;
        Sun, 28 Feb 2021 03:17:27 -0800 (PST)
Received: from localhost (89.208.244.53.16clouds.com. [89.208.244.53])
        by smtp.gmail.com with ESMTPSA id r186sm9911593pfr.124.2021.02.28.03.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 03:17:26 -0800 (PST)
Date:   Sun, 28 Feb 2021 19:17:25 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Robert Richter <rric@kernel.org>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] Introduce pcim_alloc_irq_vectors()
Message-ID: <20210228111725.GB1091046@nuc8i5>
References: <20210226155056.1068534-1-zhengdejin5@gmail.com>
 <YDlKF1MP0p7l8vxb@rric.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YDlKF1MP0p7l8vxb@rric.localdomain>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 26, 2021 at 08:20:55PM +0100, Robert Richter wrote:
> On 26.02.21 23:50:52, Dejin Zheng wrote:
> > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > pci_alloc_irq_vectors(), In some i2c drivers, If pcim_enable_device()
> > has been called before, then pci_alloc_irq_vectors() is actually a
> > device-managed function. It is used as a device-managed function, So
> > replace it with pcim_alloc_irq_vectors().
> 
> For the whole series:
> 
> Reviewed-by: Robert Richter <rric@kernel.org>
>
Robert, Thanks very much for your help!

> Thanks.
