Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7940A4A0151
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 21:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347171AbiA1UCX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 15:02:23 -0500
Received: from mga04.intel.com ([192.55.52.120]:18956 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245650AbiA1UCX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Jan 2022 15:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643400143; x=1674936143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XDrmYnVBSiMMmYRQWtq8crV165wPH0HVJ543wkoAGpE=;
  b=AlanSKm6BigKPsRV7IGKgQzOwj1LCIs64KwPWSbbmb683QLSv1O1UETg
   dhzUYvwTBjtlMXs0E7uxERz00xOU3JJxLfK1M/SB+OX4I9jM+bAKDvkGn
   NbDto4B22/iDOmEkYGs892jM/cSh+g4KRUD8+RaZG37Fwd8J3Foi+G4as
   59cxQOIZF68Cundh9nB2cfzQoKYPYkRIgcJ6q/fMWwBkrdFw7BKKCBo7n
   x68XJmNhNbnJQftrDx8aD5pv8Snd3eXcVxX3Xve1CDi8c1fBsKaGJLa0g
   sUJ8HpkGujsz56dUtIVOCdeNhRDgEWN01CZpAx2KvUltNMgjyouPHWvZW
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="246030520"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="246030520"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 12:01:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="564300747"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 12:01:36 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nDXQ7-00FYoH-Jd;
        Fri, 28 Jan 2022 22:00:31 +0200
Date:   Fri, 28 Jan 2022 22:00:31 +0200
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
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v3 8/8] i2c: i801: convert to use common P2SB accessor
Message-ID: <YfRLX/37xv1Sk5G5@smile.fi.intel.com>
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
 <20211221181526.53798-9-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221181526.53798-9-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 21, 2021 at 08:15:26PM +0200, Andy Shevchenko wrote:
> Since we have a common P2SB accessor in tree we may use it instead of
> open coded variants.
> 
> Replace custom code by pci_p2sb_bar() call.

Wolfram, does this change makes sense to you?
Can you give your tag or comment?

-- 
With Best Regards,
Andy Shevchenko


