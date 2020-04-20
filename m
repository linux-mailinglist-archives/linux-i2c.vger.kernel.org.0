Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36211B0E82
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 16:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbgDTOga (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 10:36:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729140AbgDTOga (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Apr 2020 10:36:30 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E808C061A0C
        for <linux-i2c@vger.kernel.org>; Mon, 20 Apr 2020 07:36:30 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id z6so4007360plk.10
        for <linux-i2c@vger.kernel.org>; Mon, 20 Apr 2020 07:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HGCNmU952CXP2pdvOvFnhVNp8DP/1u6iWG8z0zqRmqU=;
        b=kmBZa/DSevRlnFdWzIurfy4Nsa1EllA2lbGALf+9XFmwgKaXhqzYePE3nDDZBzT06Y
         sd6pGaGjPdrsBNtKYCtITE9NFEiyCFDLBFp6dy/xuzWxAmzCH3wSkuXKYG/3ugNxVHFT
         3DKzUA/HrkIvTAXHg4xBNRYAbSoh2cgtXsAFODShoiBCkwgEjXxM6Y+/77n2mhWacgN/
         sL0VJt8lbp92mOMnpxQMg0DuCZkSk8z//huMGexAvRTllMi7We7XVXCj8GJYPNcPL86t
         MRnfsNnGgBlRLjJyPNXBe66kRDOZ5A1Sehhp8YAaN2shcoyvlrnRh2BIDMeXTdl+u8eC
         1drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HGCNmU952CXP2pdvOvFnhVNp8DP/1u6iWG8z0zqRmqU=;
        b=oocMeCXhycVPWO9EKRQa+P/ThP6aNMbShL9Nq9+7A0qjSxg0cjcz6Z9jM2mscvEq6E
         lXOmWbM31gGbMtLK7KaZ4bG6m7bca/8QcEi3R/THC8n2MoSoIFZIw6jb3CgwgqadSuov
         1ZlX58ZMsQvp/UUlnEJArNOMIOIHLNDbNicmvDpwy3Z9wSo7olbisgVnsNxkL3671YIj
         ugBUDRyvjUJn408XMsppnqzvRBA3FBwuc4XxFBaGjjvRDcDVAdTsE0yJNQ+II80YB9iV
         8/Uh02GToXIpKUVhUEMiriI701naP4DTil4lNrmJ5IGwqmnUKz8ompbfFrL2gfL17qxw
         bTpA==
X-Gm-Message-State: AGi0Pua3dyBs7na3PWz9bdS/2HUuYQfFPOYbWAyWn35Ho+tVHqLRKqlp
        7FoA4L9/Qc6eiGH0ZZ0Xtz4=
X-Google-Smtp-Source: APiQypKOiUhdlEwdgQVgN48u3hQq1291g1HbN0QBZqdZWlhk6F6D+6fvatsNwHy+VEOJquOo2JtBjQ==
X-Received: by 2002:a17:902:7b96:: with SMTP id w22mr17451702pll.10.1587393390148;
        Mon, 20 Apr 2020 07:36:30 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id 198sm1247725pfa.87.2020.04.20.07.36.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 07:36:29 -0700 (PDT)
Date:   Mon, 20 Apr 2020 22:36:25 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        kbuild test robot <lkp@intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>, lkp@lists.01.org
Subject: Re: [PATCH v1] i2c: busses: convert to
 devm_platform_get_and_ioremap_resource
Message-ID: <20200420143625.GB10880@nuc8i5>
References: <20200414134827.18674-1-zhengdejin5@gmail.com>
 <20200415102158.GH1141@ninjato>
 <20200415160757.GC17519@nuc8i5>
 <CAHp75Vc+a7sQeY+W+4+-75TCMDCpnPRjUA5T8ZsBZi52PVB9dw@mail.gmail.com>
 <20200418040653.GA7120@nuc8i5>
 <CAHp75VcWRd8NUoYAVV1g8051XWZgrGm0vKAAzF_4WzTi40y+Ww@mail.gmail.com>
 <20200419163600.GA19772@nuc8i5>
 <20200420094319.GA2094@ninjato>
 <CAHp75VeGNV-Jsyu1ev843GzBuJqwojfDcbC5H9MJokurrQLjjg@mail.gmail.com>
 <20200420095715.GB2094@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420095715.GB2094@ninjato>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 20, 2020 at 11:57:15AM +0200, Wolfram Sang wrote:
> 
> > > > 6. Fix ioremap(..., 0) [size = 0] across architectures, now some return NULL,
> > > >    some return address, some may even have leaks
> > >
> > > This sounds more useful to me. Would be great if you have interest.
> > 
> > But it much more advanced :-) Complete dive into the kernel guts.
> 
> Well, learning by doing :) Dejin seems interested...
>
I do my best to try, Thank you all for your encouragement and help.

BR,
Dejin


