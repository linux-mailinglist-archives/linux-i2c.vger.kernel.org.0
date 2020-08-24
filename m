Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC48724F983
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Aug 2020 11:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbgHXImT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Aug 2020 04:42:19 -0400
Received: from mga06.intel.com ([134.134.136.31]:9766 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728931AbgHXImS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Aug 2020 04:42:18 -0400
IronPort-SDR: O8RVp6BZeMgNaqEndLaHF1V2W1Oouu5Zg6yqqvcJSAECI53nXSdwbl/u7hI48o8184TjbuO8dy
 /NFgUuQQvjVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="217396321"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="217396321"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2020 01:42:04 -0700
IronPort-SDR: fJOwV6oGRIzeAvOuwPcgsFQ/H3gCOo7SWXsPrHSH1LHHc9Fbpvs5xXVqr+Pmvmlhd3l7Kfpt5L
 b/ex7vXvJV4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="402251221"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 24 Aug 2020 01:42:02 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 24 Aug 2020 11:42:01 +0300
Date:   Mon, 24 Aug 2020 11:42:01 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: acpi: Remove dead code, i.e.
 i2c_acpi_match_device()
Message-ID: <20200824084201.GA1375436@lahna.fi.intel.com>
References: <20200821170334.43555-1-andriy.shevchenko@linux.intel.com>
 <20200821170334.43555-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821170334.43555-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 21, 2020 at 08:03:34PM +0300, Andy Shevchenko wrote:
> We have no users of i2c_acpi_match_device() anymore and seems
> will not have them in the future, thus remove dead code.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
