Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4E979E8F6
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 15:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240765AbjIMNRF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 09:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240883AbjIMNRD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 09:17:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477751BC9;
        Wed, 13 Sep 2023 06:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694611019; x=1726147019;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=voOn5vnRRx8HAlnRbH6yWGQTEDY27am7NocvssgVeqo=;
  b=HTHhII3tZI/dyvhxQboFch7wUXVs848TvkToPK8rKtHRO6qSch1bYaDb
   3GpdoZ3jIarDhBtbqCiekAOt7gou6xUzRI0Gdbn23a0LpxexiQpIlVfHO
   LnGMtLByhh2Hof6ivXVsVWSwmHHkkDztbR6kd+3OQSCc+gAnxMwYrPZNC
   HYEGwh59qbP1h5N1KZFEKiIZ7bao/HXEKu/BEUP+emt0eVlZyX1pEGdJM
   bDjWT4SNzwen62j04NqpraetztiCScYzB6/B3ubXQE6RbuSnCvUMghlxr
   usrz1WvDzusODlUwhPJ0DRayKuQ+w8Ibm/lG42VWQd8HxoSqM4JnDmJlG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="445095693"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="445095693"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 06:16:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="814224347"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="814224347"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2023 06:16:32 -0700
Message-ID: <e58384d1-86c4-4b56-9d05-b0f7ffb339d5@linux.intel.com>
Date:   Wed, 13 Sep 2023 16:16:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: designware: fix __i2c_dw_disable() in case master
 is holding SCL low
To:     Yann Sionneau <ysionneau@kalray.eu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Julian Vetter <jvetter@kalrayinc.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Borne <jborne@kalray.eu>
References: <20230911140749.32386-1-ysionneau@kalray.eu>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230911140749.32386-1-ysionneau@kalray.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/11/23 17:07, Yann Sionneau wrote:
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
> V3 -> V4:
> * rebase on Linux v6.6-rc1 (0bb80ec)
> 
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
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
