Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5D7442614
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 04:33:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbhKBDgC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 23:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbhKBDgC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 23:36:02 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FF4C061714
        for <linux-i2c@vger.kernel.org>; Mon,  1 Nov 2021 20:33:27 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id b4so11869416pgh.10
        for <linux-i2c@vger.kernel.org>; Mon, 01 Nov 2021 20:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a1lXUR6SQ/hD6znen9JgIoQ/BqqL7K0xRUGaDryk68I=;
        b=fDv8r6JcJVMfIdN1DY+fvOCubW1/T4KMG8OpFRuNA7E1WcPkfwCCMv3Yee5QwmoOcV
         4MVv14+urzbcwNqRSWA66Ky8VqbzrTFe8DHYZ0+qSfmcCZxHJeF6EzLzgAJM1dRvr16v
         oO9OEegl8oRX11NZjUJdAr5KC3w36lHqnios0M8p/2+lTa3wkfnVxUN6Sw0NPWbiOoM8
         VBppoS1bPQeyt9qk6sc3cwEX421Clumks+bCXpw3vDYWnyZWy14yJGbv43EwDyQ4CZtE
         6iiBDwBb559risFbjnm4sbjn3jMHvr8fDNTiCdyuZaPaBHuxauVFkRtTmgWnPYH4yPQF
         1WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a1lXUR6SQ/hD6znen9JgIoQ/BqqL7K0xRUGaDryk68I=;
        b=fKJpj0zso9Af4V+ab9QhdI5ZGqXGYsN614H2x0HXGcYjBKZr358Iy6evxruNscs+LA
         kyvxxKjIjoUt3AHtBr1T4qVzHmeMEO5pajWBAz1ouOu6KkZzssx1Qk01lFSJ55zngBDK
         O75kEfJ0SNCc3f75drLrwoic1HPdaGvDCNSAMJ61HomZ9k/8FxLQKukTkIGismuh4B79
         gPtebA6iNxz8B9dgOoAn2ln/9Gj2GXCMjhSy/S3+bjOuE4IGB1ZHd3G13txjKNWyG2VH
         Z/HhetQmHloCteVx50Ln+hviSJoZXTD1KXbeF6LNBVmGNP/kZ4krLCgFNz3fQGKpx+Ei
         nlLw==
X-Gm-Message-State: AOAM530e/kAd0LPwPKqk7PJGXuMIrGipZIWf0thAYZRBcq/yKiOK37Sc
        eMvgmdy+DaMpV+VuK5bSMwr5WpIUevLOBw==
X-Google-Smtp-Source: ABdhPJy4IoDlvp7DZL85+0EmaBuTHCvSx5BaTfRfxNq3AqWLrcAJqM+saZjZj61Da9g/a3H4u6KF8w==
X-Received: by 2002:a63:7881:: with SMTP id t123mr24852203pgc.150.1635824007531;
        Mon, 01 Nov 2021 20:33:27 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id d20sm5475136pfu.189.2021.11.01.20.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 20:33:26 -0700 (PDT)
Date:   Tue, 2 Nov 2021 09:03:24 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        conghui.chen@intel.com, mst@redhat.com, jiedeng@alumni.sjtu.edu.cn,
        vincent.whitchurch@axis.com
Subject: Re: [PATCH] i2c: virtio: update the maintainer to Conghui
Message-ID: <20211102033324.5x2sd7ezcmbk427e@vireshk-i7>
References: <00fadb64713aebd752dca3156e37c8f01c5ac184.1635736816.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00fadb64713aebd752dca3156e37c8f01c5ac184.1635736816.git.jie.deng@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01-11-21, 13:24, Jie Deng wrote:
> Due to changes in my work, I'm passing the virtio-i2c driver
> maintenance to Conghui.
> 
> Signed-off-by: Jie Deng <jie.deng@intel.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b79fd4..8c9a677 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19944,7 +19944,7 @@ F:	include/uapi/linux/virtio_snd.h
>  F:	sound/virtio/*
>  
>  VIRTIO I2C DRIVER
> -M:	Jie Deng <jie.deng@intel.com>
> +M:	Conghui Chen <conghui.chen@intel.com>
>  M:	Viresh Kumar <viresh.kumar@linaro.org>
>  L:	linux-i2c@vger.kernel.org
>  L:	virtualization@lists.linux-foundation.org

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
