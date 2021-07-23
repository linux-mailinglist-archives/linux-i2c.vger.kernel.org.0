Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817D13D3192
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jul 2021 04:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbhGWBot (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jul 2021 21:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233175AbhGWBos (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Jul 2021 21:44:48 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03734C061757
        for <linux-i2c@vger.kernel.org>; Thu, 22 Jul 2021 19:25:21 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so6921576pja.5
        for <linux-i2c@vger.kernel.org>; Thu, 22 Jul 2021 19:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PQccQSknciYEz+n8vMov2qIaMOTTz2i/faaaUpe1ves=;
        b=A45mqdZ9NUlHUuAdi1IUNK7gOjV5p0ujOWHLzbW0/QXJvJUNFKNny/2c1p4Mtcdr/x
         5S8LqxaRoZAacfPRFifcchpgpzTWy5TvcPM2XtyABgL+A2k8Cwnfg+/6SGhjTrGja3xH
         6mOdzshtd2QPQS0VkG4Ti5P7a4HDVdmeKh9/+qOM/IYZ3dSjHtOIWjXoiRMgPRFxFKvH
         G0F4veE/I0mCHn28OcibHI8w/AgyOO3mPMnsPwluWGKoRlPkRL2C7+wdgYc8VQ+VMani
         dszAucomLARADiWfQiFcdRSUCgbz6I0iscKkLzQVlofTqyOE07KrFotcnJQ69eqejN2s
         QDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PQccQSknciYEz+n8vMov2qIaMOTTz2i/faaaUpe1ves=;
        b=n1gUiG6OFM2m1oCxfYdE7zlhmedcAZEs1FEMCObQwDDJzSBc7Q/CYLGTlFiidwSRut
         ov7O1M1gmEipx5e10fBoHAdGvgqG3mV5k1Wh8yqrfo2yqEbva0Wu1WPpIPCcsFqRB1a9
         eqznjjszfeDmvIPD346xl4vStzieCp5NccjWy8WK8eAhOhk4SdOT3Ikm32NG7V9nEvNx
         tjfra5Y+/inpc1xXoZ7zloSQGFN8j5v9TOciQzt23s3YE/nOAmSvcoXpk0ghyDp61WVt
         zkwaE/GyeGXrNzL8mGQ50ua44qUx4iAL8bzeYZuiw9ayV7jrE8eEGKamHISiI6yUVUI9
         fLTA==
X-Gm-Message-State: AOAM533M5IhfHH6gfdTqdK7cMNWcYZU88DSYrmdqURNeIGnzxYn822SD
        vdJ9cLBuqjC9OW+qN+3eWCemTQ==
X-Google-Smtp-Source: ABdhPJzhsY60obBNk4BePJxS8brgK9/EnN99iFqvo544XU8b6qNM33Gi/DvHCWhR6iGHXcWT38N5Eg==
X-Received: by 2002:a63:770c:: with SMTP id s12mr2777345pgc.339.1627007121397;
        Thu, 22 Jul 2021 19:25:21 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id b184sm27503788pfg.72.2021.07.22.19.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 19:25:21 -0700 (PDT)
Date:   Fri, 23 Jul 2021 07:55:19 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH v14] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210723022519.olfmnshiulnhevja@vireshk-i7>
References: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
 <YPmQQelKfa4J7zdA@ninjato>
 <4c257470-9b07-d5dc-a5ba-770b0229663e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c257470-9b07-d5dc-a5ba-770b0229663e@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23-07-21, 10:21, Jie Deng wrote:
> I think we can add an i2c_adapter_quirks for this moment. Support for
> I2C_FUNC_SMBUS_QUICK
> can be added incrementally if needed.

+1.

We just need to get this merged :)
 
> I will play this role. I see Viresh also spend a lot of time on this driver.
> 
> So I'd like to ask Viresh, are you willing to be a co-maintainer ?

I will be happy to be listed as one. Really appreciate it Jie.

-- 
viresh
