Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E256B35F49
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 16:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbfFEOcR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 10:32:17 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:58587 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbfFEOcR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 10:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1559745136; x=1591281136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XNFcFvZp+FLfITJoF+AIM8yN6QrQMB3mYowCFh64VQc=;
  b=QLL5tU8DfhW/SxBUsohJj/kG/MAf69SZduyCsCMTFtVLlua15gUBkmVG
   NcdzDbeqVlZqOmlPqpW8V4ssEJZ8+sJCrP+Qs+auPj0boRa5xGZxfR21h
   LdUPcgiVu6xJpuV61Ev7PO+1pmeUHYNHWj6a6Ghts7GvR+yfvmt/QR5Ws
   Y=;
X-IronPort-AV: E=Sophos;i="5.60,550,1549929600"; 
   d="scan'208";a="678308820"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO email-inbound-relay-2b-3714e498.us-west-2.amazon.com) ([10.47.22.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 05 Jun 2019 14:32:02 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
        by email-inbound-relay-2b-3714e498.us-west-2.amazon.com (Postfix) with ESMTPS id 3B1C8A2753;
        Wed,  5 Jun 2019 14:32:01 +0000 (UTC)
Received: from EX13D05UWB004.ant.amazon.com (10.43.161.208) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 5 Jun 2019 14:32:00 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D05UWB004.ant.amazon.com (10.43.161.208) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 5 Jun 2019 14:32:00 +0000
Received: from localhost (10.85.18.74) by mail-relay.amazon.com (10.43.61.243)
 with Microsoft SMTP Server id 15.0.1367.3 via Frontend Transport; Wed, 5 Jun
 2019 14:31:58 +0000
Date:   Wed, 5 Jun 2019 07:31:58 -0700
From:   Eduardo Valentin <eduval@amazon.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Eduardo Valentin <eduval@amazon.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] i2c: slave-mqueue: add a slave backend to receive
 and queue messages
Message-ID: <20190605143158.GB1534@u40b0340c692b58f6553c.ant.amazon.com>
References: <20190531043347.4196-1-eduval@amazon.com>
 <20190531043347.4196-3-eduval@amazon.com>
 <20190604171611.GS9224@smile.fi.intel.com>
 <20190605032709.GA1534@u40b0340c692b58f6553c.ant.amazon.com>
 <CAHp75Vdaeprj0hFXukMqDi_dnK9-vA-O-OTRiGY6y3aGrNHUjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75Vdaeprj0hFXukMqDi_dnK9-vA-O-OTRiGY6y3aGrNHUjQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 05, 2019 at 11:25:39AM +0300, Andy Shevchenko wrote:
> On Wed, Jun 5, 2019 at 6:30 AM Eduardo Valentin <eduval@amazon.com> wrote:
> >
> > Hey Andry,
> >
> > Long time no seeing :-)
> 
> True!
> 
> 
> > > > +#define MQ_MSGBUF_SIZE             CONFIG_I2C_SLAVE_MQUEUE_MESSAGE_SIZE
> > > > +#define MQ_QUEUE_SIZE              CONFIG_I2C_SLAVE_MQUEUE_QUEUE_SIZE
> > >
> > > > +#define MQ_QUEUE_NEXT(x)   (((x) + 1) & (MQ_QUEUE_SIZE - 1))
> > >
> > > Also possible ((x + 1) % ..._SIZE)
> >
> > Right.. but I suppose the original idea is to avoid divisions on the hotpath.
> >
> > So, I am actually fine with the limitation of only using power of 2.
> 
> The original code implies that anyway, so, my proposal doesn't
> restrict it any farther.

Well, yes, but the point is you would be switching from a simple AND (&) operation
to a division...

I am keeping the power of 2 dep so that we can keep this with a simple &.

> > > > +   {
> > > > +           .compatible = "i2c-slave-mqueue",
> > > > +   },
> > >
> > > > +   { },
> > >
> > > No need for comma here.
> >
> > It does not hurt to have it either :-)
> 
> It's just a protection against some weird cases of adding entries
> behind the terminator.

Fair..

> 
> > > > +           .of_match_table = of_match_ptr(i2c_slave_mqueue_of_match),
> > >
> > > Wouldn't compiler warn you due to unused data?
> > > Perhaps drop of_match_ptr() for good...
> >
> >
> > Not sure what you meant here. I dont see any compiler warning.
> > Also, of_match_ptr seams to be well spread in the kernel.
> 
> If this will be compiled with CONFIG_OF=n...

I see.. I obviously did not test with that config..

> Though I didn't check all dependencies to see if it even possible. In
> any case of_match_ptr() is redundant in both cases here.
> Either you need to protect i2c_slave_mqueue_of_match with #ifdef
> CONFIG_OF, or drop the macro use.

I will wrap it into CONFIG_OF..

> 
> P.S. Taking into account the last part, I would wait for v7 with that
> fixed followed by fixing other nits.

I agree, the warn on CONFIG_OF=n is enough to spin out an extra version.
I will include the other nits too.

> 
> -- 
> With Best Regards,
> Andy Shevchenko

-- 
All the best,
Eduardo Valentin
