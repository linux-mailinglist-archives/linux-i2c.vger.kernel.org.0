Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A86D531BA5E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 14:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhBONa6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 08:30:58 -0500
Received: from mga02.intel.com ([134.134.136.20]:11742 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230253AbhBONak (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Feb 2021 08:30:40 -0500
IronPort-SDR: BGY6DJYlDlph3e2TK+3NZCQ6IEZF61tb/6TxUj7hKhlhMPyDhiEZIzn3l8K2kUGMP3i4FygKgf
 HJMJfY93H6Xg==
X-IronPort-AV: E=McAfee;i="6000,8403,9895"; a="169812610"
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="169812610"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 05:28:54 -0800
IronPort-SDR: DIXmMMJmAz3vR9XHDZCRkouf+7yLMNdrRd3hwF38/eCUwr9xCTdKhqATzOI+b0PRNdDIPxpq/4
 IZe7uWHk3GWw==
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="438551218"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 05:28:52 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lBdvk-005CVS-Oj; Mon, 15 Feb 2021 15:28:48 +0200
Date:   Mon, 15 Feb 2021 15:28:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH i2c-next] i2c: designware: Consolidate
 pci_free_irq_vectors to a single place
Message-ID: <YCp3EGc6N5iMlvfm@smile.fi.intel.com>
References: <20210214064529.481341-1-zhengdejin5@gmail.com>
 <YCp1KL/+YYxmr7vO@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCp1KL/+YYxmr7vO@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 15, 2021 at 03:20:40PM +0200, Andy Shevchenko wrote:
> On Sun, Feb 14, 2021 at 02:45:29PM +0800, Dejin Zheng wrote:
> > Consolidate pci_free_irq_vectors to a single place using "goto free_irq"
> > for simplify the code.

FYI, you may rather to introduce a pcim_alloc_irq_vectors() and drop all these
calls altogether.

Note to everybody: PCIm is not ideal, but this piece is being called whenever
pcim_enable_device() makes resources manageable. The problem here is the
naming.

-- 
With Best Regards,
Andy Shevchenko


