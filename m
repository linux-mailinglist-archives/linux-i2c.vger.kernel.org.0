Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76322DFC7B
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Dec 2020 14:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgLUN5k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Dec 2020 08:57:40 -0500
Received: from mga07.intel.com ([134.134.136.100]:4546 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbgLUN5k (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Dec 2020 08:57:40 -0500
IronPort-SDR: /rLzeJWkXEZ6ELkplujq1VV4lh2W7ThXVPhAgPIRHddWD4zoUn0jFd4krttM86ni2e03dIe/GM
 UG8gb5N03i9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9841"; a="239811284"
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; 
   d="scan'208";a="239811284"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2020 05:55:54 -0800
IronPort-SDR: YVl5LJfTGP8aeKF1XQMe5FmC3wmzwJ2yqBEuTbbbNaoxifrJKH0tW0YFODeACCZjw4hiFbEGem
 N+377GS9Gr8Q==
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; 
   d="scan'208";a="343043289"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2020 05:55:51 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Dec 2020 15:55:49 +0200
Date:   Mon, 21 Dec 2020 15:55:49 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@infradead.org>
Subject: Re: [PATCH] i2c: i801: Fix the i2c-mux gpiod_lookup_table not being
 properly terminated
Message-ID: <20201221135549.GP5246@lahna.fi.intel.com>
References: <20201221134225.106728-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201221134225.106728-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 21, 2020 at 02:42:25PM +0100, Hans de Goede wrote:
> gpiod_add_lookup_table() expects the gpiod_lookup_table->table passed to
> it to be terminated with a zero-ed out entry.
> 
> So we need to allocate one more entry then we will use.
> 
> Cc: Serge Semin <fancer.lancer@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
