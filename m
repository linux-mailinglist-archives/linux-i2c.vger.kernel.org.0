Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98AE76B7404
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 11:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbjCMKaO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 06:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbjCMKaN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 06:30:13 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3AD32F7B6;
        Mon, 13 Mar 2023 03:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678703406; x=1710239406;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=juvTocpOjNWKyg7Ep384flMarLN4kvUTHRGBCKg/uHQ=;
  b=QX60GsnNo1HG7BZtD/8Fzo8AifRw/E/74RJBa+iJCauz0v025TJNmmFv
   v1VwIBgUp/UsSVO0bGt7EnTdTSDnuEUrUXoi+kkjB/o7KL+r2mxfoLmub
   IC4h1A5lcWQmf22kS6RnjJGmYifcpXeQNLZuVlKkwUv6GEbV6bHO8uH8G
   k/qI91TE6++/S11yENFHIkC+uwOrpJWRtPH5r8T3Nb+dDUJ6X+KjOgx8Z
   nBHdpAtYhyCL9/cMYG8aJ8WNqRxADgNw+bv0JqbcLgYZwucIFRcPSK+aS
   sEVJYtBQcQOIKinAc2DmblB9Ev+SxBSwTHgtPH/bG7e1GV/0Xp26nO9cQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="316758972"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="316758972"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 03:30:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="924453415"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="924453415"
Received: from unknown (HELO [10.237.72.51]) ([10.237.72.51])
  by fmsmga006.fm.intel.com with ESMTP; 13 Mar 2023 03:30:02 -0700
Message-ID: <e88ca279-d8dd-b371-88f0-c6c9c79ab047@linux.intel.com>
Date:   Mon, 13 Mar 2023 12:30:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/8] crypto: ccp: Move some PSP mailbox bit definitions
 into common header
To:     Mario Limonciello <mario.limonciello@amd.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>, Rijo-john.Thomas@amd.com,
        Thomas.Lendacky@amd.com, herbert@gondor.apana.org.au,
        John Allen <john.allen@amd.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Felix.Held@amd.com, "David S. Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20230310211954.2490-1-mario.limonciello@amd.com>
 <20230310211954.2490-4-mario.limonciello@amd.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230310211954.2490-4-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/10/23 23:19, Mario Limonciello wrote:
> Some of the bits and fields used for mailboxes communicating with the
> PSP are common across all mailbox implementations (SEV, TEE, etc).
> 
> Move these bits into the common `linux/psp.h` so they don't need to
> be re-defined for each implementation.
> 
> Acked-by: Rijo Thomas <Rijo-john.Thomas@amd.com>
> Acked-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v3->v4:
>   * Pick up tags
> v2->v3:
>   * Pick up tags
> v1->v2:
>   * Update comment to indicate it's PSP response not PSP ready
> ---
>   drivers/crypto/ccp/psp-dev.h               |  3 ---
>   drivers/crypto/ccp/sev-dev.c               | 15 +++++++--------
>   drivers/crypto/ccp/sev-dev.h               |  2 +-
>   drivers/crypto/ccp/tee-dev.c               | 15 ++++++++-------
>   drivers/i2c/busses/i2c-designware-amdpsp.c | 16 +++++-----------
>   include/linux/psp.h                        | 12 ++++++++++++
>   6 files changed, 33 insertions(+), 30 deletions(-)
> 
For the i2c-designware part:

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
