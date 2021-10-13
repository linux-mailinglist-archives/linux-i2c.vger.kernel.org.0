Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 966F442C599
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 18:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236847AbhJMQCM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 12:02:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34548 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229773AbhJMQCL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 12:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634140807;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QCm5dOclxo0psHU4qKEkJZZeOXU3321uNZD2ahb33xs=;
        b=hV+rLp02GtlYqJ3V/Cyk66xz8cHZr7hoHvNYGISNif5Jp/4Fo2gPOQTq1K++Q5WWQGagS7
        lRA5czNcdoyVahy2FEO2M+P5BHAvEklhQNVT2eVUYz1JXTqOX5bUsl8mKrX6djPva2jVrR
        l0ijp2gBlyx5Ly/vWJSQS+2BxxMQSfE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-KkYBogJ0Oc2c93ymlr0TIw-1; Wed, 13 Oct 2021 12:00:06 -0400
X-MC-Unique: KkYBogJ0Oc2c93ymlr0TIw-1
Received: by mail-wr1-f71.google.com with SMTP id s18-20020adfbc12000000b00160b2d4d5ebso2376668wrg.7
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 09:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=QCm5dOclxo0psHU4qKEkJZZeOXU3321uNZD2ahb33xs=;
        b=ZxsyatgX+iV0MkuxEcvvyWdMmzudFVZBnyPQo8CKUqyBn+Lp90CaYql1M2BpbUCLSr
         4iC07MZVTptd/A3If9F3U8iDASyXDS3uUV1qc1MO8oCmlzk7Thuxo5TiQtyO+Fd1rj+l
         3gWC0nlJ8VDFY1tnToIAqV4RsljhAmG20RoPoSUVcb0fhnhDMNmel6Xizq0dsShno+Eb
         RG6qtkpK+u0nAIl2ok6CUFQzERfRJdo/OmGnaD/9+j5Sd+gb/U9nzNzwbAOA77RqMp6o
         0OtK9RxF068nm9sl9u9ffyEcSTZaauqlqCe+RL2rP7DblwKlbTDDW9drClI/Lf1klHer
         zOww==
X-Gm-Message-State: AOAM530k+KqiMcSNji51IVjSsLiFOVj1BeYcyga9aiH3iyqQsRs/qw/e
        16N9/wzBceB6GdDVtduVYJK1Oj68UYF6WOVRpbPaiY4suUVU9lLeEfE/EPApoHiyMHYE4u3GLZh
        Mf7M9K0eWU27egewke+0Z
X-Received: by 2002:adf:dc0d:: with SMTP id t13mr9670wri.158.1634140805535;
        Wed, 13 Oct 2021 09:00:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyItkbAA3kGIqmmHgTgrrpf9fCG54WlJV2+wdefB9WU28Q546eZydpGXWHl2Ou3h6lUqYc/hA==
X-Received: by 2002:adf:dc0d:: with SMTP id t13mr9603wri.158.1634140805309;
        Wed, 13 Oct 2021 09:00:05 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6774.dip0.t-ipconnect.de. [91.12.103.116])
        by smtp.gmail.com with ESMTPSA id n17sm6521wrq.11.2021.10.13.09.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 09:00:04 -0700 (PDT)
Message-ID: <cf511a7f-531f-4555-d7b4-cb171a615fdd@redhat.com>
Date:   Wed, 13 Oct 2021 18:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH RFC] virtio: wrap config->reset calls
Content-Language: en-US
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
 <2060bd96-5884-a1b5-9f29-7fe670dc088d@redhat.com>
 <20211013081632-mutt-send-email-mst@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211013081632-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 13.10.21 14:17, Michael S. Tsirkin wrote:
> On Wed, Oct 13, 2021 at 01:03:46PM +0200, David Hildenbrand wrote:
>> On 13.10.21 12:55, Michael S. Tsirkin wrote:
>>> This will enable cleanups down the road.
>>> The idea is to disable cbs, then add "flush_queued_cbs" callback
>>> as a parameter, this way drivers can flush any work
>>> queued after callbacks have been disabled.
>>>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>>   arch/um/drivers/virt-pci.c                 | 2 +-
>>>   drivers/block/virtio_blk.c                 | 4 ++--
>>>   drivers/bluetooth/virtio_bt.c              | 2 +-
>>>   drivers/char/hw_random/virtio-rng.c        | 2 +-
>>>   drivers/char/virtio_console.c              | 4 ++--
>>>   drivers/crypto/virtio/virtio_crypto_core.c | 8 ++++----
>>>   drivers/firmware/arm_scmi/virtio.c         | 2 +-
>>>   drivers/gpio/gpio-virtio.c                 | 2 +-
>>>   drivers/gpu/drm/virtio/virtgpu_kms.c       | 2 +-
>>>   drivers/i2c/busses/i2c-virtio.c            | 2 +-
>>>   drivers/iommu/virtio-iommu.c               | 2 +-
>>>   drivers/net/caif/caif_virtio.c             | 2 +-
>>>   drivers/net/virtio_net.c                   | 4 ++--
>>>   drivers/net/wireless/mac80211_hwsim.c      | 2 +-
>>>   drivers/nvdimm/virtio_pmem.c               | 2 +-
>>>   drivers/rpmsg/virtio_rpmsg_bus.c           | 2 +-
>>>   drivers/scsi/virtio_scsi.c                 | 2 +-
>>>   drivers/virtio/virtio.c                    | 5 +++++
>>>   drivers/virtio/virtio_balloon.c            | 2 +-
>>>   drivers/virtio/virtio_input.c              | 2 +-
>>>   drivers/virtio/virtio_mem.c                | 2 +-
>>>   fs/fuse/virtio_fs.c                        | 4 ++--
>>>   include/linux/virtio.h                     | 1 +
>>>   net/9p/trans_virtio.c                      | 2 +-
>>>   net/vmw_vsock/virtio_transport.c           | 4 ++--
>>>   sound/virtio/virtio_card.c                 | 4 ++--
>>>   26 files changed, 39 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/arch/um/drivers/virt-pci.c b/arch/um/drivers/virt-pci.c
>>> index c08066633023..22c4d87c9c15 100644
>>> --- a/arch/um/drivers/virt-pci.c
>>> +++ b/arch/um/drivers/virt-pci.c
>>> @@ -616,7 +616,7 @@ static void um_pci_virtio_remove(struct virtio_device *vdev)
>>>   	int i;
>>>           /* Stop all virtqueues */
>>> -        vdev->config->reset(vdev);
>>> +        virtio_reset_device(vdev);
>>>           vdev->config->del_vqs(vdev);
>>
>> Nit: virtio_device_reset()?
>>
>> Because I see:
>>
>> int virtio_device_freeze(struct virtio_device *dev);
>> int virtio_device_restore(struct virtio_device *dev);
>> void virtio_device_ready(struct virtio_device *dev)
>>
>> But well, there is:
>> void virtio_break_device(struct virtio_device *dev);
> 
> Exactly. I don't know what's best, so I opted for plain english :)

Fair enough, LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb

