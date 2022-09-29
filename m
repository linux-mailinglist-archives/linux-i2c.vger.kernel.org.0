Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0355EED62
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 07:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234834AbiI2FwZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 01:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbiI2FwX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 01:52:23 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875F412B5FA;
        Wed, 28 Sep 2022 22:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664430741; x=1695966741;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VjJBWVH0h7YcbVPe1L+QM0XMYaWxsTRckBYNk36i0mQ=;
  b=hBtqd1/zHbYaRSOdHbRCN+DHFCarKxI0VwpuGVRFBqfQHN4P4TL9sC42
   wLE1taCR9bJylVoNLlyHsnG2PdE7Gm1MY33Cn1VT9tu4L+91zR2WlgGVY
   mjL90WBOLzyMUzLkH62KCzRoGICTeFUnxzK/XLFyxTNkIUqSaNyzaa8Th
   nPhPf6clVKR5TsKKw+5zSdQwTaTJCuRGGOruS3afGwGP3oLyg/N06tE8o
   Gj+Xc0o+4cZLQdaq/VPyGFx36VlWXjGHhUOqW+PYuQfZiCXlv1VuuPEK2
   KNq6t+Y6K+ez3afQ7VU51yBWW8yQs5GXitJcIoq43Fzgql/AZJzDoP+/6
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="301776273"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="301776273"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 22:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="764584218"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="764584218"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2022 22:52:19 -0700
Message-ID: <20b11371-a6cc-5d75-904d-1c1666437572@linux.intel.com>
Date:   Thu, 29 Sep 2022 08:52:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH v1 2/2] i2c: designware-pci: Use standard pattern for
 memory allocation
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
References: <20220928162116.66724-1-andriy.shevchenko@linux.intel.com>
 <20220928162116.66724-2-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220928162116.66724-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/28/22 19:21, Andy Shevchenko wrote:
> The pattern
> 	foo = kmalloc(sizeof(*foo), GFP_KERNEL);
> has an advantage when foo type is changed. Since we are planning a such,
> better to be prepared by using standard pattern for memory allocation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
