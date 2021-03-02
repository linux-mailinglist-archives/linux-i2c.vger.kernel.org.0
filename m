Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE3A32B1FC
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241798AbhCCBOr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 20:14:47 -0500
Received: from mga02.intel.com ([134.134.136.20]:34287 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1381343AbhCBFWj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Mar 2021 00:22:39 -0500
IronPort-SDR: aqnAryx1AyDuXxrXT4VqFwO3befy0lFWYFvPPMdsxkR41OyKomzqeAFGufp+AjR7IrUZDPwBG5
 NvWyeDftTbfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="173828724"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="173828724"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 21:21:33 -0800
IronPort-SDR: 1EAGgABchDoQBsjqVttpRTIyffgxjTAGDkWJIWlE4zbkJhWrOJZDD6zxar6Xys55wm46zHlLaW
 vK286rABsECQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="444594676"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga001.jf.intel.com with ESMTP; 01 Mar 2021 21:21:26 -0800
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <20210302044214.gnnce5ptwehrsnpc@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <1e01448f-52f6-3d39-6794-d140637fdcc3@intel.com>
Date:   Tue, 2 Mar 2021 13:21:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302044214.gnnce5ptwehrsnpc@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/2 12:42, Viresh Kumar wrote:
> On 01-03-21, 14:41, Jie Deng wrote:
>> +static int virtio_i2c_send_reqs(struct virtqueue *vq,
>> +				struct virtio_i2c_req *reqs,
>> +				struct i2c_msg *msgs, int nr)
>> +{
>> +	struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
>> +	int i, outcnt, incnt, err = 0;
>> +	u8 *buf;
>> +
>> +	for (i = 0; i < nr; i++) {
>> +		if (!msgs[i].len)
>> +			break;
>> +
>> +		reqs[i].out_hdr.addr = cpu_to_le16(msgs[i].addr << 1);
> And this won't work for 10 bit addressing right? Don't we support that
> in kernel ?
>
>  From Spec:
>
> \begin{tabular}{ |l||l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l| }
> \hline
> Bits           & 15 & 14 & 13 & 12 & 11 & 10 & 9  & 8  & 7  & 6  & 5  & 4  & 3  & 2  & 1  & 0 \\
> \hline
> 7-bit address  & 0  & 0  & 0  & 0  & 0  & 0  & 0  & 0  & A6 & A5 & A4 & A3 & A2 & A1 & A0 & 0 \\
> \hline
> 10-bit address & A7 & A6 & A5 & A4 & A3 & A2 & A1 & A0 & 1  & 1  & 1  & 1  & 0  & A9 & A8 & 0 \\
> \hline
> \end{tabular}
Currently, to make things simple, this driver only supports 7 bit mode.
It doesn't declare "I2C_FUNC_10BIT_ADDR" in the functionality.
We may add in the future according to the need.
