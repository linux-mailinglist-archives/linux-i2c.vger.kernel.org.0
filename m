Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E96434915
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Oct 2021 12:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhJTKlF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Oct 2021 06:41:05 -0400
Received: from smtp1.axis.com ([195.60.68.17]:30648 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229900AbhJTKlF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Oct 2021 06:41:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1634726329;
  x=1666262329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y2adYmK2ohxodX6Ld8DWVNGEgFwqUg/XOlnsfsiGzbk=;
  b=ectoQxVdoaGRerX4Xzig43ilnTIu8VxI+oh/kh7uQcfQYHOKEYluW1lQ
   L66YeUvM5qf6h96uNKLCmhlG6Vpe0H3IX6XmtBsXksMFX9XXjfYso/6cd
   3POd50avsT3F2I9nRlDxBPxKphy7BnOc4qdxHuFRYCQ7KIX7WDUAq2wag
   8UMR7xwj8Jc+tmJxTDalZ4Lh0GhlN+YUo9ZOsdXunk6S6XENU7wCLjNbB
   78JtHdi5DykMehsbIwLpdsFiz2KSesz514NiOYZimB2SmvCQZMHdk+oXb
   tNgXGIQTbSCHZEAiUFO5qcuz0DleMAdZ5NPi83uP4yQ1DBqZMBSoLxuxr
   Q==;
Date:   Wed, 20 Oct 2021 12:38:49 +0200
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
CC:     Jie Deng <jie.deng@intel.com>, "wsa@kernel.org" <wsa@kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH 2/2] i2c: virtio: fix completion handling
Message-ID: <20211020103849.GA9985@axis.com>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-3-vincent.whitchurch@axis.com>
 <20211019082211.ngkkkxlfcrsvfaxg@vireshk-i7>
 <81ea2661-20f8-8836-5311-7f2ed4a1781f@intel.com>
 <20211020091721.7kcihpevzf7h4d62@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211020091721.7kcihpevzf7h4d62@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 20, 2021 at 11:17:21AM +0200, Viresh Kumar wrote:
> On 20-10-21, 16:54, Jie Deng wrote:
> > 
> > On 2021/10/19 16:22, Viresh Kumar wrote:
> > > On 19-10-21, 09:46, Vincent Whitchurch wrote:
> > > >   static void virtio_i2c_msg_done(struct virtqueue *vq)
> > > >   {
> > > > -	struct virtio_i2c *vi = vq->vdev->priv;
> > > > +	struct virtio_i2c_req *req;
> > > > +	unsigned int len;
> > > > -	complete(&vi->completion);
> > > > +	while ((req = virtqueue_get_buf(vq, &len)))
> > > > +		complete(&req->completion);
> > > Instead of adding a completion for each request and using only the
> > > last one, maybe we can do this instead here:
> > > 
> > > 	while ((req = virtqueue_get_buf(vq, &len))) {
> > >                  if (req->out_hdr.flags == cpu_to_le32(VIRTIO_I2C_FLAGS_FAIL_NEXT))
> > 
> > 
> > Is this for the last one check ? For the last one, this bit should be
> > cleared, right ?
> 
> Oops, you are right. This should be `!=` instead. Thanks.

I don't quite understand how that would be safe since
virtqueue_add_sgs() can fail after a few iterations and all queued
request buffers can have FAIL_NEXT set.  In such a case, we would end up
waiting forever with your proposed change, wouldn't we?
