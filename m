Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B39889C40
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 13:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbfHLLDG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 07:03:06 -0400
Received: from mga09.intel.com ([134.134.136.24]:43477 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727846AbfHLLDG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Aug 2019 07:03:06 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Aug 2019 04:03:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,377,1559545200"; 
   d="scan'208";a="177444606"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga007.fm.intel.com with ESMTP; 12 Aug 2019 04:03:03 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hx86P-0005fN-9v; Mon, 12 Aug 2019 14:03:01 +0300
Date:   Mon, 12 Aug 2019 14:03:01 +0300
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
Message-ID: <20190812110301.GD30120@smile.fi.intel.com>
References: <20190809110305.GA1143@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809110305.GA1143@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 09, 2019 at 01:03:05PM +0200, Wolfram Sang wrote:
> Hi all,
> 
> Krzysztof Adamski kindly made me aware of a race condition that most
> 'unreg_slave' callbacks have. Quote:
> 
> "BTW, I have added this synchronize_irq() in unreg_slave callback just to
> make sure it is save to set idev->slave to NULL already. Most of the
> controllers do not have such a guard and I'm wondering why that wouldn't
> be a problem for them. Like the i2c-rcar.c - isn't there a small race
> condition if some slave interrupt triggers just before ICSIER is cleared
> and somehow does not finish before priv->slave is set to NULL? This is
> the situation I was afraid of and tried to solve by using this
> synchronize_irq()."
> 
> I have fixed the rcar and emev2 drivers now. From a glimpse, the at91,
> designware, iproc, and stm32f7 are likely affected, too. Please check if
> that is the case and if you also need 'synchronize_irq' or spinlocks to
> protect the pointer to the slave. Let's hope I managed to get all
> relevat people to CC.

I'm wondering if synchronize_irq() is enough. The free_irq() theoretically is
the best option, though I dunno which one suits in which cases better.

-- 
With Best Regards,
Andy Shevchenko


