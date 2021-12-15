Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED454758BB
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 13:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242390AbhLOMU5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 07:20:57 -0500
Received: from mga03.intel.com ([134.134.136.65]:19720 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242338AbhLOMUx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 07:20:53 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="239165065"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="239165065"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 04:20:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="545556365"
Received: from mylly.fi.intel.com (HELO [10.237.72.88]) ([10.237.72.88])
  by orsmga001.jf.intel.com with ESMTP; 15 Dec 2021 04:20:51 -0800
Message-ID: <7b537fb9-6ad3-5840-fc3c-a4354dd78133@linux.intel.com>
Date:   Wed, 15 Dec 2021 14:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH v3] i2c: designware: Do not complete i2c read without
 RX_FULL interrupt
Content-Language: en-US
To:     tamal.saha@intel.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org
Cc:     bala.senthil@intel.com
References: <20211214142451.3638-1-tamal.saha@intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20211214142451.3638-1-tamal.saha@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/14/21 16:24, tamal.saha@intel.com wrote:
> From: Tamal Saha <tamal.saha@intel.com>
> 
> Intel Keem Bay platform supports multi-master operations over same i2c
> bus using Synopsys i2c DesignWare IP. When multi-masters initiate i2c
> operation simultaneously in a loop, SCL line is stucked low forever
> after few i2c operations. Following interrupt sequences are observed
> in:
>    working case: TX_EMPTY, RX_FULL and STOP_DET
>    non working case: TX_EMPTY, STOP_DET, RX_FULL.
> 
> DW_apb_i2c stretches the SCL line when the TX FIFO is empty or when
> RX FIFO is full. The DW_apb_i2c master will continue to hold the SCL
> line LOW until RX FIFO is read.
> 
> Linux kernel i2c DesignWare driver does not handle above non working
> sequence. TX_EMPTY, RX_FULL and STOP_DET routine execution are required
> in sequence although RX_FULL interrupt is raised after STOP_DET by
> hardware. Clear STOP_DET for the following conditions:
>    (STOP_DET ,RX_FULL, rx_outstanding)
>      Write Operation: (1, 0, 0)
>      Read Operation:
>        RX_FULL followed by STOP_DET: (0, 1, 1) -> (1, 0, 0)
>        STOP_DET followed by RX_FULL: (1, 0, 1) -> (1, 1, 0)
>        RX_FULL and STOP_DET together: (1, 1, 1)
> 
> Signed-off-by: Tamal Saha <tamal.saha@intel.com>
> ---
> Changes in v3:
>   - "multi-master" is used in commit message
> Changes in v2:
>   - Commit message updated as suggested by Andy Shevchenko
>    - Replaced Synopsis by Synopsys, designware by DesignWare, software by driver
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
