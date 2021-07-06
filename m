Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 397593BC4A8
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jul 2021 03:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhGFBxI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 21:53:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:33050 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229733AbhGFBxH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Jul 2021 21:53:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="189418844"
X-IronPort-AV: E=Sophos;i="5.83,327,1616482800"; 
   d="scan'208";a="189418844"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2021 18:50:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,327,1616482800"; 
   d="scan'208";a="562831796"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by fmsmga001.fm.intel.com with ESMTP; 05 Jul 2021 18:50:24 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato> <20210629101627.kwc2rszborc3kvjs@vireshk-i7>
 <YNr0uDx1fv+Gjd7m@ninjato> <20210629103014.nlk3mpetydc4mi6l@vireshk-i7>
 <YNr5Jf3WDTH7U5b7@ninjato> <YNr5ZRhT3qn+e9/m@ninjato>
 <20210705121832.fmye5xnlbydoc5ir@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <29f27ee2-5a65-f635-0b0a-d35d7c4839fb@intel.com>
Date:   Tue, 6 Jul 2021 09:50:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210705121832.fmye5xnlbydoc5ir@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/7/5 20:18, Viresh Kumar wrote:
> On 29-06-21, 12:43, Wolfram Sang wrote:
>>>  From the spec:
>>>
>>> The case when ``length of \field{write_buf}''=0, and at the same time,
>>> ``length of \field{read_buf}''=0 doesn't make any sense.
>>>
>>> I mentioned this in my first reply and to my understanding I did not get
>>> a reply that this has changed meanwhile.
>>>
>> Also, this code as mentioned before:
>>
>>> +             if (!msgs[i].len)
>>> +                     break;
>> I hope this can extended in the future to allow zero-length messages. If
>> this is impossible we need to set an adapter quirk instead.
> Wolfram,
>
> I stumbled again upon this while working at the backend implementation.
>
> If you look at i2c_smbus_xfer_emulated(), the command is always sent via
> msgbuf0[0]. Even in the case of I2C_SMBUS_QUICK, where we set msg[0].len = 0, we
> still send the buf. This is really confusing :(
>
> Do I understand correctly that we always need to send msg[0].buf even when
> msg[0].len is 0 ?
>
> If so, it would be difficult to implement this with the current i2c virtio
> specification, as the msg.len isn't really passed from guest to host, rather it
> is inferred using the length of the buffer itself. And so we can't really pass a
> buffer if length is 0.
>
> Moreover, the driver uses i2c_get_dma_safe_msg_buf(), which also depends on the
> length parameter here to allocate the buffer and copy data to it.
>
> All in all, the latest version of the driver doesn't work with "i2cdetect -q <bus>".
>
> To make it work, I had to add this:
>
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> index 731267d42292..5b8bd98ae38e 100644
> --- a/drivers/i2c/busses/i2c-virtio.c
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -73,6 +73,9 @@ static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
>                  sg_init_one(&out_hdr, &reqs[i].out_hdr, sizeof(reqs[i].out_hdr));
>                  sgs[outcnt++] = &out_hdr;
>
> +               if (!msgs[i].len)
> +                       msgs[i].len = 1;
> +
>                  if (msgs[i].len) {
>                          reqs[i].buf = i2c_get_dma_safe_msg_buf(&msgs[i], 1);
>                          if (!reqs[i].buf)
>
> which made it I2C_SMBUS_BYTE instead of I2C_SMBUS_QUICK.
>
> What should we do here Wolfram?
>
>
> Jie, while wolfram comes back and replies to this, I think you need to switch
> back to NOT supporting zero length transfer and set update virtio_i2c_func() to
> return:
>
>          I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
>
> Support for zero-length transfers and I2C_FUNC_SMBUS_QUICK can be added
> separately.
>
> Thanks.


It's OK to me. Let's see what Wolfram says when he comes back.

I will send the updated version then.

Thanks.


