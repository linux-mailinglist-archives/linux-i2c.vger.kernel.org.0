Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCCDA47D0A1
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 12:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244489AbhLVLPP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 06:15:15 -0500
Received: from mga02.intel.com ([134.134.136.20]:35056 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244469AbhLVLPL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Dec 2021 06:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640171711; x=1671707711;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=db1sx17QDaZa2BUBsB+jMc5FrPgUGSuAsy9wXBqkqK8=;
  b=TGYKejomT1PcEzrArn6tNvbwWhj86fZGq6jtbtfVgbsUi0oNiuRPfZx0
   2RFpdCxhzVocOnZC7wZ+kvCfJ1dNmKIpnLNTx5wELJA4tP+BwLhaezxIp
   iGpqQGkstwFAIaYR5dLYZZyw80bwMKB5xG5EhbFJ9326j76T7kGBU2eY+
   mlYMw1xiW5Q9I3l9mAJ0oHoE2lY62OLnwFOF0NM3MjtnwuIHB4fJg+hly
   THpVnXu6uibeC9QKnJPYszamPrssyOseBSH7audGJOTkQi1Iome94s4Yw
   qDBHlrfX6Eq3613UFnABSb7Y/oSmrwqejaD/LB+7G7IMMfwFCnQxX2Q93
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="227894642"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="227894642"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 03:15:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="664243692"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 03:15:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mzzYw-000jjn-PK;
        Wed, 22 Dec 2021 13:13:38 +0200
Date:   Wed, 22 Dec 2021 13:13:38 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
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
        platform-driver-x86@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v3 0/8] platform/x86: introduce p2sb_bar() helper
Message-ID: <YcMIYn+jV7ConPPE@smile.fi.intel.com>
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbLk1aHEaiumq3d4qmg007QtZcitmCwdyFyLxyY=H7MXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbLk1aHEaiumq3d4qmg007QtZcitmCwdyFyLxyY=H7MXQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 22, 2021 at 03:48:15AM +0100, Linus Walleij wrote:
> On Tue, Dec 21, 2021 at 7:21 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Please, comment on the approach and individual patches.
> 
> This approach looks reasonable to me so FWIW:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> for the series.

Thank you!

-- 
With Best Regards,
Andy Shevchenko


