Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B28FA43726E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 08:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbhJVHA2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Oct 2021 03:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbhJVHA1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Oct 2021 03:00:27 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0FC9C061764
        for <linux-i2c@vger.kernel.org>; Thu, 21 Oct 2021 23:58:10 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id kk10so2266781pjb.1
        for <linux-i2c@vger.kernel.org>; Thu, 21 Oct 2021 23:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=c7Ryh42xjoZrd458X0PuRKzO/jGZ4LiJFN49yEEUKqU=;
        b=qBAzCypTQajk5c9kRrbb3OjnMB83pysGa8f0+yBZdKL3RKQ9HraA7zOzdmRoSKAmve
         CnOAiNK9bzTLXT656DXcuMss006ywRhgEFfULF+cZJzghyce6Ot5MjPSSgouy1gG7Trp
         dcoATQqZj9/ZVmWRLErSAWHIAmmljTluNWtfllA4/Shl08bLf4y0M/w7KbzDSpRWn7OH
         zihPq9LHC0G05PZBso4aRpbkrDr6jf41VDoIb2YOrMiEdCf/4MFLh+2fuduJyU0BQVdb
         745oMHnJMUCETHWzU5q90ajexcmQZ3PeLWiNUhAybl/o9HhV3scHsmdFOjPfRQ1ynbNk
         0GOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c7Ryh42xjoZrd458X0PuRKzO/jGZ4LiJFN49yEEUKqU=;
        b=uPpIcjd77NA2i2pRps/34PCl7pf+OxhyJerrEAHWpW110SYDnz6bQSN+62pUwsfHRd
         jCPKpeagPlW/icrLmJbvOZEkUpacqryggh0NIYOyI+HrFVvy7T59dPjliUXAXzj4qr4O
         +X29UN4+6Bcw63diECB8gvOtqvGUslNEhz6NJvppAUdka05dbBCeTZnE0Newv5GTgWk6
         qW2QSYoOW6E98tDQLBhIVRjokGZmD0W3mbdzTX6Rydbx2fDJ6WP5DJT0Pusgv3hodTRb
         qv2ZAFtkL4i8Tsy85O12pIGPMB9uHzDsNscwQTMB2AV0d0Bal9Vh2+F7PRAE6tZu5VqP
         txag==
X-Gm-Message-State: AOAM530c6NmkMuWhGnoJxhWx8bgmuFkg8bO5qiRctuM10S+28C5Z0dUo
        hX37gXhnA0VOVl0ZK5Kjq3IhRklcF9+8+A==
X-Google-Smtp-Source: ABdhPJwMKxqgWWNy65Dtf8Zi0C/hvEbDozlU/nTWVV0Se0KvR9Raf7/OcIkwhpzIom5qPtofGLcylA==
X-Received: by 2002:a17:90a:f0c9:: with SMTP id fa9mr12611364pjb.107.1634885890395;
        Thu, 21 Oct 2021 23:58:10 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id u23sm9841299pfg.162.2021.10.21.23.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 23:58:09 -0700 (PDT)
Date:   Fri, 22 Oct 2021 12:28:08 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>,
        stratos-dev@op-lists.linaro.org,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        cohuck@redhat.com,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, conghui.chen@intel.com
Subject: Re: [PATCH] i2c: virtio: Add support for zero-length requests
Message-ID: <20211022065808.2rvbr6nvollz5mz6@vireshk-i7>
References: <7c58868cd26d2fc4bd82d0d8b0dfb55636380110.1634808714.git.viresh.kumar@linaro.org>
 <0adf1c36-a00b-f16f-e631-439148c4f956@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0adf1c36-a00b-f16f-e631-439148c4f956@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22-10-21, 14:51, Jie Deng wrote:
> > +	if (!virtio_has_feature(vdev, VIRTIO_I2C_F_ZERO_LENGTH_REQUEST)) {
> > +		dev_err(&vdev->dev, "Zero-length request feature is mandatory\n");
> > +		return -EINVAL;
> 
> 
> It might be better to return -EOPNOTSUPP ?

Maybe that or one of these:

#define	EBADE		52	/* Invalid exchange */
#define	EPROTO		71	/* Protocol error */
#define	EPFNOSUPPORT	96	/* Protocol family not supported */
#define	ECONNREFUSED	111	/* Connection refused */

Arnd, any suggestions ? This is about the mandatory feature not being offered by
the device.

-- 
viresh
