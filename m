Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99253434974
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Oct 2021 12:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhJTK6K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Oct 2021 06:58:10 -0400
Received: from smtp2.axis.com ([195.60.68.18]:12944 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229864AbhJTK6K (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Oct 2021 06:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1634727356;
  x=1666263356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nHNmZOTmEfWp7T9719d3q3afCE/4ZU54ct9XTonwH8g=;
  b=Heqs72ulCUIHW8hM0VIW9sP5IXk88P7DSnKcWljdY99Ac9B268N/kpdy
   kAVerwsh3VdnOLxohzpLZanZ1eSqdT6YiKDt65TZtnI42CKtuuIh3CwTv
   fDTHbq2BpYAFFm+f3EJDdcYr9BNwSpf74yWRmLvcdG7gMkA5HKJLkNNsi
   vB3So+yGq2qmCPBvdkD0n32D6bw9ZiUjKnLVPErx48RJ00ED07B3K9N1i
   7lL7Jo2lVDfxM3z0SygfYrfhcrN028nLjjJRLAdMQha2VKOVpjt+3QTtQ
   LQ1cFUwwsLKaVx/QYmDGIUThehudlpRf2UuY/to91t8t5O4mT1y4ciNvp
   A==;
Date:   Wed, 20 Oct 2021 12:55:54 +0200
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Jie Deng <jie.deng@intel.com>
CC:     Viresh Kumar <viresh.kumar@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <20211020105554.GB9985@axis.com>
References: <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
 <YW6pHkXOPvtidtwS@kroah.com>
 <20211019143748.wrpqopj2hmpvblh4@vireshk-i7>
 <YW8LFTcBuN1bB3PD@ninjato>
 <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com>
 <YW+q1yQ8MuhHINAs@kroah.com>
 <8e182ea8-5016-fa78-3d77-eefba7d58612@intel.com>
 <20211020064128.y2bjsbdmpojn7pjo@vireshk-i7>
 <01d9c992-28cc-6644-1e82-929fc46f91b4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <01d9c992-28cc-6644-1e82-929fc46f91b4@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 20, 2021 at 09:04:45AM +0200, Jie Deng wrote:
> On 2021/10/20 14:41, Viresh Kumar wrote:
> > On 20-10-21, 14:35, Jie Deng wrote:
> >> Yes, but we need to know what's the best value to be configured for a
> >> specific "other side".
> >>
> >> I think the "other side" should be more aware of what value is reasonable to
> >> be used.
> > If we _really_ need that, then it would require an update to the
> > specification first.
> >
> > I am not sure if the other side is the only party in play here. It
> > depends on the entire setup and not just the hardware device.
> > Specially with virtualisation things become really slow because of
> > context switches, etc. It may be better for the guest userspace to
> > decide on the value.
> >
> > Since this is specially for virtualisation, the kernel may set the
> > value to few HZ by default, lets say 10 (Yeah its really high) :).
> 
> I'm OK with this way for the simplicity.

That would not be safe.  Userspace can change this timeout and the end
result with the current implementation of the driver is potentially
kernel memory corruption, which is something userspace of course never
should be able to trigger.

Even if the timeout were hardcoded in the driver and the driver made to
ignore what userspace requests, it would need to be set to a
ridiculously high value so that we can guarantee that the timeout never
ever occurs (since the result is potentially random kernel memory
corruption).  Which is basically equivalent to disabling the timeout
entirely as my patch does.

If the timeout cannot be disabled, then the driver should be fixed to
always copy buffers and hold on to them to avoid memory corruption in
the case of timeout, as I mentioned in my commit message.  That would be
quite a substantial change to the driver so it's not something I'm
personally comfortable with doing, especially not this late in the -rc
cycle, so I'd leave that to others.
