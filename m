Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B9A3BBA66
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 11:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbhGEJn5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 05:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhGEJn4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 05:43:56 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE501C061760
        for <linux-i2c@vger.kernel.org>; Mon,  5 Jul 2021 02:41:19 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id b8-20020a17090a4888b02901725eedd346so8524243pjh.4
        for <linux-i2c@vger.kernel.org>; Mon, 05 Jul 2021 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p6TZn0pkcrohcFlzQ6B5a1UXee/0wUIqAanNPpbpYxY=;
        b=uw1MTYYdbcLOELgs2jigWYEeV1o8X6Ol1GQ0tTEFDy1ioqGaj+151xmsO2EZ35+NQj
         UUurQPGY5Hm7h6uYIOLK+sz1XG0WK4pIlHWkSoEmm7CUGQPvp9OV73fsXBxKUOywW5TO
         kht4kSFJxdwNCkkULth6ftnfe0wX1ZPQUv61LR3poblw0FUbpSSkO02gdoYJd7kIrOuq
         ghuDu+WAnY+jS3poWdCNdSPCpSiHOTuDiEQVvKiR6+nHKoiVA1QxZ4gYcazPNmBe85Vj
         aIWcSCVO6wbp/PXGjqPidGVmlmRxtM7nFv8QmZzLmKcHxVjigiuJTisM7EKrwkV77LVj
         JLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p6TZn0pkcrohcFlzQ6B5a1UXee/0wUIqAanNPpbpYxY=;
        b=MWRuLIVFYNJ3cnyD7cHWUvPS4Ic7iDag43hnBoKlczEyF03NuIrJHCd+oXRJf0H+KI
         ZDXfTmPRxvZuRU/tuFfOQg1wPhr3SP3kRoQg8K0kXzHNRWVyEGs3nIQcL8j4BBKUzVQ9
         opM8Cg6BtmwL9J2QD8/rcZT9OdzpakugcLnyW+E5tB8YSW8bcoYfzgQVlEvsb9gyI6XB
         wOa/wJxikzIYGwMOAZamQG0bOupmaJ/xhK00mPsc/5DGvLaQoHLRlnKr59TwZTdhw29D
         GFoKBub+QlJHfUV4IqIoH2URLOA8Pq0jiTibtIIakKQRvXpSOmNKR8Wg63AoGTBhyM1y
         wweQ==
X-Gm-Message-State: AOAM5311VwyX+Eye38Jp299/wKxBRtmdiYxLd7i2hE4G4nCG2yQCyYgr
        oL5mhSHCMiIP9L5JSnylDXovRQ==
X-Google-Smtp-Source: ABdhPJzjxeYwiQ48kETRpE7tMsMr3QlzW/XaT/X4Z+Cp/UJKBtL3paBM0nQfK91MoPQnH0Hv9Tu9WQ==
X-Received: by 2002:a17:90b:3ec7:: with SMTP id rm7mr14629902pjb.214.1625478079109;
        Mon, 05 Jul 2021 02:41:19 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id a15sm12283460pff.128.2021.07.05.02.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 02:41:18 -0700 (PDT)
Date:   Mon, 5 Jul 2021 15:11:16 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jie Deng <jie.deng@intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v13] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210705094116.mxzi262n4tpmcjgm@vireshk-i7>
References: <8908f35a741e25a630d521e1012494e67d31ea64.1625466616.git.jie.deng@intel.com>
 <20210705080245.yabjlrgje5l7vndt@vireshk-i7>
 <CAHp75Vf0_8+KW_cp2g0V1miMx1cegBdjLzBjTbtpmcmdCHQJxA@mail.gmail.com>
 <20210705085610.okcvnhwhwehjiehy@vireshk-i7>
 <CAHp75VeE4Du29XJV54VWR4CH4yfCEqokRUFFRY_sdMKsp1oXyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeE4Du29XJV54VWR4CH4yfCEqokRUFFRY_sdMKsp1oXyQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05-07-21, 12:38, Andy Shevchenko wrote:
> Because we do not have "uapi" in the path in /usr/include on the real
> system where the linux-headers (or kernel-headers) package is
> installed.
> 
> It's still possible that our installation hooks will remove that
> "uapi" from the headers, but I think it makes things too complicated.

Ahh, right. Yeah, I completely missed that part.

-- 
viresh
