Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CA0435A89
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Oct 2021 07:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhJUGAe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Oct 2021 02:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhJUGA2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Oct 2021 02:00:28 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD30C06161C
        for <linux-i2c@vger.kernel.org>; Wed, 20 Oct 2021 22:58:12 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t5-20020a17090a4e4500b001a0a284fcc2so2307838pjl.2
        for <linux-i2c@vger.kernel.org>; Wed, 20 Oct 2021 22:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xCfmwNiGSIU1FWTiYV1xWdNfk6l/Oap6HAgg6fjLReU=;
        b=QfX1KxO1iDmoWlrWX4kmj/ikKGs91ceVH1DNPzMwDs35Nrv4ObEjsLoiF1FocVaOiz
         cRJnikiJTuE0K3RFq8D/NAvMy8x5vaAZOKy+0qkZ12XsRvRwmnLoX/wpKKHWEZWo/ry7
         ZyUlwxLJU2SAZGPAn8Flu3mVIq/B74FSWofr0QzUBxDOdslCuMt/NBHl5Z65Mk9LVvIe
         VvGjJTGawL7iDva1ii96MYLDca4A3W/lK+DL9Bwk6x2m43ztlCbLFputTSZ3IhJmXGOp
         1EEBYCodViTpG/MznXF+icHPMRvRJBv79dW+nvbccVVFOrDJwMbU3ougmVOAiLBfy0EW
         O/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xCfmwNiGSIU1FWTiYV1xWdNfk6l/Oap6HAgg6fjLReU=;
        b=ylC9HguamSJHg2AVyDrnyB8A8PsOaBOpytqGyyO3NtW5XfOq97RG0rYxMDUuNpiTdz
         /D5cp0D31JEpacMyJjrhv+u0x/SNLMUJXRZjUNh6M+C+LEXbBWVhQTATYIYrowGfTz0I
         TQ9272tHeqMsDDHgraVPEVRbpn2zyY+HoTebJ6jwZ3kEH3XmN+HQCv9Q/oNlcS8n5iG0
         Sbm4+WJqs2xPBajM1mIJTm/9e3rijdTJwEG8snlzqJRPHj2NFt3veMHX9aSfwoCF46Hh
         +t5I4TRA8GUv+9bsWknbLewVcRNREs0ekNsUlnVuSiFn+4kgtP8Js0olGhFO2XNMaKbV
         gRLA==
X-Gm-Message-State: AOAM533wHgbsuJtOJF0AIRrwFcssitVeb8BvErDwH9oGTxpVGXKguIjr
        O0x/E+YD+TAJjp++729472ykYg==
X-Google-Smtp-Source: ABdhPJysGXA45YfqU6m6F7iEIFsFMRwo+XnZ6TQLPxUKfVVZ4koslmjfwgQj434dEw6k0qDclNfxRA==
X-Received: by 2002:a17:90a:9b84:: with SMTP id g4mr4337506pjp.123.1634795892500;
        Wed, 20 Oct 2021 22:58:12 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id b8sm4305778pfi.103.2021.10.20.22.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 22:58:12 -0700 (PDT)
Date:   Thu, 21 Oct 2021 11:28:10 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Vincent Whitchurch <vincent.whitchurch@axis.com>, wsa@kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH 2/2] i2c: virtio: fix completion handling
Message-ID: <20211021055810.4ivtscmg2rs5dtt4@vireshk-i7>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-3-vincent.whitchurch@axis.com>
 <a6cb9ae7-eee3-74aa-87de-a2be3fdc7a76@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6cb9ae7-eee3-74aa-87de-a2be3fdc7a76@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21-10-21, 13:55, Jie Deng wrote:
> Can the backend driver control the time point of interrupt injection ? I
> can't think of
> 
> why the backend has to send an early interrupt. This operation should be
> avoided
> 
> in the backend driver if possible. However, this change make sense if early
> interrupt
> 
> can't be avoid.

The backend driver probably won't send an event, but the notification
event, if it comes, shouldn't have side effects like what it currently
have (where we finish the ongoing transfer by calling complete()).

-- 
viresh
