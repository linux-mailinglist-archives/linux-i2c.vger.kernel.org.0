Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2B676BDC1
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 21:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbjHAT3i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 15:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjHAT3g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 15:29:36 -0400
Received: from mgamail.intel.com (unknown [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A85199F;
        Tue,  1 Aug 2023 12:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690918176; x=1722454176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nTLt/HhmxrDmDa3nOde9MUzoI/KRxer2J9vnTgnAEZQ=;
  b=XrWGq1ajSRnMN4I0HH+l14rXXptteaHrgdoilwmkhD/frqAbVIuG7XuH
   0ppMcKeC4Th0rHN23oWbfyYCqzp0cOdyWneaPAhGM4Jnh3vm1N24HPjn9
   3KI3Egajv9tno8TiZ2p3+6aBBPx+MqVuqkSxWwCyIWLhLO4f97gD8oZWU
   cXRrr6ojY/clvKkhlpIqHKRZcbDeUrxhpUmioqVxARRzqBbsSXq3d8dEu
   oeLKxKXosw+Uq97d3rdnkXTMYf8l6jk7LzegRCApWUmtrM0Q+wIh73bp4
   EMU7xj/REODmAtYYb1XPIBaev79k614iFTUN1bXSqLkdhwjvO/7wGrJTU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="366861626"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="366861626"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 12:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="1059534887"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="1059534887"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 01 Aug 2023 12:29:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQv3g-00GdCW-25;
        Tue, 01 Aug 2023 22:29:28 +0300
Date:   Tue, 1 Aug 2023 22:29:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <ZMldGIYbjDa51587@smile.fi.intel.com>
References: <20230801170318.82682-1-biju.das.jz@bp.renesas.com>
 <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 01, 2023 at 06:03:18PM +0100, Biju Das wrote:
> Add i2c_device_get_match_data() callback to struct bus_type().
> 
> While at it, introduced i2c_get_match_data_helper() to avoid code
> duplication with i2c_get_match_data().

...

>  * Changed i2c_of_match_device_sysfs() as non-static function as it is
>    needed for i2c_device_get_match_data().

Btw, this can be split to a separate change.

-- 
With Best Regards,
Andy Shevchenko


