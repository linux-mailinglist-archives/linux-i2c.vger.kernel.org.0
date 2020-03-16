Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6445B186FAA
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Mar 2020 17:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731931AbgCPQID (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Mar 2020 12:08:03 -0400
Received: from mga03.intel.com ([134.134.136.65]:2182 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731704AbgCPQID (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Mar 2020 12:08:03 -0400
IronPort-SDR: IMakBroWNgC9s87BO1HwUyI4AbUEFb24HOGzoeaWYjdSfovnZmLFhdjmtSOon+6FLvQ0oQHv3M
 iCdcLrGd9tjw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 09:08:03 -0700
IronPort-SDR: 7+Zwdmt4Aba1oRpfMxWO9VuyF0zKPyKqvT1lQ+6TFgeYs6scL+0JhM/RQ6yCcAiMn5I6nlpGz/
 TNukWpFMIcuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,561,1574150400"; 
   d="scan'208";a="233209984"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 16 Mar 2020 09:08:02 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jDsHc-00A6m6-Ky; Mon, 16 Mar 2020 18:08:04 +0200
Date:   Mon, 16 Mar 2020 18:08:04 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 1/5] i2c: mux: pca954x: Refactor pca954x_irq_handler()
Message-ID: <20200316160804.GU1922688@smile.fi.intel.com>
References: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
 <31d8a07f-a841-d58b-ebc8-3cba39d00a95@axentia.se>
 <20200306100215.GS1224808@smile.fi.intel.com>
 <102340b1-b742-82cb-8a31-147a8e338662@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <102340b1-b742-82cb-8a31-147a8e338662@axentia.se>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 06, 2020 at 11:58:47AM +0100, Peter Rosin wrote:
> On 2020-03-06 11:02, Andy Shevchenko wrote:

> Yep, that's safer. Thanks!

Thank you for review, I just sent v2.

-- 
With Best Regards,
Andy Shevchenko


