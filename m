Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B425E679833
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 13:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232999AbjAXMkO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 07:40:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232547AbjAXMkO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 07:40:14 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A40526847
        for <linux-i2c@vger.kernel.org>; Tue, 24 Jan 2023 04:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674564013; x=1706100013;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LP8sLQtm7hVoqWl7Apd2cvpEHRCmUm021zJLAh8uxMM=;
  b=LUqx2GQuUzGLR5SkqAaaUcquVzXnmO+bHdMOpdFUX/wBiV7BXeNc84vs
   1NdMx3a6HT7G2xlXbA2hfdMIQexaruajy82xcTwFfLfKRu1zuY+F31ZrB
   C6hSx8iSF+D1Gz4SxjUR1dywCf2qiisSIvQoLGjS1rJHiGEE4QYWbKsRo
   XVJAFlXxGdyvET+HpTdFCk4AoesA8g5ob/tfU7h6Et3M9GTraT71IusYs
   p9L50pNh/G51X3mp9kbcVN2lNkfl3yrDrT/sBy8/1GBbWrXJa9TD+t0SC
   WaFKU/3YBI/LDlXMJOoSwRRgvLJ/ZkQ6wPCGXBxWtSD/80daZ1Eh4IQ8l
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="390788182"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="390788182"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 04:40:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="786078102"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="786078102"
Received: from mylly.fi.intel.com (HELO [10.237.72.143]) ([10.237.72.143])
  by orsmga004.jf.intel.com with ESMTP; 24 Jan 2023 04:40:11 -0800
Message-ID: <27e53599-61be-7ae1-d41d-6e7eff4d4c51@linux.intel.com>
Date:   Tue, 24 Jan 2023 14:40:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH v4] i2c: designware: add a new bit check for IC_CON
 control
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Cc:     linux-i2c@vger.kernel.org
References: <20230124111127.1348054-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230124111127.1348054-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/24/23 13:11, Shyam Sundar S K wrote:
> On some AMD platforms, based on the new designware datasheet,
> BIOS sets the BIT(11) within the IC_CON register to advertise
> the "bus clear feature capability".
> 
> AMD/Designware datasheet says:
> 
> Bit(11) BUS_CLEAR_FEATURE_CTRL. Read-write,Volatile. Reset: 0.
> Description: In Master mode:
> - 1'b1: Bus Clear Feature is enabled.
> - 1'b0: Bus Clear Feature is Disabled.
> In Slave mode, this register bit is not applicable.
> 
> On AMD platform designs:
> 1. BIOS programs the BUS_CLEAR_FEATURE_CTRL and enables the detection
> of SCL/SDA stuck low.
> 2. Whenever the stuck low is detected, the SMU FW shall do the bus
> recovery procedure.
> 
> Currently, the way in which the "master_cfg" is built in the driver, it
> overrides the BUS_CLEAR_FEATURE_CTRL advertised by BIOS and the SMU FW
> cannot initiate the bus recovery if the stuck low is detected.
> 
> Hence add a check in i2c_dw_probe_master() that if the BIOS
> advertises the bus clear feature, let driver not ignore it and
> adapt accordingly.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
