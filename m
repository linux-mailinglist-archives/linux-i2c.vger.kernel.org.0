Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3F345719E
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Nov 2021 16:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234788AbhKSPdb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Nov 2021 10:33:31 -0500
Received: from smtp1.axis.com ([195.60.68.17]:63125 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231563AbhKSPdb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Nov 2021 10:33:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1637335829;
  x=1668871829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J0Q2eQn/3bf2Y/52GQfblqSKUvkUXmIj55C006lwxiI=;
  b=Lj8btmMfbs9UjOZ8ai1Xj4HoK2vbHkgqE3tUFZidWvWhArBdp7RevUZa
   LHoB2oqBMh0LsilDAPwPrv6igPqsnzijft1aWt+vZ9P4nqm8jDweMTHM6
   WRqfik5NGIj7NIN77axRjXTXgM1Eq29c4k/ltJ2dn/Cd61f0tY0ctZrvI
   zrwQlbgEHm+7fnl5JyNzPuOnSMipOVMFZwqkoLuz3Yl+D043DMMTt5WfG
   zhMoYPTOWQ82m61bLFnZIlTgZV793bpAwHOyDEr7NVAadvC8D/sarvaOb
   vP2IlbKrY2v/my5oacwZQLfDsRAtNsQmEJlfKBGDszk89xabWM4AuR/0i
   g==;
Date:   Fri, 19 Nov 2021 16:30:27 +0100
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
CC:     "wsa@kernel.org" <wsa@kernel.org>,
        "jie.deng@intel.com" <jie.deng@intel.com>,
        "conghui.chen@intel.com" <conghui.chen@intel.com>,
        "mst@redhat.com" <mst@redhat.com>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH v2 1/2] i2c: virtio: disable timeout handling
Message-ID: <20211119153025.GA17236@axis.com>
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
 <20211111160412.11980-2-vincent.whitchurch@axis.com>
 <20211112023529.2nypmrnm6mufcpjt@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211112023529.2nypmrnm6mufcpjt@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 12, 2021 at 03:35:29AM +0100, Viresh Kumar wrote:
> On 11-11-21, 17:04, Vincent Whitchurch wrote:
> >  static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> > @@ -141,7 +140,6 @@ static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> >  	struct virtio_i2c *vi = i2c_get_adapdata(adap);
> >  	struct virtqueue *vq = vi->vq;
> >  	struct virtio_i2c_req *reqs;
> > -	unsigned long time_left;
> >  	int count;
> >  
> >  	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
> > @@ -164,11 +162,9 @@ static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> >  	reinit_completion(&vi->completion);
> >  	virtqueue_kick(vq);
> >  
> > -	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
> > -	if (!time_left)
> > -		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
> > +	wait_for_completion(&vi->completion);
> 
> I thought we decided on making this in insanely high value instead ?

That wasn't my impression from the previous email thread.  Jie was OK
with doing it either way, and only disabling the timeout entirely makes
sense to me given the risk for memory corruption otherwise.

What "insanely high" timeout value do you have in mind and why would it
be acceptable to corrupt kernel memory after that time?
