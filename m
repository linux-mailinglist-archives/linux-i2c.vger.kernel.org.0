Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 068577E033A
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Nov 2023 13:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjKCM73 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Nov 2023 08:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjKCM73 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Nov 2023 08:59:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8AD83;
        Fri,  3 Nov 2023 05:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699016363; x=1730552363;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LUZaFXx8eCpqoFt+eWSDUqbx3codm6TDAZME80lLwFU=;
  b=hG4J2C6Z0x6I0lnjP6eEv+d87aZU5u2mUtlrdBf3wSgY3TpwvdxKJJOI
   gyqS0ClNvxcQDzaeaSQMm/PrzmDtQlmzFh3exE/uapsqUCcl1RSJf8ZG3
   Tt0clrKIhFhLVasAw9Gqp5dUdaAMDZnBQhBUB11QCrpSgiPeJhen8+QWl
   YblCYmbSIwYPP99cqVHGByJe1RGz9LPD9CIM1sDNq3Vu5IN47ERnHfLHP
   gJ9Dwz67IJMwrvVHFR3qefIxagv6INmVZb26dlEKte9R+9r4uPzAmo1at
   YVOW2YWYyY5n+ps8lhzHyTIjKWKttUtVSzo83vFxD7JI3UaBi/0R12vlD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="387829497"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="387829497"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 05:59:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="905339441"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="905339441"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga001.fm.intel.com with ESMTP; 03 Nov 2023 05:59:20 -0700
Message-ID: <849f77be-7cce-4c12-9064-4344e801afa5@linux.intel.com>
Date:   Fri, 3 Nov 2023 14:59:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Disable TX_EMPTY irq while waiting
 for block length byte
To:     Tam Nguyen <tamnguyenchi@os.amperecomputing.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        stable@vger.kernel.org
References: <20231102033009.4555-1-tamnguyenchi@os.amperecomputing.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231102033009.4555-1-tamnguyenchi@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/2/23 05:30, Tam Nguyen wrote:
> During SMBus block data read process, we have seen high interrupt rate
> because of TX_EMPTY irq status while waiting for block length byte (the
> first data byte after the address phase). The interrupt handler does not
> do anything because the internal state is kept as STATUS_WRITE_IN_PROGRESS.
> Hence, we should disable TX_EMPTY IRQ until I2C DesignWare receives
> first data byte from I2C device, then re-enable it to resume SMBus
> transaction.
> 
> It takes 0.789 ms for host to receive data length from slave.
> Without the patch, i2c_dw_isr() is called 99 times by TX_EMPTY interrupt.
> And it is none after applying the patch.
> 
> Cc: stable@vger.kernel.org
> Co-developed-by: Chuong Tran <chuong@os.amperecomputing.com>
> Signed-off-by: Chuong Tran <chuong@os.amperecomputing.com>
> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
> ---
> v2:
> 	+ Reduce the indentations level
> 	+ Use regmap_update_bits for bitfield update
> 	+ Rewrite comment statement                     [Serge]
> 	+ Update commit message
> 	+ Add Co-developed-by tag for co-authors        [Andy]
> 
> v1:
>    https://lore.kernel.org/lkml/avd7jhwexehgbvi6euzdwvf5zvqqgjx4ozo6uxu2qpmlarvva3@sgkce3rvovwk/T/
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
