Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4030A431355
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Oct 2021 11:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbhJRJ03 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Oct 2021 05:26:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39778 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231305AbhJRJ02 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Oct 2021 05:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634549056;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tcERYHsACD8OiG9LERSlpQxmHuHdSGg0GMtHO86OE84=;
        b=hrENfsHvHa7ijddrAdywkk3CuWIrpUjb8t1ZhjdgdWxvG7zkpMcArJoY4r5z5bw7Y/DNxK
        VEoxtzf/n1bq0CK3lsmfYRYTl65M5vQ+Z6DxTcmxjNvptMdnTnT5AbDzZRUdaeEsyg9lIU
        CeCeGeP22g33wF0BvoGcvDg6826Vsgk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-UXQy6mIkMmil6s4myRIEXQ-1; Mon, 18 Oct 2021 05:24:15 -0400
X-MC-Unique: UXQy6mIkMmil6s4myRIEXQ-1
Received: by mail-ed1-f71.google.com with SMTP id u10-20020a50d94a000000b003dc51565894so7106072edj.21
        for <linux-i2c@vger.kernel.org>; Mon, 18 Oct 2021 02:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tcERYHsACD8OiG9LERSlpQxmHuHdSGg0GMtHO86OE84=;
        b=4ixN27aImsCNde6ygWY7moLSjaSvR66Cbg7O4YKV0L2Xnjb0OSt1kdDVxZr9HRC4m0
         qIh2sopGNjDA22iT+3jqvpnv0/llfzK37DV0N9A3JjUnf2yXrb1wd8KG0VhyeqMtbz2I
         0ki13aIflm1/pfdN4B9SZHox+A5p2NNMWOs+SZt74F+FIyfQr5lrJRiCeNXoCpPQiLIU
         VTmgpyrC5ZS4/1PfTpqI9/tJKmnR6PSuSDG4EGTlBDdjRfOO9WCU1Qy4UHqovxezCNJx
         sbY8DibKOnu94MEMl9XMiH5woEUAg6f5yVcTO8KP088Dpc/KBtqUup5nGgqff9qXFonB
         B3+Q==
X-Gm-Message-State: AOAM533EnfIHM4XJpPkeEUzQnl8AqAtgyf4g9utbs8r2wjhVbBA7RTiu
        /cs5uYOFHYAjREgp+hbWo4bItNbtR7krtr9FYKQohoJ9L90iTBL+GCu7Ns9Ev+pSkNlLE1ZRQ5b
        fjqr7klWt5v9pEAyaytUC
X-Received: by 2002:a50:9d8e:: with SMTP id w14mr42193557ede.74.1634549054591;
        Mon, 18 Oct 2021 02:24:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUJYrHxvUXjdPELjIDpPtrZ181C1I4vTJbRWD4jS3vqGv74zCzzGw5AmjDAdcPLpxevcG2mg==
X-Received: by 2002:a50:9d8e:: with SMTP id w14mr42193472ede.74.1634549054384;
        Mon, 18 Oct 2021 02:24:14 -0700 (PDT)
Received: from steredhat (host-79-34-250-211.business.telecomitalia.it. [79.34.250.211])
        by smtp.gmail.com with ESMTPSA id lm14sm8629911ejb.24.2021.10.18.02.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 02:24:13 -0700 (PDT)
Date:   Mon, 18 Oct 2021 11:24:10 +0200
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
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
        David Hildenbrand <david@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Eric Van Hensbergen <ericvh@gmail.com>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>,
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
Subject: Re: [PATCH RFC] virtio: wrap config->reset calls
Message-ID: <20211018092410.t5hilzz7kbto2mhy@steredhat>
References: <20211013105226.20225-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211013105226.20225-1-mst@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 13, 2021 at 06:55:31AM -0400, Michael S. Tsirkin wrote:
>This will enable cleanups down the road.
>The idea is to disable cbs, then add "flush_queued_cbs" callback
>as a parameter, this way drivers can flush any work
>queued after callbacks have been disabled.
>
>Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>---
> arch/um/drivers/virt-pci.c                 | 2 +-
> drivers/block/virtio_blk.c                 | 4 ++--
> drivers/bluetooth/virtio_bt.c              | 2 +-
> drivers/char/hw_random/virtio-rng.c        | 2 +-
> drivers/char/virtio_console.c              | 4 ++--
> drivers/crypto/virtio/virtio_crypto_core.c | 8 ++++----
> drivers/firmware/arm_scmi/virtio.c         | 2 +-
> drivers/gpio/gpio-virtio.c                 | 2 +-
> drivers/gpu/drm/virtio/virtgpu_kms.c       | 2 +-
> drivers/i2c/busses/i2c-virtio.c            | 2 +-
> drivers/iommu/virtio-iommu.c               | 2 +-
> drivers/net/caif/caif_virtio.c             | 2 +-
> drivers/net/virtio_net.c                   | 4 ++--
> drivers/net/wireless/mac80211_hwsim.c      | 2 +-
> drivers/nvdimm/virtio_pmem.c               | 2 +-
> drivers/rpmsg/virtio_rpmsg_bus.c           | 2 +-
> drivers/scsi/virtio_scsi.c                 | 2 +-
> drivers/virtio/virtio.c                    | 5 +++++
> drivers/virtio/virtio_balloon.c            | 2 +-
> drivers/virtio/virtio_input.c              | 2 +-
> drivers/virtio/virtio_mem.c                | 2 +-
> fs/fuse/virtio_fs.c                        | 4 ++--
> include/linux/virtio.h                     | 1 +
> net/9p/trans_virtio.c                      | 2 +-
> net/vmw_vsock/virtio_transport.c           | 4 ++--

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

