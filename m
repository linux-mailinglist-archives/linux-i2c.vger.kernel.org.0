Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94AC044E788
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 14:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbhKLNmr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 08:42:47 -0500
Received: from mga09.intel.com ([134.134.136.24]:36349 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231436AbhKLNmq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Nov 2021 08:42:46 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="232976690"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="232976690"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2021 05:39:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="670655442"
Received: from mylly.fi.intel.com (HELO [10.237.72.160]) ([10.237.72.160])
  by orsmga005.jf.intel.com with ESMTP; 12 Nov 2021 05:39:54 -0800
Subject: Re: [PATCH v1 1/1] i2c: designware: Fix the kernel doc description
 for struct dw_i2c_dev
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20211112123459.73538-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <4b39d4d8-8608-bc6f-c928-b37fe29b84bb@linux.intel.com>
Date:   Fri, 12 Nov 2021 15:39:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211112123459.73538-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/12/21 2:34 PM, Andy Shevchenko wrote:
> $ scripts/kernel-doc -none drivers/i2c/busses/i2c-designware-core.h
> warning: Function parameter or member 'rst' not described in 'dw_i2c_dev'
> warning: Function parameter or member 'get_clk_rate_khz' not described in 'dw_i2c_dev'
> warning: Function parameter or member 'flags' not described in 'dw_i2c_dev'
> warning: Function parameter or member 'functionality' not described in 'dw_i2c_dev'
> warning: Function parameter or member 'master_cfg' not described in 'dw_i2c_dev'
> warning: Function parameter or member 'set_sda_hold_time' not described in 'dw_i2c_dev'
> warning: Function parameter or member 'rinfo' not described in 'dw_i2c_dev'
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-core.h | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
