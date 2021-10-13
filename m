Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9D742BE93
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 13:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbhJMLF4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 07:05:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50100 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230057AbhJMLF4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 07:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634123032;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pm2HFBolkPmIutQKtnGVo/TAfScR5edRGy4d25/SdeA=;
        b=KD+D5y+PkswhupKI4VOQaOnKEuL0aMqNbVXb4jdTD/yk8hDkQZlx+7FHmnoJ+lbV37WTzE
        xEQc2FfXE1X0Q4auQ9u3G4Ba2FfjdP8q0Z5E22PxfYNzjaF8ppbeZkvzCaDBUfyJhJGVZH
        yfr9txkvaxa/rd4zUSbTP5m+ZyV9MCw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-Wom4nao3OFaNoQ5cFpoAdA-1; Wed, 13 Oct 2021 07:03:51 -0400
X-MC-Unique: Wom4nao3OFaNoQ5cFpoAdA-1
Received: by mail-wr1-f69.google.com with SMTP id p12-20020adfc38c000000b00160d6a7e293so1646462wrf.18
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 04:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=pm2HFBolkPmIutQKtnGVo/TAfScR5edRGy4d25/SdeA=;
        b=wRReEzPd809fw0o6mUaQdRq04YM94Pf9/RT4Z0/CIk6NPfmh+SkJ8E1L7hSkxTfGic
         4OfGWGKt445K/qAZTLggLHnfxC9x8LlzduOCJdZDhJdqCYqwL3MeR6HIh/tVeVgUIBmu
         nt2t3lkoNn88+Rcdf84Ijj1//LZSgiBpS9ban13o7+PhbBSA/GtBuAHCOUJY22aLRlZD
         gJOJh9Dy4rj/osEuHj+W9Srry5kCCtyRWEW9fF2oXAdUxlW653p9Uu1VSxbSg4KSeA1H
         VX2+qTQDnhMOroYm7zkWr9s8C//xyuJGLysT645svSh1yMWZeOPDm4Es3qXMRmA60bR0
         bksQ==
X-Gm-Message-State: AOAM5317ybokT9vrzYhVH5crAhIylZlQBPge4sfCle5v66ohRSTyLC6x
        vBYjQlTWkeDQyMyvyiN0Ys0gYxHK+0L2Zdr9RwY62l9XHpMYJlBJsOA0Gk+knmTxp41wV7JXRAZ
        Sx4nEoCbYMP60L34BawFn
X-Received: by 2002:adf:a194:: with SMTP id u20mr39899245wru.275.1634123030454;
        Wed, 13 Oct 2021 04:03:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypxsxhU5d6LZPZIfUUDegUVRR2UQLEo64TMqEnAh5Ix5FGAFA1VDGCfrTQu99KLNCm64Sq/Q==
X-Received: by 2002:adf:a194:: with SMTP id u20mr39899137wru.275.1634123030054;
        Wed, 13 Oct 2021 04:03:50 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6774.dip0.t-ipconnect.de. [91.12.103.116])
        by smtp.gmail.com with ESMTPSA id m4sm5183560wrz.45.2021.10.13.04.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 04:03:49 -0700 (PDT)
Subject: Re: [PATCH RFC] virtio: wrap config->reset calls
To:     "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
Cc:     Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Jason Wang <jasowang@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Jens Axboe <axboe@kernel.dk>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gonglei <arei.gonglei@huawei.com>,
        "David S. Miller" <davem@davemloft.net>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        David Airlie <airlied@linux.ie>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>, Jie Deng <jie.deng@intel.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Kalle Valo <kvalo@codeaurora.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Eric Van Hensbergen <ericvh@gmail.com>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Stefano Garzarella <sgarzare@redhat.com>,
        Anton Yakovlev <anton.yakovlev@opensynergy.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-um@lists.infradead.org,
        virtualization@lists.linux-foundation.org,
        linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        nvdimm@lists.linux.dev, linux-remoteproc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        v9fs-developer@lists.sourceforge.net, kvm@vger.kernel.org,
        alsa-devel@alsa-project.org
References: <20211013105226.20225-1-mst@redhat.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <2060bd96-5884-a1b5-9f29-7fe670dc088d@redhat.com>
Date:   Wed, 13 Oct 2021 13:03:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013105226.20225-1-mst@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 13.10.21 12:55, Michael S. Tsirkin wrote:
> This will enable cleanups down the road.
> The idea is to disable cbs, then add "flush_queued_cbs" callback
> as a parameter, this way drivers can flush any work
> queued after callbacks have been disabled.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   arch/um/drivers/virt-pci.c                 | 2 +-
>   drivers/block/virtio_blk.c                 | 4 ++--
>   drivers/bluetooth/virtio_bt.c              | 2 +-
>   drivers/char/hw_random/virtio-rng.c        | 2 +-
>   drivers/char/virtio_console.c              | 4 ++--
>   drivers/crypto/virtio/virtio_crypto_core.c | 8 ++++----
>   drivers/firmware/arm_scmi/virtio.c         | 2 +-
>   drivers/gpio/gpio-virtio.c                 | 2 +-
>   drivers/gpu/drm/virtio/virtgpu_kms.c       | 2 +-
>   drivers/i2c/busses/i2c-virtio.c            | 2 +-
>   drivers/iommu/virtio-iommu.c               | 2 +-
>   drivers/net/caif/caif_virtio.c             | 2 +-
>   drivers/net/virtio_net.c                   | 4 ++--
>   drivers/net/wireless/mac80211_hwsim.c      | 2 +-
>   drivers/nvdimm/virtio_pmem.c               | 2 +-
>   drivers/rpmsg/virtio_rpmsg_bus.c           | 2 +-
>   drivers/scsi/virtio_scsi.c                 | 2 +-
>   drivers/virtio/virtio.c                    | 5 +++++
>   drivers/virtio/virtio_balloon.c            | 2 +-
>   drivers/virtio/virtio_input.c              | 2 +-
>   drivers/virtio/virtio_mem.c                | 2 +-
>   fs/fuse/virtio_fs.c                        | 4 ++--
>   include/linux/virtio.h                     | 1 +
>   net/9p/trans_virtio.c                      | 2 +-
>   net/vmw_vsock/virtio_transport.c           | 4 ++--
>   sound/virtio/virtio_card.c                 | 4 ++--
>   26 files changed, 39 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/um/drivers/virt-pci.c b/arch/um/drivers/virt-pci.c
> index c08066633023..22c4d87c9c15 100644
> --- a/arch/um/drivers/virt-pci.c
> +++ b/arch/um/drivers/virt-pci.c
> @@ -616,7 +616,7 @@ static void um_pci_virtio_remove(struct virtio_device *vdev)
>   	int i;
>   
>           /* Stop all virtqueues */
> -        vdev->config->reset(vdev);
> +        virtio_reset_device(vdev);
>           vdev->config->del_vqs(vdev);

Nit: virtio_device_reset()?

Because I see:

int virtio_device_freeze(struct virtio_device *dev);
int virtio_device_restore(struct virtio_device *dev);
void virtio_device_ready(struct virtio_device *dev)

But well, there is:
void virtio_break_device(struct virtio_device *dev);

-- 
Thanks,

David / dhildenb

