Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7FAF64C3C9
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 07:31:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237260AbiLNGbQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 01:31:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237152AbiLNGbM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 01:31:12 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591F527CED
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 22:31:11 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 79so1332440pgf.11
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 22:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HQixYPUGx3dNHQMvwFeapmdpykALcgOAixIE0qar/eQ=;
        b=hObCXhW5iEBR2JFX/mOosGX4M4dNVoaPDKLQuYphAMJR2iH1N0ZyLeowQm8rX0Tp6p
         NEQqrI4Pkpj2tITzrxE1la/qkpmrpXzeqiB6D4LWqaCOMG2dn7yXC9JCDb4VW5yCWqQ9
         zynVEqWHHjV3Lu/urILjfNimtEABgHwDj6CJ9YsZxRIGUhMh48PgHPCPTKdcf/I8MQf1
         jwyoWmnci25Q6vx59fvkTEZdf5PRZ2Q6T8CNWfLTPaHj2y21FgZnVH5RMZpf71qzWE2w
         tif9t28PD/Aef+evFGr+dfo5S7DF0rruRHoG1VZ+UN6W6kzOGElYgoFEsCr5Kx3qtIrQ
         oXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQixYPUGx3dNHQMvwFeapmdpykALcgOAixIE0qar/eQ=;
        b=EwHWTyqL5pTZkGlwqX0iNAkFjdlJ3MvDh4byCGk6h9tr9msUPTa8SEPie/i0f3ueVg
         cdjjG0TUpPgd5YFiQKRwflQzZD7iEGHRm+7bRSitI59oxkDygA8uButnd3IDONcKL8hU
         qYUD9so+dNE+IX2DWpqcDTem0b9ZnBJSAE3VVNFOjYLCto365MfFLNcShrP97kGfJke0
         6NvM1yrKFTfcp6cowpNfFjfj82tRRD3LSxFQgf0QpnTjOpDpkssRqIjQE0ibnQsGiNEv
         SDYjPG90EquJG5ijqTKo8vOlBFv4M8PDUcv7VXSZGz27uBX7dI3y8+jsqFCTOR19mBaF
         GMKQ==
X-Gm-Message-State: ANoB5pl7uyr8EhQEenSF/DFj9F1KyN6TsbXQMjZkibLKFYQYy5vNLMm0
        uU4f8lTGnHZmbfbHWPAHu9FEdg==
X-Google-Smtp-Source: AA0mqf70gvWGruQzLDmnl4KVdvtPjvp7ABTpAaEQSwPuOQ6LDXC2rUoVyUX0jd6/rE8xHeazM6qp3Q==
X-Received: by 2002:aa7:8f2d:0:b0:576:8027:a2fc with SMTP id y13-20020aa78f2d000000b005768027a2fcmr23462513pfr.12.1670999470608;
        Tue, 13 Dec 2022 22:31:10 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id f5-20020aa79685000000b0057726bd7335sm8632515pfk.121.2022.12.13.22.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 22:31:09 -0800 (PST)
Date:   Wed, 14 Dec 2022 12:01:07 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     wsa@kernel.org
Cc:     mst@redhat.com, asowang@redhat.com,
        Conghui <conghui.chen@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        Jian Jun Chen <jian.jun.chen@intel.com>
Subject: Re: [PATCH] MAINTAINERS: Update maintainer list for virtio i2c
Message-ID: <20221214063107.fazrfq3n26hw4ndl@vireshk-i7>
References: <20221214053631.3225164-1-conghui.chen@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214053631.3225164-1-conghui.chen@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14-12-22, 13:36, Conghui wrote:
> This updates the maintainer for virtio i2c drvier
> 
> Signed-off-by: Conghui <conghui.chen@intel.com>
> Acked-by: Jian Jun Chen <jian.jun.chen@intel.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a8c8f6b42436..44747f4641a6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21920,7 +21920,7 @@ F:	include/uapi/linux/virtio_snd.h
>  F:	sound/virtio/*
>  
>  VIRTIO I2C DRIVER
> -M:	Conghui Chen <conghui.chen@intel.com>
> +M:	Jian Jun Chen <jian.jun.chen@intel.com>
>  M:	Viresh Kumar <viresh.kumar@linaro.org>
>  L:	linux-i2c@vger.kernel.org
>  L:	virtualization@lists.linux-foundation.org

Wolfram,

I understand that it is okay to pass the maintainership, within the
company, for platform specific parts from one person to another, since
they have the best knowledge of the code and are the only one
interested in maintaining it too.

But what is the rule for generic drivers like this one ?

-- 
viresh
