Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B97C43FC48
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Oct 2021 14:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbhJ2M1V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Oct 2021 08:27:21 -0400
Received: from smtp2.axis.com ([195.60.68.18]:7911 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230134AbhJ2M1U (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Oct 2021 08:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635510292;
  x=1667046292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RZHGWtu1aosFk7Zxe6m47+9uQq7KcFZHkqCC1tNlnns=;
  b=mFTXIs3hJ0T6oQjGsXPMALj9y2bS+D3a0wdMNVvdLdJiYjZXKRYBRkno
   X8fJAgyBDXVI3K4Sb8PrS0nHz4DnrkIP4w7SWva2T9WgiGgqas3EkfoJf
   KEw8YS+wkdnO7ktubjL/Uh/kID2ioClYT1lzZ3z+N1siNln88hx+DZQeV
   ayChHvU2hXLX5LC9IEud0m8clPHoBqYg2etzRdSjrFQoa3F7WFEwIRYGu
   h6ROMMPKv2Stbt1d3mgNtyveXuL6vXXyj605hmCtEfASHzt0OMGWDU5zb
   ERdcpd9cLlckQYy5mVXe3e3atR4CdvQeu5yaJHgw5LIFiuGibkk6Ije+J
   Q==;
Date:   Fri, 29 Oct 2021 14:24:51 +0200
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
Message-ID: <20211029122450.GB24060@axis.com>
References: <20211019143748.wrpqopj2hmpvblh4@vireshk-i7>
 <YW8LFTcBuN1bB3PD@ninjato>
 <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com>
 <YW+q1yQ8MuhHINAs@kroah.com>
 <8e182ea8-5016-fa78-3d77-eefba7d58612@intel.com>
 <20211020064128.y2bjsbdmpojn7pjo@vireshk-i7>
 <01d9c992-28cc-6644-1e82-929fc46f91b4@intel.com>
 <20211020105554.GB9985@axis.com>
 <20211020110316.4x7tnxonswjuuoiw@vireshk-i7>
 <df7e6127-05fb-6aad-3896-fc810f213a54@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <df7e6127-05fb-6aad-3896-fc810f213a54@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 21, 2021 at 05:30:28AM +0200, Jie Deng wrote:
> On 2021/10/20 19:03, Viresh Kumar wrote:
> > On 20-10-21, 12:55, Vincent Whitchurch wrote:
> >> If the timeout cannot be disabled, then the driver should be fixed to
> >> always copy buffers and hold on to them to avoid memory corruption in
> >> the case of timeout, as I mentioned in my commit message.  That would be
> >> quite a substantial change to the driver so it's not something I'm
> >> personally comfortable with doing, especially not this late in the -rc
> >> cycle, so I'd leave that to others.
> > Or we can avoid clearing up and freeing the buffers here until the
> > point where the buffers are returned by the host. Until that happens,
> > we can avoid taking new requests but return to the earlier caller with
> > timeout failure. That would avoid corruption, by freeing buffers
> > sooner, and not hanging of the kernel.
> 
> It seems similar to use "wait_for_completion". If the other side is
> hacked, the guest may never get the buffers returned by the host,
> right ?

Note that it is trivial for the host to DoS the guest.  All the host has
to do is stop responding to I/O requests (I2C or others), then the guest
will not be able to perform its intended functions, regardless of
whether this particular driver waits forever or not.  Even TDX (which
Greg mentioned) does not prevent that, see:

 https://lore.kernel.org/virtualization/?q=tdx+dos

> For this moment, we can solve the problem by using a hardcoded big
> value or disabling the timeout.

Is that an Acked-by on this patch which does the latter?

> Over the long term, I think the backend should provide that timeout
> value and guarantee that its processing time should not exceed that
> value.

If you mean that the spec should be changed to allow the virtio driver
to be able to program a certain timeout for I2C transactions in the
virtio device, yes, that does sound reasonable.
