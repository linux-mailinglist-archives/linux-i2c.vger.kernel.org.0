Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9CC3B8DB1
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jul 2021 08:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbhGAGVT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jul 2021 02:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233878AbhGAGVT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jul 2021 02:21:19 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3971DC061756
        for <linux-i2c@vger.kernel.org>; Wed, 30 Jun 2021 23:18:49 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id u19so3070702plc.3
        for <linux-i2c@vger.kernel.org>; Wed, 30 Jun 2021 23:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=mu5saGqKxlXNgVr7bcUnXINmJrCKq5xXKKfQAtxefEg=;
        b=h9Kzy0o8doVD9ByVw9IGSjaHbYWwh92htcQYdFNY4Q8T7cuElQf9u0lW9u6YfjQ9CH
         kG98yU3KNF0SRulS+ANueQUmfbVupvm9cEEfBvoJ8WLnwFFsiv0JceFOF0ZSWVS0UYh5
         TyYHbWZFLgXMNwHjn9dRSu/fI5zROQe1n9YBRLsgdvd5dUBtIz1kZKg4YGR3jO4UQP5b
         2UUBh+4FY2pNgxpd1X0/XrKuJIEtoWM3mqegp96PtO2OrjqAprpCkR8kWqnQRv3Rd88u
         hWVKCr8BucPyk8uC/axXXFTzP7FCTToajduKNeCiIUJO+LhldTGAJsSlwcJf9xb5+i3Q
         l10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=mu5saGqKxlXNgVr7bcUnXINmJrCKq5xXKKfQAtxefEg=;
        b=mGj7uSvrnfDuJSUit+dOjkjNF2EuLGai8mCAuoVQgNmBQLtSwXClu7S13mfqrYWIK/
         X72273AwF+0+hNLDYdAugLqI3sJBHBQrJM0n6K+NqjIhlG6b5KwSoFOZmxqcJFQHHYPN
         TeVy5x8mPs6BSmKyhJrXlCGFqWUZCjF+FrVqTQBln1mWndx5fwrjDQWFocDskGdsr7Bv
         1L4j4lDqxKSMTm/RVKGbNDLAvA/c3a9KcvjNpzBeyLnuM3PFDe5WLpyNF2X47KhXwTEH
         iL0W3sRac6urWOBA0ngRglXkT40ofR+ogmqa8D8sDkXYhi6h2PWF8N7QqLdwhp1koU+9
         EDwg==
X-Gm-Message-State: AOAM530rs9ih9dYuqqVC07mnIflBMor6k/ZvmHGAqALoeK8TijscX0Qx
        /9pA5rYiEfINNbQKzIAACcNH6g==
X-Google-Smtp-Source: ABdhPJyhhPvVWbRIgwTFmdT2txqRXlkDS3AIl9G3Al02xTlCINLZXXpcYKBy3Lh+rfUkfZMuflb4Hg==
X-Received: by 2002:a17:90a:ea8b:: with SMTP id h11mr8539534pjz.122.1625120328712;
        Wed, 30 Jun 2021 23:18:48 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id i10sm18244312pjm.51.2021.06.30.23.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 23:18:48 -0700 (PDT)
Date:   Thu, 1 Jul 2021 11:48:46 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210701061846.7u4zorimzpmb66v7@vireshk-i7>
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <20210701040436.p7kega6rzeqz5tlm@vireshk-i7>
 <cb35472d-f79e-f3f8-405f-35c699d897a1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb35472d-f79e-f3f8-405f-35c699d897a1@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01-07-21, 14:10, Jie Deng wrote:
> I think a fixed number of sgs will make things easier to develop backend.

Yeah, but it looks awkward to send a message buffer which isn't used
at all. From protocol's point of view, it just looks wrong/buggy.

The backend can just look at the number of elements received, they
can either be 2 (in case of zero-length) transfer, or 3 (for
read/write) and any other number is invalid.

> If you prefer to parse the number of descriptors instead of using the msg
> length to
> 
> distinguish the zero-length request from other requests, I'm OK to set a
> limit.

My concern is more about the specification here first.

> if (!msgs[i].len) {
>     sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);
> 
>     if (msgs[i].flags & I2C_M_RD)
>         sgs[outcnt + incnt++] = &msg_buf;
>     else
>         sgs[outcnt++] = &msg_buf;
> }

> > > +#ifdef CONFIG_PM_SLEEP
> > You could avoid this pair of ifdef by creating dummy versions of below
> > routines for !CONFIG_PM_SLEEP case. Up to you.
> 
> 
> Thank you. I'd like to keep the same.

Sure.

-- 
viresh
