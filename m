Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC72347073
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 05:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbhCXEVa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 00:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbhCXEUt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Mar 2021 00:20:49 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833D9C0613D9
        for <linux-i2c@vger.kernel.org>; Tue, 23 Mar 2021 21:20:49 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id v23so7240838ple.9
        for <linux-i2c@vger.kernel.org>; Tue, 23 Mar 2021 21:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a/afWGdGSFNXJr7csXPGWYa00EkTSTONmeMOpMJ1SaM=;
        b=XiLjGp1stdvKpQHizWW/ll5mPZgehWA9t0Rnisnqa8NmCv07d9Siqs7eUy+/KGuJuF
         ICY6jizwg+2xSNrqUHbsuNKlUpmu/QJWyHfSrnJ3fcNm9Y6cFZ+wpIu9sFvBlBx1tO3G
         ZElvXAY5N9S9d63tr2bMJoZ2lfO/RAsrSIsTzEsx/pVN53CcKQg1jGXoJdpYLMF2vAxH
         dAMCXAW3mZQcD8jTIpdy9ZJ5J66EA1BuIQUrK1nVEGdACqiYVgerrq2+Ip+dnbTerPFG
         gdeuGCfQj7SPZlsyo5iaeLxUJHNBUK3tXWJBgSaEAyHWkUccs5Y8MM9ih/6sPXy8l+nI
         Si3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a/afWGdGSFNXJr7csXPGWYa00EkTSTONmeMOpMJ1SaM=;
        b=QO0oG1OblWXM2YXAj/gpdcubbhCw8/fZWCofMtDwCz4EZVYcN6vB5LAtbBAM12wVx3
         Vas0WwmLZ2AVVEM9qiTmjG5B3Y1y1Y3DlrCDwOYozitXonK69vWVCPAgLhoVf8yjWWWb
         qPYMCcuQNKTIvMY5xUYO8M9XLmIhDnR9i1mQx9SX0Jqu7Wc2oEPhd6nW7zIYb+nUNQ5z
         TncyJJ3DR640V2Xg8MxCkRmu4vZqsrb71kcHbA6chImu2r7xNI5oN5lpZEkY+KK0bZc8
         FjgLf5AquAMRKGSutW5SvsmeHvrIASj0IzNU2P4E4pFyJXjKoDUG4SEVUuk9znKWub1T
         v87Q==
X-Gm-Message-State: AOAM530CFJAHnIccIzvedmeIbRmVBGi3LDnWxriNw8t6w3ZlMGZAXK3T
        GVrM2k+up17R5qpv96nbpaMaEg==
X-Google-Smtp-Source: ABdhPJzzNbNptUENuuBe+67fTNok5AkA8Q+dvT7nlnxwW5tKps+et+igtpXYVKWYh29pGLhOvVh4/A==
X-Received: by 2002:a17:902:eac3:b029:e6:f010:6ecb with SMTP id p3-20020a170902eac3b02900e6f0106ecbmr1766125pld.37.1616559648644;
        Tue, 23 Mar 2021 21:20:48 -0700 (PDT)
Received: from localhost ([122.172.6.13])
        by smtp.gmail.com with ESMTPSA id e65sm698992pfe.9.2021.03.23.21.20.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 21:20:48 -0700 (PDT)
Date:   Wed, 24 Mar 2021 09:50:46 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210324042046.idkctj2t7cxi53jf@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23-03-21, 22:19, Jie Deng wrote:
> +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +{
> +	struct virtio_i2c *vi = i2c_get_adapdata(adap);
> +	struct virtqueue *vq = vi->vq;
> +	struct virtio_i2c_req *reqs;
> +	unsigned long time_left;
> +	int ret, nr;
> +
> +	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
> +	if (!reqs)
> +		return -ENOMEM;
> +
> +	mutex_lock(&vi->lock);
> +
> +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
> +	if (ret == 0)
> +		goto err_unlock_free;
> +
> +	nr = ret;
> +	reinit_completion(&vi->completion);
> +	virtqueue_kick(vq);

Coming back to this again, what is the expectation from the other side for this
? I mean there is no obvious relation between the *msgs* which we are going to
transfer (from the other side's or host's point of view). When should the host
OS call its virtqueue_kick() counterpart ?

Lemme give an example for this. Lets say that we need to transfer 3 messages
here in this routine. What we did was we prepared virtqueue for all 3 messages
together and then called virtqueue_kick().

Now if the other side (host) processes the first message and sends its reply
(with virtqueue_kick() counterpart) before processing the other two messages,
then it will end up calling virtio_i2c_msg_done() here. That will make us call
virtio_i2c_complete_reqs(), while only the first messages is processed until
now and so we will fail for the other two messages straight away.

Should we send only 1 message from i2c-virtio linux driver and then wait for
virtio_i2c_msg_done() to be called, before sending the next message to make sure
it doesn't break ?

-- 
viresh
