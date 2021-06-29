Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D17B3B710B
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 12:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233356AbhF2K7V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 06:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233346AbhF2K7U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Jun 2021 06:59:20 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABB2C061574
        for <linux-i2c@vger.kernel.org>; Tue, 29 Jun 2021 03:56:52 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id j24so2841142pfi.12
        for <linux-i2c@vger.kernel.org>; Tue, 29 Jun 2021 03:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Jc3NxCk+KDZnIQDnHNRavHi5mkTsU8gdZSOVUuYmb/Q=;
        b=QS9szzKZkwbuUl6cKd5ztj/xB9uMz9A1jTb+bhp/iKdt6UXXCDtfbkgpYSl9Ld+viw
         6wm5vnieXa0uuthxGAsd2dKH5l1eiA5nEb/Q01RIm+4sRZOun/GGl0IoKejxx6PU/Cxi
         KwW+NE7q5y9MFmWzZwJ/lOLR6FezFPiwFKp36Ggo57oNbkpfTdkz/yl0ZVaty0BvAd0Q
         tkint4nL99vAdnuiwBtQONS1EyfJelM8ZYkTwrROgl/HDIykl+FUEmL3aXcw5DRa/mvE
         VkMMefHA41nC0ZWHpWASXk0mnM1R+U1S1zX3LjB0QOklwhgqe/MbW7AabHCf9G6KZz9/
         kW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Jc3NxCk+KDZnIQDnHNRavHi5mkTsU8gdZSOVUuYmb/Q=;
        b=kZeu+VESdLOuRXuIJbkiuXNjDPUSXOEOOw0iZz2Qn6J82sRLgbyw87zcNxBgnzRvS7
         Ci7IaRZq9V4idUVjjkKOiiEmH0oS5H4pLMd4qs6nRAWpDDMZ/ZmBDVtFCg1RAbfy6SIG
         X6ILmzLic/5JjmW9mG6dOcatsX1vdwzX1FEbFxZ69wgWl5fEP0whiR2A+7JgupeyOOGq
         G3DH/3qgk9vahxwoMYHPD88cAT6zuxux2i24yYMz4hkkZrP+vBNeuIMXpyvHA4AjP8yY
         PCdVG/RECjB7ZkD0p1Z3Gs1rtvqDb+rwMgesmggtGahB2CnX3krNLpSCofW9PtQg1RMG
         WOlQ==
X-Gm-Message-State: AOAM530/dUv4KcBiVMBRSj6EImWkC9auxHTFrpQoPUeY5eZ03mrzpE9g
        7f/gfITriIBWze4CEpOzbZIpHg==
X-Google-Smtp-Source: ABdhPJztQOYmtid8VFswfwsuX0Ti0CJClj3s+tJOjyJNAmsG+72+n65kqxZFjJN+ujUm53A0wuaxzw==
X-Received: by 2002:a63:5616:: with SMTP id k22mr27766655pgb.41.1624964212463;
        Tue, 29 Jun 2021 03:56:52 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id w123sm17955912pff.186.2021.06.29.03.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 03:56:51 -0700 (PDT)
Date:   Tue, 29 Jun 2021 16:26:49 +0530
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
Message-ID: <20210629105649.nt63mxtiy6u7de3g@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato>
 <20210629101627.kwc2rszborc3kvjs@vireshk-i7>
 <YNr0uDx1fv+Gjd7m@ninjato>
 <20210629103014.nlk3mpetydc4mi6l@vireshk-i7>
 <YNr5Jf3WDTH7U5b7@ninjato>
 <YNr5ZRhT3qn+e9/m@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNr5ZRhT3qn+e9/m@ninjato>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29-06-21, 12:43, Wolfram Sang wrote:
> 
> > From the spec:
> > 
> > The case when ``length of \field{write_buf}''=0, and at the same time,
> > ``length of \field{read_buf}''=0 doesn't make any sense.
> > 
> > I mentioned this in my first reply and to my understanding I did not get
> > a reply that this has changed meanwhile.
> > 
> 
> Also, this code as mentioned before:
> 
> > +             if (!msgs[i].len)
> > +                     break;
> 
> I hope this can extended in the future to allow zero-length messages. If
> this is impossible we need to set an adapter quirk instead.

Ahh, yeah I saw these messages but I wasn't able to relate them to the
I2C_FUNC_SMBUS_QUICK thing. My bad.

Looked at Spec, Linux driver and my backends, I don't there is
anything that breaks if we allow this. So the best thing (looking
ahead) is if Jie sends a patch for spec to be modified like this.

The case when ``length of \field{write_buf}''=0, and at the same time,
``length of \field{read_buf}''=0 is called not-a-read-write request
and result for such a request is I2C device specific.

-- 
viresh
