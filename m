Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53983214A9
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 12:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhBVLAq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 06:00:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:34444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230211AbhBVLAj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Feb 2021 06:00:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9226C64E3F;
        Mon, 22 Feb 2021 10:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613991599;
        bh=DS6RXMGaxoqu6/MMmgkarIZRU3g0QdBsNAYVTDAcCJE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NytykporKIyVErVx1qYP8i/9pmmjPsp+vznWXECMJ7UP4MbQeRpJSNw59kGFaXyMk
         i9qefnYaxGZTF0NAWSfL2wc3UtuIf6W2cd/hHg0GRTVS3CAVz6YR64wNcwGnVPOaFy
         P3059WYIkN1UOCHBSe3TkknPIeonZ81opm4Z1UtKguPEm58ljIzlp58YgRJ7i5yNlG
         lTUdP6TY10liaAGPDDudHeBFV4RiVkAG8RVzZNpkkQoi5QTyTNOwIO8t6rqnpxrdwx
         9Xp5sCFBhcSWyrvHHRkib9OhUaT4/7yd4O6UvMPhPGXYjX9tgKqWGMHK4XXDmxSAmK
         aQQehILAHbOmQ==
Date:   Mon, 22 Feb 2021 11:59:53 +0100
From:   Robert Richter <rric@kernel.org>
To:     Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, corbet@lwn.net,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, helgaas@kernel.org,
        wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YDOOqX1zS1SzEhWR@rric.localdomain>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
 <20210218150458.798347-2-zhengdejin5@gmail.com>
 <YC/NxfsQn2RKkrp8@rric.localdomain>
 <YC/PoOOgRVHa1HIH@rric.localdomain>
 <YC/kNnkusVHg8S0H@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YC/kNnkusVHg8S0H@rocinante>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19.02.21 17:15:50, Krzysztof Wilczyński wrote:
> Hi Robert,
> 
> [...]
> > Obiously this is meant here:
> > 
> > 	if (!pci_is_managed(dev))
> [...]
> 
> A question to improve my understanding for future reference.  Was the
> previous approach of checking for "enabled" flag from struct pci_devres
> was not a good choice here?

Initially this was meant to just show the idea.

After careful review I don't see this additional check is required as
once the pci dev is managed, it will be always released with
pcim_release().

-Robert
