Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0271455042
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 15:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbfFYNZU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 09:25:20 -0400
Received: from mga12.intel.com ([192.55.52.136]:10373 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726486AbfFYNZU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Jun 2019 09:25:20 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jun 2019 06:25:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,416,1557212400"; 
   d="scan'208";a="152298125"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga007.jf.intel.com with ESMTP; 25 Jun 2019 06:25:17 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hflRj-0002pk-OM; Tue, 25 Jun 2019 16:25:15 +0300
Date:   Tue, 25 Jun 2019 16:25:15 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@the-dreams.de, jarkko.nikula@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, benjamin.tissoires@redhat.com,
        jbroadus@gmail.com, patches@opensource.cirrus.com
Subject: Re: [PATCH v6 4/7] i2c: core: Make i2c_acpi_get_irq available to the
 rest of the I2C core
Message-ID: <20190625132515.GA9224@smile.fi.intel.com>
References: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
 <20190621100815.12417-5-ckeepax@opensource.cirrus.com>
 <20190625115011.GE2640@lahna.fi.intel.com>
 <20190625124245.GC54126@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625124245.GC54126@ediswmail.ad.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 25, 2019 at 01:42:45PM +0100, Charles Keepax wrote:
> On Tue, Jun 25, 2019 at 02:50:11PM +0300, Mika Westerberg wrote:

> I would be happy to squash the two patches, and go back to the
> i2c_client approach, if that was preferred and  as long as Andy
> doesn't mind.

I don't.

-- 
With Best Regards,
Andy Shevchenko


