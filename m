Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 603BE343B15
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 08:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCVH6x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 03:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbhCVH6Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Mar 2021 03:58:24 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9FEC061756
        for <linux-i2c@vger.kernel.org>; Mon, 22 Mar 2021 00:58:24 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so10707122pjb.0
        for <linux-i2c@vger.kernel.org>; Mon, 22 Mar 2021 00:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sGf+kwZW/wFP+9L+f/Acn8ft874BxO79I+2RdR2Ljro=;
        b=zYOBtMnDt3uvZ32hAu89RQU4ZZsrmM60m26MQ4CUJ7FsZE28fioehItLrKUI/cVcX9
         n4dft/MaV2jLEONuV59lCXv2Qw8E1Pb4KjmRECmU0uNnDZsCjEa3+B3VBUUxXtuO63zv
         HJhdwxgZJrWu/0naL93G7rJvl1n0sLc6ECynFYmlUjXBXdr9Z9ntKakESU55rMuP1NzL
         fDtD1d7V3U3ldcPmpqlJwCzk8CYc0QtQPFvuigF6pB1DYLMAM/WLRkSOFlmFRGi+eVkt
         nhOu2psV51aRVVgfBs0HNkWh6Yg3ica4wbnQ9PVlm93vTl+/pFw0VyairmnLC7Tt863C
         zUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sGf+kwZW/wFP+9L+f/Acn8ft874BxO79I+2RdR2Ljro=;
        b=Vd4H1Gr7fMCDTlgUm5+5pGhIWgDBVz8hTT5sd4pxraiPCT92prreXOKaVORZcYWTkh
         bCN+4Nrao6ntXjfKiWWCER9WW7SxpFVLLWD1YPLWCZcQ2IRF2tagLuSS3tKDbGNp/JNI
         2FcN9hBtLt6PC/l9F8JUHhL5r8vxA80CfI0cgM1vTS6A3T+sgrQWEtFtyLCZ6rXg9J+U
         8jmNy8E8N41RxPPgKejZNOZjHTgjL7JBXyYZKcIQSQ+XhSFWKuXCGwuSIcRQdgv3gs5r
         bg7eadeVE/bC5hqZmrHKItecFCupzdhCKEoJviRKdfmVx3OCIewbViTFDAqr31n5Ak1x
         +RLw==
X-Gm-Message-State: AOAM531VlrK1S9NInHU028ddkNVuwjVIgF9fshViXU9DgbZU+US/uEIu
        SghafcYnBBmGlFq7P0MR8htHSw==
X-Google-Smtp-Source: ABdhPJxouYQ82LCmVrc8wz5uT/zuSts5pJLavO1ID85yMTnE8nEYY23D6RDb7vIT3duJwog//o52yA==
X-Received: by 2002:a17:902:834a:b029:e6:b6bc:f58c with SMTP id z10-20020a170902834ab02900e6b6bcf58cmr26215016pln.85.1616399904057;
        Mon, 22 Mar 2021 00:58:24 -0700 (PDT)
Received: from localhost ([122.172.6.13])
        by smtp.gmail.com with ESMTPSA id z4sm11601770pgv.73.2021.03.22.00.58.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Mar 2021 00:58:23 -0700 (PDT)
Date:   Mon, 22 Mar 2021 13:28:21 +0530
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
Subject: Re: [PATCH v9] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210322075821.x6firpcpnuohf6y2@vireshk-i7>
References: <e09c07532f5456816eb91ef4176bf910284df4ff.1616418890.git.jie.deng@intel.com>
 <20210322064144.y6kpajolwh2kd3lj@vireshk-i7>
 <dbb5dfe9-8ee6-e3f8-3681-d0ec83282930@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbb5dfe9-8ee6-e3f8-3681-d0ec83282930@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22-03-21, 15:53, Jie Deng wrote:
> I think your optimization has problems...
> 
> 
> > 	bool err_found = timeout;

While at it, see if you want to rename this variable as well to something
smaller, like "failed". I didn't touch it as it is a matter of personal choice,
so leaving it to you..

-- 
viresh
