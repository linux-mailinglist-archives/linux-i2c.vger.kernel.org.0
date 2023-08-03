Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C28F776E7FF
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 14:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235836AbjHCMN2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 08:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235851AbjHCMN0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 08:13:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC2A3586;
        Thu,  3 Aug 2023 05:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691064805; x=1722600805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hN5dM8m7SMePeE1jeqL/EaU51Sm3ACO8thzTfdNqzYk=;
  b=U1I3YLQqEjro6ToF1rsGwQ9+JQv7/lziebpliWcY02H0F0c29gHQfvTi
   TUOl6yja/dn6aG22s6drIkfXw+4WGV4ABmkI6AdVuYIbTRsxtKbryZS8R
   O9codH7ocjc3m2uQmtdtwxeoaZTL3OkK9T6PZc/x0uV8WHmC8QSymGbbY
   INOtcb7vY9OsL0JcKM95g1g5+erRi3YF2mGi/ljM3OmzH2ijcA4xrRus+
   /7MtX38wUKtwd0AZqShIGXJDqmqQMrRqTO0S7b3WVjeAu0ryG+q82zrDA
   F4c3No0Pste4EtshVbISdok0AzsK95GrhC+m8d7+Y3KRdwbxZ7QyugvHj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="350150052"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="350150052"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 05:13:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="706514042"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="706514042"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 03 Aug 2023 05:13:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qRXCe-00BgyM-1Q;
        Thu, 03 Aug 2023 15:13:16 +0300
Date:   Thu, 3 Aug 2023 15:13:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 RESEND 0/4] Extend device_get_match_data() to struct
 bus_type
Message-ID: <ZMuZ3PonCzDtrVus@smile.fi.intel.com>
References: <20230803103102.323987-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803103102.323987-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 03, 2023 at 11:30:58AM +0100, Biju Das wrote:
> This patch series extend device_get_match_data() to struct bus_type,
> so that buses like I2C can get matched data.

Thank you! We are getting closer, I believe v6 will be the one against which
I give my Rb tag.

Nice job!

-- 
With Best Regards,
Andy Shevchenko


