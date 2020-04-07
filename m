Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF901A0FBC
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 16:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729177AbgDGO4V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 10:56:21 -0400
Received: from mga05.intel.com ([192.55.52.43]:9181 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729060AbgDGO4V (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Apr 2020 10:56:21 -0400
IronPort-SDR: bwFOvFPTmcvAwoIYjMqtm8WxHhlv3modY5QTYCZrA9twbQlCPW71cz4eGIrPgSaF+Ma11a5BKW
 ciXTi3KZTsEg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 07:56:11 -0700
IronPort-SDR: 3RdFAF2eGmlBMU2dwLcPgV9Cou/Sq3GgUGruyL2M2Of8yNik3dwlZjo2S8RB+D9rskvUPyUDij
 diAVBOxt3fBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,354,1580803200"; 
   d="scan'208";a="251254867"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2020 07:56:10 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jLpe6-00GSFc-H9; Tue, 07 Apr 2020 17:56:10 +0300
Date:   Tue, 7 Apr 2020 17:56:10 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: designware: Calculate *CNT for Fast Mode Plus
Message-ID: <20200407145610.GI3676135@smile.fi.intel.com>
References: <20200407133439.23422-1-wan.ahmad.zainie.wan.mohamad@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407133439.23422-1-wan.ahmad.zainie.wan.mohamad@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 07, 2020 at 09:34:37PM +0800, Wan Ahmad Zainie wrote:
> Hi.
> 
> Custom parameters for HCNT/LCNT are not available for OF based system.
> We will use existing SCL timing parameter calculation functions to
> get HCNT/LCNT value for Fast Mode Plus and High Speed Mode.
> 
> The patches were tested on Keem Bay EVM (OF based system), and using
> Tiger Lake platform and Leaf Hill board to cover ACPI and PCI mode.

Wolfram, for the sake of clarification, the series has been reviewed
internally, that's why it has my tags already (though usually I ask
to Cc me and give them explicitly during external review, not everybody
follow this way).

> 
> Thank you.
> 
> Best regards,
> Zainie.
> 
> 
> Wan Ahmad Zainie (2):
>   i2c: designware: Calculate SCL timing parameter for Fast Mode Plus
>   i2c: designware: Calculate SCL timing parameter for High Speed Mode
> 
>  drivers/i2c/busses/i2c-designware-master.c | 37 ++++++++++++++++++----
>  1 file changed, 31 insertions(+), 6 deletions(-)
> 
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


