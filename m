Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE924B279E
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 15:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245644AbiBKOMa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 09:12:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235702AbiBKOM2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 09:12:28 -0500
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5063DDE9;
        Fri, 11 Feb 2022 06:12:27 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id u3so9601753oiv.12;
        Fri, 11 Feb 2022 06:12:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lAkUnjcZkQaj/Jq2IySe0qTtnqDiy/JqCybGCbj3Xr4=;
        b=5mNmr8yHdbwp5y5Z7i4FgoIsKJMsKAO9MIu0CIG0lr7DykEvXtPE0Z96oUtRTXbwyf
         lyLNIHgtetc5wnUJcc2RmNHI3+cMM2OXoKjpsVmj0cVjzSjSnq8z+2nmhEguPmZVFnO1
         MkVPlI3TM2kyJC5ithzkG0xu9rXiP9He8NHSuQt2EaBRlcUEN8IQ9rNQjIHulZtoGmhc
         o+O+h20evJds50LnCXJsofiBs2aWv7Z+SzIkHqdcWupI4C2aAuQq3/AaeGbEGNjyMV5O
         P1Omuupa8MgKsqoRSDRoJz+MdKVsytvswqSJx/BYBzfjI10CMncBF/Cr/9H2jccJVLH/
         IPLQ==
X-Gm-Message-State: AOAM530cOwetM4Q3AmxLtkeJTW+5TncQDG2Vza3N9AkfPpHild1BVuS4
        gBc4g1WuRWBrMiWcTQsU8Y2W/va13w==
X-Google-Smtp-Source: ABdhPJwmSbOHF34SzzapTIDb7eEv5EgBL3YRReQ1KuJvfhTPrEgsWRjiCFNskT7QkRP715c6n1sF+A==
X-Received: by 2002:a05:6808:ec2:: with SMTP id q2mr249429oiv.124.1644588746611;
        Fri, 11 Feb 2022 06:12:26 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d7:a802:e6b0:6d9c:32f7:4bd9])
        by smtp.gmail.com with ESMTPSA id c61sm9016445otb.52.2022.02.11.06.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 06:12:25 -0800 (PST)
Received: (nullmailer pid 291081 invoked by uid 1000);
        Fri, 11 Feb 2022 14:12:23 -0000
Date:   Fri, 11 Feb 2022 08:12:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: i2c: qcom-cci: add QCOM SM8450
 compatible
Message-ID: <YgZux6VgMQqpA0dj@robh.at.kernel.org>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164629.1711958-2-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203164629.1711958-2-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 03 Feb 2022 18:46:28 +0200, Vladimir Zapolskiy wrote:
> The change adds QCOM SM8450 compatible value to the list of QCOM CCI
> controller compatibles, the controller found on the SoC is equal to
> the ones found on previous SoC generations.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
