Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C832E69032C
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 10:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjBIJRz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 04:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjBIJRu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 04:17:50 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BEB5EFBA;
        Thu,  9 Feb 2023 01:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675934263; x=1707470263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EvLzQgkzdk7aDWv2rfChiSTaNUqGXqwhhLY/PvofPvU=;
  b=AulXuXVVWJDmX8TiEuhn7dPeD5scFoI75l7YMNWAcUbIPz/8Q8eJnBrw
   PfmCAoCIlrDajY9RtNljiUS4QsT8SBAs5s4/IBaWDeTE2b5eO9/NgEyfk
   RKkbA5TEWWCnThP/gfSSPF45NVRCutB2llGAtFKKNu+v9gOJ6yS/Nc8Ag
   QN/y/NLp+p6/edh9P99tM/PDQP/frS4tVWvJWuuH5CJ96e1NOkNw9a9+Z
   IakVyTTJXbjrpiWRh+F8UOFamBt6O7NtpyjsTCw1RF995b0N4aafsednj
   UZ0gUuNACV6YkbXEuMRpcwB7/DQaiqQslyli4PsU+jxv7A103RIXKMK/H
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="357462365"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="357462365"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 01:17:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="731192154"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="731192154"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 09 Feb 2023 01:17:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 653181C5; Thu,  9 Feb 2023 11:18:19 +0200 (EET)
Date:   Thu, 9 Feb 2023 11:18:19 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= 
        <amadeuszx.slawinski@linux.intel.com>
Cc:     Raul Rangel <rrangel@chromium.org>, Wolfram Sang <wsa@kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [RFC] i2c: core: Do not enable wakeup by default
Message-ID: <Y+S6Wz5P/dMG8I8g@black.fi.intel.com>
References: <20230207072540.27226-1-mika.westerberg@linux.intel.com>
 <CAHQZ30Bzn1Lxy+Y2gCcFTmzWzwnxqUZAHAjSh67Pz=WweaKHkg@mail.gmail.com>
 <Y+NH9pjbFfmijHF+@black.fi.intel.com>
 <b429918f-fe63-2897-8ade-d17fe2e3646f@linux.intel.com>
 <Y+Nrhq9l6CIPjL7Z@black.fi.intel.com>
 <eadeb808-1925-164e-3e78-0f14c4f2bdc4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eadeb808-1925-164e-3e78-0f14c4f2bdc4@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, Feb 09, 2023 at 10:13:00AM +0100, Amadeusz Sławiński wrote:
> > > Well, I tried custom DSDT and had problems, but I just remembered that I
> > > probably need to pass "revision+1" in file, so kernel sees it as a newer
> > > version, let me try again. Is it enough to replace "ExclusiveAndWake" with
> > > "Exclusive"?
> > 
> > Yes, I think that should be enough.
> 
> And yes, it seems to work when I bump revision. So will use it as workaround
> for now and see about fixing BIOS.

Okay good to know, then I think we can forget this patch.
