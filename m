Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C95427D979
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Sep 2020 23:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728999AbgI2VAo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 17:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728729AbgI2VAo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 17:00:44 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A21C061755;
        Tue, 29 Sep 2020 14:00:44 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id j2so8108428eds.9;
        Tue, 29 Sep 2020 14:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KFjBMwnr0euHuLOqoi5dKD5UMAj+YeZolmwPYrZ8vCI=;
        b=VOh/uSh6VZfA3xkq4m0en5VoZi2PBQpqWq/pvwk4OWd58/qLL7UiXMYajKcmtpvt6o
         EPJRk2YOnr9njp+jkdOWzUqgxbOLwAWgvRG19RjHvZ/FPHW/zXAvWH0YonUDiR1egwUX
         voGo3LSvRZEvwDBfB6NPn/21GUaikA2kncOIbfOFKXRd5VxyTRnSIhsgNhwPBurFEYYM
         jD4WOPpNr5+gkxEMcHnaiPqPEsknw0GioeAoOS6fNzS38BwcWUif877Ml+mPfx3YZXZh
         i20DuJaPTvOth3Xr9Yx0T0K0wul/HiXAxwvqzxuL3OO6gTAhwIweVp9MxHyWGvKDimE0
         +EQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KFjBMwnr0euHuLOqoi5dKD5UMAj+YeZolmwPYrZ8vCI=;
        b=lCiEPfVb9nCOvsrdbBToXKFiQDEyucTLy3v3B6BTuoAyV+MbWq9BeaOFxQmrrypaBm
         cw591SwjtsXS5wr78WtaEnu5qc/VcXe0Gn+tOTiyEgV6n8S84t7XLc4RMZb4kLJ1ib3j
         oCY/JwN2DKoJzE6534rlGWnrSqjCXP7at54YGyD8InY1b5MhmZTE/wd28kBANS+7LXJt
         f8H//klyKxh7tn/Q9JAoHnXLEcAc7pddnUZqTsg//mNyWZpZuC8hqb6mZdXK0CvZaGR8
         gMQTOE5Fe6MISWIYHo9FF23T+0oN7j54g4NojVeBHoqgNTvwfRXl6nd1dU8hN4WIzN4L
         nzqw==
X-Gm-Message-State: AOAM530vtbiigR4kw6E88PUHB9lCZcYxMg9ij6M5izBMP4POpUW4yzHS
        qmoM23i7rQ0cRwdVu7Dt1Qo=
X-Google-Smtp-Source: ABdhPJzENPgyaRQm3+MFtflMD9edfYqyb/lgtEcQtJ51bMN+IkAWc1fzyob2mUkz6P+pS2srZ/uIow==
X-Received: by 2002:aa7:db82:: with SMTP id u2mr4548592edt.262.1601413243079;
        Tue, 29 Sep 2020 14:00:43 -0700 (PDT)
Received: from BV030612LT (oi48z9.static.otenet.gr. [79.129.51.141])
        by smtp.gmail.com with ESMTPSA id a2sm16539ejx.27.2020.09.29.14.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 14:00:42 -0700 (PDT)
Date:   Wed, 30 Sep 2020 00:00:10 +0300
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: Re: [PATCH v2 1/1] i2c: busses: Add support for atomic transfers in
 Actions Semi Owl driver
Message-ID: <20200929210010.GB35053@BV030612LT>
References: <b6c56858854805b0f03e29b7dde40b20796d5c93.1599561278.git.cristian.ciocaltea@gmail.com>
 <20200909151748.GA11397@mani>
 <20200909165915.GA387239@BV030612LT>
 <20200910030225.GA10495@mani>
 <20200910141223.GA447296@BV030612LT>
 <20200929194523.GE2010@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929194523.GE2010@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, Sep 29, 2020 at 09:45:23PM +0200, Wolfram Sang wrote:
> 
> > Sure, I can handle this. I assume this should be a separate patch, to
> > be applied before the current patch. Should I submit a patch series
> > instead?
> 
> Yes, just do it. 

Sure, I have already clarified this directly with Mani and I'm going
to handle it soon.

> And please remove irrelevant parts of the mail when
> replying. Thanks!

Ok, I'll pay attention to this.

Thanks,
Cristi


