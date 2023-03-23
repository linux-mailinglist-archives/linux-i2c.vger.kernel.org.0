Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8056A6C6928
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 14:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbjCWNKm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 09:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbjCWNKl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 09:10:41 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB54E7;
        Thu, 23 Mar 2023 06:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679577040; x=1711113040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SEiWb4Q6KJdpzyl0PbGH3F5TMxuxW2ELHAWHnMyMCNI=;
  b=QfqmPLp6anZ1smpOe6hbl4Z7fJxW+1RQY0oTVGbwYx1z+hO7hwaXuqNn
   ywLPb+L1yVZ/XcjqtH4zmSMesa4TR6n4QfQO4Q4Q/Npu8BNgznKChkLHR
   C/XI+M7QhspVO5OBnhZ/gKhhmEvT+YxEPFNumizmWPvR84odhd+oAQP+Z
   VTNNdnXsjpsaFNPKUMoShNHfdMbMh/UiU8BJP9xhkmXNCSfO0BhxrCPUW
   smKCfEMKyVCCxkA9lH/VOR8AK2HGIrNdCygDZrVnNSToTBQ+K5czItQc2
   IEGnTz68DR7a5WZTBdHjOOoC2CQIIU4Oh8ucKUZU7/A4Iybu4yfCEi7cj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341020180"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="341020180"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 06:06:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="746706038"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="746706038"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 06:06:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pfKdu-007W8w-0h;
        Thu, 23 Mar 2023 15:06:10 +0200
Date:   Thu, 23 Mar 2023 15:06:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/4] i2c: designware: Add doorbell support for
 Mendocino
Message-ID: <ZBxOwTggrZTvJf2H@smile.fi.intel.com>
References: <20230322210227.464-1-mario.limonciello@amd.com>
 <20230322210227.464-5-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322210227.464-5-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 22, 2023 at 04:02:26PM -0500, Mario Limonciello wrote:
> Mendocino and later platform don't use the platform feature mailbox for
> communication for I2C arbitration, they rely upon ringing a doorbell.
> 
> Detect the platform by the device ID of the root port and choose the
> appropriate method.

...

> -	ret = read_poll_timeout(psp_send_i2c_req_cezanne, status,
> +	ret = read_poll_timeout(_psp_send_i2c_req, status,
>  				(status != -EBUSY),

You can place it now in the above line, but up to you.

>  				PSP_I2C_REQ_RETRY_DELAY_US,
>  				PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_US,

...

> +	/* Cezanne uses platform mailbox, Mendocino and later use doorbell */
> +	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
> +	if (rdev->device == 0x1630)
> +		_psp_send_i2c_req = psp_send_i2c_req_cezanne;
> +	else
> +		_psp_send_i2c_req = psp_send_i2c_req_mendocino;

Where is pci_dev_put()?

-- 
With Best Regards,
Andy Shevchenko


