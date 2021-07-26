Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A223D51FD
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jul 2021 05:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbhGZDSi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 25 Jul 2021 23:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbhGZDSi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 25 Jul 2021 23:18:38 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDA6C061760
        for <linux-i2c@vger.kernel.org>; Sun, 25 Jul 2021 20:59:06 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so12412662pjh.3
        for <linux-i2c@vger.kernel.org>; Sun, 25 Jul 2021 20:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6b6G7xsuI/npQw8leSBd2R5w5X77r6uj+WW4obPWFsw=;
        b=VQkpuFkYjvVU0ufuNZMY7yM/t2vY0VdkA1BnbAzxTtCkrT1U6fCjGg49ga7dSMJnQG
         3uCpatpwAP5VkpnYnMsgudFgYvX9LiHzc2pjIpK6HoS68+OxPyxkYHEedEYS/CbS8IRt
         bMPi/IFA4puY8eLwO9yy/M40y/Vv9cZRsNAmoI41KyCFuDbQQm11MET73wzTrlhhP1Wb
         8IeUPeSJyS7wqJCNcWTWo7Izvlw1k9IHp1xrbqs+Vft5L20IDFMJk8xD5btpWkMiMwtm
         VE2zCqS/DTyMIGuYOvDZ4feGrG4RFIFgP3HdNY87Hf458Lihrt6aSa58aFEPqP9XO2mB
         /mJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6b6G7xsuI/npQw8leSBd2R5w5X77r6uj+WW4obPWFsw=;
        b=C17Z8bkilx6TTWEo+R0SAs5W3n1K994xnmpkqKEno2laViXCY0QoRljKDAFzVYMxlt
         6wk1/7PdGVv8RcILzY0qpDLY41LNEDvK5hbpznWDutM4v+C+pchtMTbRjhRA03fpY2xn
         ZxbrKqxloiafYZLAaivHRz/p3NL9OCzBisdWmoVxJ7GuNYNtjgiynzmK4DdPrEJq48H8
         VZrbOHWBohMzGQwTNUcrPfIyf+ikbL0PphDfhisLNuIlhg8r7S+oMP76CSjmuTorB0M+
         aLwfyc8zxZ0ELxpvKsxQ7obFxmP2qvuTZrZ2ynmOJPrDwQWPLyj7H6GHSG1jF4sx1kWe
         OOSQ==
X-Gm-Message-State: AOAM530m+kcpfVtkeYDwBgv9az1EzSaXXO7Dauf4KettfkZ3ZdLpiiIr
        SC+uuU6VwypzsCzobC3lqmpmQQ==
X-Google-Smtp-Source: ABdhPJzMUxri6/V8qt5gZUc8Gv7kxqmxbKkJVX/Y+NwcW2h5Cwsik9jvRxSWDPTTYYWKygEgWqvVVQ==
X-Received: by 2002:a17:90a:f011:: with SMTP id bt17mr4259246pjb.105.1627271946201;
        Sun, 25 Jul 2021 20:59:06 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id g18sm40050802pfi.199.2021.07.25.20.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 20:59:05 -0700 (PDT)
Date:   Mon, 26 Jul 2021 09:29:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        yu1.wang@intel.com, conghui.chen@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        gregkh <gregkh@linuxfoundation.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        jiedeng@alumni.sjtu.edu.cn
Subject: Re: [PATCH v15] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210726035902.b6zo72r6mdlxyf7w@vireshk-i7>
References: <bcf2fb9bbe965862213f27e05f87ffc91283c0c5.1627018061.git.jie.deng@intel.com>
 <CAK8P3a1=TpKLGMzvoLafjxtmoBbDL+sBMb8ZiEmTjW91Yr-cYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1=TpKLGMzvoLafjxtmoBbDL+sBMb8ZiEmTjW91Yr-cYw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23-07-21, 11:03, Arnd Bergmann wrote:
> > index 70a8057a..99aa27b 100644
> > --- a/include/uapi/linux/virtio_ids.h
> > +++ b/include/uapi/linux/virtio_ids.h
> > @@ -55,6 +55,7 @@
> >  #define VIRTIO_ID_FS                   26 /* virtio filesystem */
> >  #define VIRTIO_ID_PMEM                 27 /* virtio pmem */
> >  #define VIRTIO_ID_MAC80211_HWSIM       29 /* virtio mac80211-hwsim */
> > +#define VIRTIO_ID_I2C_ADAPTER          34 /* virtio i2c adapter */
> >  #define VIRTIO_ID_BT                   40 /* virtio bluetooth */
> 
> This will now conflict with Viresh's patch that adds all the other IDs.
> Not sure if there is anything to be done about that.

An easier way of avoiding all such conflicts can be:

- Michael applies my first patch (which sync's the device id's from specs) for
  5.14-rc4. Rest of the patches can go for 5.15.

- And then Wolfram applies this series over rc4 instead of rc1.

Or we can leave the conflict there for Linus to handle.

-- 
viresh
