Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5AD31FB95
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Feb 2021 16:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbhBSPC3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Feb 2021 10:02:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:37972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229932AbhBSPCY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Feb 2021 10:02:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FE9E64EC7;
        Fri, 19 Feb 2021 15:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613746901;
        bh=2dvd+U3L8fNFlkHRFUOynnP8Ro2etvNKVTOpnZNGerQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g/gVip9/5HTsH6FBcHyt3lUBDaL6oQTVI0vNs+wdT7iUbqS3M2PUJWlKpmdcrZA+e
         NRKr2+6N/X/+ty8ki0AGPwKyo0VECTibT0+PgKptGjwzB8tl6QuEZXUo1EHIp5jzun
         z14cW8rsBbNtOexXUV8B+jdC5BM1S4m2fz/LfFDbUgvZCEBi2J+A5uy3JgwZrnUdfa
         5vjDabcZ65J0UWCh1udNMPJxUUvGG0Er1W1pKRtbUHSKkyEa7E1hop0OfAgrpeKoaF
         PINe++5UaPU9PSdws8j4rCTq2v5xf4K/HtpvjsD2KLPtZrwAu6m9oBWxBlAWvZMmQz
         0rpPHbpbAWq3A==
Date:   Fri, 19 Feb 2021 16:01:35 +0100
From:   Robert Richter <rric@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, corbet@lwn.net,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YC/Sz/S1SXgsptq4@rric.localdomain>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
 <20210218150458.798347-2-zhengdejin5@gmail.com>
 <YC/NxfsQn2RKkrp8@rric.localdomain>
 <YC/P2VF8ki28Hqnp@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YC/P2VF8ki28Hqnp@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19.02.21 16:48:57, Andy Shevchenko wrote:
> On Fri, Feb 19, 2021 at 03:40:05PM +0100, Robert Richter wrote:
> > On 18.02.21 23:04:55, Dejin Zheng wrote:
> > > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > > pci_alloc_irq_vectors(). Introducing this function can simplify
> > > the error handling path in many drivers.
> > > 
> > > And use pci_free_irq_vectors() to replace some code in pcim_release(),
> > > they are equivalent, and no functional change. It is more explicit
> > > that pcim_alloc_irq_vectors() is a device-managed function.
> 
> ...
> 
> > If it is just about having a pcim-* counterpart why not just an inline
> > function like the one below.
> 
> It's a good suggestion, thanks!
> 
> Still we need to amend pcim_release() to explicitly show that we call
> pci_free_irq_vectors().

Fair enough. Thanks,

-Robert
