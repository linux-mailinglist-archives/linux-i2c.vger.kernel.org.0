Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF0F92AEFEA
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Nov 2020 12:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgKKLql (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Nov 2020 06:46:41 -0500
Received: from mga04.intel.com ([192.55.52.120]:61477 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbgKKLqj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Nov 2020 06:46:39 -0500
IronPort-SDR: lSlzhjSK5FwgT88m+r6fJ6yJReJPLZ+h/DPwM3mrtFs99tZ4IBqcEz6eBmrRLBbuzQ0S9bgXfK
 yvZe8xouKk8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="167548957"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="167548957"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 03:46:35 -0800
IronPort-SDR: aLVfRnQ6syjz5hXBA2uHcXCUdpunAAx5MGZAPEb0SNSLesgqWUeWlXvn+plo64gIgKQuVNxZxR
 EjK/gvhjb7MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="541753308"
Received: from mylly.fi.intel.com (HELO [10.237.72.73]) ([10.237.72.73])
  by orsmga005.jf.intel.com with ESMTP; 11 Nov 2020 03:46:32 -0800
Subject: Re: [PATCH v1] i2c: nvidia-gpu: drop empty stub for runtime pm
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     Ajay Gupta <ajayg@nvidia.com>, Bjorn Helgaas <helgaas@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>
References: <20201107082151.58239-1-vaibhavgupta40@gmail.com>
 <20201107090442.GA107675@gmail.com>
 <6989eb51-a36c-6e43-86f3-9b02ab490d95@linux.intel.com>
 <X6vDAttVkugjceaX@gmail.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <8e2b0544-5ff1-41aa-7f38-e501c1aff6d6@linux.intel.com>
Date:   Wed, 11 Nov 2020 13:46:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <X6vDAttVkugjceaX@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/11/20 12:54 PM, Vaibhav Gupta wrote:
> On Tue, Nov 10, 2020 at 02:33:43PM +0200, Jarkko Nikula wrote:
>>>> +#define gpu_i2c_suspend NULL
>> Perhaps we can put NULL directly into UNIVERSAL_DEV_PM_OPS() for the suspend
>> callback?
>>
> Yes. I have noticed that the approach for this is random. Many drivers pass
> NULL directly to the dev_pm_ops type variable, and rest of them use a macro.
> 
> I used it for symmetry. I mean there is 'gpu_i2c_resume', so although a macro,
> I have put a 'gpu_i2c_suspend'.
> 
> Although it won't make any significant change, but if required, I can send
> another patch where NULL is passed into UNIVERSAL_DEV_PM_OPS() instead.

No need to resend from my side, it was just a remark and I gave already 
the reviewed-by tag.

Jarkko
