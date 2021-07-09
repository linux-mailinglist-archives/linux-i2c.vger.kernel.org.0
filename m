Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCB73C1DE3
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jul 2021 05:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhGIDqy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jul 2021 23:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbhGIDqx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jul 2021 23:46:53 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362B7C06175F
        for <linux-i2c@vger.kernel.org>; Thu,  8 Jul 2021 20:44:11 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id b5-20020a17090a9905b029016fc06f6c5bso5304958pjp.5
        for <linux-i2c@vger.kernel.org>; Thu, 08 Jul 2021 20:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xkFDtexi/vMwk8I3d6YlTg5u37i8ZW2hQo1vPp5vAsk=;
        b=CIGTDosxAQ1YjXeC3953YY48H+KIcktvFf+jUy6Mf3aKz9wBXD27lWDOaK7UCa23Hi
         PWHBvkvblid2DvD713/emp6BmhVjoXVyyC2KDZPIRy9bs1eHgiqQztLd+28te0uYIV/O
         gE66OE3UGusmNlh4Gfxj63fcFmrH7p3KLoSLwBeIpvE8SWMgRKT8LeCKgdCikjKxin4z
         q9sDIgDhoRtFk21Pe8VMVmq1MAZf27Vv29rcFc6f72E1AEP2hbE15ClxubOUGaXvHSWm
         gOn7MT3GAU2RrDIk4/5PtozgUlwa9FLExSwt7EkkI8N1iakD8beHuDX3Z8h1G3+eNNsw
         36XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xkFDtexi/vMwk8I3d6YlTg5u37i8ZW2hQo1vPp5vAsk=;
        b=FCVAKYWRtrDCJ4gaKwvYLq0QKbS4t8th+sSjqFTEDdExx/XPtcF9/JpUt/YAloNTn5
         ca+huELOIMAyuWfPfnDfHGFOMe2zRhq2CI8oiPjAEgXdsWwT801EJJ8KsCz+Tg1noEgK
         NB9nBweFhFXLlS/M5Gm0sSYL7Y0h1rLgoE3ZdWw5tSUjL9+qeTXVzADvBV6LCRW9q+ry
         MLqP4ZAQSUAC2omPQYXtqGdGXpDNEaXYCl7TwJ5qEuL/87qc2O3fe0MTglgK9x1S7s7J
         Vu9MKk/pUWg84QYuVgexSUO7DzU2dlyjKbi97U6M8nuFaM1IVhOZ9hVcgdC9kvCS3TMn
         BS2g==
X-Gm-Message-State: AOAM531QpiwTAZkNXKfSGDgzJUYYGquLYx8CX4ZRJiXiVo3sDMer2oYD
        70C7OUNw2qFQODwoB6g6UkvDaA==
X-Google-Smtp-Source: ABdhPJxH+A4xey9h58qu80WqGf4nd39LxWfRQeFFewlb+PDJOngfC5cTctLhAT7z2TUi+NJIe3vRxw==
X-Received: by 2002:a17:90a:cd01:: with SMTP id d1mr8389091pju.106.1625802250390;
        Thu, 08 Jul 2021 20:44:10 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id q21sm4218209pfh.26.2021.07.08.20.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 20:44:09 -0700 (PDT)
Date:   Fri, 9 Jul 2021 09:14:07 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com, gregkh@linuxfoundation.org,
        vincent.guittot@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v14] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210709034407.xmglkgzubrztnxsg@vireshk-i7>
References: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09-07-21, 10:25, Jie Deng wrote:
> Add an I2C bus driver for virtio para-virtualization.
> 
> The controller can be emulated by the backend driver in
> any device model software by following the virtio protocol.
> 
> The device specification can be found on
> https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.
> 
> By following the specification, people may implement different
> backend drivers to emulate different controllers according to
> their needs.
> 
> Co-developed-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Jie Deng <jie.deng@intel.com>
> ---
> Changes v13 -> v14
> 	- Put the headers in virtio_i2c.h in alphabetical order.
> 	- Dropped I2C_FUNC_SMBUS_QUICK support.
> 	- Dropped few unnecessary variables and checks.
> 	- Use "num" everywhere instead of num or nr, to be consistent.
> 	- Added few comments which make the design more clear. 

Thanks a lot for following this up so far :)

> +static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
> +				   struct virtio_i2c_req *reqs,
> +				   struct i2c_msg *msgs, int num)
> +{
> +	struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
> +	int i;
> +
> +	for (i = 0; i < num; i++) {
> +		int outcnt = 0, incnt = 0;
> +
> +		/*
> +		 * We don't support 0 length messages and so masked out
> +		 * I2C_FUNC_SMBUS_QUICK in virtio_i2c_func().
> +		 */
> +		if (!msgs[i].len)
> +			break;
> +
> +		/*
> +		 * Only 7-bit mode supported for this moment. For the address
> +		 * format, Please check the Virtio I2C Specification.
> +		 */
> +		reqs[i].out_hdr.addr = cpu_to_le16(msgs[i].addr << 1);
> +
> +		if (i != num - 1)
> +			reqs[i].out_hdr.flags = cpu_to_le32(VIRTIO_I2C_FLAGS_FAIL_NEXT);
> +
> +		sg_init_one(&out_hdr, &reqs[i].out_hdr, sizeof(reqs[i].out_hdr));
> +		sgs[outcnt++] = &out_hdr;
> +
> +		reqs[i].buf = i2c_get_dma_safe_msg_buf(&msgs[i], 1);
> +		if (!reqs[i].buf)
> +			break;
> +
> +		sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);
> +
> +		if (msgs[i].flags & I2C_M_RD)
> +			sgs[outcnt + incnt++] = &msg_buf;
> +		else
> +			sgs[outcnt++] = &msg_buf;
> +
> +		sg_init_one(&in_hdr, &reqs[i].in_hdr, sizeof(reqs[i].in_hdr));
> +		sgs[outcnt + incnt++] = &in_hdr;
> +
> +		if (virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL)) {
> +			i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], false);
> +			break;
> +		}
> +	}
> +
> +	return i;
> +}

Wolfram, in case you wonder why we don't error out early as discussed earlier,
then ...

> +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +			   int num)
> +{

...

> +	/*
> +	 * For the case where count < num, i.e. we weren't able to queue all the
> +	 * msgs, ideally we should abort right away and return early, but some
> +	 * of the messages are already sent to the remote I2C controller and the
> +	 * virtqueue will be left in undefined state in that case. We kick the
> +	 * remote here to clear the virtqueue, so we can try another set of
> +	 * messages later on.
> +	 */

... here is the reasoning for that.

Please see if you can still get it merged into 5.14-rc1/2. Thanks.

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
Tested-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
