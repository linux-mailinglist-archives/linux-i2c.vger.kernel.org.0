Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69A52CBC50
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 13:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgLBMDk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 07:03:40 -0500
Received: from mga09.intel.com ([134.134.136.24]:22711 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbgLBMDk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 07:03:40 -0500
IronPort-SDR: OmFzxEylQUk4OHykfPKy1R7AMYlMQUYO4ma0s/AzKa37RUtjX50tiUmYMHVtYzoT1pqU5bgfci
 Oj0vd77j3q7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="173162685"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="173162685"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 04:01:58 -0800
IronPort-SDR: zEt0GWiSR2TPU57vUg4u1xKU7CcuguoJ8GjgLwL9VhlGNku89SG+rgMRNmMggsu6t9y3QtSwV5
 4pxlzuzIoxMg==
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="330415081"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 04:01:51 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkQqR-00BV9k-Gr; Wed, 02 Dec 2020 14:02:51 +0200
Date:   Wed, 2 Dec 2020 14:02:51 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 13/18] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201202120251.GB4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-14-djrscally@gmail.com>
 <20201130170955.GN14465@pendragon.ideasonboard.com>
 <b5cc6bbd-f679-7023-fde0-de2acb65a3c2@gmail.com>
 <20201201223053.GB4569@pendragon.ideasonboard.com>
 <20201202103851.GC852@paasikivi.fi.intel.com>
 <cb68e265-0e6c-4079-e835-f004e6a46dfb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb68e265-0e6c-4079-e835-f004e6a46dfb@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 02, 2020 at 10:53:05AM +0000, Dan Scally wrote:
> On 02/12/2020 10:38, Sakari Ailus wrote:

...

> >>> Argh, thanks, this is the curse of using VS code on multiple machines...
> >> I recommend vim ;-)
> > What is VS code? Very Serious Code?
> 
> Visual Studio Code - it has some nice features, but the
> facepalm-to-productivity ratio is a bit high.

Perhaps you can submit an issue report on GitHub. I found VS Code pretty nice
to be with Linux kernel development.

-- 
With Best Regards,
Andy Shevchenko


