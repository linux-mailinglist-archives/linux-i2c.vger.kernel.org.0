Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDCF878DB29
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Aug 2023 20:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbjH3Sik (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Aug 2023 14:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243326AbjH3Kmy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Aug 2023 06:42:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5883B83;
        Wed, 30 Aug 2023 03:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693392172; x=1724928172;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YvbhLLjEvxspvvwFLcbNzIYMP/3JZ/zVIHYs3pSlMwE=;
  b=j9Gdw6bWY6/JvbH7EvVzcgLzSdMn1xnv9mBy8RNd85Dkey9iHDFlmGXv
   UGddeQKA7KiK5oqRjn2N7ujYdNdrqTo/t2BZ9jc+ZaFnBCxhk8dieCInJ
   C8O3jgvTA1d0E3f+UmCE5pQoExsluAYpY8ptKo0NyMX68gQDG/FOIcT5j
   g0hH/aR13wOT7CUsQVmQsrYLfWK9iCqn7IP+WBZVSSDM77xl7rdBlf/Oq
   596oUR9kXPsML6HsPa8Ff9wFTSrvP09KWIT2FcES2yGYT2ItX6pyv0Enm
   b469El6fgqwkmzA314ezn0IWg86Pk2vdGEuOAl/42r1G+yrJI71TtiraV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="461983201"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="461983201"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 03:42:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="742187521"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="742187521"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by fmsmga007.fm.intel.com with ESMTP; 30 Aug 2023 03:42:49 -0700
Message-ID: <483369c5-2042-486f-ad95-10bfb1adb444@linux.intel.com>
Date:   Wed, 30 Aug 2023 13:42:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: designware: fix __i2c_dw_disable() in case master
 is holding SCL low
Content-Language: en-US
To:     Yann Sionneau <ysionneau@kalray.eu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Borne <jborne@kalray.eu>
References: <20230822090233.14885-1-ysionneau@kalray.eu>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230822090233.14885-1-ysionneau@kalray.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 8/22/23 12:02, Yann Sionneau wrote:
> The DesignWare IP can be synthesized with the IC_EMPTYFIFO_HOLD_MASTER_EN
> parameter.
> In this case, when the TX FIFO gets empty and the last command didn't have
> the STOP bit (IC_DATA_CMD[9]), the controller will hold SCL low until
> a new command is pushed into the TX FIFO or the transfer is aborted.
> 
> When the controller is holding SCL low, it cannot be disabled.
> The transfer must first be aborted.
> Also, the bus recovery won't work because SCL is held low by the master.
> 
> Check if the master is holding SCL low in __i2c_dw_disable() before trying
> to disable the controller. If SCL is held low, an abort is initiated.
> When the abort is done, then proceed with disabling the controller.
> 
> This whole situation can happen for instance during SMBus read data block
> if the slave just responds with "byte count == 0".
> This puts the driver in an unrecoverable state, because the controller is
> holding SCL low and the current __i2c_dw_disable() procedure is not
> working. In this situation only a SoC reset can fix the i2c bus.
> 
> Co-developed-by: Jonathan Borne <jborne@kalray.eu>
> Signed-off-by: Jonathan Borne <jborne@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
> V2 -> V3:
> * do not rename timeout variable for disabling loop
> in order to ease backports
> * replace abort loop with regmap_read_poll_timeout()
> * remove extra empty line.
> 
> V1 -> V2:
> * use reverse christmas tree order for variable declarations
> * use unsigned int type instead of u32 for regmap_read
> * give its own loop to the abort procedure with its own timeout
> * print an error message if the abort never finishes during the timeout
> * rename the timeout variable for the controller disabling loop
> * with the usleep_range(10, 20) it takes only 1 loop iteration.
> Without it takes 75 iterations and with udelay(1) it takes 16
> loop iterations.
> 
>   drivers/i2c/busses/i2c-designware-common.c | 17 +++++++++++++++++
>   drivers/i2c/busses/i2c-designware-core.h   |  3 +++
>   2 files changed, 20 insertions(+)
> 
This doesn't apply against current code. Looks like your base is older 
than v6.2? I.e. before commit 966b7d3c738a ("i2c: designware: Align 
defines in i2c-designware-core.h").

Jarkko
