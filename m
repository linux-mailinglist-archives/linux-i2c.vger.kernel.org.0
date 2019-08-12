Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC808A2A6
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 17:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfHLPu3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 11:50:29 -0400
Received: from mga07.intel.com ([134.134.136.100]:5344 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725923AbfHLPu3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Aug 2019 11:50:29 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Aug 2019 08:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,378,1559545200"; 
   d="scan'208";a="193994327"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2019 08:49:51 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hxCZx-0000Kr-ML; Mon, 12 Aug 2019 18:49:49 +0300
Date:   Mon, 12 Aug 2019 18:49:49 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Ray Jui <ray.jui@broadcom.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Subject: Re: Please check your unreg_slave() callbacks!
Message-ID: <20190812154949.GO30120@smile.fi.intel.com>
References: <20190809110305.GA1143@ninjato>
 <20190812110301.GD30120@smile.fi.intel.com>
 <20190812143842.GA5804@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812143842.GA5804@kunai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 12, 2019 at 04:38:43PM +0200, Wolfram Sang wrote:
> 
> > I'm wondering if synchronize_irq() is enough. The free_irq() theoretically is
> > the best option, though I dunno which one suits in which cases better.
> 
> In which scenario do you think synchronize_irq() is not enough?

I think if the driver is using tasklets this is not enough. However, I might
miss the context in i2c case.

-- 
With Best Regards,
Andy Shevchenko


