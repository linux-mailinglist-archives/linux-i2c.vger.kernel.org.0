Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0813B7077
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 12:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233001AbhF2KS7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 06:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbhF2KS6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Jun 2021 06:18:58 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFEC4C061760
        for <linux-i2c@vger.kernel.org>; Tue, 29 Jun 2021 03:16:30 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so2089230pjo.3
        for <linux-i2c@vger.kernel.org>; Tue, 29 Jun 2021 03:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fHJGPCNIIZX7zHvjAz1sYFrEy/nZsnBPgV4WCrzHZoY=;
        b=Z98RsBJ2tMkTUKUXLl5Z86dDA+gDkUzfeRB2iqkEAFOn8W9kU5xnIsZ24Mi2XLNOF0
         wLYpHpBObb7m0JF/BoIRzigVvDYWyxdeUcYiFI5SHXNrriLH9LHd4N1F5bR4+j59cYev
         ddhr0+b3wwtxl4cKcgAEjM5c3rT4ljRAE/ptecca3hwkFvqQvztGcA5Fsuar4AaLcURV
         khUnJ7jrXaTAOQWs32074IgP9tVrU19TS63wSh+JRJ6BkxgoZZ0fjOY8w5CPqacleKmM
         Z3OsH/ev2NhpiGg9tRp9OUv6SrhGJEnuZ7OGS6YCrAPDr6gyZ98FImrkj2n1hshYeGtM
         F8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fHJGPCNIIZX7zHvjAz1sYFrEy/nZsnBPgV4WCrzHZoY=;
        b=S18jbBElJOgiIZ5RnUvWXIOxNU7Bi7dghVwic7DAvvWL5Br9yOx0EeRwBM2psXIvhU
         0MOUFhSNXvuo27uKB6Hnt0hYEqNWw5YvrBbwYijPqcXaL9hFkiUOxBpFgBtOTVkHtDfg
         Tph1ePQH80yHb8+/tIRPo1OLnWzR0I1vTsAcVLYsn/O4+2s0C4cheaNlxugX2TwDmfjg
         RHt26sboymXsrbp84i7NNjlfj91ZYrryuFsnlxj8sFMHBHlnee55z4SUq5U/gFMF2Whu
         TVgFo6h84f3kozhcrfWIWIIaPjEVhs9M1BmkTj55HWu32PVs8NEZEmJBR8rIdhVKeBHV
         H8wA==
X-Gm-Message-State: AOAM533YSsls+3a+Z/hU73wqdCN5xKMOE3/1PCsl1g5OvOLn1CicNsxr
        4md5YeKZP8qvr7PYid9ql09liQ==
X-Google-Smtp-Source: ABdhPJy6ELC1Uskp0Zc2w7psvkk4b23wKkXSPLPrQWne41oU8aWbeHNf1IoQruutBgVH7W34Ck67cQ==
X-Received: by 2002:a17:90a:ea8a:: with SMTP id h10mr6312319pjz.61.1624961790404;
        Tue, 29 Jun 2021 03:16:30 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id c18sm16989726pfo.143.2021.06.29.03.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 03:16:29 -0700 (PDT)
Date:   Tue, 29 Jun 2021 15:46:27 +0530
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
Message-ID: <20210629101627.kwc2rszborc3kvjs@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNrw4rxihFLuqLtY@ninjato>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29-06-21, 12:07, Wolfram Sang wrote:
> > +static u32 virtio_i2c_func(struct i2c_adapter *adap)
> > +{
> > +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> 
> You are not emulating I2C_FUNC_SMBUS_QUICK, so you need to mask it out.

What is it that we need to have to emulate it ? I did use it in my
qemu and rust backends, not sure if this was ever sent by device I
used for testing SMBUS though.

-- 
viresh
