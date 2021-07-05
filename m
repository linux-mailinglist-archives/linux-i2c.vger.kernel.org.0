Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C3B3BB530
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 04:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhGECnh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jul 2021 22:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhGECnh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Jul 2021 22:43:37 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A902C061762
        for <linux-i2c@vger.kernel.org>; Sun,  4 Jul 2021 19:41:00 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id x16so15427873pfa.13
        for <linux-i2c@vger.kernel.org>; Sun, 04 Jul 2021 19:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5/pN4Ke3pX5vwwN2WlNO8yjdHUq5AXPfMRLrRETfPdM=;
        b=aKHomYdcEPhBlAt9kkJ9qhJHj4PKhbT8TgIKZmAadkH7oOmMWT7cO8Nc2Dh6r+KABy
         0RcgKCkPwd9PD3TXkF4zAa6KFS+yFhm5nSMnR89DRg9ljePoxjE+xGbwDXJOtD1+RDjs
         68unMHyVBNWNz0Bu/GPPH479FKPHzgOvubvi3NE/0q6wpbhwbt8YDwJyn50nP+W68MVW
         FdyYPUiMSa96ouDxzhvHnCLNgjRlVmpskQhqkZMmNj/I2IAIK/h2sspGxK2anoPE3lii
         bCW8i0qRetCnlEHomG0zBkx3BJbYyo3nhULU8cGXU0fArL/+TyqX0mtApAuIFlWnXq/M
         53Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5/pN4Ke3pX5vwwN2WlNO8yjdHUq5AXPfMRLrRETfPdM=;
        b=Rn50HLl7Efc6SQyW8C7/52Lk6P+P4N5O9DmWwH5LO+GVLhKqV/67NdGgTBWBBudkva
         Gw/L3/NYaRinmjgkzwONmalXczMpMBUe53MQ7bn0rBfwgfOJdedJPAOJ36/nWxo3A+Ei
         JId7h8zMvtPdyy97ZDK5iOC4u35QuPaELpGsod0oDtb+XzPHk0wcJXNfsINFckeDSx5w
         5wquP6xmsjVZJcglGVaQdzcvCI7eto34fCvk4ZOMhfi8yLI0j/6Inik1mQ/DcMeQthi6
         FFbV+qyTuRC0PX0qNaUCMr+kdDZE5KBR27nEOI6j8W6DZwdT73o77Vi6zzIsu1eRDkTd
         jf6g==
X-Gm-Message-State: AOAM533SQNvpEDkWotV927b3jMq5kFaHw2wW6KMq8Ytf0+mUTxuiTyyA
        oPTX+Z+LLTPEshomZQUBHaT0NTmFMEURqA==
X-Google-Smtp-Source: ABdhPJzv9zFkEM6yETuk4Cev7zKRIgjashmgNIf2AdxBqzXPrH5890A/gDkkpaAuKAPq34OVoQ/T0Q==
X-Received: by 2002:a65:68c1:: with SMTP id k1mr13154806pgt.335.1625452859542;
        Sun, 04 Jul 2021 19:40:59 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id d1sm10001808pfu.6.2021.07.04.19.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 19:40:58 -0700 (PDT)
Date:   Mon, 5 Jul 2021 08:10:56 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
Subject: Re: [PATCH v12] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210705024056.ndth2bwn2itii5g3@vireshk-i7>
References: <f229cd761048bc143f88f33a3437bdbf891c39fd.1625214435.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f229cd761048bc143f88f33a3437bdbf891c39fd.1625214435.git.jie.deng@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I think we missed the first deadline for 5.14-rc1 as Wolfram should be out of
office now. Anyway lets make sure we fix all the pending bits before he is back
and see if we can still pull it off by rc2.

On 02-07-21, 16:46, Jie Deng wrote:
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> +static int virtio_i2c_send_reqs(struct virtqueue *vq,

It would be better to rename this to virtio_i2c_prepare_reqs instead, as this
doesn't send anything.

> +				struct virtio_i2c_req *reqs,
> +				struct i2c_msg *msgs, int nr)
> +{
> +	struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
> +	int i, outcnt, incnt, err = 0;
> +
> +	for (i = 0; i < nr; i++) {
> +		/*
> +		 * Only 7-bit mode supported for this moment. For the address format,
> +		 * Please check the Virtio I2C Specification.
> +		 */
> +		reqs[i].out_hdr.addr = cpu_to_le16(msgs[i].addr << 1);
> +
> +		if (i != nr - 1)
> +			reqs[i].out_hdr.flags = cpu_to_le32(VIRTIO_I2C_FLAGS_FAIL_NEXT);
> +
> +		outcnt = incnt = 0;
> +		sg_init_one(&out_hdr, &reqs[i].out_hdr, sizeof(reqs[i].out_hdr));
> +		sgs[outcnt++] = &out_hdr;
> +
> +		if (msgs[i].len) {
> +			reqs[i].buf = i2c_get_dma_safe_msg_buf(&msgs[i], 1);
> +			if (!reqs[i].buf)
> +				break;
> +
> +			sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);
> +
> +			if (msgs[i].flags & I2C_M_RD)
> +				sgs[outcnt + incnt++] = &msg_buf;
> +			else
> +				sgs[outcnt++] = &msg_buf;
> +		}
> +
> +		sg_init_one(&in_hdr, &reqs[i].in_hdr, sizeof(reqs[i].in_hdr));
> +		sgs[outcnt + incnt++] = &in_hdr;
> +
> +		err = virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL);
> +		if (err < 0) {
> +			i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], false);
> +			break;
> +		}
> +	}
> +
> +	return i;
> +}

The right way of doing this is is making this function return - Error on failure
and 0 on success. There is no point returning number of successful additions
here.

Moreover, on failures this needs to clean up (free the dmabufs) itself, just
like you did i2c_put_dma_safe_msg_buf() at the end. The caller shouldn't be
required to handle the error cases by freeing up resources.

> +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
> +				    struct virtio_i2c_req *reqs,
> +				    struct i2c_msg *msgs, int nr,
> +				    bool fail)
> +{
> +	struct virtio_i2c_req *req;
> +	bool failed = fail;
> +	unsigned int len;
> +	int i, j = 0;
> +
> +	for (i = 0; i < nr; i++) {
> +		/* Detach the ith request from the vq */
> +		req = virtqueue_get_buf(vq, &len);
> +
> +		/*
> +		 * Condition (req && req == &reqs[i]) should always meet since
> +		 * we have total nr requests in the vq.
> +		 */
> +		if (!failed && (WARN_ON(!(req && req == &reqs[i])) ||
> +		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))

What about writing this as:

		if (!failed && (WARN_ON(req != &reqs[i]) ||
		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))

We don't need to check req here since if req is NULL, we will not do req->in_hdr
at all.

> +			failed = true;
> +
> +		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
> +		if (!failed)
> +			++j;
> +	}
> +
> +	return (fail ? -ETIMEDOUT : j);
> +}
> +

-- 
viresh
