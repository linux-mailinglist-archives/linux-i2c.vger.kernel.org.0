Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D38954FB78
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jun 2022 18:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbiFQQvC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jun 2022 12:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234704AbiFQQue (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jun 2022 12:50:34 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92D256779;
        Fri, 17 Jun 2022 09:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655484594; x=1687020594;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WMJ5d5awbKL0dMnI96913C+jxgBE/ZRcvA/34CvVE3E=;
  b=NW7OJacWFoymg3duGIfdRNcjgsEVANxgsiMDzt/J+fkJ2s7iZ/oWUNxr
   SxUgXC4NFKhD7tueIa809rj+uV/J4xvmQ+kOMMLM0z6AFp+z0GdWV3re4
   3z5YlBM7uS8P89e8v0+1h6lo1Enh+DhinUrxTmg3POKfTIyOywA8WevZf
   nmYbW2OiwwVu+HHa2r8f5m2qXXngGhzDsHrdpk87pSqW+w1DvGa4DglBk
   eLsSuzh8sJ62N27mDriHVw9DcbMLe7ee/N5GYk0HcMHulbcfon2A5tFah
   T4SSxrvpZUPPHuDqauI670LJrnOZHDjVz/CyX/gd2S6opEf2uWMdsmhrx
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259938390"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="259938390"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 05:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="675475753"
Received: from mylly.fi.intel.com (HELO [10.237.72.55]) ([10.237.72.55])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2022 05:59:43 -0700
Message-ID: <f8647bec-eca7-b318-4f79-bc4bae721004@linux.intel.com>
Date:   Fri, 17 Jun 2022 15:59:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCHv5 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Content-Language: en-US
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220616141230.858409-1-dinguyen@kernel.org>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220616141230.858409-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 6/16/22 17:12, Dinh Nguyen wrote:
> The I2C pins on the SoCFPGA platforms do not go through a GPIO module,
> thus cannot be recovered by the default method of by doing a GPIO access.
> Only a reset of the I2C IP block can a recovery be successful.
> 
One thing what is unclear to me how does this release the I2C slave that 
potentially keeps the SDA stuck low. Does platform specific reset 
sequence send 9 SCL pulses, toggle HW reset of the clients or cycle 
power of them?

If recovery is only controller point of view then worth to emphasis it 
in the commit log and perhaps add a comment too into 
i2c_socfpga_scl_recovery(). Some might hit an issue that I2C client is 
stuck and wonder why recovery won't work.

> The assignment of the recover_bus needs to get done before the call to
> devm_gpiod_get_optional(), otherwise, the assignment is not taking place
> because of an error after returning from devm_gpiod_get_optional().
> 
This sentence no longer true after v3?

Otherwise code looks good to me.

Jarkko
