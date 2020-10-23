Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1C7D2969AD
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Oct 2020 08:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S368876AbgJWG1Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Oct 2020 02:27:16 -0400
Received: from mga14.intel.com ([192.55.52.115]:50330 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2898454AbgJWG1Q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 23 Oct 2020 02:27:16 -0400
IronPort-SDR: l71xQqnb88U4fJATYdTLndqUZiyK0cHBRPlGLAHrU71l5MWoEBfhokI7m1GtcSavJuU8ZhtXSP
 Bsraln7AVyHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="166850854"
X-IronPort-AV: E=Sophos;i="5.77,407,1596524400"; 
   d="scan'208";a="166850854"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 23:27:09 -0700
IronPort-SDR: iEcDPwK14VKvyoX2Rqv4SPxJGglj4BDc4Q2l0Up16jowqUgvMpSPWSPUP8/Cwh/H0VJW4C+H4K
 +/vuScI1dfEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,407,1596524400"; 
   d="scan'208";a="466961410"
Received: from mylly.fi.intel.com (HELO [10.237.72.73]) ([10.237.72.73])
  by orsmga004.jf.intel.com with ESMTP; 22 Oct 2020 23:27:08 -0700
Subject: Re: [PATCH v3] i2c: designware: call
 i2c_dw_read_clear_intrbits_slave() once
To:     Michael Wu <michael.wu@vatics.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Morgan Chang <morgan.chang@vatics.com>
References: <20201023054027.13540-1-michael.wu@vatics.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <a44aacbb-fcb4-f83f-b781-b69f52944f09@linux.intel.com>
Date:   Fri, 23 Oct 2020 09:27:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201023054027.13540-1-michael.wu@vatics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/23/20 8:40 AM, Michael Wu wrote:
> If some bits were cleared by i2c_dw_read_clear_intrbits_slave() in
> i2c_dw_isr_slave() and not handled immediately, those cleared bits would
> not be shown again by later i2c_dw_read_clear_intrbits_slave(). They
> therefore were forgotten to be handled.
> 
> i2c_dw_read_clear_intrbits_slave() should be called once in an ISR and take
> its returned state for all later handlings.
> 
> Signed-off-by: Michael Wu <michael.wu@vatics.com>
> ---
> 
> Change in v3:
>   - revert deleted braces of 'else' branch in v2
> 
> Change in v2:
>   - revert moving I2C_SLAVE_WRITE_REQUESTED reporting in v1
> 
>   drivers/i2c/busses/i2c-designware-slave.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
