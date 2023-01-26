Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60D8067C86C
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jan 2023 11:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237149AbjAZKV4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Jan 2023 05:21:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237103AbjAZKVj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Jan 2023 05:21:39 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B49CA5EE;
        Thu, 26 Jan 2023 02:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674728477; x=1706264477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Wdj5n8WybsZYtkV2jOsasrUUhnq8i1MgcmZSnWSJSg=;
  b=FyiHZ00AmlV5cMXIVuXLnwRdxqk23SJon6/e8tKZ4jsvncTIYqhj0Bmh
   Cse5ZiTgtXV5BZn0/9us917oyeiXkTNuygyxvvvEN9JLBpEHQmWeab40z
   R6wuh1/DOr5/qwlVxx76NNSp5b+NR19c7G8dFSjbk2aD9Q80NBwnxWN+l
   jsheza8XPogUUS0LpcntvzDCGkaGNedUidC1ad+Pt0J7FfMYfgGuW2r4b
   F3LkKM2M/MLEZWQl09mNLbfZc5gJFVRhI9n+LbDONNFK9B23gLYTKNBBg
   22+FS5ANsl5KSISvtQKPTBsKCbCVa8L27mNF6VYEQ0aQKe6h0ZLTLOFY5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="328861727"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; 
   d="scan'208";a="328861727"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 02:21:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="662804905"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; 
   d="scan'208";a="662804905"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 26 Jan 2023 02:21:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pKzNS-00FKzV-1t;
        Thu, 26 Jan 2023 12:21:06 +0200
Date:   Thu, 26 Jan 2023 12:21:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v7 5/7] media: i2c: add DS90UB960 driver
Message-ID: <Y9JUEv66Gze8FjMZ@smile.fi.intel.com>
References: <Y8gUuqLBXsXQoNUC@smile.fi.intel.com>
 <aba49d82-c76f-7ff2-751c-d1be7b8f3bca@ideasonboard.com>
 <Y8rFh6zO7Hp9mLxE@smile.fi.intel.com>
 <4286abe2-f23f-d4c9-ef18-f351af7a3a8b@ideasonboard.com>
 <Y9EcRlooHwIjOqiZ@smile.fi.intel.com>
 <cad92dbb-43ef-fa8c-1962-13c4a8578899@ideasonboard.com>
 <Y9FBlMl4b3l1zVck@smile.fi.intel.com>
 <5d208710-f284-e6e9-18dc-f5ef63a9ea44@ideasonboard.com>
 <Y9FKcoVlgUWR4rhn@smile.fi.intel.com>
 <04a82b08-524f-8d03-ac47-73d826907fc3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04a82b08-524f-8d03-ac47-73d826907fc3@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 26, 2023 at 10:41:47AM +0200, Tomi Valkeinen wrote:
> On 25/01/2023 17:27, Andy Shevchenko wrote:

...

> > But I probably don't understand the ATR structure and what exactly we need to
> > pass to it, perhaps it also can be replaced with properties (note, that we have
> > some interesting ones that called references, which is an alternative to DT
> > phandle).
> 
> Well, maybe this needs a Linux bus implementation. I'm not that familiar
> with implementing a bus, but I think that would make it easier to share data
> between the deserializer and the serializer. A bus sounds a bit like an
> overkill for a 1-to-1 connection, used by a few drivers, but maybe it
> wouldn't be too much code.

Have you looked at auxiliary bus (appeared a few releases ago in kernel)?

-- 
With Best Regards,
Andy Shevchenko


