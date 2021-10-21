Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7B34358F9
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Oct 2021 05:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhJUDcr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Oct 2021 23:32:47 -0400
Received: from mga17.intel.com ([192.55.52.151]:65520 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229842AbhJUDcr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Oct 2021 23:32:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="209727953"
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; 
   d="scan'208";a="209727953"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 20:30:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; 
   d="scan'208";a="444616242"
Received: from unknown (HELO [10.239.154.68]) ([10.239.154.68])
  by orsmga006.jf.intel.com with ESMTP; 20 Oct 2021 20:30:29 -0700
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel <kernel@axis.com>
References: <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
 <YW6pHkXOPvtidtwS@kroah.com> <20211019143748.wrpqopj2hmpvblh4@vireshk-i7>
 <YW8LFTcBuN1bB3PD@ninjato> <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com>
 <YW+q1yQ8MuhHINAs@kroah.com> <8e182ea8-5016-fa78-3d77-eefba7d58612@intel.com>
 <20211020064128.y2bjsbdmpojn7pjo@vireshk-i7>
 <01d9c992-28cc-6644-1e82-929fc46f91b4@intel.com>
 <20211020105554.GB9985@axis.com> <20211020110316.4x7tnxonswjuuoiw@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <df7e6127-05fb-6aad-3896-fc810f213a54@intel.com>
Date:   Thu, 21 Oct 2021 11:30:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211020110316.4x7tnxonswjuuoiw@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/10/20 19:03, Viresh Kumar wrote:
> On 20-10-21, 12:55, Vincent Whitchurch wrote:
>> If the timeout cannot be disabled, then the driver should be fixed to
>> always copy buffers and hold on to them to avoid memory corruption in
>> the case of timeout, as I mentioned in my commit message.  That would be
>> quite a substantial change to the driver so it's not something I'm
>> personally comfortable with doing, especially not this late in the -rc
>> cycle, so I'd leave that to others.
> Or we can avoid clearing up and freeing the buffers here until the
> point where the buffers are returned by the host. Until that happens,
> we can avoid taking new requests but return to the earlier caller with
> timeout failure. That would avoid corruption, by freeing buffers
> sooner, and not hanging of the kernel.


It seems similar to use "wait_for_completion". If the other side is 
hacked, the guest may never

get the buffers returned by the host, right ?


For this moment, we can solve the problem by using a hardcoded big value 
or disabling the timeout.

Over the long term, I think the backend should provide that timeout 
value and guarantee that its processing

time should not exceed that value.


