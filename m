Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4004B4FBF
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 13:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243709AbiBNMLv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Feb 2022 07:11:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241615AbiBNMLu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Feb 2022 07:11:50 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600B648E58;
        Mon, 14 Feb 2022 04:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644840703; x=1676376703;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JKS4ZYVvHPWJrzHepeoCtuWYZKUX+bMl14hpmXPHIJw=;
  b=T0SLUcL1Y4NwtiII5wL2o3zBiYywRCvNOHnc0tGKnQ6noaU9cSg3/ZvG
   /E4wMrKX4sxtDNz6jOfR2KsEZ6oXhmJrklUKGcNUiKbuFuLFWlDON1pbv
   OB5MZciRKtXRGYfs3TQOLGig/LHEQNK+++K6HzGls1xKQ8EUoynT7GU0A
   NnJYz9u5hi98YGKVTgVkfeB9EdYRKDZ96+HNaEYfIWttOLbGdFHlralRW
   HsjOGF/TQwmF8RIZtUyHKcqm8yYApVmT0W7JDFm/PkCAeBXCdfYBZb3X4
   a8QOJAAkJBq9bZ19jeFdJVslFGx/ldFc5cV2AGE1nw/yzW65yayDIbE0A
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="237486582"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="237486582"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 04:11:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="495513323"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by orsmga006.jf.intel.com with ESMTP; 14 Feb 2022 04:11:39 -0800
Message-ID: <b1c3a16a-2917-309a-5e5d-e4d9a4a62ebd@linux.intel.com>
Date:   Mon, 14 Feb 2022 14:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: 5.17-rc regression: rmi4 clients cannot deal with asynchronous
 suspend? (was: X1 Carbon touchpad not resumed)
Content-Language: en-US
To:     Hugh Dickins <hughd@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rajat Jain <rajatja@google.com>, Wolfram Sang <wsa@kernel.org>,
        Derek Basehore <dbasehore@chromium.org>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        vincent.huang@tw.synaptics.com, cheiny@synaptics.com,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
References: <89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com>
 <YgF/0QGFN4SppLKg@shikoro>
 <CACK8Z6Etj-gq1VKpkUBstiXEETekPWG9p9gKBtuFaZF05pQEvQ@mail.gmail.com>
 <CACK8Z6FUsceYgBoaAtN8o4m9HpZaBZMt0Nqtvw0a1Z3EuD_nWg@mail.gmail.com>
 <YgHTYrODoo2ou49J@google.com>
 <b76771e5-b8e-54c9-2474-d5a73d236cba@google.com>
 <6f1103af-595c-ed0a-b946-97a9331ed148@linux.intel.com>
 <Ygm+5rS7Cxeea5Dp@google.com>
 <3741afae-305a-4ba-187d-eb52b039bc1a@google.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <3741afae-305a-4ba-187d-eb52b039bc1a@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/14/22 09:36, Hugh Dickins wrote:
> On Sun, 13 Feb 2022, Dmitry Torokhov wrote:
>>
>> Sorry for the delay, but I wonder if you could try the patch below and
>> tell me if that also fixes the issue for you?
> 
> It fixes it for me, thanks Dmitry; with nothing unpleasant in dmesg.
> 
Also for me.

Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
