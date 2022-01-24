Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1491D498314
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 16:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbiAXPH6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 10:07:58 -0500
Received: from mga14.intel.com ([192.55.52.115]:44189 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233197AbiAXPH4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jan 2022 10:07:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643036876; x=1674572876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WfniBTTSEaPFxsu5vRYfpOWuPtWBpFQSOCOt7yTI/as=;
  b=HNRvx9Svj2ZLon+dtwrr5bIsx3mehlF8wLMmroUdFf5xC+DM4xrU6ZLs
   XNhdOduSG4TccR8XganWToMKE8ATiH1vJjBhXoana1PIRX4k1Rbr/i7Ys
   sUC3rV0Osqz/vMZyIgR2QobNAyjszZGBTmpbBEA16xuW3gkWhLbgbe4/W
   kOWxpLymykuuA50CMABcQ/SD8ml8kkcryL8cinxZNHgep07aZmZ+dGCLe
   WR2nPrDmI7z4bGWSRRarxdnoQWGy9FHKjarajwGfZMTC4kcM4rPR1D7Md
   8pC6VhDnv0uaZlimyoAXtWadSCRtzROaoJEBJwN5CZh/oi2pcmGOE8WdV
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="246282908"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="246282908"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 07:07:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="476746264"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 07:07:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nC0vf-00Dvqb-1s;
        Mon, 24 Jan 2022 17:06:47 +0200
Date:   Mon, 24 Jan 2022 17:06:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: Re: [PATCH v3 1/5] i2c: Introduce common module to instantiate CCGx
 UCSI
Message-ID: <Ye7AhqMsOkfvHOAg@smile.fi.intel.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 05, 2022 at 04:19:31PM +0200, Andy Shevchenko wrote:
> Introduce a common module to provide an API to instantiate UCSI device
> for Cypress CCGx Type-C controller. Individual bus drivers need to select
> this one on demand.

Ajay, is it possible to get your tag on the series, please?

-- 
With Best Regards,
Andy Shevchenko


