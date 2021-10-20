Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C11343454A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Oct 2021 08:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhJTGnq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Oct 2021 02:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhJTGnp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Oct 2021 02:43:45 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC67BC06161C
        for <linux-i2c@vger.kernel.org>; Tue, 19 Oct 2021 23:41:31 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id y4so15467847plb.0
        for <linux-i2c@vger.kernel.org>; Tue, 19 Oct 2021 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=otIQhWkkiTUCK7A8zqj4dcMFSS7Btq7zBo70rVUTfH8=;
        b=pWiezsUCqWZue+ySifqtIfn3GEltgU49NBeZJ+/Mv7Zujj8l7Hm2jNPzH1bwOCVyMz
         D3Jv+BmNDsABGLssv1QgrbFUey1rHeejyYKgEe3hSaQXr5VVyOmfRyleS8xqu+tsa6ri
         rSKJvS9KSGbUnl12IStEH9pKrF2nY4ABM+I7zdTF0lmYLCF897/7uTh1W9wnslSdAPY1
         R1q37pYCFuF33Fig2IqlydmRz9Su1RpohkNZ1/bp8L0tuDdf61TjEIVJ8/epYfcYu7rN
         5swcvM3pm3s1Ezx+L73ZOdOEm41/+lFGWGqcXeQAMSXOyzNNorHrOZWaruylo9qJ69AX
         i6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=otIQhWkkiTUCK7A8zqj4dcMFSS7Btq7zBo70rVUTfH8=;
        b=UAVpTEhvr2GeUrjMn1WCm3wU/oN47joLg3mp8lZ//ZHwj9eh0mGUsOXyPP3qhfdqXv
         IBQabjpDkqLl+Z51Gkd2HWJvfDKt93jbjWHETie4jg9IOQTujoMQgknn09JIXq6f9AO+
         LuIYg+xUj57qOt3VizSA3MrK3wqiyAm+evAuZnyWSnyHmkSEpqThM8OepquQsy/12mr2
         Hg1QTIR1zIBoUZhTWwePLGDHT4UG2rjnjAd5do9AjDOS/5trJbyp3/4jlNXyQTxD3CBW
         XJF3W5Rib5iUSiLf8kq1lIA5+J/iQQXqZocmMrqMYCCnxRp+L1C+j4ISN+XUzYLgpQMK
         pXYA==
X-Gm-Message-State: AOAM531i7YT/VZt2yOjiKGkydhMIWWssWFqQdHfUB9PNQGULIHibx7n3
        STOiHfnAXuaMUkUWfH6o++3Z0Q==
X-Google-Smtp-Source: ABdhPJzoKP4oeBg3gPjvGCznKOoVE1EtsQzbyyfVfWYL0UiXmVZmMMyypeV17+qxmo+F/34/IEinCA==
X-Received: by 2002:a17:90b:17c9:: with SMTP id me9mr5163946pjb.197.1634712091178;
        Tue, 19 Oct 2021 23:41:31 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id l6sm4665309pjy.23.2021.10.19.23.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 23:41:30 -0700 (PDT)
Date:   Wed, 20 Oct 2021 12:11:28 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@kernel.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <20211020064128.y2bjsbdmpojn7pjo@vireshk-i7>
References: <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7>
 <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
 <YW6pHkXOPvtidtwS@kroah.com>
 <20211019143748.wrpqopj2hmpvblh4@vireshk-i7>
 <YW8LFTcBuN1bB3PD@ninjato>
 <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com>
 <YW+q1yQ8MuhHINAs@kroah.com>
 <8e182ea8-5016-fa78-3d77-eefba7d58612@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e182ea8-5016-fa78-3d77-eefba7d58612@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20-10-21, 14:35, Jie Deng wrote:
> Yes, but we need to know what's the best value to be configured for a
> specific "other side".
> 
> I think the "other side" should be more aware of what value is reasonable to
> be used.

If we _really_ need that, then it would require an update to the
specification first.

I am not sure if the other side is the only party in play here. It
depends on the entire setup and not just the hardware device.
Specially with virtualisation things become really slow because of
context switches, etc. It may be better for the guest userspace to
decide on the value.

Since this is specially for virtualisation, the kernel may set the
value to few HZ by default, lets say 10 (Yeah its really high) :).

-- 
viresh
