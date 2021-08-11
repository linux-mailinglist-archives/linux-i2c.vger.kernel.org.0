Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 719823E9515
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 17:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233454AbhHKPx4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 11:53:56 -0400
Received: from mga09.intel.com ([134.134.136.24]:11189 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233456AbhHKPxX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 11:53:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="215136334"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="215136334"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 08:52:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="526982047"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 08:52:54 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mDqXA-008C4A-8n; Wed, 11 Aug 2021 18:52:48 +0300
Date:   Wed, 11 Aug 2021 18:52:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 8/9] i2c: i801: Improve
 register_dell_lis3lv02d_i2c_device
Message-ID: <YRPyUM/nGD3dQv9C@smile.fi.intel.com>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <3ce2ea87-809e-5999-e920-07ddd5fcc035@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ce2ea87-809e-5999-e920-07ddd5fcc035@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 06, 2021 at 11:18:05PM +0200, Heiner Kallweit wrote:
> - Use an initializer for struct i2c_board_info info
> - Use dmi_match()
> - Simplify loop logic

I'm wondering if changing this to a DMI match table will give better result.

Something like
(Sorry I forgot APIs, but plenty of examples are under PDx86: drivers/platform/x86):

struct dmi_..._id *id;

id = dmi_..._match();
if (!id) {
	pci_warn();
	return;
}

i2c_new_client_device(...);


-- 
With Best Regards,
Andy Shevchenko


