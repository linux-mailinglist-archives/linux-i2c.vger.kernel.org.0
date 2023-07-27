Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 366AB7651A2
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 12:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbjG0Ktl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 06:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjG0Ktk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 06:49:40 -0400
Received: from mgamail.intel.com (unknown [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126841B0;
        Thu, 27 Jul 2023 03:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690454980; x=1721990980;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=57mYT2f2RrP9FiodEMMr76QgapJHPnR1nBjKTCXuo1A=;
  b=Bi/vMRdkZVZxLAFy/AyZsxOHd1O385HsZNSAUgBSEPgCtl7NJ0bMrHZP
   2ZDvMMzxANjrls/b06H6teoDo082hcbTAnFN08R/SZm++EKRk5O8NvjKZ
   641xVzMzR2X0Nk86/B6H15JrKvbxliXPJdtmC+Lxt47kwglDK8PGPoHaq
   nAmMljOxBijv9XtvfIcuxgwPhC1x07I8CM6o4/D1SMblws0KZyZRBww4w
   iKngxMPJcWq0f8VDAaloV1SszdfKHsCF9v5tWYOROKDrnjDsEjg75pqoD
   FlVw8/iVZhn1XIShnNmPiBvaCloY7QKrpOuYZ1OxRFVnzBILY1ZaT+2Kk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358278571"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="358278571"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 03:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="677111514"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="677111514"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by orsmga003.jf.intel.com with ESMTP; 27 Jul 2023 03:49:36 -0700
Message-ID: <d1ec82a2-5c16-c3dd-147f-1e5256acffcd@linux.intel.com>
Date:   Thu, 27 Jul 2023 13:49:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] i2c: designware: Handle invalid SMBus block data
 response length value
Content-Language: en-US
To:     Tam Nguyen <tamnguyenchi@os.amperecomputing.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        stable@vger.kernel.org
References: <20230726080001.337353-1-tamnguyenchi@os.amperecomputing.com>
 <20230726080001.337353-3-tamnguyenchi@os.amperecomputing.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230726080001.337353-3-tamnguyenchi@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/26/23 11:00, Tam Nguyen wrote:
> In the I2C_FUNC_SMBUS_BLOCK_DATA case, the invalid length byte value
> (outside of 1-32) of the SMBus block data response from the Slave device
> is not correctly handled by the I2C Designware driver.
> 
> In case IC_EMPTYFIFO_HOLD_MASTER_EN==1, which cannot be detected
> from the registers, the Master can be disabled only if the STOP bit
> is set. Without STOP bit set, the Master remains active, holding the bus
> until receiving a block data response length. This hangs the bus and
> is unrecoverable.
> 
> Avoid this by issuing another dump read to reach the stop condition when
> an invalid length byte is received.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
