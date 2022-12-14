Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13A5C64C826
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 12:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237528AbiLNLif (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 06:38:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiLNLie (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 06:38:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442F26555
        for <linux-i2c@vger.kernel.org>; Wed, 14 Dec 2022 03:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671017870;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Xbb/OYb347XWt0aChq9WW/A++3VBOQvZVK9Cr0CpKIU=;
        b=hV7wauMJcT32u7WGMdTfBsnHQ2QrymfsK3IoF9pWdX+bPIrwOB1+QEH7g/zIcrOI3110Ni
        72O50rpltU0L4FGT1gFPmU1BfvHalq3yD+WRtBaG+GXyTrAn6jEYVeghLldtHIJLX1v1O6
        txlGMuV9KuUkg0FLfUnjPKFG4HLvL8Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-gETDN-p9NrmSZMFZ1Q2vVA-1; Wed, 14 Dec 2022 06:37:49 -0500
X-MC-Unique: gETDN-p9NrmSZMFZ1Q2vVA-1
Received: by mail-wm1-f70.google.com with SMTP id i9-20020a1c3b09000000b003d21fa95c38so4318701wma.3
        for <linux-i2c@vger.kernel.org>; Wed, 14 Dec 2022 03:37:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xbb/OYb347XWt0aChq9WW/A++3VBOQvZVK9Cr0CpKIU=;
        b=JY0hhPSF9y7Ta5oZMHHS44KJ8FvweO0g2emma+G68JDRB+kKcU5Zz2aUNNSHQxEQUM
         kVVxN8C0bROr1sWp+MpRx73g+jRmvkgYEorMLjWh3cJXRuZfcDSSutHDTMCvz9rP+0On
         wVIfdzXWI6E2vGOKvQHgDhAMoYoAAJzGDGZW/cecsV1j9P04BV94w7nDENQNWLIT8FW/
         yE3sDTD7cEpRXcVW0lXMNZ5l7WoPUHllM5uIzk+FJ8RxFM+DvhSyqr0t4jWLL/k22PO1
         60x8V+mHTb/ErIl+MVUIR2C+McFMJiuN5E0RfxCgS/wQQ8j4ebe3ueuXLuZTeEX1Vs0J
         QDBw==
X-Gm-Message-State: ANoB5pmKupKLr8LQXZ5KPXooC+XGyHRTQwJF1Y3kcffmbHofD5N5i1Op
        AxauyRxG+Px4slEm0sHeMLPD4Mn5jJB5s7o3kk9CzIA3tN0mK839rrjLIomAGzLLtzXtRUB3kUi
        zg4PU/EgatlmAgEF1SavX
X-Received: by 2002:a05:600c:1e8c:b0:3d2:381f:2db5 with SMTP id be12-20020a05600c1e8c00b003d2381f2db5mr2852483wmb.22.1671017868266;
        Wed, 14 Dec 2022 03:37:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7+/bU1un/JpJM4ymOe9NfhDvrRwq4OTL101Vo082S4gqBPPhwQb2YjlTNDwe3J9cq8jj9gYA==
X-Received: by 2002:a05:600c:1e8c:b0:3d2:381f:2db5 with SMTP id be12-20020a05600c1e8c00b003d2381f2db5mr2852461wmb.22.1671017868013;
        Wed, 14 Dec 2022 03:37:48 -0800 (PST)
Received: from redhat.com (bzq-82-81-161-50.red.bezeqint.net. [82.81.161.50])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c4ecc00b003cf9bf5208esm2429840wmq.19.2022.12.14.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 03:37:47 -0800 (PST)
Date:   Wed, 14 Dec 2022 06:37:44 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Conghui <conghui.chen@intel.com>
Cc:     wsa@kernel.org, asowang@redhat.com, viresh.kumar@linaro.org,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        Jian Jun Chen <jian.jun.chen@intel.com>
Subject: Re: [PATCH] MAINTAINERS: Update maintainer list for virtio i2c
Message-ID: <20221214063352-mutt-send-email-mst@kernel.org>
References: <20221214053631.3225164-1-conghui.chen@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214053631.3225164-1-conghui.chen@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 14, 2022 at 01:36:31PM +0800, Conghui wrote:
> This updates the maintainer for virtio i2c drvier

I got that, but what is going on here exactly?
I generally expect a new maintainer to be active in the
project for a while first.
I don't see contributions or reviews for this driver or
for that matter for any virtio or i2c drivers from Jian Jun Chen.
It looks like you are no longer interested in maintaining
this? In that case pls just send a patch removing yourself.

Jian Jun Chen, if you are interested in reviewing
patches please start doing so, you don't need to
be listed as a maintainer for this to happen.
Once you do this for a while and write some patches,
you can become a maintainer, this is not a high bar
to clear.

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
> -- 
> 2.25.1

