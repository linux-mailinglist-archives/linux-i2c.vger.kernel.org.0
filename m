Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D312A2C5906
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Nov 2020 17:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391490AbgKZQKL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Nov 2020 11:10:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730987AbgKZQKL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Nov 2020 11:10:11 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171EBC0613D4
        for <linux-i2c@vger.kernel.org>; Thu, 26 Nov 2020 08:10:11 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id b6so2002819pfp.7
        for <linux-i2c@vger.kernel.org>; Thu, 26 Nov 2020 08:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XX1dKY+g5cNULWumwqO6QpUHR/ReF5hRORN8sYXjQBU=;
        b=W/5Fc9iFFkc2XtMFTWg9row9KaKBexv9VZ4pj/3ElJzj3fs6664TpDiV/EtYqkAf6G
         cXvRsFe1Beft6NBMjnSc+jzEMm+GEAsWhbIYFb0mnHbpSapv7WxJPuo28+89D2OAuLC5
         jZnnRjBbWnf2n+J3RUyGwGBRHnpBeF1xJkOA5cnN7lXn7AEUrKTsnTNmTjwLA2l89HoX
         oXfruCXbK9RDekg6imdjiQNJUMl9tlSBK61ahG1Ip//G05vtTgv2ic5Fr02RhPmUPScH
         rDWITon7R6/yPNAQtrEPdQC/I5JoFbTC7m1dYiEvfGKfazR68aElmh82ycmopbWLkZ88
         VpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XX1dKY+g5cNULWumwqO6QpUHR/ReF5hRORN8sYXjQBU=;
        b=FktGwYuG7nT/zLPM7RTFLbF2DgPA8Rh8NCsrKZMZ3hRinubYU3Bv1fmm9wEMLknrfm
         4Do/KgMGWNPYTMJJrdKAxYifLcIPgOCSyBW6GEiq8kJb9LMh7gKr/n56C/1eowl3aTZh
         CT3bw3raQMdbsBIf8jKG4N9kMfkjO3bzqoClqsn2OPYw1LYcev/xH8Zvj6n+tIlaHCff
         EvN/5tHfwmmRcSXhZeaoNvfruqGMHkeZ8qku30pwj+bTFuEVjGEaWZ5qXAyE598I7RUn
         /P0E0bHJJgVf1AUSVoQMHEZ/JJClOgP8n4XnHkapp675hvdHIHuGBItPCTZiD2Kin2KJ
         uj0A==
X-Gm-Message-State: AOAM530cRABnE4222BOucj4NqumRpqyymn0G+7/781Vh4amkXXi0WGBF
        hTawVJU9x2XZtQ/Bc9RVaPEj
X-Google-Smtp-Source: ABdhPJxPk8yzwbdBrvHhw1L2hjPE0hNuaXTYPgSDi9ylqtHzP7IaIaBzhdHSGeeTo5FjZtQmSLGqDw==
X-Received: by 2002:a63:d157:: with SMTP id c23mr2967582pgj.196.1606407010538;
        Thu, 26 Nov 2020 08:10:10 -0800 (PST)
Received: from thinkpad ([2409:4072:6e95:f2a:3996:9d7f:e389:7f7d])
        by smtp.gmail.com with ESMTPSA id q5sm5256623pff.36.2020.11.26.08.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 08:10:09 -0800 (PST)
Date:   Thu, 26 Nov 2020 21:40:05 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] i2c: qcom: Fix IRQ error misassignement
Message-ID: <20201126161005.GF51288@thinkpad>
References: <20201126145321.18269-1-robert.foss@linaro.org>
 <20201126150334.GC51288@thinkpad>
 <CAG3jFysosSVGfLzAvERS=GaEz8J8SJwh7roS5twG6-7meErKdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFysosSVGfLzAvERS=GaEz8J8SJwh7roS5twG6-7meErKdw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 26, 2020 at 04:58:48PM +0100, Robert Foss wrote:
> Thanks for the review Mani.
> 
> On Thu, 26 Nov 2020 at 16:03, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Thu, Nov 26, 2020 at 03:53:21PM +0100, Robert Foss wrote:
> > > During cci_isr() errors read from register fields belonging to
> > > i2c master1 are currently assigned to the status field belonging to
> >
> > s/correctly/incorrectly
> 
> I don't think there actually is an error in the comment.
> 

Yeah its an error in my comment ;) Please ignore that.

Thanks,
Mani

> >
> > > i2c master0. This patch corrects this error, and always assigns
> > > master1 errors to the status field of master1.
> > >
> >
> > This patch fixes a legitimate bug. So there should be a fixes tag!
> 
> On it, fixed in v2
> 
> >
> > > Suggested-by: Loic Poulain <loic.poulain@linaro.org>
> >
> > Reported-by?
> 
> I'll add both in v2
