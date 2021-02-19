Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567BB31F848
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Feb 2021 12:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhBSLV0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Feb 2021 06:21:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:34470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229804AbhBSLUH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Feb 2021 06:20:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CCB464E77;
        Fri, 19 Feb 2021 11:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613733566;
        bh=YFg4Atmp59pHQeT8wPbE/amvEYcgx1e0rb0E2V1wsVI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CPQwToA/EWAwk27hMnWle2hs4utfQvNVMPw1h0h7/qLa3RjmZqFsCUAdKuqBxjEjQ
         yTmpuyV5C1bZEZQHFpRr9SB0d0dXuaxrfTED3E+DWTQkP+ntQDhgehhhqn386QsGP2
         jvBtwfPVRF2KLV5Eb8ylf6V3hxPOgqwlaMGC0A4x3kIIYgf0W2/JwEu8rDFAxC4pkf
         /ZUAcJKvqdHgfoB+rrUqCCEgeHPPjZ3R3edCI71vugtkZCWJxwKPSEiw6or/YaBQ5v
         13BOdBO1SlfmZGzpTXR2pi72xB9WzPoMd1wYX4BrvU6mncI2DbMS8rkJPmgOB4qcKM
         JLBnXKeqdc3/w==
Date:   Fri, 19 Feb 2021 12:19:20 +0100
From:   Robert Richter <rric@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, corbet@lwn.net,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, kw@linux.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Introduce pcim_alloc_irq_vectors()
Message-ID: <YC+euDIrR5apkAqp@rric.localdomain>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
 <YC41HD422Mjh1IZK@rric.localdomain>
 <YC5zVHnRog3EX0rl@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YC5zVHnRog3EX0rl@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18.02.21 16:01:56, Andy Shevchenko wrote:
> The problem this series solves is an imbalanced API.

This (added) API is bloated and incomplete. It adds functions without
benefit, the only is to have a single pcim alloc function in addition
to the pairing of alloc/free functions. I agree, it is hard to detect
which parts are released if pcim_enable_device() is used.

Additional, you need to go through pcim_release() to add other
pcim_*() functions for everything else that is released there.
Otherwise that new API is still incomplete. But this adds another
bunch of useless functions.

> Christoph IIRC was clear that if we want to use PCI IRQ allocation API the
> caller must know what's going on. Hiding this behind the scenes is not good.
> And this series unhides that.

IMO, this is more a documentation issue. pcim_enable_device() must be
better documented and list all enable/alloc functions that are going
to be released out of the box later.

Even better, make sure everything is managed and thus all of a pci_dev
is released, no matter how it was setup (this could even already be
the case).

In addition you could implement a static code checker.

> Also, you may go and clean up all pci_free_irq_vectors() when
> pcim_enable_device() is called, but I guess you will get painful process and
> rejection in a pile of cases.

Why should something be rejected if it is not correctly freed?

Even if pci_free_irq_vectors() is called, pcim_release() will not
complain if it was already freed before. So using
pci_free_irq_vectors() is ok even in conjunction with
pcim_enable_device().

In the end, let's make sure everything is released in pci_dev if it is
managed and document this.

Thanks,

-Robert
