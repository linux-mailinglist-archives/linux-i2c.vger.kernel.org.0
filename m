Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 310E53D3415
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jul 2021 07:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233793AbhGWEsC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jul 2021 00:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233771AbhGWEsB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jul 2021 00:48:01 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31283C061757
        for <linux-i2c@vger.kernel.org>; Thu, 22 Jul 2021 22:28:35 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id f1so2011639plg.3
        for <linux-i2c@vger.kernel.org>; Thu, 22 Jul 2021 22:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J87f8T10lgtVuzcfK6rQXH+rwvV/4HwvhXrz0f4FLD0=;
        b=JWPEJ8wVPzIVjSi6bXQsG2CTcz6zWW9SQbNjgvUnbVzcB05X8Ar0CMyPUPh/oIS0XL
         UO0Y3LRoOmlpfGLQQP6oRTVzyGWhcrZqZNWFOPJiElfej2LRbRH71xEr46axPvjfwuab
         eIQPLafyxTXrQmXOft4lzdMAbg2cMdi+BncNS4HukrXy/df8nXM0k6IjwLxJAWS47fj3
         7svNWv28SdZBoM+MuW6ZjxBSEP0zZWt7rKizRWqjdWZkrBdVsYCJ6G5D9eLUpsiV8OpW
         Wt4s7Fsb9SE88DmXMHWcEYHqU4Euj/xsKus6niUK336f4oRWDodSrcChvD7UxJaTAG3u
         POGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J87f8T10lgtVuzcfK6rQXH+rwvV/4HwvhXrz0f4FLD0=;
        b=nCmNPAF1dIyqD9ciHCxZf/NqeGUTvC6ll9pRDzU0PaFRt6ciDDbDNOVe66Bj6XEvhs
         0XPOr420WPHZrHpZZFkR4b38kKrr9hnajaH/gOl1CV9kb59Z8D+eqhEwT1+8RRyjLhJ2
         0Xr46Ajm5LId8wenwO5ILc4JiOfNuZLeauS/FKsMHcxHG6m8KDQy1jBLObFXhcRrA3z9
         wymQRm3sKqHpIIfTSHnc01I157uq7jpLeU3POPgkoYjyHUvG45zwtjYJSsJGv2gygPof
         fv/PYohJOghOhfICMHwFT7c6DP8sF6OoptROueVsb1QRHBfsiAHJacoHRjUKGMiSsZBb
         J55A==
X-Gm-Message-State: AOAM5304Gs3omRoIx6dG3KYUo+9egzWsribFyD9vST0a6pEzz2OZ2Ca4
        Bzu8XBonxTfxCRbuqlgQCZp/Lw==
X-Google-Smtp-Source: ABdhPJwrlLG2ErWx84N6cAS6kFP1mW+MQT2AXD6jNUD9UMF3uahmb2g3KxWWnPrca6tjN2zQvYsJMA==
X-Received: by 2002:a65:434c:: with SMTP id k12mr3332536pgq.17.1627018114572;
        Thu, 22 Jul 2021 22:28:34 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id b7sm31767619pfl.195.2021.07.22.22.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 22:28:33 -0700 (PDT)
Date:   Fri, 23 Jul 2021 10:58:32 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, Jie Deng <jie.deng@intel.com>,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210723052832.kmi2654q2bufu45w@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato>
 <20210629101627.kwc2rszborc3kvjs@vireshk-i7>
 <YNr0uDx1fv+Gjd7m@ninjato>
 <20210629103014.nlk3mpetydc4mi6l@vireshk-i7>
 <YNr5Jf3WDTH7U5b7@ninjato>
 <YNr5ZRhT3qn+e9/m@ninjato>
 <20210705121832.fmye5xnlbydoc5ir@vireshk-i7>
 <YPmLoeLSPS1tfYUK@ninjato>
 <20210723022836.ews7bshlwcsaktud@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723022836.ews7bshlwcsaktud@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23-07-21, 07:58, Viresh Kumar wrote:
> Would need a spec update, which I am going to send.
> 
> We would also need another update to spec to make the Quick thing
> working. Lemme do it separately and we merge the latest version of the
> driver for linux-next until then.
> 
> I checked the code with i2cdetect -q and it worked fine, I was
> required to do some changes to the backend (and spec) to make it work.
> I will propose the changes to the spec first for the same.

I have sent all the necessary changes for the spec here:

https://lists.oasis-open.org/archives/virtio-dev/202107/msg00167.html

-- 
viresh
