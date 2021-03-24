Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382C73471C2
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 07:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbhCXGok (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 02:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbhCXGoj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Mar 2021 02:44:39 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7BCC061763
        for <linux-i2c@vger.kernel.org>; Tue, 23 Mar 2021 23:44:39 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id 11so16628460pfn.9
        for <linux-i2c@vger.kernel.org>; Tue, 23 Mar 2021 23:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aSJT5+vBOjWVkgbSerE6Hjm36gVu5BRtzRn7wN8U5NI=;
        b=quufM2cQbZgCBGhyCWILsUT4i1rQCv+xKFJ1M+3C2+C1HTxHlcAQN7Xgz732Ss6eAv
         lCUcFz4NwL3MIDXiQBnMZiCVYigH5kj1hVtj1DSayrzP8d5R2t2P7MI6s09D3O+Plzk+
         FQTlfF5EKfv3fc6Ft9S/r6HM7NfpcCKk7TNeatgExUvKDC6ieq7pC+NTiSQGVuJa2f4y
         WgsCHsIUUGr1YzIc61BudkgGEpxqMuCpy6iB2nb0GX7NcFvFkFa3uD12dgpF2zpxt/g2
         bjOScdWm6VYnRVCPYRCgRm7bJxr5Z9Ev79KpYk2PQcebgjcWJ+yHilXXfVnXiHv4Sn47
         1obA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aSJT5+vBOjWVkgbSerE6Hjm36gVu5BRtzRn7wN8U5NI=;
        b=S2Nv8DeJ2auTOE2LDWj9yX16pp0s13Jy+FhltIpUbIhqz30+ITcdWA4Np9q5uQSbzq
         wMKo/5nAu/HdE+5MYkyHHwBYel3JkhpJLe5hb7zF3efMENgYDbf3jGkQtlXCAhfGHR7B
         oi9yBLPuuG5zfd1zJQ915xJTUl/nSgI6zs8iYGLlhn3MNc7yQvka1PeOou7zskWvoJp5
         1QKANL6yR1stU32nmq6QnvI8zELA5MB97gkPFz/Iop4n1dOhl9XP5Zg8C709c22MuK5Q
         E/G50CZ9hAvsojJPC71IthzrryA8+wvvFT5VAfM6hMF1KK651tzggoeNWrVZyfeOmHB4
         WCUA==
X-Gm-Message-State: AOAM530yxSqPqX1IH0TZBYQyvncXOYjqDNb0VP8fm933X8/mYhIRyWSA
        MtT3L97ceYHb52XnIrGU377FdQ==
X-Google-Smtp-Source: ABdhPJwiq4he5NCvbnsn9N+SGA43USt37qlGbDAoLwgzTGE9SmzjOJfsas45sPcABEmtrmW8SBRM5w==
X-Received: by 2002:a62:1bd5:0:b029:1f9:2f83:2e82 with SMTP id b204-20020a621bd50000b02901f92f832e82mr1874718pfb.1.1616568278752;
        Tue, 23 Mar 2021 23:44:38 -0700 (PDT)
Received: from localhost ([122.172.6.13])
        by smtp.gmail.com with ESMTPSA id 6sm1280867pfv.179.2021.03.23.23.44.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 23:44:37 -0700 (PDT)
Date:   Wed, 24 Mar 2021 12:14:35 +0530
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
Message-ID: <20210324064435.qbsbtjax2iklubfh@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210324042046.idkctj2t7cxi53jf@vireshk-i7>
 <70908366-c270-848e-0be3-c85fec7958ec@intel.com>
 <20210324060907.nwilmghg2xcdz7nv@vireshk-i7>
 <84f0bf1b-9b69-6fc0-011c-2aafde208435@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84f0bf1b-9b69-6fc0-011c-2aafde208435@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24-03-21, 14:41, Jie Deng wrote:
> 
> On 2021/3/24 14:09, Viresh Kumar wrote:
> > On 24-03-21, 14:05, Jie Deng wrote:
> > Or, now that I think about it a bit more, another thing we can do here is see if
> > virtqueue_get_buf() returns NULL, if it does then we should keep expecting more
> > messages as it may be early interrupt. What do you say ?
> 
> I don't think we really need this because for this device, early interrupt
> is a bad operation
> which should be avoided. I can't think of why this device need to send early
> interrupt, what
> we can do is to clarify that this means loss of the remaining requests. A
> device should never
> do this, if it does then loss is the expected result.

Fair enough.

-- 
viresh
