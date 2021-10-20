Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B35434950
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Oct 2021 12:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhJTKt0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Oct 2021 06:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbhJTKt0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Oct 2021 06:49:26 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574B0C061749
        for <linux-i2c@vger.kernel.org>; Wed, 20 Oct 2021 03:47:12 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id t184so9153555pgd.8
        for <linux-i2c@vger.kernel.org>; Wed, 20 Oct 2021 03:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1TSBvBQA8kI7/EQ8+8MISIe+X1LmR0R1M6KJhiZdbho=;
        b=ct1uNESrIaobgUaR7vGp25KTJreEBOB3or6gUrv32EmtudAWNGnNpCb4FTr457gP2O
         6NW5jYl8ajoHl2r9WIffV3WB4kNgE9w7yy83Y4Etx79vkkMs9phnY3bpm5ntzf/1sHw0
         hPTfEUrdO86+9+sDzHBlat7nvIE94RdNVrJQAZOJC8UrZ8XfArqGbXZn7cmCyVSyM62Y
         qFzFTQ4nhn1mD+2aq9obIxT5/IqRMzac8lpVSKmvle7HV2geTJbv76nF0MlGeJOpwKTk
         d+kCV8vYmMGBnFo5lQeiH8DCQvdraZ9TOCWwsyyESMQR1BwiOw/mNNVrk528ZkHJyD4X
         WS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1TSBvBQA8kI7/EQ8+8MISIe+X1LmR0R1M6KJhiZdbho=;
        b=DkTDz0BPHfTzpdnN63UX2X4lF9gRLjWTpYFclomQAiBUGDZeqUxhNiGf/83UVFrC2j
         nwPsrSLBOt/UNW5SQIEFEzPQr2OenXkWZ4SJcEkQ92N/WaS4plW8uNZn+zxDc199TeFE
         EKRpLoIS2cWyzW5iBapzRxg5CKI0y2kxPZRYaBj7I5AOUrp3ueevSrC4Mpe3uffvQM6m
         AcCIGcCMb7IuSfFE3dNimuaS0zk+B5nk3x9N2lTTO546K6hQR+oUhoiUdsaLL9Z77dkh
         sN0QpSyTUwdfhDRXwZgOrXz/vHB0Fw+3h+XaKxKylfVdx6tjdiLa7ihAeapcygZkFoWL
         ljyg==
X-Gm-Message-State: AOAM532GUtAvyDdQDfLHpgSTUCnC/NXEb91LqubqYHdCmhWBZiwDVn8g
        BvjlVNWV5MaUf0JOR2oYM6gAAw==
X-Google-Smtp-Source: ABdhPJxaLdJ/OxJPo3hbNu88Qkt7ECSU97PQAPCrbvcXEInQyh5N7LcufZL+eAND3ifiPqtz7Nl5yQ==
X-Received: by 2002:aa7:9823:0:b0:44d:2428:3b62 with SMTP id q3-20020aa79823000000b0044d24283b62mr5507496pfl.77.1634726831843;
        Wed, 20 Oct 2021 03:47:11 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id g10sm2366308pfc.213.2021.10.20.03.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 03:47:11 -0700 (PDT)
Date:   Wed, 20 Oct 2021 16:17:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     Jie Deng <jie.deng@intel.com>, "wsa@kernel.org" <wsa@kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH 2/2] i2c: virtio: fix completion handling
Message-ID: <20211020104709.k6oqo2gmegiwfre4@vireshk-i7>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-3-vincent.whitchurch@axis.com>
 <20211019082211.ngkkkxlfcrsvfaxg@vireshk-i7>
 <81ea2661-20f8-8836-5311-7f2ed4a1781f@intel.com>
 <20211020091721.7kcihpevzf7h4d62@vireshk-i7>
 <20211020103849.GA9985@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020103849.GA9985@axis.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20-10-21, 12:38, Vincent Whitchurch wrote:
> I don't quite understand how that would be safe since
> virtqueue_add_sgs() can fail after a few iterations and all queued
> request buffers can have FAIL_NEXT set.  In such a case, we would end up
> waiting forever with your proposed change, wouldn't we?

Good point. I didn't think of that earlier.

I think a good simple way of handling this is counting the number of
buffers sent and received. Once they match, we are done. That
shouldn't break anything else I believe.

-- 
viresh
