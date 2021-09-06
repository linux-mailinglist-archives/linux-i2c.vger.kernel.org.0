Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406D34015BF
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Sep 2021 06:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238371AbhIFEoU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Sep 2021 00:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbhIFEoO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Sep 2021 00:44:14 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890DEC061575
        for <linux-i2c@vger.kernel.org>; Sun,  5 Sep 2021 21:43:10 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so3725254pjt.0
        for <linux-i2c@vger.kernel.org>; Sun, 05 Sep 2021 21:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3zWdOueDKtAVWRvfy9UP9yg3qL1geWqf5YsZ2lnxtUo=;
        b=pHag5NqN7NmLLdCbx6/9eOnpQtF7ZlLiKc0HpXCLEHtYhFph+QMys170qxyVKIziAJ
         enhc3w7ko88B/HrujeSJFW01Tsp70YxHU5h7+qcxRx/yPlTwmNSRAygOJ/VqxGqskb78
         n8uNACU1NwyC3ZYEZa3Zvk2c+yxY/GkY692LDiF6q15ZWgGC74nDpAXLre+X+TESFFnL
         DMkSwFFLmbQlek3KbcJp8a/1dp0UEvsdaG1SQv9RSw0l9n26nA05ViLHUoE2ydq/s842
         jpLOLaILRNKQHmHgsHh1CiqQpd1G8rrWRD6m0F8jrPKzpRL3gtF128GTM3KoKaW4P0yj
         Cslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3zWdOueDKtAVWRvfy9UP9yg3qL1geWqf5YsZ2lnxtUo=;
        b=cIT95qzt8GrxpaknyRoFNw6CXNDeVCrEiyk0avsOMyTaZtP91OxpGABt3fw0ChDJFA
         dLc89W/T1b00wD9KV7xmNRes8H0Ik3e3640fNtmVFTSKVRoCnOgSSaKc+ECeHnfZjj0P
         iKAhzteUSfAIPpIrJdxbCZikFZA4B4e5B1c7/Ks0tofVpyKCKN2IvoYHyW/q1W/1qDHm
         oaEQqkWUslCs4y0UCHJpqGyIW8KM5XIoycPG1uMKqr7Remhs8fxQrQ24oPNRiaWWpweC
         2Kb+a85JVjQ7H7U7Dlutl7qfSJsDPjsHTiDQoTchBgtXNBwonqckQsxq20YW1kNujZzN
         bcWA==
X-Gm-Message-State: AOAM5319hKpXZuoZhBsMVsI9eYPTtscfLlthRijGKcDzr0SUPcUKOG/B
        5sdT4G06xQH8c1Gi/Cwxj5SBbTO96HBu5A==
X-Google-Smtp-Source: ABdhPJwe0pj97liB4LbsuYiSoF/Xal92iCreh5AfSiBr0sUl9OcHufz0zEsxfvXQheepjecetEIs7w==
X-Received: by 2002:a17:90b:4b4f:: with SMTP id mi15mr11975932pjb.120.1630903390124;
        Sun, 05 Sep 2021 21:43:10 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id m28sm7594271pgl.9.2021.09.05.21.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 21:43:09 -0700 (PDT)
Date:   Mon, 6 Sep 2021 10:13:07 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH v14] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210906044307.se4dcld2wlblieyv@vireshk-i7>
References: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
 <20210904160059-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210904160059-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 04-09-21, 16:01, Michael S. Tsirkin wrote:
> Same as with qemu bits, I am confused as to what is the status
> of proposed spec changes and whether the driver will work
> with them.

This is already merged as well.

The current version simply fails to transmit the messages in case the
length of a buffer is 0. I have patch ready to make it work with the
proposed spec changes, just waiting for them to be accepted.

> Let's let the dust settle on them then, then
> resubmit?

It doesn't break anything for now since we don't have much users and
we know zero length transfers don't work. I will submit the necessary
changes once spec is finalized.

-- 
viresh
