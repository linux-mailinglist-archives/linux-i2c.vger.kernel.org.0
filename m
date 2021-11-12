Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2267944E48B
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 11:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234844AbhKLK3S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 05:29:18 -0500
Received: from mga02.intel.com ([134.134.136.20]:35250 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234675AbhKLK3R (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Nov 2021 05:29:17 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="220321710"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="220321710"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2021 02:26:26 -0800
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="453113481"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2021 02:26:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mlTl8-0063lg-Ow;
        Fri, 12 Nov 2021 12:26:14 +0200
Date:   Fri, 12 Nov 2021 12:26:14 +0200
From:   "andriy.shevchenko" <andriy.shevchenko@linux.intel.com>
To:     =?utf-8?B?6buE56Kn5rOi?= <huangbibo@uniontech.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "mika.westerberg" <mika.westerberg@linux.intel.com>,
        "p.zabel" <p.zabel@pengutronix.de>
Subject: Re: [PATCH] i2c: designware: I2C unexpected interrupt handling will
 cause kernel panic
Message-ID: <YY5BRrE8bLyvd3PB@smile.fi.intel.com>
References: <20211111065759.7423-1-huangbibo@uniontech.com>
 <0f203acf-7f63-e2d0-b590-120d3a7ba9c5@linux.intel.com>
 <tencent_48E4F3B231317FCA25752384@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_48E4F3B231317FCA25752384@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 12, 2021 at 03:35:07AM +0000, 黄碧波 wrote:
> Hi Andy,

First of all, please fix your email client (it mangled the message
in a bad way) and do not top post!

> This patch is to make the kernel more stable &amp; stronger,
> Even if there is an unexpected I2C interrupt, kernel will not crash

As far as I can see this is, as Jarkko said, the change to hide the real issue.

> Let me elaborate on this issue:
> The BIOS support EFI RTC feature and add the I2C bus descr in the ACPI table (RTC chip is connected to I2C bus), The OS matches and registers the I2C bus driver.
> 
> When OS get RTC time by BIOS interface (Runtime Server), crash occurs.
> The&nbsp; BIOS interface direct acces registers to sends and receives data, which conflicts with the&nbsp; I2C driver
> 
> This is a BIOS error and the root cause of this issue. The final solution is to delete the I2C device node in the ACPI table

Oh, yeah, yet another brain damaged design. If somebody wants to have driver of
the I²C peripheral in the ASL, it's not gonna work in Linux (in 99.99% cases).

What you should do is go and fix BIOS that it won't do two things together, i.e.
ASL based driver and exposure of I²C host controller in ACPI.

On the constructive way, you need to use DMI quirks and somehow make EFI and
I²C code to be communicating nicely in the kernel.

The patch makes no sense to me, the problem is obviously somewhere else.

NAK.

> &nbsp;
> &nbsp;
> ------------------&nbsp;Original&nbsp;------------------
> From: &nbsp;"Jarkko Nikula"<jarkko.nikula@linux.intel.com&gt;;
> Date: &nbsp;Thu, Nov 11, 2021 02:06 PM
> To: &nbsp;"huangbibo"<huangbibo@uniontech.com&gt;; "linux-i2c"<linux-i2c@vger.kernel.org&gt;; 
> Cc: &nbsp;"linux-kernel"<linux-kernel@vger.kernel.org&gt;; "mika.westerberg"<mika.westerberg@linux.intel.com&gt;; "andriy.shevchenko"<andriy.shevchenko@linux.intel.com&gt;; "p.zabel"<p.zabel@pengutronix.de&gt;; 
> Subject: &nbsp;Re: [PATCH] i2c: designware: I2C unexpected interrupt handling will cause kernel panic
> 
> &nbsp;
> 
> Hi
> 
> On 11/11/21 8:57 AM, huangbibo wrote:
> &gt; I2C interrupts may be triggered unexpectedly,
> &gt; such as programs that directly access I2C registers,
> &gt; bus conflicts caused by hardware design defects, etc.
> &gt; These can cause null pointer reference errors and kernel panic.
> &gt; 
> &gt; kernel log:
> &gt; [&nbsp;&nbsp; 52.676442] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> &gt; ...
> &gt; [&nbsp;&nbsp; 52.816536] Workqueue: efi_rts_wq efi_call_rts
> &gt; [&nbsp;&nbsp; 52.820968] pstate: 60000085 (nZCv daIf -PAN -UAO)
> &gt; [&nbsp;&nbsp; 52.825753] pc : i2c_dw_isr+0x36c/0x5e0 [i2c_designware_core]
> &gt; [&nbsp;&nbsp; 52.831487] lr : i2c_dw_isr+0x88/0x5e0 [i2c_designware_core]
> &gt; [&nbsp;&nbsp; 52.837134] sp : ffff8020fff17650
> &gt; [&nbsp;&nbsp; 52.924451] Call trace:
> &gt; [&nbsp;&nbsp; 52.926888]&nbsp; i2c_dw_isr+0x36c/0x5e0 [i2c_designware_core]
> &gt; ...
> &gt; [&nbsp;&nbsp; 52.957394]&nbsp; gic_handle_irq+0x7c/0x178
> &gt; [&nbsp;&nbsp; 52.961130]&nbsp; el1_irq+0xb0/0x140
> &gt; [&nbsp;&nbsp; 52.964259]&nbsp; 0x21291d30
> &gt; [&nbsp;&nbsp; 52.983729]&nbsp; 0x21160938
> &gt; [&nbsp;&nbsp; 52.986164]&nbsp; __efi_rt_asm_wrapper+0x28/0x44
> &gt; [&nbsp;&nbsp; 52.990335]&nbsp; efi_call_rts+0x78/0x448
> &gt; [&nbsp;&nbsp; 53.019021] Kernel panic - not syncing: Fatal exception in interrupt

-- 
With Best Regards,
Andy Shevchenko


