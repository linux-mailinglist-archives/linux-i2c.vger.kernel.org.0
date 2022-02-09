Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF9464AF536
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 16:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235803AbiBIP2c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 10:28:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235504AbiBIP2b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 10:28:31 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD20C0613C9;
        Wed,  9 Feb 2022 07:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644420515; x=1675956515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BfdMQRhUm+aalOSFCbFowijlAV6V+19pLIrURpEARr4=;
  b=gMLJ0lK4mMV2vdxQiaptbA5CzWsEHQEsV4Rj0+cifmEmTDb9f3GWp9JN
   GjQu13prkOndy3ae8tvAWRGMm2TK6ykkTxWuO4SnotQ8bjFSiuDyW+0IA
   WBpM9RlcXBI4zqxi92t/De+b/vUkVjcxkhESBu5eOeevtiDULAtvvATHT
   xzVJAbJ8ZGBEbwqKUXhBRJHTPG8MTNMzzfYBdnvH2bK6NuVtd8VwqAEO3
   kCpImw/GrpTqWcLe1CQMDArAXylXqIn2uFFqGZiLmG4zkDakL0zBVXH6I
   sw/SXwlZ3hrXiA2fVpNcu8MkM3Q46jtArFlPmCinJqNzor1HkNNhGwsNh
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="335629245"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="335629245"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 07:28:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="633251571"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 07:28:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nHosW-002ehw-0y;
        Wed, 09 Feb 2022 17:27:32 +0200
Date:   Wed, 9 Feb 2022 17:27:31 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        hdegoede@redhat.com, wsa@kernel.org, rrangel@chromium.org,
        mw@semihalf.com, jaz@semihalf.com, upstream@semihalf.com,
        thomas.lendacky@amd.com, alexander.deucher@amd.com,
        Nimesh.Easow@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH v4 2/2] i2c: designware: Add AMD PSP I2C bus support
Message-ID: <YgPdYw6hDoN198Hf@smile.fi.intel.com>
References: <20220208141218.2049591-1-jsd@semihalf.com>
 <20220208141218.2049591-3-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208141218.2049591-3-jsd@semihalf.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 08, 2022 at 03:12:18PM +0100, Jan Dabros wrote:

...

I have noticed code duplication.

> +	status = psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
> +	if (status) {
> +		if (status == -ETIMEDOUT)
> +			dev_err(psp_i2c_dev, "Timed out waiting for PSP to release I2C bus\n");
> +		else
> +			dev_err(psp_i2c_dev, "PSP communication error\n");
> +
> +		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
> +		psp_i2c_mbox_fail = true;
> +		goto cleanup;
> +	}

> +	/* Send a release command to PSP */
> +	status = psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
> +	if (status) {
> +		if (status == -ETIMEDOUT)
> +			dev_err(psp_i2c_dev, "Timed out waiting for PSP to acquire I2C bus\n");
> +		else
> +			dev_err(psp_i2c_dev, "PSP communication error\n");
> +
> +		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
> +		psp_i2c_mbox_fail = true;
> +		goto cleanup;
> +	}

If you are going to update the series, consider to introduce a common helper.
Otherwise, consider a follow up.

-- 
With Best Regards,
Andy Shevchenko


