Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0994AF496
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 16:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235356AbiBIPBY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 10:01:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232066AbiBIPBX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 10:01:23 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4672EC06157B;
        Wed,  9 Feb 2022 07:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644418887; x=1675954887;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LMWgSssEmxW76CNAAploRbBL4rV1GObNLLZhQr+ZF1o=;
  b=gy6XvD1TG8s/i012O/ZI8TbRQTN/ZM7mt9madjVm0PzIzOU40Lmd18T0
   FRH2Wwk560Z582G50SisqD5O6TCXAPAoC1ACPBqqeJp1+WU+E8WSZLott
   +haPlMYRNX1iT7dzjE4qg0mbVi0c7xorkSpakyKIC6Am8F6lcMB0pIW3b
   DnSTAWlG7K1nn3++b0Nf/tdOOUz9AcoKOX+L+uzTGDCVjU+CRi7ARDfDT
   KtpzrqVtEYjcP0NDVQ4ryRUKhCwmLvDE1tNRPJFeitHz44cuGeRJUrSjo
   Kcg22zaVzrEa/bBTkoMXIu/0Xhp845RBXLPjCb6EB7RyOBS4AUsTAuOEr
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="229867494"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="229867494"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 07:01:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="485269621"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by orsmga006.jf.intel.com with ESMTP; 09 Feb 2022 07:01:22 -0800
Message-ID: <9816b101-6252-5792-65bd-3cab6fa496c4@linux.intel.com>
Date:   Wed, 9 Feb 2022 17:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH v4 1/2] i2c: designware: Add missing locks
Content-Language: en-US
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, andriy.shevchenko@linux.intel.com
Cc:     mika.westerberg@linux.intel.com, hdegoede@redhat.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com, thomas.lendacky@amd.com,
        alexander.deucher@amd.com, Nimesh.Easow@amd.com,
        mario.limonciello@amd.com
References: <20220208141218.2049591-1-jsd@semihalf.com>
 <20220208141218.2049591-2-jsd@semihalf.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220208141218.2049591-2-jsd@semihalf.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/8/22 16:12, Jan Dabros wrote:
> All accesses to controller's registers should be protected on
> probe, disable and xfer paths. This is needed for i2c bus controllers
> that are shared with but not controller by kernel.
> 
> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/i2c/busses/i2c-designware-common.c | 12 ++++++++++++
>   drivers/i2c/busses/i2c-designware-master.c |  6 ++++++
>   2 files changed, 18 insertions(+)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Shortly tested by rmmod & modprobe loop.

Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
