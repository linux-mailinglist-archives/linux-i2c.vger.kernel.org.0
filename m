Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB5903B909C
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jul 2021 12:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235300AbhGAKrs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jul 2021 06:47:48 -0400
Received: from mga03.intel.com ([134.134.136.65]:15689 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229744AbhGAKrq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Jul 2021 06:47:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="208551649"
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; 
   d="scan'208";a="208551649"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2021 03:45:15 -0700
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; 
   d="scan'208";a="408887812"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2021 03:45:12 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lyuBv-006z0C-DF; Thu, 01 Jul 2021 13:45:07 +0300
Date:   Thu, 1 Jul 2021 13:45:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, yu1.wang@intel.com, shuo.a.liu@intel.com,
        conghui.chen@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YN2cs0H+5C892kM4@smile.fi.intel.com>
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 01, 2021 at 11:24:46AM +0800, Jie Deng wrote:
> Add an I2C bus driver for virtio para-virtualization.
> 
> The controller can be emulated by the backend driver in
> any device model software by following the virtio protocol.
> 
> The device specification can be found on
> https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.
> 
> By following the specification, people may implement different
> backend drivers to emulate different controllers according to
> their needs.

> 	- Use #ifdef CONFIG_PM_SLEEP to replace the "__maybe_unused".

Why is that?

-- 
With Best Regards,
Andy Shevchenko


