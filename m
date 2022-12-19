Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08E0650C78
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 14:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiLSNLG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 08:11:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbiLSNLD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 08:11:03 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483428FE7;
        Mon, 19 Dec 2022 05:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671455462; x=1702991462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cfu7nn7qs6yDdiRgwGy1GBfso8mGEh+ivNzLv4Ej808=;
  b=f+Sba0MMNn2rCv5/8OWnvycXOb0PMHYXrQP5LC5aAhHKoXrKRHeHB4nr
   3OVHaPg90bgTNpnBP+8XFlKr8dsL8frlMHcK7ROVlcWJih4w+EGg4VmTF
   T60QQ4gksMMgFQhtL8yHhTVf2dUSKQwami9qZ5ASZXG4L2WqWgN1XWADA
   wupJLtns8Ba89aGwDRgkoK7zbBNUOCj6hcP1krq8jW10sTH5qgg2bFEjG
   waaqX8W+BkvaVEdeNsiTkWzkPTCKJuWlqJvAZzF1ffE78bjGfDAPD72a5
   A2YR5G9rRb7YqzYhpupeyEmnNSjm9qaQNNyh0Mf4UjMBbZ7lEzU+C6dDn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="316980323"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="316980323"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 05:11:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="719105753"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="719105753"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 19 Dec 2022 05:10:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p7Fuz-00CIa0-2w;
        Mon, 19 Dec 2022 15:10:57 +0200
Date:   Mon, 19 Dec 2022 15:10:57 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Richard Fitzgerald <rf@opensource.cirrus.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, wsa@kernel.org, hdegoede@redhat.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v4] i2c: designware: Fix unbalanced suspended flag
Message-ID: <Y6Bi4Q9xyPd2Tc6k@smile.fi.intel.com>
References: <20221219130145.883309-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219130145.883309-1-rf@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 19, 2022 at 01:01:45PM +0000, Richard Fitzgerald wrote:
> Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
> i2c_mark_adapter_resumed().
> 
> dw_i2c_plat_resume() must always be called, so that
> i2c_mark_adapter_resumed() is called. This is not compatible with
> DPM_FLAG_MAY_SKIP_RESUME, so remove the flag.
> 
> Since the controller is always resumed on system resume the
> dw_i2c_plat_complete() callback is redundant and has been removed.
> 
> The unbalanced suspended flag was introduced by commit c57813b8b288
> ("i2c: designware: Lock the adapter while setting the suspended flag")
> 
> Before that commit, the system and runtime PM used the same functions. The
> DPM_FLAG_MAY_SKIP_RESUME was used to skip the system resume if the driver
> had been in runtime-suspend. If system resume was skipped, the suspended
> flag would be cleared by the next runtime resume. The check of the
> suspended flag was _after_ the call to pm_runtime_get_sync() in
> i2c_dw_xfer(). So either a system resume or a runtime resume would clear
> the flag before it was checked.
> 
> Having introduced the unbalanced suspended flag with that commit, a further
> commit 80704a84a9f8
> ("i2c: designware: Use the i2c_mark_adapter_suspended/resumed() helpers")

This is still unwrapped propertly, but no need to resend, it so minor, really.
Just a hint for the future submissions.

> changed from using a local suspended flag to using the
> i2c_mark_adapter_suspended/resumed() functions. These use a flag that is
> checked by I2C core code before issuing the transfer to the bus driver, so
> there was no opportunity for the bus driver to runtime resume itself before
> the flag check.

...

> ---
> Changes from v3:
> - Fixed wrapping in commit description. No code changes

Thank you, but see the above :-)

-- 
With Best Regards,
Andy Shevchenko


