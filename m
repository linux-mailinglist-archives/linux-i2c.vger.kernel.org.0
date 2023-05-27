Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E308F713352
	for <lists+linux-i2c@lfdr.de>; Sat, 27 May 2023 10:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjE0I0x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 May 2023 04:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbjE0I0w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 27 May 2023 04:26:52 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F6EB1;
        Sat, 27 May 2023 01:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685176012; x=1716712012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bpnXRwupjfIYm1tkD0cA3h4+Qspmuh3JFATiktRdi3g=;
  b=RiBjw2xEmMu38dy2wHdrnxyCahcnlImBKKCVocgS/t6LgypxgF7FD53j
   a4ZHa+yjFFFqSHbNvlfFq79WjNahHeTKUQ8hoLLrT2obQuo1rga4POYJc
   6hvKgrds17gpXRp3xD4Ln3VMb3wxzSYU3sIg+l/2UdwOu6080ugXfXvsV
   L8sT6hJwhxUHPO4Wn7/Tgq97ayNDTv5tbO19Q2SdbXsiUzkNfgZ6K10rx
   beKwEE+dWwEzWPmn4UKj+AOJJu3Xow4rB8s3iivykPZH+C9O6NXoEXdp2
   provvRS7H0NEzAmATwTmc2+S+ps7n8UN9TReO95i0RqrEh0xiBgvf2llv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382628045"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="382628045"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 01:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="952135078"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="952135078"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 27 May 2023 01:26:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1q2pGC-000Ipq-0Z;
        Sat, 27 May 2023 11:26:48 +0300
Date:   Sat, 27 May 2023 11:26:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] RZ/V2M I2Cdriver clean ups
Message-ID: <ZHG+x9J+AAYYTumR@smile.fi.intel.com>
References: <20230525135226.240732-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525135226.240732-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 25, 2023 at 02:52:26PM +0100, Biju Das wrote:
> This patch series aims to do the following clean ups based on feedback
> from Pavel while backporting this driver to 5.10.y-cip kernel.
> 
> Drop extra space from config help description, Rename macro names in all
> uppercase and finally in probe disable the operation of unit in case of
> error.

This mail is detached from the series.
I suppose you forgot to use --cover-letter option and/or --thread.

-- 
With Best Regards,
Andy Shevchenko


