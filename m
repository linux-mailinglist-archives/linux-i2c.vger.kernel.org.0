Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C4443B0D4
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Oct 2021 13:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234147AbhJZLQ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Oct 2021 07:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhJZLQx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Oct 2021 07:16:53 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CDCC061745
        for <linux-i2c@vger.kernel.org>; Tue, 26 Oct 2021 04:14:28 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id t5-20020a17090a4e4500b001a0a284fcc2so1923880pjl.2
        for <linux-i2c@vger.kernel.org>; Tue, 26 Oct 2021 04:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Uay9CbMwX+2O0ogFCTZO+22+pOrDr/HSyVNYJuWbPJM=;
        b=wTbsTpMWtz2u0QXyxWwJhRBj7ddnChMovMZItHWImTK/f9mO8NhRrA6Pz3op87sJii
         NClyz1RI88YScuKoBzVDWgy6fZrG5jvqqkeIaQUuln6qqSZj0X2ELVAyXnaO7bUPq9aC
         1YWZhMoWIY8+D/T/EO3OL7O/aydr466G/KA+z9lc3JB5hjo60vbh1Kvz4YrpzBm1wbP/
         3PZHlQGrL72ToRU479+DVQ6lHY2WBLgHLjhTG7GA/caVd49KmwED3wKe/XanL5FFT5nl
         3cmLWRcOlOTW076t2DcqmEkSAIkPGguFYWC+6Ild/vxmGPKSUFBlesMVC6fbpQPpZbtS
         P6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Uay9CbMwX+2O0ogFCTZO+22+pOrDr/HSyVNYJuWbPJM=;
        b=i4fxWsSfQgOLldDMQpSdKn8hD8ipImSq2QsreEMRG2jtt1ulPrDwb6OPdOdtA99qua
         /WG8LIcmo1BFhYkz+MGEcAP4CoPCV+KDv8k0RD+ONvCMPTn405ns/kTMrgznY720V66b
         NVQ0o9T2Hh4Vd44xdUSXE4LvSQr7P0Pr9CJVC6V17MTgGxawK09J0nc1NxJklCOAPPVC
         HVT3I9aCj1RP3kAJr3zLtRCBHrkvAHbX/0ATAlR4m/f9CnLwkYOVONM3SsvBTSxb0O5d
         sjcVPY4HmTybkp+Unm3IEHx248qIB3j3AB8WYJSj4oa+8Mi6JLjmu5rioOVj+NNJ1WFI
         c6hg==
X-Gm-Message-State: AOAM532Mnr/+bHRTjreDpl/03q+c8q9tlHQvrRlIRTL27LB8wMID3RYK
        EJI1ZSndTU6B3QITWEKziWwZcA==
X-Google-Smtp-Source: ABdhPJz5DzSXU7DwLlex+7rlFsYGq6KKZNeMQTh0M9IOLPaXuknmZc5dsUMVK6fUbDZJCpWMYOgv0A==
X-Received: by 2002:a17:90b:38c6:: with SMTP id nn6mr12930310pjb.72.1635246868236;
        Tue, 26 Oct 2021 04:14:28 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id r8sm19409595pgp.30.2021.10.26.04.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 04:14:27 -0700 (PDT)
Date:   Tue, 26 Oct 2021 16:44:25 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, Jie Deng <jie.deng@intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>,
        stratos-dev@op-lists.linaro.org,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        cohuck@redhat.com,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: virtio: Add support for zero-length requests
Message-ID: <20211026111425.nigbol5stajopkrw@vireshk-i7>
References: <7c58868cd26d2fc4bd82d0d8b0dfb55636380110.1634808714.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c58868cd26d2fc4bd82d0d8b0dfb55636380110.1634808714.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21-10-21, 15:17, Viresh Kumar wrote:
> The virtio specification received a new mandatory feature
> (VIRTIO_I2C_F_ZERO_LENGTH_REQUEST) for zero length requests. Fail if the
> feature isn't offered by the device.
> 
> For each read-request, set the VIRTIO_I2C_FLAGS_M_RD flag, as required
> by the VIRTIO_I2C_F_ZERO_LENGTH_REQUEST feature.
> 
> This allows us to support zero length requests, like SMBUS Quick, where
> the buffer need not be sent anymore.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> Hi Wolfram,
> 
> Please do not apply this until the spec changes [1] are merged, sending it early
> to get review done. I will ping you later once the spec is merged.
> 
> [1] https://lists.oasis-open.org/archives/virtio-dev/202110/msg00109.html

Michael,

Can this be merged as well based on the current voting at the ballot ?

https://www.oasis-open.org/committees/ballot.php?id=3659

Wolfram,

I am asking as this patch should be considered as a fix, which needs to be
applied to the 5.15 kernel itself if possible (now or via stable), as we are
implementing a new mandatory feature, which will make the currently merged
version of the driver unusable going forward (since this won't be backwards
compatible).

-- 
viresh
