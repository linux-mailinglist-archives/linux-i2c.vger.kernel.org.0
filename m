Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921BE44DA19
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 17:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234215AbhKKQQu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 11:16:50 -0500
Received: from mga11.intel.com ([192.55.52.93]:5694 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234183AbhKKQQt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:49 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="230400557"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; 
   d="scan'208";a="230400557"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 08:13:59 -0800
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; 
   d="scan'208";a="670289533"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 08:13:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mlChq-005nc2-Vg;
        Thu, 11 Nov 2021 18:13:42 +0200
Date:   Thu, 11 Nov 2021 18:13:42 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     huangbibo <huangbibo@uniontech.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        p.zabel@pengutronix.de
Subject: Re: [PATCH] i2c: designware: I2C unexpected interrupt handling will
 cause kernel panic
Message-ID: <YY1BNpKIbVVwf7F1@smile.fi.intel.com>
References: <20211111065759.7423-1-huangbibo@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111065759.7423-1-huangbibo@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 11, 2021 at 02:57:59PM +0800, huangbibo wrote:
> I2C interrupts may be triggered unexpectedly,

> such as programs that directly access I2C registers,

Wow! What programs you are talking about? How comes they are doing this
weirdness in parallel with the OS running?

Can you elaborate, please?

> bus conflicts caused by hardware design defects, etc.
> These can cause null pointer reference errors and kernel panic.

-- 
With Best Regards,
Andy Shevchenko


