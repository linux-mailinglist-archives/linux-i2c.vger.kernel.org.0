Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510453B70B9
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 12:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbhF2Kcp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 06:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233037AbhF2Kco (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Jun 2021 06:32:44 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1020BC061766
        for <linux-i2c@vger.kernel.org>; Tue, 29 Jun 2021 03:30:17 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so2109779pjo.3
        for <linux-i2c@vger.kernel.org>; Tue, 29 Jun 2021 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AplI6UhQ/G6u2g2DkIgG3XJVtDuTtMAV8bpatC2NRMA=;
        b=RGz3rS3mFY+gNujWuQHWeD28pyLAd3A55cSGjgbJwhUrTj/QpoWa3tQFzVqw+LpF93
         93s/6VZGbo4RDnbUPsweWP5/kBmHJT3EK7D66wBeI9pNIPJFxAJpB2eY9k6dbNyLXUBH
         TxY3g+8o0TEJMkXc0A6KAFUEGvuobzkDRW4f878knKwuyjqJ7Od9tFYiyPcHO9IBuZci
         i+enWmvZ4ZrmDL3m3AyB8q8HesgPyUr2jxeEmbwX58n59URqVszwZc+118HDiXvgWClE
         twrMj+H4MEUIRw61GiBtp0/VQGPqUn6vGEIN0OVWAYO8yBxoSuFrsOqqV+R7QOZVc4RD
         8SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AplI6UhQ/G6u2g2DkIgG3XJVtDuTtMAV8bpatC2NRMA=;
        b=i1jPFAwc73DINg35tfglIKoFgfs3xCFDJl63lYq2Gzz0VMS8Rs5RzWxu+sTzqQdgVB
         WjsGoMwP8hLl4rZW2B0AcivGFHinXbwkFDffLzeKVUp7vFGS7emznpJyq2lzm4XYWQwB
         /+Bl8Ao0kD6KD9e40x2Osn+NMizrs4Q8+jnoKbNvtatYKEnYXsR1IbeIXuyghnzJ+ts9
         nhJFGqcywgsECNpGHd5cK1V6Fk5v6hpHfAt1SIsAT1wq5a0Rj0G530g4ECcQHg8LPEEa
         HI0UjYVNcdxUd3bm4Ag6TCC3d24pa2mgWhz5moZgfpDZNraa9J1MgnDr+JGZvwrs4DZS
         enxg==
X-Gm-Message-State: AOAM530zYSt5Ky0XyaD5AcUlHKzYY3Q1LqcOSZb0LklmsGdpGsUwyubI
        MTPG9aJOmvHEQaGFB3BMQsr7zQ==
X-Google-Smtp-Source: ABdhPJzj8DyqgsJQPdYIVf1Hs422bzpfb/1ueEKtGoM/X8JqPu9WgSL27fFIOF33UEZWog4ObSleUg==
X-Received: by 2002:a17:90b:4d81:: with SMTP id oj1mr24694030pjb.153.1624962616536;
        Tue, 29 Jun 2021 03:30:16 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id n69sm18024140pfd.132.2021.06.29.03.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 03:30:16 -0700 (PDT)
Date:   Tue, 29 Jun 2021 16:00:14 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, Jie Deng <jie.deng@intel.com>,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210629103014.nlk3mpetydc4mi6l@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato>
 <20210629101627.kwc2rszborc3kvjs@vireshk-i7>
 <YNr0uDx1fv+Gjd7m@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNr0uDx1fv+Gjd7m@ninjato>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29-06-21, 12:23, Wolfram Sang wrote:
> 
> > > You are not emulating I2C_FUNC_SMBUS_QUICK, so you need to mask it out.
> > 
> > What is it that we need to have to emulate it ? I did use it in my
> > qemu and rust backends, not sure if this was ever sent by device I
> > used for testing SMBUS though.
> 
> The biggest use is to scan busses for devices, i.e. use 'i2cdetect'
> without the -r parameter.

Okay. But what is missing in the driver because of which it should
mask out I2C_FUNC_SMBUS_QUICK.

-- 
viresh
