Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04A934344B7
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Oct 2021 07:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhJTFil (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Oct 2021 01:38:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:56606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229920AbhJTFik (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Oct 2021 01:38:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF9B2610F8;
        Wed, 20 Oct 2021 05:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634708187;
        bh=6fVHD7xrVJvgYXLp6J/4BH55nxeDujiQGTN1Ry4XUDE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ePzr6Al1vjz8thy9piKGPcI0KFuG/z8LdqYEC0ObXBBzvm9aenbRTkV+RYzrN9WSA
         Nt5PsSeC9vcKCXMqKiJXgNgoIL6YusGRjaQSf4gwkKOrNsbcvBl+T8/HWRwV5qv4Nj
         d5X0GUHgdSRnz6cqz5AVXRLS2IVWMPXToqonmR9I=
Date:   Wed, 20 Oct 2021 07:36:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <YW+q1yQ8MuhHINAs@kroah.com>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7>
 <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
 <YW6pHkXOPvtidtwS@kroah.com>
 <20211019143748.wrpqopj2hmpvblh4@vireshk-i7>
 <YW8LFTcBuN1bB3PD@ninjato>
 <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 20, 2021 at 12:20:13PM +0800, Jie Deng wrote:
> 
> On 2021/10/20 2:14, Wolfram Sang wrote:
> > > I think it is set to HZ currently, though I haven't tried big
> > > transfers but I still get into some issues with Qemu based stuff.
> > > Maybe we can bump it up to few seconds :)
> > If you use adapter->timeout, this can even be set at runtime using a
> > ioctl. So, it can adapt to use cases. Of course, the driver should
> > initialize it to a sane default if the automatic default (HZ) is not
> > suitable.
> 
> 
> I think a big value may solve most cases. but the driver never know how big
> is enough by static configuration.
> 
> Can we make this value to be configurable, just let the other side provide
> this value ?

If an ioctl can change it, that would mean it is configurable, right?
