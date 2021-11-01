Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2462A441307
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 06:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhKAF0b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 01:26:31 -0400
Received: from mga17.intel.com ([192.55.52.151]:10897 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229502AbhKAF0b (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Nov 2021 01:26:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="211715451"
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; 
   d="scan'208";a="211715451"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2021 22:23:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; 
   d="scan'208";a="449138280"
Received: from unknown (HELO [10.239.154.43]) ([10.239.154.43])
  by orsmga003.jf.intel.com with ESMTP; 31 Oct 2021 22:23:55 -0700
Message-ID: <8592a48d-0131-86bf-586a-d33e7989e523@intel.com>
Date:   Mon, 1 Nov 2021 13:23:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel <kernel@axis.com>, Conghui Chen <conghui.chen@intel.com>
References: <20211019143748.wrpqopj2hmpvblh4@vireshk-i7>
 <YW8LFTcBuN1bB3PD@ninjato> <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com>
 <YW+q1yQ8MuhHINAs@kroah.com> <8e182ea8-5016-fa78-3d77-eefba7d58612@intel.com>
 <20211020064128.y2bjsbdmpojn7pjo@vireshk-i7>
 <01d9c992-28cc-6644-1e82-929fc46f91b4@intel.com>
 <20211020105554.GB9985@axis.com> <20211020110316.4x7tnxonswjuuoiw@vireshk-i7>
 <df7e6127-05fb-6aad-3896-fc810f213a54@intel.com>
 <20211029122450.GB24060@axis.com>
From:   Jie Deng <jie.deng@intel.com>
In-Reply-To: <20211029122450.GB24060@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/10/29 20:24, Vincent Whitchurch wrote:
> On Thu, Oct 21, 2021 at 05:30:28AM +0200, Jie Deng wrote:
>> For this moment, we can solve the problem by using a hardcoded big
>> value or disabling the timeout.
> Is that an Acked-by on this patch which does the latter?


Yes, you can add my Acked-by. Let's see if other people still have 
different opinions.


>
>> Over the long term, I think the backend should provide that timeout
>> value and guarantee that its processing time should not exceed that
>> value.
> If you mean that the spec should be changed to allow the virtio driver
> to be able to program a certain timeout for I2C transactions in the
> virtio device, yes, that does sound reasonable.


Due to changes in my work, I will pass my virtio-i2c maintenance to Conghui.

She may work on this in the future.


