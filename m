Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84DDA697A7A
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 12:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232124AbjBOLN4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 06:13:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbjBOLNU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 06:13:20 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E6AF367DE;
        Wed, 15 Feb 2023 03:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676459599; x=1707995599;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=e16pSdQgmFTyQTyCvFDV4lMnQOhE7jy+vLaJeDYlLbo=;
  b=Dfu6Atn5qBmZxAWNy+sqLP/r44d5htxDqMEeWlB8I3D5MdXXvw7A4060
   6T36snurDdxiYlHfyuoYpD2BUjwWWD7mFs9DIZSIHtNdQTdPbYZ9jYq9m
   5T4QBoGLfINHxC5m3bB3sYOh8UywMsGBEKQgUH6i4/WNw389a7OLp6XyA
   iXHvUNBjZo/VH9YiqXhp7RLrbyZnXSMdXU0qrMVyZqoMAnW7uQgi6buys
   xZ52pWLQx3DHfFjNqdTE/bxcc/dmZIYAgsmjgj4a+DZEEXGSrAQCqQa3W
   XdHh1VXFstGwuqs9SPbkJHP6+ZNdfgAsIZljYenGDO+B8iyG5TU/L6CkK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="330033485"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="330033485"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 03:13:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="619390996"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="619390996"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by orsmga003.jf.intel.com with ESMTP; 15 Feb 2023 03:13:11 -0800
Message-ID: <72567585-0091-7bf4-35b3-ce3f94936bcc@linux.intel.com>
Date:   Wed, 15 Feb 2023 13:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 2/6] crypto: ccp: Add a header for multiple drivers to use
 `__psp_pa`
To:     =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Cc:     Grzegorz Bernacki <gjb@semihalf.com>,
        Thomas Rijo-john <Rijo-john.Thomas@amd.com>,
        Lendacky Thomas <Thomas.Lendacky@amd.com>,
        herbert@gondor.apana.org.au,
        Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        John Allen <john.allen@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>, kvm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
References: <20230209223811.4993-1-mario.limonciello@amd.com>
 <20230209223811.4993-3-mario.limonciello@amd.com>
 <CAOtMz3OfGFsiThY7hQYG2oh1=HKg7N56cuA28e+dhB4EtZsz=Q@mail.gmail.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <CAOtMz3OfGFsiThY7hQYG2oh1=HKg7N56cuA28e+dhB4EtZsz=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/14/23 10:40, Jan Dąbroś wrote:
>> The TEE subdriver for CCP, the amdtee driver and the i2c-designware-amdpsp
>> drivers all include `psp-sev.h` even though they don't use SEV
>> functionality.
>>
>> Move the definition of `__psp_pa` into a common header to be included
>> by all of these drivers.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> Reviewed-by: Jan Dabros <jsd@semihalf.com>

For the drivers/i2c/busses/i2c-designware-amdpsp.c:

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
