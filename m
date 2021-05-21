Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C754238BF6D
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 08:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbhEUGej (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 02:34:39 -0400
Received: from mleia.com ([178.79.152.223]:54334 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232654AbhEUGeg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 02:34:36 -0400
X-Greylist: delayed 508 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 May 2021 02:34:36 EDT
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id F2E9C3977;
        Fri, 21 May 2021 06:24:45 +0000 (UTC)
Subject: Re: [PATCH 11/16] i2c: busses: i2c-pnx: Provide descriptions for
 'alg_data' data structure
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Dennis Kovalev <dkovalev@ru.mvista.com>,
        Vitaly Wool <vwool@ru.mvista.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-12-lee.jones@linaro.org>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <25d9800d-2c0e-4a76-8a56-3f845ab7b9e8@mleia.com>
Date:   Fri, 21 May 2021 09:24:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210520190105.3772683-12-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20210521_062446_021852_6E2EF448 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message. 
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Lee,

On 5/20/21 10:01 PM, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/i2c/busses/i2c-pnx.c:147: warning: Function parameter or member 'alg_data' not described in 'i2c_pnx_start'
>   drivers/i2c/busses/i2c-pnx.c:147: warning: Excess function parameter 'adap' description in 'i2c_pnx_start'
>   drivers/i2c/busses/i2c-pnx.c:202: warning: Function parameter or member 'alg_data' not described in 'i2c_pnx_stop'
>   drivers/i2c/busses/i2c-pnx.c:202: warning: Excess function parameter 'adap' description in 'i2c_pnx_stop'
>   drivers/i2c/busses/i2c-pnx.c:231: warning: Function parameter or member 'alg_data' not described in 'i2c_pnx_master_xmit'
>   drivers/i2c/busses/i2c-pnx.c:231: warning: Excess function parameter 'adap' description in 'i2c_pnx_master_xmit'
>   drivers/i2c/busses/i2c-pnx.c:301: warning: Function parameter or member 'alg_data' not described in 'i2c_pnx_master_rcv'
>   drivers/i2c/busses/i2c-pnx.c:301: warning: Excess function parameter 'adap' description in 'i2c_pnx_master_rcv'
> 
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Dennis Kovalev <dkovalev@ru.mvista.com>
> Cc: Vitaly Wool <vwool@ru.mvista.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

thank you for the change, it's obviously correct.

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
