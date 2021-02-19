Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA47C31FC5B
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Feb 2021 16:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhBSPqe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Feb 2021 10:46:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:45688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229959AbhBSPqZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Feb 2021 10:46:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE5AC64E46;
        Fri, 19 Feb 2021 15:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613749540;
        bh=N4kwTHQ5ETlfn2hxyzF8UDx5W5fNe+tnVx+GjwtOP6M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MRkk6KiJsmsavZwpVvzz5nsz978ZzU/lc46ua697r5zasUloRybA58p6EyFGfn0m4
         CXORUKsEAUI78yhAHFqAnGfxJJxiyFIcInbgm65vSPGN++wzMGBtC5lsBDPQA+kf1t
         Qrg7LsUBLeqJncsWAGdNS8e6opCGWIXCXvZMbqp3+MVz654HRnXFQJmVNyxT09c9Lr
         GVVBP/OnLr3Si+0nU3c7PNnArxfbAq5gkl8uxPjS74+BRjOD/iQxl3Okz3OR/vcicS
         r+9XadiE96b1pDeRG2c2+mXSUn8kQy94Ud3AotZBAqyBn+fRFu1slpTVSlKIv6fW4C
         eNdfnTOUVQwVQ==
Date:   Fri, 19 Feb 2021 16:45:34 +0100
From:   Robert Richter <rric@kernel.org>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] i2c: thunderx: Use the correct name of
 device-managed function
Message-ID: <YC/dHum90mM6aldt@rric.localdomain>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
 <20210218150458.798347-5-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210218150458.798347-5-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18.02.21 23:04:58, Dejin Zheng wrote:
> Use the new function pcim_alloc_irq_vectors() to allocate IRQ vectors,
> the pcim_alloc_irq_vectors() function, an explicit device-managed version
> of pci_alloc_irq_vectors(). If pcim_enable_device() has been called
> before, then pci_alloc_irq_vectors() is actually a device-managed
> function. It is used here as a device-managed function, So replace it
> with pcim_alloc_irq_vectors().
> 
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

The title of this patch suggests there was something incorrect before
and this is a fix, which it isn't. Please reword.

Thanks,

-Robert
