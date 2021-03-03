Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4184232C23C
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Mar 2021 01:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245713AbhCCXGz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Mar 2021 18:06:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1842519AbhCCIGQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Mar 2021 03:06:16 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9FAC061793
        for <linux-i2c@vger.kernel.org>; Tue,  2 Mar 2021 23:54:34 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id m6so15697602pfk.1
        for <linux-i2c@vger.kernel.org>; Tue, 02 Mar 2021 23:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1OHNpV5o7TZ/CsTPSnfCsiR7j00EOgl+1+rL+aenzg8=;
        b=E6aTq4IzcdgHTaVB46rDkYllEEMGl8JV+5cuhSotwMfh09YnMZXpUfd8YJm82ztZaW
         OI7yYuwqNEo0e77PYkrE9DUEpsxBBKmRRBMs5ug77ekHJlCi7sIkR01rZ2N4OaHIoRwa
         D7ppHFidESKVcGTKT8xs0bCVQHXSW+WQWNRxKlChMCd68oHpqCwZ0nt2EOqNoYBx1qKS
         pXubDFViPEkA24rc+T4Dhat/jrdNAqrOizovXnACjoDj1VgddZIc4RAGahfai5nzM211
         IV36HsDzzAD9Qh6xh1nDD1bik0/5OVqST8j9+6QeLcwVe82k9c4XH5YBJbGl53qels9U
         aPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1OHNpV5o7TZ/CsTPSnfCsiR7j00EOgl+1+rL+aenzg8=;
        b=gNzsZhJdcNegpqaYEJgNH63RljJy878M8OMADD08zLYvbgQgUKDbq2ggUWWmk7IP7Y
         ZMEZR+Sd6XJyNfFskaf+fd74L9+F5NXLex/xGyfQYgWfB356BtUSTvYFv3hdKQpWKcr0
         n8ObaI/3rNuLVpTqdTdhNILneUAFGk7i5JBjimdpDJJFL7cGW38fAuOoXFb0/lYAcqhU
         Gh6BkNkB7BFuc1RnkYqPFABD0izKshnO5iS1QJfA5NwLJm5ZUk3qK8e8MF/7T74NIblu
         7P8hN9YuDYi8LFk9o+1gazzc5rYmYMME5g4LqRPsk5z2v9xXK2HXMab+Yi/52rxjGlv9
         YFQQ==
X-Gm-Message-State: AOAM533lZkz3iuAv6rdbelMVQY444Sq5lecirXgirBoUrbYGPGtFSayA
        5WJOozfd5wlwVDLPkrTjN4CDDQ==
X-Google-Smtp-Source: ABdhPJxU2Pb2IsjDSyaYgpyK6YHgNLiha4rdcYZpod8JO49hKBKueY8CQGeH5WDMGK83u6EtOv7DWg==
X-Received: by 2002:a62:1896:0:b029:197:491c:be38 with SMTP id 144-20020a6218960000b0290197491cbe38mr7006426pfy.15.1614758073259;
        Tue, 02 Mar 2021 23:54:33 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id a23sm23693188pfk.80.2021.03.02.23.54.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Mar 2021 23:54:32 -0800 (PST)
Date:   Wed, 3 Mar 2021 13:24:30 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>
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
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210303075430.n7ewkots6cgbbabi@vireshk-i7>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01-03-21, 14:41, Jie Deng wrote:
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> +static int virtio_i2c_send_reqs(struct virtqueue *vq,
> +				struct virtio_i2c_req *reqs,
> +				struct i2c_msg *msgs, int nr)
> +{
> +	struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
> +	int i, outcnt, incnt, err = 0;
> +	u8 *buf;
> +
> +	for (i = 0; i < nr; i++) {
> +		if (!msgs[i].len)
> +			break;
> +
> +		reqs[i].out_hdr.addr = cpu_to_le16(msgs[i].addr << 1);
> +
> +		if (i != nr - 1)
> +			reqs[i].out_hdr.flags |= VIRTIO_I2C_FLAGS_FAIL_NEXT;
> +
> +		outcnt = incnt = 0;
> +		sg_init_one(&out_hdr, &reqs[i].out_hdr, sizeof(reqs[i].out_hdr));
> +		sgs[outcnt++] = &out_hdr;
> +
> +		buf = kzalloc(msgs[i].len, GFP_KERNEL);
> +		if (!buf)
> +			break;
> +
> +		if (msgs[i].flags & I2C_M_RD) {
> +			reqs[i].read_buf = buf;
> +			sg_init_one(&msg_buf, reqs[i].read_buf, msgs[i].len);
> +			sgs[outcnt + incnt++] = &msg_buf;
> +		} else {
> +			reqs[i].write_buf = buf;
> +			memcpy(reqs[i].write_buf, msgs[i].buf, msgs[i].len);
> +			sg_init_one(&msg_buf, reqs[i].write_buf, msgs[i].len);
> +			sgs[outcnt++] = &msg_buf;
> +		}
> +
> +		sg_init_one(&in_hdr, &reqs[i].in_hdr, sizeof(reqs[i].in_hdr));
> +		sgs[outcnt + incnt++] = &in_hdr;
> +
> +		err = virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL);
> +		if (err < 0) {
> +			pr_err("failed to add msg[%d] to virtqueue.\n", i);
> +			if (msgs[i].flags & I2C_M_RD) {
> +				kfree(reqs[i].read_buf);
> +				reqs[i].read_buf = NULL;
> +			} else {
> +				kfree(reqs[i].write_buf);
> +				reqs[i].write_buf = NULL;
> +			}
> +			break;
> +		}
> +	}
> +
> +	return i;
> +}

> diff --git a/include/uapi/linux/virtio_i2c.h b/include/uapi/linux/virtio_i2c.h
> +/**
> + * struct virtio_i2c_out_hdr - the virtio I2C message OUT header
> + * @addr: the controlled device address
> + * @padding: used to pad to full dword
> + * @flags: used for feature extensibility
> + */
> +struct virtio_i2c_out_hdr {
> +	__le16 addr;
> +	__le16 padding;
> +	__le32 flags;
> +};

Both this code and the virtio spec (which is already merged) are
missing msgs[i].flags and they are never sent to backend. The only
flags available here are the ones defined by virtio spec and these are
not i2c flags.

I also looked at your i2c backend for acrn and it mistakenly copies
the hdr.flag, which is the virtio flag and not i2c flag.

https://github.com/projectacrn/acrn-hypervisor/blob/master/devicemodel/hw/pci/virtio/virtio_i2c.c#L539

I will send a fix for the specs if you agree that there is a problem
here.

what am I missing here ? This should have been caught in your testing
and so I feel I must be missing something.

-- 
viresh
