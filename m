Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F627441508
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 09:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbhKAILU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 04:11:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53939 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231364AbhKAILT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 04:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635754126;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5kLbjZDDkOhz4cJ9xiUMiFb06EkLr1swGgOKmXg3lr4=;
        b=fsVxumKTO0jzlBOmyuHd8ov5IGo31mV0QWedi27Z9hTQ6DHqcCMRZPbKD4Lgf6HEhvJZsz
        ODqxbcX9ICcGexMSE++cnZze+YANBBj0DbFmOvdxC0EvRYQ5d7MQOZLQLQObl8EwRmmBJy
        ITwIylWAGpt/bUBrZPrPVskiAnnZlUI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-8bC3v9oqPXqrBC6ijDSHqg-1; Mon, 01 Nov 2021 04:08:45 -0400
X-MC-Unique: 8bC3v9oqPXqrBC6ijDSHqg-1
Received: by mail-ed1-f71.google.com with SMTP id g3-20020a056402424300b003e2981e1edbso313137edb.3
        for <linux-i2c@vger.kernel.org>; Mon, 01 Nov 2021 01:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5kLbjZDDkOhz4cJ9xiUMiFb06EkLr1swGgOKmXg3lr4=;
        b=iH70rH5L/4b+YENAVgLz3ZVraRxAycw249IMcPhR9OKT4LPwB4t5eRb/5Qvf9ZlgLN
         gBPecQi3AQl6q6oYIWOwpQ5HKTHadaDXNzabe8rThrwxrPji3CyLum+9u7ioh9atDuIb
         lP/qGtB8UjvjE3Dweg3u7on7D2b3vhMWJuVoFWijQ2nfnjowVUKuHQEsKfOopA8YePRS
         KQEkn5S59Tc3ImMsBPzYO77aL4qp1EBQORRZow0GqSzNs/7GQvPeAc9v4iteqLcosL3R
         tV2IZ1aQJw03Z80araUemmlqchnfQzpXaVoHSYw52cDXfvbXc1eXTr3ZloUJpYP3F5Jf
         JOHw==
X-Gm-Message-State: AOAM531YbAUlO4FRm++NFfyBRt3H447VMqvZUxfKBEAMaPtO8zaw+kh9
        BcQzyYKeZ24ppS5D9T+EXj/hXG5zepUkmpg0o2wDGNJb9sIAj/evdVQaNOs+JDgoQKg2DesOQcW
        jasMn9RgDz9fQ/z1XD0AL
X-Received: by 2002:a05:6402:1d9a:: with SMTP id dk26mr26519880edb.222.1635754124292;
        Mon, 01 Nov 2021 01:08:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcxJeBlZMLJMZ/Yhk6ZkJJr8jvsWcWuj9uKKrNWq+CK5HLX298LesyvMYX0VmL4Ww/FQna1Q==
X-Received: by 2002:a05:6402:1d9a:: with SMTP id dk26mr26519863edb.222.1635754124152;
        Mon, 01 Nov 2021 01:08:44 -0700 (PDT)
Received: from redhat.com ([176.12.204.186])
        by smtp.gmail.com with ESMTPSA id s26sm5967202edq.6.2021.11.01.01.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 01:08:43 -0700 (PDT)
Date:   Mon, 1 Nov 2021 04:08:38 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        viresh.kumar@linaro.org, conghui.chen@intel.com,
        jiedeng@alumni.sjtu.edu.cn, vincent.whitchurch@axis.com
Subject: Re: [PATCH] i2c: virtio: update the maintainer to Conghui
Message-ID: <20211101040814-mutt-send-email-mst@kernel.org>
References: <00fadb64713aebd752dca3156e37c8f01c5ac184.1635736816.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00fadb64713aebd752dca3156e37c8f01c5ac184.1635736816.git.jie.deng@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 01, 2021 at 01:24:50PM +0800, Jie Deng wrote:
> Due to changes in my work, I'm passing the virtio-i2c driver
> maintenance to Conghui.
> 
> Signed-off-by: Jie Deng <jie.deng@intel.com>

Seeing as Conghui co-developed the driver, seems reasonable.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

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
> -- 
> 2.7.4

