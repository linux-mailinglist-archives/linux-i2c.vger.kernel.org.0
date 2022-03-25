Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD0434E787B
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 16:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356936AbiCYP67 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 11:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242758AbiCYP67 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 11:58:59 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A00E9A990;
        Fri, 25 Mar 2022 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648223845; x=1679759845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=a3/78ixH1ACUXhASSJ7kUC9sw50/0quKPSlttsfajKw=;
  b=GSpXf8OWM+elJTi9PD+7i2HVoI577MtmgxwV5F7jDv46UeWRs+2v6fFF
   b8ssPOGvYKO3ycgbr1n+JtOUwX5+RwKq7abAUz3PUe6/9OJgkIOoXe0hu
   zgIoP/5oZxzY+DGHmcmyVo7M9NDsQVLx87fQ9zHZnN0TZRAev2SE1Hb/c
   s0IgAs69EgEyjKChlhM/gjGSNczEZnN0+/4lLXa4n62Lsm7uzltjYDg1h
   5hIXdgq2ciw6DV/Xl7XKTTW8PtuCQc79NqYwlSmrqRu745j0ZFSl0AB0T
   H+mGcfCibNWYpYqyoIVy+iyrspjS6hz3NXVX4JmKWizDApJQrGwR3WYAe
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="238600739"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="238600739"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 08:57:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="638255996"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 08:57:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nXmIu-006Tfh-6a;
        Fri, 25 Mar 2022 17:56:44 +0200
Date:   Fri, 25 Mar 2022 17:56:43 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 6/9] i2c: fwnode: add fwnode_find_i2c_adapter_by_node()
Message-ID: <Yj3mO/Co/RdlZnV+@smile.fi.intel.com>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
 <20220325113148.588163-7-clement.leger@bootlin.com>
 <Yj3TSBEY/P7d8XJj@smile.fi.intel.com>
 <20220325160927.30e5aef8@fixe.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220325160927.30e5aef8@fixe.home>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 25, 2022 at 04:09:27PM +0100, Clément Léger wrote:
> Le Fri, 25 Mar 2022 16:35:52 +0200,
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> a écrit :
> > On Fri, Mar 25, 2022 at 12:31:45PM +0100, Clément Léger wrote:

...

> > > +	 * For ACPI device node, the behavior is to not match the parent (see
> > > +	 *  did not checked the )
> > 
> > Would it be harmful to drop this check?
> 
> Can't tell, I would not want to introduce some behavior wrt to parent
> node for ACPI since it was not done this way. Might works in 99% of the
> case though.
> 
> If ok with that, I can drop it.

Let's ask Mika and Jarkko if they know more on this. I think Mika was the
one who introduced that (sorry, if I'm mistaken, haven't looked at the history
carefully).

P.S. Interesting enough that Mika is listed as I2C ACPI maintainer and his
email is not in the Cc. Please, check how you form Cc list for this series
and include all parties next time.

-- 
With Best Regards,
Andy Shevchenko


