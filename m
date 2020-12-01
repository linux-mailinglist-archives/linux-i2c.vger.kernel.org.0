Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 295DF2CAB58
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 20:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392352AbgLATCr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 14:02:47 -0500
Received: from mga09.intel.com ([134.134.136.24]:28865 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388004AbgLATCq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Dec 2020 14:02:46 -0500
IronPort-SDR: kHKVMZ177Xjyd38ROHonB4THuBHuDXNNHVqZfN3GzYIlFTRJLEFCIv5tbQdAznbeJyHTO9gyJL
 1yHwn31Es79A==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="173047975"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="173047975"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 11:01:01 -0800
IronPort-SDR: tGFE7zu9R3jBry5iYfAFhFMcH6Xq8kfbvYyCxFwqADHJmXHi24BPQWpHUcSvgRd9tLbPENwJJ8
 nuHwzYech7FA==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="434787131"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 11:00:51 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkAuN-00BLFh-Ne; Tue, 01 Dec 2020 21:01:51 +0200
Date:   Tue, 1 Dec 2020 21:01:51 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <20201201190151.GN4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130205203.GQ4351@valkosipuli.retiisi.org.uk>
 <3e8494a0-a2c0-59e7-46bb-9635c3c239dd@gmail.com>
 <20201201064421.GR4351@valkosipuli.retiisi.org.uk>
 <2a548835-78c6-8fe3-cceb-1fc000707157@gmail.com>
 <20201201123244.GT4351@valkosipuli.retiisi.org.uk>
 <0f85d875-cac2-8273-d687-e5845f4c2bb8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f85d875-cac2-8273-d687-e5845f4c2bb8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 01, 2020 at 12:48:28PM +0000, Dan Scally wrote:
> On 01/12/2020 12:32, Sakari Ailus wrote:

...

> Sorry, clarification here: The INT3472 driver in patch #18 runs probe()
> for the device representing a physical tps68470, but then -EINVAL's. The
> existing tps68470 mfd driver doesn't probe() for the dummy INT3472 device.

As I said in the other subthread, we need to take ACPI ID from MFD and move it
to platform driver. I like the idea what Laurent proposed there.

-- 
With Best Regards,
Andy Shevchenko


