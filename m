Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3878D1DB23C
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 13:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgETLt2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 07:49:28 -0400
Received: from mga06.intel.com ([134.134.136.31]:34265 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgETLt2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 07:49:28 -0400
IronPort-SDR: luJ9WmqpTkppN5ANoXkKYFNr6zVaLQf4/WRuOkByLeWokAi01j5vhmVeqMd+cbIOMoG2bUJOB5
 IUMiyNIW4IUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 04:49:27 -0700
IronPort-SDR: a/+Fpg54o+8PTDC2WA+m5PdUJa0V8mJpZ3R5KEtl27Vp1YaBQPYo9Gd+f4hN621W9nP6OxLRAh
 AaEUA68Jxk4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,413,1583222400"; 
   d="scan'208";a="253582839"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 20 May 2020 04:49:23 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jbNDx-007pYn-Jd; Wed, 20 May 2020 14:49:25 +0300
Date:   Wed, 20 May 2020 14:49:25 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Avi Fishman <avifishman70@gmail.com>
Cc:     Tali Perry <tali.perry1@gmail.com>, ofery@google.com,
        Brendan Higgins <brendanhiggins@google.com>,
        Tomer Maimon <tmaimon77@gmail.com>, kfting@nuvoton.com,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>, wsa@the-dreams.de,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200520114925.GQ1634618@smile.fi.intel.com>
References: <20200520095113.185414-1-tali.perry1@gmail.com>
 <20200520095113.185414-3-tali.perry1@gmail.com>
 <20200520102452.GP1634618@smile.fi.intel.com>
 <CAKKbWA5L_n7iC6-d22Am62SOoDBwNWO87+sXtRbwxwuVdjmRYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKKbWA5L_n7iC6-d22Am62SOoDBwNWO87+sXtRbwxwuVdjmRYA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 20, 2020 at 02:37:13PM +0300, Avi Fishman wrote:
> On Wed, May 20, 2020 at 1:24 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, May 20, 2020 at 12:51:12PM +0300, Tali Perry wrote:
> > > Add Nuvoton NPCM BMC I2C controller driver.
> >
> > ...
> >
> > > +#ifdef CONFIG_DEBUG_FS
> >
> > Why?!
> 
> It is made to save code size if CONFIG_DEBUG_FS is not defined?

Nope (in cases I have commented on). Try again.

> We see a lot of kernel code that is doing it.

Cargo cult, okay. So, somebody should try to understand what they are doing.

> So could you elaborate what is the problem?

Problem 1: ugly code.
Problem 2: some of the code is not guarded (seems never been tested with disabled debugfs).
Problem 3: it's not needed.

> > > +#include <linux/debugfs.h>
> > > +#endif

-- 
With Best Regards,
Andy Shevchenko


