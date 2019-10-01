Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07087C3E15
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2019 19:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727661AbfJAQj0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Oct 2019 12:39:26 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:39375 "EHLO
        smtp-fw-6002.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727562AbfJAQj0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Oct 2019 12:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1569947965; x=1601483965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8vKl6yDkUjVwSIEpS1l7EJEXTANs8Udckbj8KOh+Zes=;
  b=CStsrV285EVpR0AnerPgPGqPjyI7WBMogxbCSBp2skS5/5+B6+zpJouj
   /jikUaB9BJuK+7hLGtkZpQ6OhnLyuMPVl1daN+q+PYEYiIpmOCz4C53GE
   5L7rVWK6UjJl4kyf6NfHOoQadl3qIKnsBJpuUL2NmdN03QTWpyGART7dd
   M=;
X-IronPort-AV: E=Sophos;i="5.64,571,1559520000"; 
   d="scan'208";a="425072078"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.124.125.6])
  by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP; 01 Oct 2019 16:39:22 +0000
Received: from EX13MTAUWC001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
        by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS id 95FB0A2254;
        Tue,  1 Oct 2019 16:39:18 +0000 (UTC)
Received: from EX13D02UWC003.ant.amazon.com (10.43.162.199) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 16:39:18 +0000
Received: from localhost (10.43.160.153) by EX13D02UWC003.ant.amazon.com
 (10.43.162.199) with Microsoft SMTP Server (TLS) id 15.0.1367.3; Tue, 1 Oct
 2019 16:39:16 +0000
Date:   Tue, 1 Oct 2019 11:39:10 -0500
From:   Patrick Williams <alpawi@amazon.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Patrick Williams <patrick@stwcx.xyz>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Max Staudt <max@enpas.org>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>,
        Ajay Gupta <ajayg@nvidia.com>, Stefan Roese <sr@denx.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        "Paul Cercueil" <paul@crapouillou.net>,
        Enrico Weigelt <info@metux.net>,
        "Allison Randal" <allison@lohutok.net>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: pxa: migrate to new i2c_slave APIs
Message-ID: <20191001163910.GA2307@8c859006a84e.ant.amazon.com>
References: <20191001160001.2388-1-alpawi@amazon.com>
 <20191001160001.2388-2-alpawi@amazon.com>
 <20191001162913.GR32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191001162913.GR32742@smile.fi.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Originating-IP: [10.43.160.153]
X-ClientProxiedBy: EX13D15UWB001.ant.amazon.com (10.43.161.254) To
 EX13D02UWC003.ant.amazon.com (10.43.162.199)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for the review Andy.

On Tue, Oct 01, 2019 at 07:29:13PM +0300, Andy Shevchenko wrote:
> 
> 
> On Tue, Oct 01, 2019 at 10:59:59AM -0500, Patrick Williams wrote:
> There are quite a few people in the Cc list. I'm not sure they all are
> interested in this. I deliberately dropped few names, sorry, if I was mistaken.

Agree it was kind of a big list.  Just chose what was given to me by
get_maintainer.pl.  It seems like there isn't a direct identified
maintainer of this file.

> 
> > +		if (isr & ISR_RWM) {
> > +			u8 byte = 0;
> > +
> > +			i2c_slave_event(i2c->slave, I2C_SLAVE_READ_REQUESTED,
> > +					&byte);
> > +			writel(byte, _IDBR(i2c));
> > +		} else {
> > +			i2c_slave_event(i2c->slave, I2C_SLAVE_WRITE_REQUESTED,
> > +					NULL);
> > +		}
> 
> Hmm... Perhaps
> 
> 		u8 byte = 0;
> 
> 		i2c_slave_event(i2c->slave, I2C_SLAVE_READ_REQUESTED, &byte);
> 		if (isr & ISR_RWM)
> 			writel(byte, _IDBR(i2c));
> 

The two different paths also require READ_REQUEST vs WRITE_REQUESTED.  I
could do a ternary there but it seemed more obvious to just unroll the
logic.

-- 
- Patrick
