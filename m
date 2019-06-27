Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08B6E5817D
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2019 13:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfF0L1L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jun 2019 07:27:11 -0400
Received: from mga04.intel.com ([192.55.52.120]:32328 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726429AbfF0L1L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Jun 2019 07:27:11 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Jun 2019 04:27:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; 
   d="scan'208";a="183428592"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 27 Jun 2019 04:27:07 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 27 Jun 2019 14:27:06 +0300
Date:   Thu, 27 Jun 2019 14:27:06 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v8 3/6] i2c: acpi: Factor out getting the IRQ from ACPI
Message-ID: <20190627112706.GD2640@lahna.fi.intel.com>
References: <20190627092411.26123-1-ckeepax@opensource.cirrus.com>
 <20190627092411.26123-4-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627092411.26123-4-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 27, 2019 at 10:24:08AM +0100, Charles Keepax wrote:
> In preparation for future refactoring factor out the fetch of the IRQ
> into its own helper function. Whilst we are at it update the handling
> to return the actual error code returned from acpi_dev_get_resources
> as well.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
