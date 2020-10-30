Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B16232A085D
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Oct 2020 15:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgJ3Osf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Oct 2020 10:48:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:38461 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726239AbgJ3OrB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Oct 2020 10:47:01 -0400
IronPort-SDR: MYes1HbQxGgmM41l95aX8YwVuh1tfsxeQCboDVSBAEGIm0oLpRkgxTPWfG02Kvs7DojbhYuQ94
 Axr1IMy/RzRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="168712021"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; 
   d="scan'208";a="168712021"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 07:46:05 -0700
IronPort-SDR: JFvH7no/9HmOkEt0yQULlmCJZDuhjNnU/TSiSzPDvyqnNz1LgU7P1Fjl1F4JIqA0/hpVlmtQyN
 66OYUgcPkH+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; 
   d="scan'208";a="356609975"
Received: from mylly.fi.intel.com (HELO [10.237.72.73]) ([10.237.72.73])
  by fmsmga002.fm.intel.com with ESMTP; 30 Oct 2020 07:46:03 -0700
Subject: Re: [PATCH 2/2] i2c: designware: slave should do WRITE_REQUESTED
 before WRITE_RECEIVED
To:     Michael Wu <michael.wu@vatics.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Morgan Chang <morgan.chang@vatics.com>
References: <20201030080420.28016-1-michael.wu@vatics.com>
 <20201030080420.28016-3-michael.wu@vatics.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <85c6cb3f-2eeb-07c7-0a53-a502b45c91a5@linux.intel.com>
Date:   Fri, 30 Oct 2020 16:46:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201030080420.28016-3-michael.wu@vatics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/30/20 10:04 AM, Michael Wu wrote:
> Sometimes we would get the following flow when doing an i2cset:
> 
> 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
> I2C_SLAVE_WRITE_RECEIVED
> 0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x714 : INTR_STAT=0x204
> I2C_SLAVE_WRITE_REQUESTED
> I2C_SLAVE_WRITE_RECEIVED
> 
> Documentation/i2c/slave-interface.rst says that I2C_SLAVE_WRITE_REQUESTED,
> which is mandatory, should be sent while the data did not arrive yet. It
> means in a write-request I2C_SLAVE_WRITE_REQUESTED should be reported
> before any I2C_SLAVE_WRITE_RECEIVED.
> 
> By the way, I2C_SLAVE_STOP didn't be reported in the above case because
> DW_IC_INTR_STAT was not 0x200.
> 
> dev->status can be used to record the current state, especially Designware
> I2C controller has no interrupts to identify a write-request. This patch
> makes not only I2C_SLAVE_WRITE_REQUESTED been reported first when
> IC_INTR_RX_FULL is rising and dev->status isn't STATUS_WRITE_IN_PROGRESS
> but also I2C_SLAVE_STOP been reported when a STOP condition is received.
> 
> Signed-off-by: Michael Wu <michael.wu@vatics.com>
> ---
>   drivers/i2c/busses/i2c-designware-slave.c | 45 +++++++++--------------
>   1 file changed, 18 insertions(+), 27 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
