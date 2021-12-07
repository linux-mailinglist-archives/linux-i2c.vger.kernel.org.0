Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1CDB46C30E
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 19:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235868AbhLGSta (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 13:49:30 -0500
Received: from mga06.intel.com ([134.134.136.31]:61567 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhLGSta (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Dec 2021 13:49:30 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="298454455"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="298454455"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 10:42:54 -0800
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="515414445"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 10:42:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mufPU-003KCw-HN;
        Tue, 07 Dec 2021 20:41:52 +0200
Date:   Tue, 7 Dec 2021 20:41:52 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] i2c: designware: Add a note about struct
 dw_scl_sda_cfg usage
Message-ID: <Ya+q8CPfpBLgXYKf@smile.fi.intel.com>
References: <20211203171318.62503-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203171318.62503-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 03, 2021 at 07:13:18PM +0200, Andy Shevchenko wrote:
> Add a note about struct dw_scl_sda_cfg usage to discourage people
> of using this structure on new platforms. Instead they should try
> hard to put the needed information into firmware descriptions.

Scratch this, I will send a bigger series where I incorporate this one into.

-- 
With Best Regards,
Andy Shevchenko


