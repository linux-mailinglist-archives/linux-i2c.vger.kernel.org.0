Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8111D45D4F5
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 07:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348694AbhKYGxF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 01:53:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348883AbhKYGvF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Nov 2021 01:51:05 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9C2C06175A
        for <linux-i2c@vger.kernel.org>; Wed, 24 Nov 2021 22:47:54 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id z6so3797471plk.6
        for <linux-i2c@vger.kernel.org>; Wed, 24 Nov 2021 22:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8xu2aIxFiMS+FdoCDZiYWeLv0HFIncR6uH5xTnTYuDE=;
        b=sQ7DeQx2L7wyOPR8AcPj2GANXOImuYpFUsZVVyPXeFkHRdzeY53EDx1g9DibKS+Tkt
         If5lxUsGj4pBaes1VY3Idbzo/bVvsRrPq8+g5S/amBkhwtyZ0rpZQSGqLlqz14rgTBxA
         qdXq298SyjxjqaonhpCTUiHc4d6KDe/Gwz7rGuRqYABI9zZEe8Du5FNiBJAKWUrGimKv
         62fy4f3TGCw/stdY8x983P+ls4Bu06nqdsA3heRa8Y/Tx/4nIJAFKtPT7cq4r5e7h/O3
         6v4bYKvH3eN5ECerCjtGIr5RBrAW07a7YL8aro9cU+JhjOmmAl9Ub/+hQL42DAeEW4gk
         t+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8xu2aIxFiMS+FdoCDZiYWeLv0HFIncR6uH5xTnTYuDE=;
        b=6uMhQdybakaFIgT0q9n25D4683CvVYEZaT2f7MnvNWlACuLsrpT2LnudQlhh03dlor
         Vl3rjdpuL6xAoWFmoEOOMstkETk1zOJ3QgaHrpZ8K0giBgVuza9UPFK+AIfcvRlY/t2S
         XCsVx/IYSWM/ZhCYTo3fSTppIRJKhUxEH9CL+u2q2cuoJsgThHfT5kwAk7y7fV5eOfLO
         Ked1mzGHQ7B1I7I9b13E5xeaA04fsgU8CIcsbq85ckrGPyYPOkDft/HI4NIiixYXaMYK
         umPL0nALC2TZsa5rEBBj1qBclynQaSRdVJKdGELkYXom/SRskx3A3SkhaVhwZQvP0d3o
         qONg==
X-Gm-Message-State: AOAM531/RqvUkFjKY8YBqgwiLibvS5mSlwcGuGTuiJNmkB0xCizGL4sQ
        7F2C+2I0c4TO+/RB+K/FT5WWDw==
X-Google-Smtp-Source: ABdhPJzRN1Vq8J4tQeRAEWR90H5WICez/RY4tb7lTi4AOQPbpllEtnv65NgkuG6F/L8OFo9V7oaMZQ==
X-Received: by 2002:a17:902:c3cc:b0:141:be17:405e with SMTP id j12-20020a170902c3cc00b00141be17405emr27698607plj.76.1637822874397;
        Wed, 24 Nov 2021 22:47:54 -0800 (PST)
Received: from localhost ([122.181.57.99])
        by smtp.gmail.com with ESMTPSA id z8sm1312770pgc.53.2021.11.24.22.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 22:47:53 -0800 (PST)
Date:   Thu, 25 Nov 2021 12:17:50 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        jie.deng@intel.com, conghui.chen@intel.com,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v2 0/2] virtio-i2c: Fix buffer handling
Message-ID: <20211125064750.ywq3vd76uy2levoz@vireshk-i7>
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
 <20211124185546-mutt-send-email-mst@kernel.org>
 <20211125032119.vklsh4yymwnalh5b@vireshk-i7>
 <YZ8rxHDPo68AT4HN@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZ8rxHDPo68AT4HN@kunai>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 25-11-21, 07:24, Wolfram Sang wrote:
> 
> > Wolfram, you can apply that one as well, it looks okay.
> 
> Is it? I read that the code only waits for the last request while
> Michael suggested to wait for all of them? And he did not ack patch 2
> while he acked patch 1. Did I misunderstand?

Okay, I misread it then.

To clarify, we should initialize the completion for each buffer and
wait for all of them to be completed before returning back to the
user.

Lets wait for an update by Vincent for that then.

-- 
viresh
