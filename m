Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A5945D16E
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 00:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237424AbhKXX7S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Nov 2021 18:59:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24628 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237406AbhKXX7S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Nov 2021 18:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637798167;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7Aq2BDIOL1rOwQ9dBnbb+hwIKJaZN1tdzzbInSFnljw=;
        b=PsFShBzOCpfS6ocmYn6trsCj0ZBzYo9zgT8+QHqiPjeBdQhCaNaxauJW9fs5dN7rxUrJgD
        nbeeNsgVlo/bmXw0x8sbH4KmGL7RHmwKbwzg+Pcv8q2A9lhtELVwiu0kKgzBJJxgyYjyLC
        6XF912QN9MnIxo9MwPRz/av2EAaNjuw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-VHbo26SCMu6_14KdQZc37g-1; Wed, 24 Nov 2021 18:56:06 -0500
X-MC-Unique: VHbo26SCMu6_14KdQZc37g-1
Received: by mail-ed1-f72.google.com with SMTP id v9-20020a50d849000000b003dcb31eabaaso3800457edj.13
        for <linux-i2c@vger.kernel.org>; Wed, 24 Nov 2021 15:56:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7Aq2BDIOL1rOwQ9dBnbb+hwIKJaZN1tdzzbInSFnljw=;
        b=Bbe9ngwFk5QHsharJTm0xl1YfGsjRyPWNdl+Xkr+xx4o78eVfDcYB8selB37/7+UOB
         59Mg9vnBJ5VhSvN9LK50araXY8jUelcpEqiZkjax6TrVa/BD3zcyXmqqC1cVv6D0XN0z
         ik3iwWHtPILDO3+X/cM1BTSsOOJPftxcSh20UxHZca/gfY9AGXJ65GAgcx4Zp7PeEGtk
         Ywh6RgxhBZTFKjfL7k1PM4OZRVs/od1hRURkm4byL9XhSp7yixkujUE9KYZ4vf6sNpWP
         wf5hs3awyMCt/ZBcOGldvZJMNBgPt22TCpKfudhuzKJIS2x0RAwmHuEY9Q3xuxUlYB/e
         t2nA==
X-Gm-Message-State: AOAM531uPAvvCR39QSYkbhyZrSOP9nMZ/ZAhc0yuHIoxLEodO4LrGpaA
        I2dYYVLLf1XbaWuqr+a0fP+Nb89S59PT9E1Iz7R4qfY0oNVzaxSV1NkO8swJTUPd9vbvT+1aNK8
        pVWq5nsoTBsti12bRWVDs
X-Received: by 2002:a17:907:86a1:: with SMTP id qa33mr25976954ejc.142.1637798164841;
        Wed, 24 Nov 2021 15:56:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/BeF/KE9jXz/y70P34AnKAccg8V9yjGfdr5JI7QmEdI6beBgERTWQTzGGy07CdiEexVs2GQ==
X-Received: by 2002:a17:907:86a1:: with SMTP id qa33mr25976932ejc.142.1637798164681;
        Wed, 24 Nov 2021 15:56:04 -0800 (PST)
Received: from redhat.com ([2a0e:1c80:14::66])
        by smtp.gmail.com with ESMTPSA id q17sm863125edd.10.2021.11.24.15.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 15:56:03 -0800 (PST)
Date:   Wed, 24 Nov 2021 18:55:56 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     wsa@kernel.org, jie.deng@intel.com, viresh.kumar@linaro.org,
        conghui.chen@intel.com, virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v2 0/2] virtio-i2c: Fix buffer handling
Message-ID: <20211124185546-mutt-send-email-mst@kernel.org>
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111160412.11980-1-vincent.whitchurch@axis.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 11, 2021 at 05:04:10PM +0100, Vincent Whitchurch wrote:
> This fixes a couple of bugs in the buffer handling in virtio-i2c which can
> result in incorrect data on the I2C bus or memory corruption in the guest.
> 
> I tested this on UML (virtio-uml needs a bug fix too, I will sent that out
> later) with the device implementation in rust-vmm/vhost-device.
> 
> Changes in v2:
> - Added Acked-by and Fixes tags


What are the plans for this patchset?

> Vincent Whitchurch (2):
>   i2c: virtio: disable timeout handling
>   i2c: virtio: fix completion handling
> 
>  drivers/i2c/busses/i2c-virtio.c | 46 ++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 27 deletions(-)
> 
> -- 
> 2.28.0

