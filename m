Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06623413E2
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 04:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233358AbhCSDyp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 23:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233613AbhCSDyj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Mar 2021 23:54:39 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C42AC06175F
        for <linux-i2c@vger.kernel.org>; Thu, 18 Mar 2021 20:54:39 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y200so4944127pfb.5
        for <linux-i2c@vger.kernel.org>; Thu, 18 Mar 2021 20:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=narkUsbR5ZUD1XMmhTYoytTDn8nBO3CvEWs/Vsjdzh4=;
        b=SCqTJyXszA4QtpOWiiaGqTicH6VMbqAXvLD8IEo3iKOG64GQU6qaQrlQuZiMfDrQ2M
         AV7fsI6pokKg3fwm+gIgwnSYCsJvwSzUmTiguQITXtPMM8XNBFlsc3PFrgEszFIwP31a
         XDsX4VZLOnQoG34Bm1HwGINs9ilviRRoBxoucehvmHZffLfHtZddjEVCKIiSEIBiIgjH
         S+IgHh4H8f0Sscg9fTAEDKknzmi7A7YfEbS+ikNbNuaYKEYKMxsCA9W6v/t+jAyp07Bd
         DSXl3jq9Bl0DdGM3rG2dY3ldEf0iiiRZfCGGMZYQO2ET+3e5V0m3d4KPYA3ErJTmtuGU
         dwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=narkUsbR5ZUD1XMmhTYoytTDn8nBO3CvEWs/Vsjdzh4=;
        b=US6vI5Rv2MqgL7ANhOzjXCvnrBT92uFjQiWRJ5b6gBg85/k0vk29hDTMeK+RX+Tvwd
         1GmoTQ/YRc9Blya/fmr4mlRkNNCnHH1hM52JZ/mfwLEyVzyIklWxtjDs2ZwmSM0k7bze
         Tzf03TEVkoUOTGq1BQnLy8ezQk6pLDYQuP8SHZji2a7fHMGZ/LUoegGS10jc+Eilznuo
         6FvxrWPglJbTb2o6dS/f9qeZwJatlATSjAMTyMJs0dOfQF5Bv0BY2qNyMx6SbKDHAspN
         b/2sNOEKknZEoej85tDstjGV2bxmroqVylKmzuul7wDDp4ei7o/tPDGs4nxEX9lbYS6y
         Racg==
X-Gm-Message-State: AOAM530WBzkYK03lQvaJKci4VFSebKLgmMz4PemCCTV0rH6B9gNZ47mv
        6F1lCosR7jEMU5O2tca2z7TkTEdPSmd+JQ==
X-Google-Smtp-Source: ABdhPJygVESN9h44+tNWX3dTnBly9T7ce+LfjxsvZ5WfoERLs08fRAO+nT6RE4PnG82iwDTnqHrkuQ==
X-Received: by 2002:a62:3503:0:b029:1aa:6f15:b9fe with SMTP id c3-20020a6235030000b02901aa6f15b9femr7100635pfa.65.1616126078954;
        Thu, 18 Mar 2021 20:54:38 -0700 (PDT)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id bj15sm3609033pjb.9.2021.03.18.20.54.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Mar 2021 20:54:37 -0700 (PDT)
Date:   Fri, 19 Mar 2021 09:24:35 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210319035435.a4reve77hnvjdzwk@vireshk-i7>
References: <c193b92d8d22ba439bb1b260d26d4b76f57d4840.1615889867.git.jie.deng@intel.com>
 <20210316074409.2afwsaeqxuwvj7bd@vireshk-i7>
 <0dfff1ac-50bb-b5bc-72ea-880fd52ed60d@metux.net>
 <CAK8P3a3f9bKdOOMgrA9TfeObyEd+eeg8JcTVT8AyS1+s=X2AjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3f9bKdOOMgrA9TfeObyEd+eeg8JcTVT8AyS1+s=X2AjQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18-03-21, 15:52, Arnd Bergmann wrote:
> Allowing multiple virtio-i2c controllers in one system, and multiple i2c
> devices attached to each controller is clearly something that has to work.

Good.

> I don't actually see a limitation though. Viresh, what is the problem
> you see for having multiple controllers?

I thought this would be a problem in that case as we are using the global
virtio_adapter here.

+       vi->adap = &virtio_adapter;
+       i2c_set_adapdata(vi->adap, vi);

Multiple calls to probe() will end up updating the same pointer inside adap.

+       vi->adap->dev.parent = &vdev->dev;

Same here, overwrite.

+       /* Setup ACPI node for controlled devices which will be probed through ACPI */
+       ACPI_COMPANION_SET(&vi->adap->dev, ACPI_COMPANION(pdev));
+       vi->adap->timeout = HZ / 10;

These may be fine, but still not ideal I believe.

+       ret = i2c_add_adapter(vi->adap);
i
This should be a problem as well, we must be adding this to some sort of list,
doing some RPM stuff, etc ?

Jie, the solution is to allocate memory for adap at runtime in probe and remove
the virtio_adapter structure completely.

-- 
viresh
