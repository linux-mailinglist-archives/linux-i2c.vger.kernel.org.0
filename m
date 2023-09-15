Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4AA97A14E7
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Sep 2023 06:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbjIOEzW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Sep 2023 00:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231911AbjIOEzV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Sep 2023 00:55:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3130F271B
        for <linux-i2c@vger.kernel.org>; Thu, 14 Sep 2023 21:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694753710; x=1726289710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=huc9vQnpTLK3Sk3DKoS8T1qpO1SevpOHQkQSQsQg6cc=;
  b=JAouv5FQPI2Axxdjf8MCwBihB7UfLjXR4Onf50hugOA0wEiVmcriGdJg
   FC0M7x4pFrEr4RjnKMeNQGwxRGIysXF8nKt7CHAv3MFMcXCflY7pRBNZZ
   C8n5WzLcQkuWk9gljgR2gv8201GjH+fSgQg+Qht2PGFUQr8Ilc9sAWjBC
   BgxFDJKJbNzvpN3tYLBv8J5uwcIihrUbPAbjHK3fgnf430862uguNkpoO
   10i9VFKEdAvHgMVpV+c3ppNel8MI9B7fBnlaqP4lC4J7HBSzbVhwP4t47
   xRf4zNPPkwJRgIUl0smZwKCdPydioJaO8gyasLHbHOOkra7lht6RWFcMS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="359414354"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="359414354"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 21:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="868547734"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="868547734"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 14 Sep 2023 21:55:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2E7A416E; Fri, 15 Sep 2023 07:55:04 +0300 (EEST)
Date:   Fri, 15 Sep 2023 07:55:04 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Matt Fleming <matt.fleming@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] i2c: i801: unregister tco_pdev in i801_probe() error path
Message-ID: <20230915045504.GN1599918@black.fi.intel.com>
References: <458b1c8b-1885-6583-f45d-7548ce65bb33@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <458b1c8b-1885-6583-f45d-7548ce65bb33@gmail.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 14, 2023 at 11:08:44PM +0200, Heiner Kallweit wrote:
> We have to unregister tco_pdev also if i2c_add_adapter() fails.
> 
> Fixes: 9424693035a5 ("i2c: i801: Create iTCO device on newer Intel PCHs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
