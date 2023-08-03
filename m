Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBA476EB0C
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 15:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235473AbjHCNpl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 09:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbjHCNpO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 09:45:14 -0400
Received: from mgamail.intel.com (unknown [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BED3A92;
        Thu,  3 Aug 2023 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691070216; x=1722606216;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CdyfmAicdVhiGrzRE4OoQgxtaYf0InFSz3PUvomAixU=;
  b=F3ZDMaOkjWsucyWCEpae3lEtTHE9vD/+nBN2ycbtmfFh9sfh+vOdWPJQ
   U+QqJSmMtRZ/5BLulhkiJIC2kAw1YWDuCZxfY3jFomxN2POoi26LFSMQO
   tebsJ9ASxOH66b4SByLUrnw6VSqCcD11j+H+IkUnnkTOaCQZ9U+j50bbT
   vxzBfYJRsMMXibkoTCpBey+Lsbvmad6j0z16zFO/MH7B7Bbu0uHsrK2Jn
   vqEnqk0Qzunx8tx0QDe8Xpu8GECCFLzWjhQNWwiMxPQMlVUNlZ+CRvcoi
   ZuDNwfOVJ0+Qfx9HZL/Ps1GOHDSfCD0OQgDzk2mtBbgTdbUlYvknzGYCO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="350171460"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="350171460"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 06:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="732765624"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="732765624"
Received: from mylly.fi.intel.com (HELO [10.237.72.67]) ([10.237.72.67])
  by fmsmga007.fm.intel.com with ESMTP; 03 Aug 2023 06:43:33 -0700
Message-ID: <2e2f4d7e-2831-9161-9564-3d1e89511727@linux.intel.com>
Date:   Thu, 3 Aug 2023 16:43:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.1
Subject: Re: [PATCH v1 1/9] i2c: designware: Move has_acpi_companion() to
 common code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-2-andriy.shevchenko@linux.intel.com>
 <20230725214521.zxjqinryvva2zanx@intel.intel>
 <928d54c4-ec71-5f09-ed66-5f9c52aca6ba@linux.intel.com>
 <ZMgWJY3w/HhsZvVd@smile.fi.intel.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZMgWJY3w/HhsZvVd@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/31/23 23:14, Andy Shevchenko wrote:
> On Fri, Jul 28, 2023 at 02:33:07PM +0300, Jarkko Nikula wrote:
>> On 7/26/23 00:45, Andi Shyti wrote:
>>> On Tue, Jul 25, 2023 at 05:30:15PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
>>>> -int i2c_dw_acpi_configure(struct device *device)
>>>> +static void i2c_dw_acpi_do_configure(struct dw_i2c_dev *dev, struct device *device)
>>
>> Because of this dual dev pointer obscurity which is cleaned in the next
>> patch and Andi's comment below in my opinion it makes sense to combine
>> patches 1 and 2.
> 
> Besides that these 2 are logically slightly different, the changes don't drop
> the duality here. And there is also the other patch at the end of the series
> that makes the below disappear.
> 
> Not sure that any of these would be the best approach (Git commit is cheap,
> maintenance and backporting might be harder). So, ideas are welcome!
> 
Unless I'm missing something you won't need to carry both struct 
dw_i2c_dev *dev and struct device *device since struct dw_i2c_dev 
carries it already and it's set before calling the dw_i2c_of_configure() 
and i2c_dw_acpi_configure().

Also it feels needless to add new _do_configure() functions since only 
reason for them seems to be how patches are organized now.

So if instead of this in i2c_dw_fw_parse_and_configure()

	if (is_of_node(fwnode))
		i2c_dw_of_do_configure(dev, dev->dev);
	else if (is_acpi_node(fwnode))
		i2c_dw_acpi_do_configure(dev, dev->dev);

let end result be

	if (is_of_node(fwnode))
		i2c_dw_of_configure(dev);
	else if (is_acpi_node(fwnode))
		i2c_dw_acpi_configure(dev);

My gut feeling says patchset would be a bit simpler if we aim for this 
end result in mind.

Simplest patches like int to void return type conversion first since 
either i2c_dw_acpi_configure() and dw_i2c_of_configure() return is not 
used now. Then perhaps dw_i2c_of_configure() renaming.

Moving to common code I don't know how well it's splittable into smaller 
patches or would single bigger patch look better.
