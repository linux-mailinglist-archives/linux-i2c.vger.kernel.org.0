Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCBA36051
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 17:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbfFEPb3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 11:31:29 -0400
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:27037 "EHLO
        smtp-fw-9101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbfFEPb3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 11:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1559748688; x=1591284688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SZDqMhXVHKpi6b60Mndyg6IqKyAEKB8xVLBf3wCGp48=;
  b=YkmfipVk/32s1sMohbCiuDppYdTQGNJcnJ6ZJ2oKTSpWVduS0KcT6JaS
   mapbUV9cV74y86HYBw6fHAfi0abYTU2GgBUIY3L27awUHbKy+oufVQUXS
   lGPSo7jXd4/+ow8yGTurbI/vC8OZGoFzEpdgp9afyDDUnMnHJTslGiKra
   E=;
X-IronPort-AV: E=Sophos;i="5.60,550,1549929600"; 
   d="scan'208";a="808761647"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.47.22.38])
  by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP; 05 Jun 2019 15:31:25 +0000
Received: from EX13MTAUWC001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
        by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS id 60EDEA18D7;
        Wed,  5 Jun 2019 15:31:21 +0000 (UTC)
Received: from EX13D05UWC004.ant.amazon.com (10.43.162.223) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 5 Jun 2019 15:31:20 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC004.ant.amazon.com (10.43.162.223) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 5 Jun 2019 15:31:20 +0000
Received: from localhost (10.85.18.74) by mail-relay.amazon.com
 (10.43.162.232) with Microsoft SMTP Server id 15.0.1367.3 via Frontend
 Transport; Wed, 5 Jun 2019 15:31:20 +0000
Date:   Wed, 5 Jun 2019 08:31:20 -0700
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
Message-ID: <20190605153120.GC1534@u40b0340c692b58f6553c.ant.amazon.com>
References: <20190531043347.4196-1-eduval@amazon.com>
 <20190531043347.4196-3-eduval@amazon.com>
 <20190604171611.GS9224@smile.fi.intel.com>
 <20190605032709.GA1534@u40b0340c692b58f6553c.ant.amazon.com>
 <CAHp75Vdaeprj0hFXukMqDi_dnK9-vA-O-OTRiGY6y3aGrNHUjQ@mail.gmail.com>
 <20190605143158.GB1534@u40b0340c692b58f6553c.ant.amazon.com>
 <CAHp75Vc2us0UDmGnzjF0vkzWM_9KqRa0AZKnRsUYmFRTsgwEyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75Vc2us0UDmGnzjF0vkzWM_9KqRa0AZKnRsUYmFRTsgwEyg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 05, 2019 at 06:20:37PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 5, 2019 at 5:32 PM Eduardo Valentin <eduval@amazon.com> wrote:
> > On Wed, Jun 05, 2019 at 11:25:39AM +0300, Andy Shevchenko wrote:
> > > On Wed, Jun 5, 2019 at 6:30 AM Eduardo Valentin <eduval@amazon.com> wrote:
> 
> > Well, yes, but the point is you would be switching from a simple AND (&) operation
> > to a division...
> >
> > I am keeping the power of 2 dep so that we can keep this with a simple &.
> 
> Works for me.
> 
> > > > > > +           .of_match_table = of_match_ptr(i2c_slave_mqueue_of_match),
> > > > >
> > > > > Wouldn't compiler warn you due to unused data?
> > > > > Perhaps drop of_match_ptr() for good...
> > > >
> > > > Not sure what you meant here. I dont see any compiler warning.
> > > > Also, of_match_ptr seams to be well spread in the kernel.
> > >
> > > If this will be compiled with CONFIG_OF=n...
> >
> > I see.. I obviously did not test with that config..
> >
> > > Though I didn't check all dependencies to see if it even possible. In
> > > any case of_match_ptr() is redundant in both cases here.
> > > Either you need to protect i2c_slave_mqueue_of_match with #ifdef
> > > CONFIG_OF, or drop the macro use.
> >
> > I will wrap it into CONFIG_OF..
> 
> Would be this expected to work in the case of CONFIG_OF=n?
> If no, why to introduce ugly #ifdef:s and additional macros?

I do hate those too...

> Wouldn't be better to have
>   depends on OF || COMPILE_TEST

Well, technically, the original author had a case for using this
without CONFIG_OF. That is why I did not force here to be a strong
dependency on CONFIG_OF. So, I guess in this case the driver will
work properly in both cases if we:

+#ifdef CONFIG_OF
+static const struct of_device_id i2c_slave_mqueue_of_match[] = {
+       {
+               .compatible = "i2c-slave-mqueue",
+       },
+       { /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, i2c_slave_mqueue_of_match);
+#endif
+
+static struct i2c_driver i2c_slave_mqueue_driver = {
+       .driver = {
+               .name   = "i2c-slave-mqueue",
+               .of_match_table = of_match_ptr(i2c_slave_mqueue_of_match),
+       },
+       .probe          = i2c_slave_mqueue_probe,
+       .remove         = i2c_slave_mqueue_remove,
+       .id_table       = i2c_slave_mqueue_id,
+};

The above is a well stablish pattern across the drivers.

> ?
> 
> -- 
> With Best Regards,
> Andy Shevchenko

-- 
All the best,
Eduardo Valentin
