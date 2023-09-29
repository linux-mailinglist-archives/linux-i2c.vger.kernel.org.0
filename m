Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECD77B33EA
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 15:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233260AbjI2Nnb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 09:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233266AbjI2Nna (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 09:43:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D9A1AB;
        Fri, 29 Sep 2023 06:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695995008; x=1727531008;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=96dT32PkgdFwEas9sw2UMEYPTGNvdBIo1204mmN2CYA=;
  b=O0Drq6UWLC+lr0DAMdNeYwi8XHzyr1Aq8s14QF7ruCAKCfo9ss1TozBy
   JMrmLA5XkhdeQksxvN4nQUGP0kASA3XKV6aY7OlH1YTbjMvbBPaAYgZgf
   Yr8P3jLSTAHyrOwYDUuUYStw60yq5iCtXNaWD+QAbOx+txHVOOcrk0RcZ
   kb4HE5XICflHG5rZoCDhQx23ZsdNI3F95chewb8HhrnF4vKcQPdbTnWnb
   HOEZyvsz8flmjtKXJ+/inTjFNHzByTGKGsxsIYHFDEuSqcks04Io8cyul
   o0H6qXpTlwNMHMw8Iy3c1oW6ML+2htwzSDEM0vvVxuqjqpttD5M50iG8U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="385116918"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="385116918"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 06:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="699652390"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="699652390"
Received: from mylly.fi.intel.com (HELO [10.237.72.66]) ([10.237.72.66])
  by orsmga003.jf.intel.com with ESMTP; 29 Sep 2023 06:43:25 -0700
Message-ID: <29e57ece-032b-4b04-bbfc-14383c1f3c9a@linux.intel.com>
Date:   Fri, 29 Sep 2023 16:43:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: designware: Disable TX_EMPTY irq while waiting
 for block length byte
Content-Language: en-US
To:     Tam Nguyen <tamnguyenchi@os.amperecomputing.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        stable@vger.kernel.org
References: <20230929035356.6435-1-tamnguyenchi@os.amperecomputing.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230929035356.6435-1-tamnguyenchi@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/29/23 06:53, Tam Nguyen wrote:
> During SMBus block data read process, we have seen high interrupt rate
> because of TX_EMPTY irq status while waiting for block length byte (the
> first data byte after the address phase). The interrupt handler does not
> do anything because the internal state is kept as STATUS_WRITE_IN_PROGRESS.
> Hence, we should disable TX_EMPTY irq until I2C DW receives first data
> byte from I2C device, then re-enable it.
> 
> It takes 0.789 ms for host to receive data length from slave.
> Without the patch, i2c_dw_isr is called 99 times by TX_EMPTY interrupt.
> And it is none after applying the patch.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Chuong Tran <chuong@os.amperecomputing.com>
> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
