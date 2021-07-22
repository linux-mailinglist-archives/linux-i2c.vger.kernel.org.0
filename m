Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C593D1E04
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Jul 2021 08:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbhGVFbA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jul 2021 01:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhGVFbA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Jul 2021 01:31:00 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB01FC061757
        for <linux-i2c@vger.kernel.org>; Wed, 21 Jul 2021 23:11:35 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id i16-20020a17090acf90b02901736d9d2218so4053435pju.1
        for <linux-i2c@vger.kernel.org>; Wed, 21 Jul 2021 23:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5cK/GjjXslo6GmhOaYGYgEeJORqH/6loH5RcftK4HU0=;
        b=sNFeP8gsrg5VCxm8rqifewFeatxucPeFT8QEFd5cHlvPnxDGYlqnnKYLg+/mZOBh3V
         CekjXrhczXfkr2iNaSB6W8rWUmHAet4VscoEFL0AxiE9nbEs9oJIBany+LvtbYG7FrUc
         Jw565w2BlZDy5hT+ZL/hzLtLDs7UhDamlxcQbn9ItGvEKbqihRsPUMqc5D4lK31eE//F
         lS0ODkg7FIALkXk18t7MF1EHSOEK3hYf68fnBKu1wVHjDBdpcWUyZkgHgaDfg2A3IbOM
         v9sUmK94nsKDYack8MCse8YMfsQ0WP92vv5RlI9kGXshr0CnNHD8SOp8MmT9xvmbYGp5
         RAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5cK/GjjXslo6GmhOaYGYgEeJORqH/6loH5RcftK4HU0=;
        b=W40qWFKkMCAkiBt4PWpmpMjNDx4fLRmYbi8Y8jhPMphxvmT09vHXz/AnKTLaEcezb+
         BkUSovGNMTeIWPg6csEUwY49iCV3CdIrp7MW6XfA75YRDIsJvlKhDhaf2hy38hJOWQqE
         iI52n9EU7EHGXHtGl88cpPXZlXUOKm0viLdOQ1NdlPb0Daf52oUJFJx05LtcyRzkzrZ5
         HThX4qhIBbY4GmDNAN6KCWPAof57Fjys49Cdy0zEA8+V6J+5dhZJkK930pEVTAQ7D8EX
         2lMCFutCEY6SlyhGhu+vapgG8yulmwdxaV3iJ3K7hAU9s5ImgY3GmGMyARmRetHXuFDG
         JyJA==
X-Gm-Message-State: AOAM530OCH16Rvk4hCAN+E4pGBvoaWwAwLrHqatyA6U2i654yvUFbLG4
        5pDVqP7NARIlGcOsiYpICXhwUw==
X-Google-Smtp-Source: ABdhPJzsWABQoKOw3MzOV+BFwPL/nvqeS+gihVIl55DIiQN+F2diI2HTBaXl4hz/H55Mrjp2n4llLA==
X-Received: by 2002:a05:6a00:1895:b029:32c:b091:ebc with SMTP id x21-20020a056a001895b029032cb0910ebcmr41234478pfh.4.1626934295257;
        Wed, 21 Jul 2021 23:11:35 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id 202sm29390372pfx.75.2021.07.21.23.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 23:11:32 -0700 (PDT)
Date:   Thu, 22 Jul 2021 11:41:30 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jie Deng <jie.deng@intel.com>, wsa@kernel.org,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com,
        mst@redhat.com, arnd@arndb.de, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, yu1.wang@intel.com,
        shuo.a.liu@intel.com, conghui.chen@intel.com, stefanha@redhat.com
Subject: Re: [PATCH v14] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210722061130.yb7z7povshgtbi7z@vireshk-i7>
References: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
 <20210722051433.3f2ix75wbi5pphp2@vireshk-i7>
 <YPkK7RlufYj1b+2f@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPkK7RlufYj1b+2f@kroah.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22-07-21, 08:06, Greg KH wrote:
> No new features are allowed for 5.14, you know this.  It's but fixes
> only now.

I was trying to be (overly) optimistic here since this was a fairly
independent driver which won't break anything else, and had been
pending on the list since many months now.

But yeah, I know the rule and understand its purpose :)

5.15 it is then.

-- 
viresh
