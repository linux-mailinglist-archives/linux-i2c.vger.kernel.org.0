Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481C83EF786
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Aug 2021 03:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbhHRBaQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 21:30:16 -0400
Received: from mga18.intel.com ([134.134.136.126]:35266 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233027AbhHRBaQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 21:30:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="203382777"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="203382777"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2021 18:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="531300286"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2021 18:29:38 -0700
Subject: Re: [PATCH v15] i2c: virtio: add a virtio i2c frontend driver
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, conghui.chen@intel.com,
        viresh.kumar@linaro.org, stefanha@redhat.com,
        gregkh@linuxfoundation.org, vincent.guittot@linaro.org,
        alex.bennee@linaro.org, jiedeng@alumni.sjtu.edu.cn
References: <bcf2fb9bbe965862213f27e05f87ffc91283c0c5.1627018061.git.jie.deng@intel.com>
 <YRwagcZ8SUCsncEA@kunai>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <b15f5586-4ffa-e794-aca3-5125dc7378bf@intel.com>
Date:   Wed, 18 Aug 2021 09:29:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRwagcZ8SUCsncEA@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/8/18 4:22, Wolfram Sang wrote:
>
>   Michael S. Tsirkin <mst@redhat.com>
> Okay, with rc6 being released, I won't wait for an immutable branch
> anymore. I applied this now and we will see if there will be a merge
> conflict. If so, it will be trivial to handle, I'd think. So:
>
> Applied to for-next, thanks!


Thanks Wolfram!


