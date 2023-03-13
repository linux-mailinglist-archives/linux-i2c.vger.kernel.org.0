Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65EE66B761A
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 12:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjCMLf3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 07:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbjCMLfW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 07:35:22 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F4323DAD;
        Mon, 13 Mar 2023 04:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678707304; x=1710243304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NY8qvYTr7xVntkMrD4cfbSK3BNhGq4p46TRzfLXOtqU=;
  b=n3nF0UiIWZa0I1DTplI/Ro9QjoSPM7uQREFf6q4DWsdAFx90hX1MaD2U
   ng7DFL2ZFhBRxb8lCIUKwBaAA5oW72+9G1SNLIDala5av44ssmzLuJe55
   aPSyLxlgAm+3FqsEgTWCoWk+bBG4uu/O+TM9Of/fHcunFBbXkFgYaj746
   dLUWmEpQoYMq9g3QaXkgyEp9uTOO2r8lORUa6FaOj3mye+kPOwjreExCa
   wBs5eF+RtWjwd7KVsqdlKkZQiJn24GaRT7pd0kjkLBeYHBLRAbdEj46C5
   kwttufS38WvANAR+1SKBYAOHWRhNQJIyG97MSg2PvnqIc+NdDJMIjkxRZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="337143881"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="337143881"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 04:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="681006841"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="681006841"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 13 Mar 2023 04:34:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pbgRd-002b96-0d;
        Mon, 13 Mar 2023 13:34:25 +0200
Date:   Mon, 13 Mar 2023 13:34:24 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>, Rijo-john.Thomas@amd.com,
        Thomas.Lendacky@amd.com, herbert@gondor.apana.org.au,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Felix.Held@amd.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 8/8] i2c: designware: Add doorbell support for Skyrim
Message-ID: <ZA8KQIeRUtAXbkTV@smile.fi.intel.com>
References: <20230310211954.2490-1-mario.limonciello@amd.com>
 <20230310211954.2490-9-mario.limonciello@amd.com>
 <b18aefc2-dd07-5356-0d19-b4783ed500e6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b18aefc2-dd07-5356-0d19-b4783ed500e6@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 13, 2023 at 12:29:50PM +0200, Jarkko Nikula wrote:
> On 3/10/23 23:19, Mario Limonciello wrote:

...

> > +	if (rdev->device == 0x1630)
> > +		_psp_send_i2c_req = psp_send_i2c_req_cezanne;
> > +	else
> > +		_psp_send_i2c_req = psp_send_i2c_req_skyrim;
> 
> Is there any possibility pci_get_domain_bus_and_slot() returns NULL? Or is
> 00:00.0 always present?

Theoretically it's possible in two cases (or more?):
1) no PCI support compiled;
2) no device found (PCI-less system).

-- 
With Best Regards,
Andy Shevchenko


