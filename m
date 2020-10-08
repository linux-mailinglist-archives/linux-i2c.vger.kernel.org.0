Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0082287E92
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Oct 2020 00:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729818AbgJHWRG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 18:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgJHWRG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Oct 2020 18:17:06 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B84C7C0613D2;
        Thu,  8 Oct 2020 15:17:05 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id ce10so10301418ejc.5;
        Thu, 08 Oct 2020 15:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+aeXw7s2WES7bcNIdbdIQaaY4T8unlkjPQpfMFRfKYE=;
        b=OT8GmOHr/+PKpAnOhOB6AXLJfROCTf/sLq3Ir8dOAQ3jMBwCpQbMXeMP8QazUo0JCR
         5at6UNhtpcJDK3AxhYq+podo0/uLZ9d0Ed2linGEPFjHwnLdvFRemweohWq2FT+jm5Mc
         pd5KboHgkOseOvaVscUCw3sh4Zwob8aJRHD/5hyFZuxlwR/YVUHszQ9+CD3LSagApPnZ
         5vlboMqm6v626uyo/LcZdYBOAIR67L4eV//wRs+7DDewHVWzaPeMebbcK8muSfX9UHL2
         O/fGpomsUt4ZFPO47c9eEOuHigpiHEEwC3TpVMtO+FAzMTi6rjIqiTAg64sICVh3itQp
         W+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+aeXw7s2WES7bcNIdbdIQaaY4T8unlkjPQpfMFRfKYE=;
        b=WSiHu71MF9fe0cTJgIOrg/4/O+SKJaZJIjLWK5ZP1F4imfTuVUsmJ7W2Nz+HPMSH5o
         1HYEI6O/KA0Hsi+GDBM3EL0FGe5l+zsIpH4O0xMdJbrUemyRbHfG30Gtpud2SUYw6exj
         WPzl5XiM63HMrcLNPPviCjOV1Ns2aK6yR3z+CNTOMA3F5K4Owh9KZjkAgAI+j8MFm1G5
         Nm6RvefbdUh107ciMV1pF1sQHMXdEggWUpP/0NFt3D+6HgWWZkQ71UyNJjxmPVZ/6GO4
         RUhjVQ//2G6yxY9SZHhZXTjUR7pRBCIlUtDfI8y0M3iCv34z8oSrrSzhHRw7cr7tR3Sn
         ub7Q==
X-Gm-Message-State: AOAM530h/lo9N6Ot21Om3K9ArKGHY5hGvm26U3p3fKchEAF8jZsP1xif
        7BpKJMdsTxOzp+W0arUBc68=
X-Google-Smtp-Source: ABdhPJyoKHyQ1LkmMvJEYSp14ZYLQ0yQRbzyQ7HV7iNRjesSPGaDP9QIbQDX4yBszTlOpQIqwufiRA==
X-Received: by 2002:a17:906:bc98:: with SMTP id lv24mr10937117ejb.545.1602195424307;
        Thu, 08 Oct 2020 15:17:04 -0700 (PDT)
Received: from BV030612LT ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id i14sm5137429ejy.110.2020.10.08.15.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 15:17:03 -0700 (PDT)
Date:   Fri, 9 Oct 2020 01:17:01 +0300
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: Re: [PATCH v2 1/1] i2c: busses: Add support for atomic transfers in
 Actions Semi Owl driver
Message-ID: <20201008221701.GA72402@BV030612LT>
References: <b6c56858854805b0f03e29b7dde40b20796d5c93.1599561278.git.cristian.ciocaltea@gmail.com>
 <20200909151748.GA11397@mani>
 <20200909165915.GA387239@BV030612LT>
 <20200910030225.GA10495@mani>
 <20200910141223.GA447296@BV030612LT>
 <20200929194523.GE2010@kunai>
 <20200929210010.GB35053@BV030612LT>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929210010.GB35053@BV030612LT>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mani, Wolfram,

On Wed, Sep 30, 2020 at 12:00:10AM +0300, Cristian Ciocaltea wrote:
> Hi Wolfram,
> 
> On Tue, Sep 29, 2020 at 09:45:23PM +0200, Wolfram Sang wrote:
> > 
> > > Sure, I can handle this. I assume this should be a separate patch, to
> > > be applied before the current patch. Should I submit a patch series
> > > instead?
> > 
> > Yes, just do it. 
> 
> Sure, I have already clarified this directly with Mani and I'm going
> to handle it soon.

I have just submitted a patch series that incorporates the current
feedback (patches 1 & 2) and an additional improvement (patch 3):

  i2c: owl: Clear NACK and BUS error bits
  i2c: owl: Add support for atomic transfers
  i2c: owl: Enable asynchronous probing

https://lore.kernel.org/lkml/cover.1602190168.git.cristian.ciocaltea@gmail.com/

Thanks,
Cristi
