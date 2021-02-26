Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BB6325D9A
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 07:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhBZGgx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 01:36:53 -0500
Received: from mga07.intel.com ([134.134.136.100]:5752 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229618AbhBZGgw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Feb 2021 01:36:52 -0500
IronPort-SDR: WZ8b8co/M5X42spHx/sdiC8m8Uo/jV/wY8tNJJEtn3kCWdNhBqTJ5YwBb4r8ATAltO8iF0sXJ/
 rFGm0B7ktPRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9906"; a="249850295"
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; 
   d="scan'208";a="249850295"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2021 22:36:10 -0800
IronPort-SDR: is0K+Bt0lWf4cURRIiLxV4oQ1h0TAMqjZtGGjmWNxreUFwznHD84BCaiHBptzO8JxynKfFixrf
 X1Wa934K+VBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; 
   d="scan'208";a="381896236"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga002.jf.intel.com with ESMTP; 25 Feb 2021 22:36:05 -0800
Subject: Re: [PATCH v4] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        wsa+renesas@sang-engineering.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>
References: <7c5e44c534b3fd07b855af22d8d4b78bc44cd7a4.1602465440.git.jie.deng@intel.com>
 <20210225072114.iwmtaexl3dkihlba@vireshk-i7>
 <a580de35-787e-4024-3c80-0a101b1a6d3b@intel.com>
 <20210226042126.rix5gjxqrazb6sao@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <96f88e54-ebc7-bfda-310c-ca75b3e09398@intel.com>
Date:   Fri, 26 Feb 2021 14:36:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226042126.rix5gjxqrazb6sao@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/2/26 12:21, Viresh Kumar wrote:
> On 26-02-21, 10:46, Jie Deng wrote:
>> This v4 was the old version before the specification was acked by the virtio
>> tc.
>>
>> Following is the latest specification.
>>
>> https://raw.githubusercontent.com/oasis-tcs/virtio-spec/master/virtio-i2c.tex
>>
>> I will send the v5 since the host/guest ABI changes.
> Okay, now it makes some sense :)
>
> I am interested in this stuff, if possible please keep me Cc'd for following
> versions, thanks.
Sure. I will add you to the Cc list.
