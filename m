Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD2E4A0C9
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2019 14:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbfFRM3J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jun 2019 08:29:09 -0400
Received: from mga04.intel.com ([192.55.52.120]:2410 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbfFRM3J (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jun 2019 08:29:09 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 05:29:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,389,1557212400"; 
   d="scan'208";a="181384458"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 18 Jun 2019 05:29:05 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 18 Jun 2019 15:29:05 +0300
Date:   Tue, 18 Jun 2019 15:29:05 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v4] i2c: mux/i801: Switch to use descriptor passing
Message-ID: <20190618122905.GK2640@lahna.fi.intel.com>
References: <20190618105833.31933-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618105833.31933-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 18, 2019 at 12:58:33PM +0200, Linus Walleij wrote:
> This switches the i801 GPIO mux to use GPIO descriptors for
> handling the GPIO lines. The previous hack which was reaching
> inside the GPIO chips etc cannot live on. We pass descriptors
> along with the GPIO mux device at creation instead.
> 
> The GPIO mux was only used by way of platform data with a
> platform device from one place in the kernel: the i801 i2c bus
> driver. Let's just associate the GPIO descriptor table with
> the actual device like everyone else and dynamically create
> a descriptor table passed along with the GPIO i2c mux.
> 
> This enables simplification of the GPIO i2c mux driver to
> use only the descriptor API and the OF probe path gets
> simplified in the process.
> 
> The i801 driver was registering the GPIO i2c mux with
> PLATFORM_DEVID_AUTO which would make it hard to predict the
> device name and assign the descriptor table properly, but
> this seems to be a mistake to begin with: all of the
> GPIO mux devices are hardcoded to look up GPIO lines from
> the "gpio_ich" GPIO chip. If there are more than one mux,
> there is certainly more than one gpio chip as well, and
> then we have more serious problems. Switch to
> PLATFORM_DEVID_NONE instead. There can be only one.
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
