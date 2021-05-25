Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9FC390B8F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 23:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbhEYVhy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 17:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232958AbhEYVhy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 17:37:54 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C44C061756
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 14:36:24 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id c3so31670016oic.8
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 14:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=oIw6Lm/oEW4kxw3eJiq093+7BPtybJnf2iAVAUKE+sM=;
        b=Ij/vaAeJmniEAxFBeZvrK6vWuXnus+DNYdZ6aQCicMy1Jc4wKLWqEETu3fAE5O2vw/
         eoIb4O29CH6fH9sFGvo68N2816adL01iY3DWGtZS7QbP4VAjSFHoYVrPM87BBbaQkD2D
         QYxpGmbFTR8AXLvuWqCNkx6HFH4qdyQ1Pc2v8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=oIw6Lm/oEW4kxw3eJiq093+7BPtybJnf2iAVAUKE+sM=;
        b=X75q0hpWB3f0RvWOKK/1NyeUeyDmHMVVJGworQTsa+oOmcuIX49GyqWascEUkeZ715
         YYRVcB5uwnwMy6KQ0wQzHOC4YM8MTWRzSq+jtnzJI0KYhJUOGaS2H3KMFEggludoG7RN
         XVS32kxM4S62GGqANghNy0XOSEJjBHGvHTJNBnqtzl50hSClUrulbgBZdpyrh4g4dPfU
         rxAEYOFXX6yaK5scGVnPRCyjtDzEkdECg3XAxPNsMkPajAXgcOk93+CTwyXk+b9AnhGj
         2LjQaMXfpgp1vXKkhHD1lT5xA5Q5gZcouk2aEQz10HNefGKJiSqJTCIzjqyyq0iQytsA
         ME7w==
X-Gm-Message-State: AOAM5335CezdbmdOmYfh8QfmRc1oLl8udj4vyTbZlO3IMfPk88PZdbDN
        CE1zQqNfZ9d+fDcbelG47IWkNTgiL9I/r/2Fa6i1qA==
X-Google-Smtp-Source: ABdhPJwNsDttLPTEzEPUI36VovAcfJ6b4EI4MmCDl4scokm5BDtcdbM8uZchDV6/AnozgWdsmwNeoO2/h+YIlgOhzoU=
X-Received: by 2002:a54:4501:: with SMTP id l1mr15689617oil.19.1621978583504;
 Tue, 25 May 2021 14:36:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 May 2021 17:36:23 -0400
MIME-Version: 1.0
In-Reply-To: <20210525131051.31250-3-rojay@codeaurora.org>
References: <20210525131051.31250-1-rojay@codeaurora.org> <20210525131051.31250-3-rojay@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 25 May 2021 17:36:23 -0400
Message-ID: <CAE-0n517a659m9MtrZUxUN-p_JGj6uCn1Z6zQvjwvYh=miNAeA@mail.gmail.com>
Subject: Re: [PATCH V11 2/2] i2c: i2c-qcom-geni: Suspend and resume the bus
 during SYSTEM_SLEEP_PM ops
To:     Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
Cc:     dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        gregkh@linuxfoundation.org, mka@chromium.org,
        skananth@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Roja Rani Yarubandi (2021-05-25 06:10:51)
> Mark bus as suspended during system suspend to block the future
> transfers. Implement geni_i2c_resume_noirq() to resume the bus.

May also be worth noting that this causes some warnings on trogdor
boards because suspend ordering is incorrect and the bus is being
accessed after it is suspended. Unless that is all resolved?

>
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
