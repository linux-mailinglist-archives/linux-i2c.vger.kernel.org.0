Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E65947FAA2
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Dec 2021 07:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbhL0Gtt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Dec 2021 01:49:49 -0500
Received: from mga01.intel.com ([192.55.52.88]:60364 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229490AbhL0Gtt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Dec 2021 01:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640587789; x=1672123789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DdDGXc2F7CYN9wfJUMRNMmlJCgC3nyXppiE6EdDZFFg=;
  b=LY2BQGbnizIOFI8gHKpAbCfe1J/1CsPUeahRsUIbHiomOqglLytpmV+S
   KODwrnXe8Z4Wmdm7LDqn2au81S4aPq2MG3xg7zhI20U84TQmetGeopLt2
   9fMMU9TPSoiL5KsKKrNOyFwSuQbzJFfHvWedj8dJci+bQnkRF7zrWibqF
   bo+XixYexi6gUwmI9DEX8UzWfXRnccdkxFODRZHAF151sVCJeOsaHW6UM
   UOs9uAHPmVxfXYz62l7fCZiSsfwnyRj1HT8giY5lG2FFpSqp94pmnZ3sE
   3u62N3IhUBKCdbhl8CYOB/FckJhQyy75rQB1ZdSrXXmExqp3N9KXKIa4B
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="265391178"
X-IronPort-AV: E=Sophos;i="5.88,238,1635231600"; 
   d="scan'208";a="265391178"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2021 22:49:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,238,1635231600"; 
   d="scan'208";a="469640732"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2021 22:48:41 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 27 Dec 2021 08:48:32 +0200
Date:   Mon, 27 Dec 2021 08:48:32 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v3 4/8] pinctrl: intel: Check against matching data
 instead of ACPI companion
Message-ID: <YclhwMldCseidCCh@lahna>
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
 <20211221181526.53798-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221181526.53798-5-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 21, 2021 at 08:15:22PM +0200, Andy Shevchenko wrote:
> In some cases we may get a platform device that has ACPI companion
> which is different to the pin control described in the ACPI tables.
> This is primarily happens when device is instantiated by board file.
> 
> In order to allow this device being enumerated, refactor
> intel_pinctrl_get_soc_data() to check the matching data instead of
> ACPI companion.
> 
> Reported-by: Henning Schild <henning.schild@siemens.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
