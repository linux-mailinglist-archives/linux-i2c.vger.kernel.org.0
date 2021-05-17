Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FC4382E0A
	for <lists+linux-i2c@lfdr.de>; Mon, 17 May 2021 15:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235891AbhEQN47 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 May 2021 09:56:59 -0400
Received: from mga11.intel.com ([192.55.52.93]:58801 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232924AbhEQN47 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 May 2021 09:56:59 -0400
IronPort-SDR: oqUsk117Jb1pHEF293DalBX/bOjtvuNpG2AjLoXx2i6GFC4QPtHbekFvhbf1jdlk6dnLgBraqI
 JpqSaYvpH1mg==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="197386149"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="197386149"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 06:55:43 -0700
IronPort-SDR: sRljyzGClPT11dARfJMUIn3lj3s88tZhkg78C8LTEYY5FNNCKjak7tL9KcaGwn4uHs7jK/dGqB
 ENGogLcc2ItA==
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="438929730"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 06:55:40 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lidiX-00CkQk-Li; Mon, 17 May 2021 16:55:33 +0300
Date:   Mon, 17 May 2021 16:55:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v1 1/1] i2c: core: Propagate all possible errors when
 requesting recovery GPIOs
Message-ID: <YKJ11UKwSZPy9X5D@smile.fi.intel.com>
References: <20210428154934.18807-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428154934.18807-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 28, 2021 at 06:49:34PM +0300, Andy Shevchenko wrote:
> If GPIO is available but we can't get it by some other, than deferred probe,
> reason, propagate it to the caller.
> 
> No functional change since i2c_register_adapter() still cares only about
> deferred probe.

Wolfram, any comment on this?

-- 
With Best Regards,
Andy Shevchenko


