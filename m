Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6454ABE78
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 13:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383466AbiBGMJ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 07:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382439AbiBGLTK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 06:19:10 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE28C0401C4;
        Mon,  7 Feb 2022 03:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644232750; x=1675768750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kKcu7RU9yRPj0IKWBTOxXLSq9oagyXhvHD/FJX/JvtY=;
  b=i4lsAfo3OiQ2dSaEEeLYQ29MiAhpjpfKCdCSPX0WH2bwkVxd2qHxNHeY
   +Oi+WoXJi6fOGAbG17lxkHDGohNAaIxd1kSRLYNvd53+WT1LeaPEUy0dt
   BfDJW4JJ5q7dIHJioAP/Wtamx1tKClLjXJFvmY9G23lORWYL5P58ncRAB
   5k3gUHZzhV4egD4edubZAU8co/Rb8bRJUGD+AgUdd6ni4j5x3BWAJWVhP
   WlOUrcEcT+cw6hcj4Bd79mIJP37hGvbu1pjoxV0pSGE5GvcZ8hHD89jW/
   328pvX65K6omXSxo6FN9abzIePbEdCD1Mr0aGU4wWAG1RS7q9Q9cvKCZr
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248906184"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="248906184"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 03:18:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="700430362"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 03:18:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nH21l-001sOb-JB;
        Mon, 07 Feb 2022 13:17:49 +0200
Date:   Mon, 7 Feb 2022 13:17:49 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, prime.zeng@hisilicon.com,
        linuxarm@huawei.com
Subject: Re: [PATCH 1/2] i2c: hisi: Add generic GPIO bus recovery support
Message-ID: <YgD/3Xi0yLPHCu+L@smile.fi.intel.com>
References: <20220125124930.50369-1-yangyicong@hisilicon.com>
 <20220125124930.50369-2-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125124930.50369-2-yangyicong@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 25, 2022 at 08:49:29PM +0800, Yicong Yang wrote:
> Add generic GPIO bus recovery support for i2c-hisi driver
> by registering the recovery information with core provided
> i2c_generic_scl_recovery() method.
> 
> As the SCL/SDA pins are multiplexed with GPIO, we need to
> switch the pins mux to GPIO before recovery and switch back
> after recovery. It's implemented by the ACPI method in
> the i2c_bus_recovery_info->{prepare,unprepare}_recovery()
> method.

NAK.

ACPI has its own resources for that. What is missed is the layer between ACPI
and pin control.

-- 
With Best Regards,
Andy Shevchenko


