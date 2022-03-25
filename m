Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C132E4E78EB
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 17:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348569AbiCYQcK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 12:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241341AbiCYQcJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 12:32:09 -0400
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42FF44E38B;
        Fri, 25 Mar 2022 09:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648225835; x=1679761835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IsvoGIwKuaSZVlp8CRIX2eressldpJyF130eHQPZqvU=;
  b=HkjH/sMgSOiN973AFECdoFopbBJCZlIq9xYMZN8xJda/9nUQwtoYPwsY
   SFfAqkLVvau2vEnZ7nhX1Tof+yhVu6wn6WkTvjZYAvElsrHOckL2vg6+J
   cLFCn1ZSABnvjDSValyZHq7HESZELE9sa+UgNazi/GoZ6EuaSraPIudWa
   jnmS4QLzyZHk5BnAJD6dZuX7lRKr3zl3eQcT3U1TY+Jykbv3bxYXxWx5A
   M10/eCtZgmMin0z9MrLAqEXfA1SAGhxTCMN9WeMsJz8oWS7Ny+ulLc7kU
   x4UocNev4iRPjRExEMpUrol97dJXPFJVbv82Ox5RoZbRIh4JaZgWq4Br6
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="319375621"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="319375621"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 09:30:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="520255143"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 09:30:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nXmoz-006Ugu-HS;
        Fri, 25 Mar 2022 18:29:53 +0200
Date:   Fri, 25 Mar 2022 18:29:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
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
Message-ID: <Yj3uATh/pkTyYTUi@smile.fi.intel.com>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
 <20220325113148.588163-7-clement.leger@bootlin.com>
 <Yj3TSBEY/P7d8XJj@smile.fi.intel.com>
 <20220325160927.30e5aef8@fixe.home>
 <Yj3mO/Co/RdlZnV+@smile.fi.intel.com>
 <20220325170439.75ce012d@fixe.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220325170439.75ce012d@fixe.home>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 25, 2022 at 05:04:39PM +0100, Clément Léger wrote:
> Le Fri, 25 Mar 2022 17:56:43 +0200,
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> a écrit :

...

> > P.S. Interesting enough that Mika is listed as I2C ACPI maintainer and his
> > email is not in the Cc. Please, check how you form Cc list for this series
> > and include all parties next time.
> 
> I'm using get_maintainers.pl which does not return Mika nor Jarkko. I
> was using --nogit which probably ruled out some contributors but not
> them apparently.

Yeah, in this case it seems some heuristics has to be used...

-- 
With Best Regards,
Andy Shevchenko


