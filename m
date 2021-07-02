Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622033B9CA1
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 08:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhGBG7A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jul 2021 02:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbhGBG7A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Jul 2021 02:59:00 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF634C061762
        for <linux-i2c@vger.kernel.org>; Thu,  1 Jul 2021 23:56:28 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id w15so8638808pgk.13
        for <linux-i2c@vger.kernel.org>; Thu, 01 Jul 2021 23:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bRTZFZ1E3CpWrLbQ7HRC4Me3IA6jdcuP5hZkPy8aTqQ=;
        b=cPTSpOr4Y/ib3p0oVnLcMOPoCVA4W1519zFDRhfxi/uCtnS57a1MfwBzYEH9JJnTXg
         8MzSrGxsX9E/7tvsWnkkpL2FdMmKxWCRn05paSKE7R0C7X12dizUgxonJ/cZhu3p8Pi6
         ZxOF5CxF+VsXgzt3zYkNvbGKfbfnvf0Xmgg6g83a/CUV3Kk2Sm8hBbuXWQOTJbQOpL4D
         2u7ZKhxrMgTlFp9gvGFE7htnxEWSMikZM+7ae7FovIVVaSzPKEih1VWpYHaqqKB0z/7m
         elg+D+S/qK8GfNncidfw2annOuFP6gf7Gqdnruf5ENF55lVCzRCCOHr2pA4KZ1agDDMu
         HNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bRTZFZ1E3CpWrLbQ7HRC4Me3IA6jdcuP5hZkPy8aTqQ=;
        b=frhxVjlWWLxwFMiWBra1HR1vHERlaR3X1XWorusBD42RPalPWoEQV1La9x4/mNf2qd
         sGMrlQ1TiRGLX1/taQo0Z2d6qXYNHj+pW5CR6kB8MMb7xQe5U1yGSkVEcwWyrxf9h6RZ
         K9WuXqbEC6e0U6LfL4Nx+BZ2uHOTk8VuKtSBwlNs5kV+/qFIXYm1CDgsASEcNAChWJED
         hgFUG7+6JYPMf3PRgl18lIOrWYNDgVVQIDSveeuGl/a2hCMri7KzwFVbZi7E1rUtLPwR
         rIlnCY4k9t0zEHF9xZdKaieFGMdEUFuwSuJh0VcsgnEuo74hAw5w3SaqzM8/MroKh15Y
         KH9Q==
X-Gm-Message-State: AOAM530vIHCvBmRj7+zKpcU/bvyRil62YcC9EG0Gfif2d840g16Js0Z4
        e64KyZ39w0gXuJPOMR55WzRAbA==
X-Google-Smtp-Source: ABdhPJxavtN37ys1rmwQed3n/qbrHe7nbn8CnsVNS+IEutFRk9yJ8cEvH5dkgIHmH2s1Uoq0OvHW1A==
X-Received: by 2002:a65:6544:: with SMTP id a4mr286407pgw.280.1625208988205;
        Thu, 01 Jul 2021 23:56:28 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id p29sm2206840pfq.55.2021.07.01.23.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 23:56:27 -0700 (PDT)
Date:   Fri, 2 Jul 2021 12:26:25 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210702065625.qielhnfyrlvrtrkk@vireshk-i7>
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <20210701040436.p7kega6rzeqz5tlm@vireshk-i7>
 <YN4WeJCepCrpylOD@kunai>
 <20210702045512.u4dvbapoc5a2a4jb@vireshk-i7>
 <409b6cc3-3339-61b2-7f42-0c69b6486bb3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <409b6cc3-3339-61b2-7f42-0c69b6486bb3@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02-07-21, 14:52, Jie Deng wrote:
> This is not efficient. If adding the ith request to the queue fails, we can
> still send
> 
> the requests before it.

Not really. Normally the requests which are sent together by clients, are linked
together, like a state machine. So if the first one is sent, but not the second
one, then there is not going to be any meaningful result of that.

The i2c core doesn't club requests together from different clients in a single
i2c_transfer() call. So you must assume i2c_transfer(), irrespective of the
number of underlying messages in it, as atomic. If you fail, the client is going
to retry everything again or assume it failed completely.

> We don't need to know if it fails here (adding to
> the queue)
> 
> or there (later in the host). The "master_xfer" just need to return final
> number of
> 
> messages successfully processed.

No, that isn't going to help and it is rather inefficient, trying to send
transfer when we already know part of it failed.

-- 
viresh
