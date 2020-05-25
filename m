Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A501E0FA8
	for <lists+linux-i2c@lfdr.de>; Mon, 25 May 2020 15:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390777AbgEYNmW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 May 2020 09:42:22 -0400
Received: from mga17.intel.com ([192.55.52.151]:52678 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390752AbgEYNmW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 May 2020 09:42:22 -0400
IronPort-SDR: 2mJyGc4DUto9zzv9PPlx+qHEoNf7SXkxytbVXHQI6WdSWdqRx70LB0pGUKNdEP/xWVJfxooaFt
 DCJ72WqDfqKg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2020 06:42:20 -0700
IronPort-SDR: 3ahJSY+WGJJJL30AHT0RjfuA8GbpndCYboJhLj5auNonIf3UK1WzfXVbmt5TsM2f+/YaVPBve3
 c8UhP5cU6vZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; 
   d="scan'208";a="468055300"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 25 May 2020 06:42:17 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdDMx-008nMy-GZ; Mon, 25 May 2020 16:42:19 +0300
Date:   Mon, 25 May 2020 16:42:19 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 08/12] i2c: designware: Introduce platform drivers
 glue layer interface
Message-ID: <20200525134219.GB1634618@smile.fi.intel.com>
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
 <20200510095019.20981-9-Sergey.Semin@baikalelectronics.ru>
 <4950bb1e-302f-947e-1924-452a8169b504@linux.intel.com>
 <20200521023735.mja62ujmxebgwyef@mobilestation>
 <80cf1d67-5de1-f3f1-27a0-b88cc105b228@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80cf1d67-5de1-f3f1-27a0-b88cc105b228@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 25, 2020 at 04:16:05PM +0300, Jarkko Nikula wrote:
> On 5/21/20 5:37 AM, Serge Semin wrote:

> For this patchset I'd like more if changes are done to
> i2c-designware-platdrv.c since it's not too complicated yet :-)

And after moving ACPI stuff to common code, the one has even been shrunk significantly.

> If it starts to look too messy in the future then it's time split I think.

-- 
With Best Regards,
Andy Shevchenko


