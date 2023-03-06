Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCD966ABFF7
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Mar 2023 13:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbjCFMzd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Mar 2023 07:55:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbjCFMzc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Mar 2023 07:55:32 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B932C2B630;
        Mon,  6 Mar 2023 04:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678107331; x=1709643331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N3bME327kRn6eVQW6WyWwP3Z0p6q478WVPYcFPJ0SGs=;
  b=HDjENVuzDlLt+G+QD2xqhjq4Mr4NQb94Wk4NgXNB3YCZf0W6IejkorMT
   JolnqNR0zu5VrTr6pydbU3NtIEpIiOf+5Tszw5jbSFHOmiNdlZI66AZD4
   cs0Dz4h0oQPXP2Y7UMhvyR6PUjbAo8pYJogdh7ZfRCK9Ql3uzDLGb+HRp
   PBddTWbGkEkExpEPHqY03UiNYlJ4/nymXiNkibn0FxEH6JuwbmNscd9sO
   mK2ty7m45i00Lx/LNECenW3GD5ol4AYWlYlYwOPI+Hgi7lepnIeICLsxc
   7/P0gbmd1eI7of9+AhaVN0WetmduqrBPToNqyPDsuz9lfD7zFxdyWhL7p
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="319372315"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="319372315"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 04:55:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="765208080"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="765208080"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Mar 2023 04:55:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZAND-00GMCg-0G;
        Mon, 06 Mar 2023 14:55:27 +0200
Date:   Mon, 6 Mar 2023 14:55:26 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>, Rijo-john.Thomas@amd.com,
        Thomas.Lendacky@amd.com, herbert@gondor.apana.org.au,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 9/9] i2c: designware: Add support for AMDI0020 ACPI ID
Message-ID: <ZAXiviOdddEK/Pak@smile.fi.intel.com>
References: <20230303165050.2918-1-mario.limonciello@amd.com>
 <20230303165050.2918-10-mario.limonciello@amd.com>
 <ZAXWzMFBjo57UUa+@smile.fi.intel.com>
 <0a872110-3f38-0744-17f1-74de3e78f84d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a872110-3f38-0744-17f1-74de3e78f84d@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 06, 2023 at 02:28:05PM +0200, Jarkko Nikula wrote:
> On 3/6/23 14:04, Andy Shevchenko wrote:
> > On Fri, Mar 03, 2023 at 10:50:47AM -0600, Mario Limonciello wrote:
> > > Cezanne and Skyrim have the same PSP hardware but use a different
> > > protocol to negotiate I2C arbitration. To disambiguate this going
> > > forward introduce a new ACPI ID to represent the protocol that utilizes
> > > a doorbell.

...

> > > -	if (boot_cpu_data.x86 == 25 && boot_cpu_data.x86_model == 80)
> > 
> > Ah, in this form it's getting better than I thought!
> > 
> These removed lines were added by previous patch. I think a bit too short
> lived if the same patchset adds and then removes lines?

That what I have missed. Okay, coming to square 1, i.e. dropping CPU ID
completely from the series.

Note, for testing purposes you may always add a HACK patch at the end of the
series, marking it respectively. So, people may test it all and maintainer
apply w/o unneeded tail.

-- 
With Best Regards,
Andy Shevchenko


