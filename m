Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E096833CEC7
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Mar 2021 08:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbhCPHol (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Mar 2021 03:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhCPHoM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Mar 2021 03:44:12 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E73C061756
        for <linux-i2c@vger.kernel.org>; Tue, 16 Mar 2021 00:44:12 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so977849pjb.2
        for <linux-i2c@vger.kernel.org>; Tue, 16 Mar 2021 00:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W5h0bUXWDSB1Ae5XJBoiyh2Xj3toBE2wNivBmYweenE=;
        b=msj76aS02SzqrQYNNwz0myiH2/v4E3ZS61URkmTlbAHwl2fSTmCEF6ltGLFQCHhn1D
         lDIaPpf4572rbiQ0jZtFi3+deALQo1y0B3GAbBJ3opczO159ob3ZjLNsnLD64uQPHcDf
         BhvKddS/BVBmNScJQPHYJwbgJI7pUX/TJPppMcM8WbU0WDeUpsGnpOemrJoVaPSgXhnV
         HLS7CKpSHu5JzNqX7cFtiHuy43PljgokxR9KwRqyPPht2WU6RpPf+1YgRHax91ssyVtd
         zij/lXOw0sIj0JotTnpegtiggzbC3fzhfP1jmDFbDzGUELTp3QzcA02ZgGE/P9BO7hY4
         rBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W5h0bUXWDSB1Ae5XJBoiyh2Xj3toBE2wNivBmYweenE=;
        b=e3WuTMa6+O6g7M7LZtEwwGKkNN396p1NFDSfZvR+v+3yAMqrk5ETN59lO4ZN6qu/4z
         +e34lWk3AkDasr+wde1ghOENpU0L9qEqhA+AFZ4XE4CEUC6OLgQl7h2v1skKh1hVpzBg
         No0CxFLS33CB/iXSPj0v2VH4SYT92QOsC/0MXuIOq1ZxZsU/IDvD5xRfJzILPygJJxXd
         q1U9LL8UZCYM/fEie/fiE+2Jypj/+ssmZzHDu1akMeVSLXrp2OA+C4NeQ3r9PvqjeYIw
         84ZWkUb4DAU5BSa+oSVPXYJqaYJJu/D6eTUNp8LuKwn19Wo3GmdghDSIPxjA88tvPLwc
         PhuA==
X-Gm-Message-State: AOAM530AcJNlphXBHStHjFdQwrMElBQQp8CLF39x2QevmfztAcW7dcAb
        tCD5s85WfskI4Nz9eDE6drDPBg==
X-Google-Smtp-Source: ABdhPJwK3maXiitVa4tCw10zFcQS+WrulYJYSD7NM0WPIl3IRwGQQTQ4LI6oq7jfJuaeVuNb0Zc+Pg==
X-Received: by 2002:a17:90a:174c:: with SMTP id 12mr3476958pjm.40.1615880651886;
        Tue, 16 Mar 2021 00:44:11 -0700 (PDT)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id s62sm16122881pfb.148.2021.03.16.00.44.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Mar 2021 00:44:11 -0700 (PDT)
Date:   Tue, 16 Mar 2021 13:14:09 +0530
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
Subject: Re: [PATCH v8] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210316074409.2afwsaeqxuwvj7bd@vireshk-i7>
References: <c193b92d8d22ba439bb1b260d26d4b76f57d4840.1615889867.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c193b92d8d22ba439bb1b260d26d4b76f57d4840.1615889867.git.jie.deng@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16-03-21, 18:35, Jie Deng wrote:
> +static struct i2c_adapter virtio_adapter = {
> +	.owner = THIS_MODULE,
> +	.name = "Virtio I2C Adapter",
> +	.class = I2C_CLASS_DEPRECATED,
> +	.algo = &virtio_algorithm,
> +};
> +
> +static int virtio_i2c_probe(struct virtio_device *vdev)
> +{
> +	struct device *pdev = vdev->dev.parent;
> +	struct virtio_i2c *vi;
> +	int ret;
> +
> +	vi = devm_kzalloc(&vdev->dev, sizeof(*vi), GFP_KERNEL);
> +	if (!vi)
> +		return -ENOMEM;
> +
> +	vdev->priv = vi;
> +	vi->vdev = vdev;
> +
> +	mutex_init(&vi->lock);
> +	init_completion(&vi->completion);
> +
> +	ret = virtio_i2c_setup_vqs(vi);
> +	if (ret)
> +		return ret;
> +
> +	vi->adap = &virtio_adapter;
> +	i2c_set_adapdata(vi->adap, vi);
> +	vi->adap->dev.parent = &vdev->dev;

FWIW, this limits this driver to support a single device ever. We
can't bind multiple devices to this driver now. Yeah, perhaps we will
never be required to do so, but who knows.

-- 
viresh
