Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16BE947C5F8
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 19:10:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236977AbhLUSKi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 13:10:38 -0500
Received: from mga02.intel.com ([134.134.136.20]:29388 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236910AbhLUSKh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Dec 2021 13:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640110237; x=1671646237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5rAkGo7m3btbz/rVfCE7AaZjZ9uyiTmkMcIFoB+AHtw=;
  b=HRz7We4tjYDxmxn/m/qNkL4MlSekvmCG4y6J/KRUXUdDx2OIiiWzn4/V
   vmevis2iRe/7aflkySb4nnZhbN5NpVAjrVBX3qvjJfO+SuISoner5ZND/
   nZGOa4iLBm6MjyUCH8lfw4xxtQY7O1NiaX2zU3TVTRbRMI2TiJE7VfBlg
   YGXeBRa+OaNZcJz6wTMtJmZKqF7++RJoDDyip82ibe9S0PH8guNUCfKZT
   /BhBZtRQtpP3lKKb4xtDRyPnoriFLtpiOoMKTWTXLSlBFbXl70J+ibcYq
   l2EoZ2ZplJhgyEFfz26DEz1rzSymoJRURG03KGIoJUZrKJOlYcAEMixaC
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="227753031"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="227753031"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 09:50:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="586768160"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 09:50:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mzjG5-000WYP-OM;
        Tue, 21 Dec 2021 19:49:05 +0200
Date:   Tue, 21 Dec 2021 19:49:05 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v2 1/8] PCI: Introduce pci_bus_*() printing macros when
 device is not available
Message-ID: <YcITkYx6dnjRjdCd@smile.fi.intel.com>
References: <20211221173945.53674-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221173945.53674-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 21, 2021 at 07:39:38PM +0200, Andy Shevchenko wrote:
> In some cases PCI device structure is not available and we want to print
> information based on the bus and devfn parameters. For this cases introduce
> pci_bus_*() printing macros and replace in existing users.

Please, ignore this version (the code will be kept the same in v3, but what
is missed is cover letter and changelog).

I will send it as soon as I prepare the cover letter.

It also missed Henning in the Cc list.

-- 
With Best Regards,
Andy Shevchenko


