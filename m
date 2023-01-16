Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1784E66BA90
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 10:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbjAPJis (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 04:38:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232182AbjAPJij (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 04:38:39 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BE2C679
        for <linux-i2c@vger.kernel.org>; Mon, 16 Jan 2023 01:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673861918; x=1705397918;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yQ/ZS6csZGvtAv02FYb81prh/O2AQxt8aFQrJINJnd8=;
  b=I6XM7LJ39U68ZfOuyPxn2lsmm3TeTgqJ/jA06PdzWsTYUmthxrzkRbLn
   LWKZcP7DkMxrkN7fk7Ifp/GZQ5vJ3bP8RqfkRB88fejhxRRyPlgk23Stt
   ktNLMm3j3xz7aLCNvpq0tbSoTpLW8ICuzHTWoU1vPzQUeQsuISRCmZvjY
   +9StC5/Zybu2B4+MS6gHwBg4g21Mya9ICoOSc3rkCXceUdSsfs0PjrDMs
   RY+eBFZSbZOFNnb7/NSKah9sgj4/XdJiL8FP+Njm4eTJB+LZbaXrXsGJB
   isrS26pFnLdyD9ELxVSCik/SHY4HFwU0FGSLACK7KHaxYwV4y/VLoFwR4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="322120898"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="322120898"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 01:38:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="987741629"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="987741629"
Received: from mylly.fi.intel.com (HELO [10.237.72.61]) ([10.237.72.61])
  by fmsmga005.fm.intel.com with ESMTP; 16 Jan 2023 01:38:37 -0800
Message-ID: <59fbf54d-9bbc-efaa-bb2a-74880156e310@linux.intel.com>
Date:   Mon, 16 Jan 2023 11:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH] i2c: designware: add a new bit check for IC_CON control
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Cc:     linux-i2c@vger.kernel.org
References: <20230116043500.413499-1-Shyam-sundar.S-k@amd.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230116043500.413499-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 1/16/23 06:35, Shyam Sundar S K wrote:
> On some AMD platforms, based on the new designware datasheet,
> BIOS sets the BIT(11) within the IC_CON register to advertise
> the "bus clear feature capability".
> 
> Since the current driver implementation completely ignores what
> is advertised by BIOS, we just build the master_cfg and
> overwrite the entire thing into IC_CON during
> i2c_dw_configure_master().
> 
> Since, the bus clear feature is not enabled, sometimes there is
> no way to reset if the BIT(11) is not set.
> 
> AMD/Designware datasheet says:
> 
> Bit(11) BUS_CLEAR_FEATURE_CTRL. Read-write,Volatile. Reset: 0.
> Description: In Master mode:
> - 1'b1: Bus Clear Feature is enabled.
> - 1'b0: Bus Clear Feature is Disabled.
> In Slave mode, this register bit is not applicable.
> 
> Hence add a check in i2c_dw_configure_master() that if the BIOS
> advertises the bus clear feature, let driver not ignore it and
> adapt accordingly.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i2c/busses/i2c-designware-core.h   | 1 +
>   drivers/i2c/busses/i2c-designware-master.c | 5 +++++
>   2 files changed, 6 insertions(+)
> 
Is this change alone enough? I understood from the specification that 
the SCL/SDA stuck low timeout registers should be set and a bus recovery 
procedure (additional code) is required.

Jarkko
