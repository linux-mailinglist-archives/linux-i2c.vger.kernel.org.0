Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D95422DC2
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 18:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233975AbhJEQV5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Oct 2021 12:21:57 -0400
Received: from mga07.intel.com ([134.134.136.100]:52971 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231196AbhJEQV5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Oct 2021 12:21:57 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="289294118"
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; 
   d="scan'208";a="289294118"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2021 09:20:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; 
   d="scan'208";a="559379000"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2021 09:20:01 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mXnAb-008vgs-4v;
        Tue, 05 Oct 2021 19:19:57 +0300
Date:   Tue, 5 Oct 2021 19:19:57 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, p.zabel@pengutronix.de, arnd@arndb.de,
        olof@lixom.net, soc@kernel.org, dinguyen@kernel.org,
        p.yadav@ti.com, Tudor.Ambarus@microchip.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        alexandre.belloni@bootlin.com, sre@kernel.org,
        thunder.leizhen@huawei.com, Jonathan.Cameron@huawei.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        ka@semihalf.com, tn@semihalf.com, jam@semihalf.com,
        amstan@google.com
Subject: Re: [PATCH v2 1/4] i2c: check bus number property in DesignWare I2C
 Controller
Message-ID: <YVx7LdKo1f1KBpqr@smile.fi.intel.com>
References: <20211005143748.2471647-1-pan@semihalf.com>
 <20211005143748.2471647-2-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005143748.2471647-2-pan@semihalf.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 05, 2021 at 04:37:45PM +0200, Paweł Anikiel wrote:
> On SoCFPGA systems, it's desireable to have fixed numbering for
> i2c busses, while being able to enable/disable them (e.g. have i2c1
> be mapped to /dev/i2c-1, even though i2c0 is disabled). This can also
> be achieved using devicetree aliases (see i2c_add_adapter). However,
> having the driver be self-contained without relying on aliases is more
> robust.

Why? This number means nothing, user space has another means to have
this being robust. Sorry, but I don't see any even close to good enough
justification, NAK.

-- 
With Best Regards,
Andy Shevchenko


