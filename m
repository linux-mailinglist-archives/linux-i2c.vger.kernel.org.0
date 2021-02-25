Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A3E324D08
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Feb 2021 10:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236495AbhBYJhH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Feb 2021 04:37:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:49614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236530AbhBYJek (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Feb 2021 04:34:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E19164EC3;
        Thu, 25 Feb 2021 09:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614245639;
        bh=8Do2C4WBXZBF/0ynfKiFsieMc4j7Q7V/sblXKRyy2/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qFyrV+U7evW7a1f+VttInzAOAUpvh/39rN8QnzAN9k9HB7YfZPH4KOxvc6Letqy1g
         33r3K8mSdgZiaytCB4/wa6mJEMPpBOUuV4iTnapx4mDRCNrmgIwHoaCgO9aMojTJY4
         UioHSZV+6nfRm0PvDb0I/T2fOBrr33+5BeRqBU8vhOFLSY5qwkT/XKQN1vR5E6IFZl
         tePTPy2G7quKsSZMD5pk6y3yk8ob/oFVE+HtMGWki0EWP+6VaOCRX1JrI9IkrZXubZ
         u1P/oqS28P7nls4m0lyb+A64PXVmkWRMdGBRM2JMn9mJmMmOZ7gMJehS/zFOESgXV5
         9FhNszGN9MMcA==
Date:   Thu, 25 Feb 2021 10:33:53 +0100
From:   Robert Richter <rric@kernel.org>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YDdvAYLckBHi7qSe@rric.localdomain>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
 <20210218150458.798347-2-zhengdejin5@gmail.com>
 <YC/NxfsQn2RKkrp8@rric.localdomain>
 <20210219164649.GA814637@nuc8i5>
 <YDONyMSHO9FDeY69@rric.localdomain>
 <20210222151415.GA896979@nuc8i5>
 <YDS2rkJu7PTJJiZr@rric.localdomain>
 <20210223141435.GA912403@nuc8i5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210223141435.GA912403@nuc8i5>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23.02.21 22:14:35, Dejin Zheng wrote:
> On Tue, Feb 23, 2021 at 09:02:54AM +0100, Robert Richter wrote:
> > On 22.02.21 23:14:15, Dejin Zheng wrote:
> > > On Mon, Feb 22, 2021 at 11:56:08AM +0100, Robert Richter wrote:
> > > > On 20.02.21 00:46:49, Dejin Zheng wrote:
> > > > > > On 18.02.21 23:04:55, Dejin Zheng wrote:
> > > > 
> > > > > > > +	if (!dr || !dr->enabled)
> > > > > here checks whether the pci device is enabled.
> > > > 
> > > > What is the purpose of this? The device "is_managed" or not.
> > > >
> > > The device is managed or not by check whether "dr" is NULL. And
> > > check the "dr->enabled" is for the PCI device enable. I think it
> > > may not make sense to apply for irq vectors when PCI device is not
> > > enabled.
> > 
> > I don't see how a disabled device affects in any way the release of
> > the irq vectors during device removal. dr is always non-null in case
> > the device is managed, a check isn't needed for that.
> >
> Yes, the disabled device does not affect release irq vectors, But
> the disabled device affects apply for irq vectors, It is wrong to apply
> for the irq vectors when the device is not enabled.

What is the scenario you have in mind here? What does happen then?
The typical use case is to pcim_enable_device() it and then add the
irq vectors. It is always enabled then.

Even if the device could wrongly be disabled, it does not affect the
device's release.

Also, how is this related to pcim? There isn't a check in
pci_alloc_irq_vectors() either for that case. 

> Add this check can
> facilitate developers to find problems as soon as possible.

No, there are many ways to shoot yourself in the foot. We cannot add
checks here and there for this, esp. at runtime. If there is a valid
reason that the device must always be enabled and we cannot assume
this is the case, then we could add a WARN_ON(). But I doubt that.

-Robert
