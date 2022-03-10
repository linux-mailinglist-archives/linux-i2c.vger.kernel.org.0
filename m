Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70D914D4C8F
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Mar 2022 16:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244741AbiCJPBs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Mar 2022 10:01:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344255AbiCJO7v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Mar 2022 09:59:51 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA0218A7A5;
        Thu, 10 Mar 2022 06:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646923976; x=1678459976;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2obXWm16zHjxkmZ9vE0erL/w5gsiL/wNUz/RM0HIzeE=;
  b=btRRfKTx629TvbXkbDiAAD/Umjl2Ia1oQ8FpVTG+dqnuHbB7Cj++k0IJ
   wewQ+sGFqzozxxrMvkBRvdQsOySTrjWm/zJAyIZw4AfeKG+LusIa8UAWF
   K4EyKcJSARg49mZ9Yv+8a1Lba4221i1DY5Ks2UoSvEHGsPdbo3GVESvRH
   pAm/Dwu3smGmGM8sdkVwDE+w1buGVq28DGKhqSZWKKeG5QB3HyqqVjblF
   QGUyWWuOx8GgQa0Pi4n5ZoRXVlCd/3+dO2LpVY6miQXX+UPB+Z7VnSrvU
   Z6mZDs5HuTkEmaLU7KKFP9GT7EI6KVC/ge/1iwxWbJaEb0t8pjOmk8IX5
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255002978"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="255002978"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 06:52:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="596683170"
Received: from mylly.fi.intel.com (HELO [10.237.72.156]) ([10.237.72.156])
  by fmsmga008.fm.intel.com with ESMTP; 10 Mar 2022 06:52:10 -0800
Message-ID: <5612fbbe-a42b-997e-2375-6d5f0c53bdea@linux.intel.com>
Date:   Thu, 10 Mar 2022 16:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH -next] i2c: designware: Add helper to remove redundancy
Content-Language: en-US
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, andriy.shevchenko@linux.intel.com
Cc:     wsa@kernel.org, upstream@semihalf.com
References: <20220310142236.192811-1-jsd@semihalf.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220310142236.192811-1-jsd@semihalf.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/10/22 16:22, Jan Dabros wrote:
> Simplify code by adding an extra static function for sending I2C
> requests and verifying results.
> 
> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> ---
>   drivers/i2c/busses/i2c-designware-amdpsp.c | 44 ++++++++++++----------
>   1 file changed, 24 insertions(+), 20 deletions(-)
> 
Do I remember correctly was this suggested by Andy? I.e. to give kudos 
to him if that was the case:

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
> index c64e459afb5c..cc758792f150 100644
> --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -229,6 +229,26 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
>   	return ret;
>   }
>   
> +static int psp_send_i2c_req_check_err(enum psp_i2c_req_type request)
> +{
> +	int status;
> +
> +	status = psp_send_i2c_req(request);
> +	if (status) {
> +		if (status == -ETIMEDOUT)
> +			dev_err(psp_i2c_dev, "Timed out waiting for PSP to %s I2C bus\n",
> +				(request == PSP_I2C_REQ_ACQUIRE) ?
> +				"release" : "acquire");
> +		else
> +			dev_err(psp_i2c_dev, "PSP communication error\n");
> +
> +		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
> +		psp_i2c_mbox_fail = true;
> +	}
> +

Does it make sense to have these inside the psp_send_i2c_req() and get 
rid of this new middle function? I mean psp_send_i2c_req() is called now 
only from here so can it do these common error prints and set 
"psp_i2c_mbox_fail = true"?

Jarkko
