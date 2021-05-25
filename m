Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD38A390B88
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 23:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232891AbhEYVgP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 17:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbhEYVgO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 17:36:14 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FE9C061760
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 14:34:43 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id y76so22413630oia.6
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 14:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=AV1x4xY7BNlvbADnTNrQXi/pFbf3brHLvoWH+DisJu8=;
        b=TVv/M+CITgXJfBorA0YOq7+hshFN1qCmyi7/acuHDjIxa5rN4/3A6i2PsmL5+17oV2
         S+cCUc9QAtjPKA1TU++KXfTwbEPFGfcYc8H/W0Wd844tGn+fT6ZgcjK3Pvjho31P8dTZ
         Zld23f9YNBRYC3Xo68O6dW7FMZ2eny1a2GHAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=AV1x4xY7BNlvbADnTNrQXi/pFbf3brHLvoWH+DisJu8=;
        b=nBaKkkpmZLifGd1POZyp4t04NmF0ldjG/BRhf6Ziau35GGe7+r79gl3nKfQ5NCA3ns
         9fK2WPBPJ6SWWlbH3eBltCrVpvCVXBEHfrm/ibJUiWTxqokZZ0Bhf3K8/B6fEhKQuGKS
         pWpEPTpatMMKneyatCT68Aq5u2lXObsJnKT/K0a3PSWx9UKBrOjhZkTUcibQENWVS65Z
         Px0A4LylLA5EtNtMCQb4lg2aNQOY62/xjDlzcy6lksXMMorKIxCAtJD5g3LZfK6Lu0Xv
         VWuuxUjUBq0G7nFoNjIsoti39yrjcBGMqRz4H9Uh/yCmJS/gA/NP/nZ/tl/jP48t8z8x
         hN7A==
X-Gm-Message-State: AOAM533aURex6ZPSa9nctRzh7syfznkO8BAXN/gxXjBr1joNtRk/9703
        11zbg1hvYJNKJSTiQvB1Cw/euLIemTVrzZlg7BJn2g==
X-Google-Smtp-Source: ABdhPJyDalNERHMC9OBcejmrwU3aDmCi5jtvRGCgbJT4ryJX3N8M2IpQuBdgh2aLEnO1vLHG6HGVTjg0vZ5ikvYn7LU=
X-Received: by 2002:aca:654d:: with SMTP id j13mr262572oiw.125.1621978482401;
 Tue, 25 May 2021 14:34:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 May 2021 17:34:41 -0400
MIME-Version: 1.0
In-Reply-To: <20210525131051.31250-2-rojay@codeaurora.org>
References: <20210525131051.31250-1-rojay@codeaurora.org> <20210525131051.31250-2-rojay@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 25 May 2021 17:34:41 -0400
Message-ID: <CAE-0n50LiQWZSgHZaPL4xq2Bf-EFTb9U7YJ6Ey3Tja1099ij6g@mail.gmail.com>
Subject: Re: [PATCH V11 1/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
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

Quoting Roja Rani Yarubandi (2021-05-25 06:10:50)
> If the hardware is still accessing memory after SMMU translation
> is disabled (as part of smmu shutdown callback), then the
> IOVAs (I/O virtual address) which it was using will go on the bus
> as the physical addresses which will result in unknown crashes
> like NoC/interconnect errors.
>
> So, implement shutdown callback for i2c driver to suspend the bus
> during system "reboot" or "shutdown".
>
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
