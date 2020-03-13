Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B870184C70
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 17:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgCMQ0R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 12:26:17 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41948 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgCMQ0R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 12:26:17 -0400
Received: by mail-pl1-f193.google.com with SMTP id t14so4486899plr.8
        for <linux-i2c@vger.kernel.org>; Fri, 13 Mar 2020 09:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9duP3dH+aH6CT7yB4gVvhjVC0X7MYOO6kZ8y2HY41wc=;
        b=VCLEFuMQYF1m6BKJsL0oksC1WBq5jRVxRxsQiEcPt3NRwsUKL0k0NyLz3a9pa/pOnH
         jyhGgAShULjHz9oLPPVA99S5lBDFkR2Nu+7RrA7dbetqqjQ/v0xOn462W2t/zEHEgJ/Y
         QmsCOKz/KFqGhQfWhmlxttlq+xColL+tKFLLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9duP3dH+aH6CT7yB4gVvhjVC0X7MYOO6kZ8y2HY41wc=;
        b=ZOdsVlvG1Lt0dsxNh5IkH1HCBHk2I+2RfG25U8ZHtkP6+kVPI/ay3KGir9QrSBOVkk
         U6CvcJ2o5SkNwK8LnGc3D30ULpWUC2EdozcNNK67SbKYD11YiUudw6vuvdby2KUcnCdp
         FTX6jUL5RM4nZoIPZO4TTt2TALMYJywfDK8IEc6rVzvSN0bPKQPISxPHJiXoTg/QX867
         zm31zQSKtY8pMC7KRHSUPQMVfOnTnpbD7rEo0ysYXaMpUoFiLoS085DPheP4dvHBQGPy
         zAP+KDNUpC3UVqNBemVwJSKchj25XzIP8Wrr+aD/96PKrcMogod6ET/MidC/AwUmrDWg
         eASA==
X-Gm-Message-State: ANhLgQ11mvmREXVtOVCuSZBdGP4/NJR8rvddzDIzsN3PhSgMVyHJpC3j
        XdGty+cqt1IVDvT0G07xqABP/g==
X-Google-Smtp-Source: ADFU+vsPsA3vvdpbgpspQcOzaz1fjLOJRiNK9x2Pzp04oC9rV4EJ/KR3BicBI9malNEFSPehXIWYmg==
X-Received: by 2002:a17:90a:714a:: with SMTP id g10mr10400527pjs.155.1584116776171;
        Fri, 13 Mar 2020 09:26:16 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id nl7sm3616751pjb.36.2020.03.13.09.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2020 09:26:15 -0700 (PDT)
Date:   Fri, 13 Mar 2020 09:26:14 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
Subject: Re: [PATCH V2 1/8] interconnect: Add devm_of_icc_get() as exported
 API for users
Message-ID: <20200313162614.GG144492@google.com>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-2-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1584105134-13583-2-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 13, 2020 at 06:42:07PM +0530, Akash Asthana wrote:
> Users can use devm version of of_icc_get() to benefit from automatic
> resource release.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
>  drivers/interconnect/core.c  | 25 +++++++++++++++++++++++++
>  include/linux/interconnect.h |  7 +++++++
>  2 files changed, 32 insertions(+)

Reviewed by: Matthias Kaehlcke <mka@chromium.org>
