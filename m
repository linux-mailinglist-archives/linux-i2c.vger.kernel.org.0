Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C45B76516D
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 12:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbjG0Kjm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 06:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbjG0Kjh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 06:39:37 -0400
Received: from mgamail.intel.com (unknown [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D69FE268B;
        Thu, 27 Jul 2023 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690454376; x=1721990376;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ap72cX/8T3ny+bqu7pGgd944OAjKiuy6FxPkyIxDrT0=;
  b=P8gqo9JDyWiWqzRJlS5rt/PFuDL/PNOv6nLXfSUO97NN8XM+tWpAK514
   G3hJJ7YY8sJNWSqJvTstNt1a797qYGujJwnz8vFrwFHXl8VJ/D/eaTthc
   ci6atyGHFZVwn9+Y2eu/05hPGIJFFWIwtGtrfchwFNJnnTNqoFbrQZzRM
   iPaxgnrS/OfmXn5nYHDL9JX0SWvPRecojFufzJC8KHD6vwTckg/EjciB2
   H1laNXLt1VQK48BcVairDKGuMtaIKfKC+tevKmBm8/GtkuBPoyEHlChQI
   UMGCMrRmG73sVjy1bMwxBoOLe8yT70gDogA+9gsrJxCAcePd3PT5vTmVn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="368291799"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="368291799"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 03:39:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="720858331"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="720858331"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by orsmga007.jf.intel.com with ESMTP; 27 Jul 2023 03:36:48 -0700
Message-ID: <afacba7f-c836-9d0c-3ffa-2b1cf3d4bdaa@linux.intel.com>
Date:   Thu, 27 Jul 2023 13:36:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] i2c: designware: Correct length byte validation
 logic
Content-Language: en-US
To:     Tam Nguyen <tamnguyenchi@os.amperecomputing.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        Quan Nguyen <quan@os.amperecomputing.com>,
        stable@vger.kernel.org
References: <20230726080001.337353-1-tamnguyenchi@os.amperecomputing.com>
 <20230726080001.337353-2-tamnguyenchi@os.amperecomputing.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230726080001.337353-2-tamnguyenchi@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/26/23 11:00, Tam Nguyen wrote:
> From: Quan Nguyen <quan@os.amperecomputing.com>
> 
> Commit 0daede80f870 ("i2c: designware: Convert driver to using regmap API")
> changes the logic to validate the whole 32-bit return value of
> DW_IC_DATA_CMD register instead of 8-bit LSB without reason.
> 
> Later, commit f53f15ba5a85 ("i2c: designware: Get right data length"),
> introduced partial fix but not enough because the "tmp > 0" still test
> tmp as 32-bit value and is wrong in case the IC_DATA_CMD[11] is set.
> 
> Revert the logic to just before commit 0daede80f870
> ("i2c: designware: Convert driver to using regmap API").
> 
> Fixes: f53f15ba5a85 ("i2c: designware: Get right data length")
> Fixes: 0daede80f870 ("i2c: designware: Convert driver to using regmap API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
