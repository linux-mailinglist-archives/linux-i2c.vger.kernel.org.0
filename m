Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 741E84443C2
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Nov 2021 15:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbhKCOpU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Nov 2021 10:45:20 -0400
Received: from smtp1.axis.com ([195.60.68.17]:52499 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230472AbhKCOpT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Nov 2021 10:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635950563;
  x=1667486563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h8J2kmEgurblPdeLMlFL+uqxgtxQUO5ic+miy3dskg8=;
  b=CXUR7vlvsFSycuUv8FzLY0Ckjl4O73lrdf0KI+IGTo4tcpDna7E1Oaa7
   4QNRVo8bgimyZxtTTEZGGykGHPicvJ0MEOA+0X8moC5u7CTWtDB4IfCOy
   x1ixdT+jtE8GwrSV8d6IxagfdgT7wlN30dMgxnVADzwOfmp94gFwfV6OP
   CnsnrlL5EFtRdKFG1SU0UIhOAC/WtsvQYBZcysoNrj3LLn1v3RO3RlSpb
   +d6wMIhQY+sSGauyIMBaG2o4bONlvtVkHtYcRtHJRDBTZqXqVvT91FDB2
   im/AeCET6vBznlCLl4aEUoteU4Np1tCh5hUx9mN/M33cHFjipsqUpAiLY
   A==;
Date:   Wed, 3 Nov 2021 15:42:41 +0100
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
CC:     "Chen, Conghui" <conghui.chen@intel.com>,
        "Deng, Jie" <jie.deng@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <20211103144241.GA27285@axis.com>
References: <8e182ea8-5016-fa78-3d77-eefba7d58612@intel.com>
 <20211020064128.y2bjsbdmpojn7pjo@vireshk-i7>
 <01d9c992-28cc-6644-1e82-929fc46f91b4@intel.com>
 <20211020105554.GB9985@axis.com>
 <20211020110316.4x7tnxonswjuuoiw@vireshk-i7>
 <df7e6127-05fb-6aad-3896-fc810f213a54@intel.com>
 <20211029122450.GB24060@axis.com>
 <8592a48d-0131-86bf-586a-d33e7989e523@intel.com>
 <MWHPR11MB0030C3489F38FF2AAF7C3D0A908C9@MWHPR11MB0030.namprd11.prod.outlook.com>
 <20211103063745.utpphthou4angs4s@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211103063745.utpphthou4angs4s@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 03, 2021 at 07:37:45AM +0100, Viresh Kumar wrote:
> On 03-11-21, 06:18, Chen, Conghui wrote:
> > >>> Over the long term, I think the backend should provide that timeout
> > >>> value and guarantee that its processing time should not exceed that
> > >>> value.
> > >> If you mean that the spec should be changed to allow the virtio driver
> > >> to be able to program a certain timeout for I2C transactions in the
> > >> virtio device, yes, that does sound reasonable.
> > >
> > >
> > >Due to changes in my work, I will pass my virtio-i2c maintenance to Conghui.
> > >
> > >She may work on this in the future.
> > >
> > 
> > I'll try to update the spec first.
> 
> I don't think the spec should be changed for timeout. Timeout-interval
> here isn't the property of just the host firmware/kernel, but the
> entire setup plays a role here.
> 
> Host have its own timeframe to take care of things (I think HZ should
> really be enough for that, since kernel can manage it for busses
> normally with just that). Then comes the virtualization, context
> switches, guest OS, backend, etc, which add to this delay. All this is
> not part of the virtio protocol and so shouldn't be made part of it.

The suggested timeout is not meant to take into account the overhead of
virtualization, but to be used by the virtio device as a timeout for the
transaction on the I2C bus (presumably by programming this value to the
physical I2C controller, if one exists).

Assume that userspace (or an I2C client driver) asks for a timeout of 20
ms for a particular transfer because it, say, knows that the particular
connected I2C peripheral either responds within 10 ms to a particular
register read or never responds, so it doesn't want to waste time
waiting unnecessarily long for the transfer to complete.

If the virtio device end does not have any information on what timeout
is required (as in the current spec), it must assume some high value
which will never cause I2C transactions to spuriously timeout, say 10
seconds.  

Even if the virtio driver is fixed to copy and hold all buffers to avoid
memory corruption and to time out and return to the caller after the
requested 20 ms, the next I2C transfer can not be issued until 10
seconds have passed, since the virtio device end will still be waiting
for the hardcoded 10 second timeout and may not respond to new requests
until that transfer has timed out.
