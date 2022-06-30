Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 167BA5612E6
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 09:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbiF3HHl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 03:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232927AbiF3HH3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 03:07:29 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D757534BB6
        for <linux-i2c@vger.kernel.org>; Thu, 30 Jun 2022 00:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656572848; x=1688108848;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=m+eB6NglV66cnHXZga4kBM2jqBh4JI+MEEAyOzWzMAM=;
  b=F8LK6EkrwDtozx120ADtUpAIWtr+cLailzExAEo+oS/yT6PKqTW2yAG5
   LFHGkQ5rL18qlXcAxuge0bi3huPO/ReLp4WPCBj8OBakQtjHf4pqh3xiG
   4AceX51c3RbbUCjpxVNwzRIuDnAPheGjPVQmK9F0MR2kubISNabHg4/Hx
   Si9AmvrSNxtb6vWxx8cDlnyfz3izjAn05NAUPxUk0S4SdY5MqN7hPhudV
   H7s9OwQWEbZrxg7WAcO+mMaB2fS+eQsuFjm2yE+tDWiHaMA68Cxk7Lo5C
   suOl/pljV9Ou4cVf3mZtaegaQelPT+PyKjjf7X8MI+2uQTrtDK/is84E0
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="265301274"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="265301274"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 00:07:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="647763714"
Received: from mylly.fi.intel.com (HELO [10.237.72.55]) ([10.237.72.55])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jun 2022 00:07:27 -0700
Message-ID: <d53579e3-f45d-5bee-2269-c69278ebed19@linux.intel.com>
Date:   Thu, 30 Jun 2022 10:07:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] i2c: i801: Add support for Intel Meteor Lake PCH-P
Content-Language: en-US
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220629110918.613484-1-jarkko.nikula@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220629110918.613484-1-jarkko.nikula@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 6/29/22 14:09, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Meteor Lake PCH-P.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>   Documentation/i2c/busses/i2c-i801.rst | 1 +
>   drivers/i2c/busses/Kconfig            | 1 +
>   drivers/i2c/busses/i2c-i801.c         | 3 +++
>   3 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
> index cad59170b2ad..615a3a92aa88 100644
> --- a/Documentation/i2c/busses/i2c-i801.rst
> +++ b/Documentation/i2c/busses/i2c-i801.rst
> @@ -46,6 +46,7 @@ Supported adapters:
>     * Intel Emmitsburg (PCH)
>     * Intel Alder Lake (PCH)
>     * Intel Raptor Lake (PCH)
> +  * Intel Meteor Lake (PCH)
>   
Please ignore this version. Andy reminded me in another patch Meteor 
Lake -P doesn't have PCH die and functionality is integrated into a same 
SoC. Will resend.
