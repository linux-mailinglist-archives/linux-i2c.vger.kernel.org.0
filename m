Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4A8343B93
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 09:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhCVITb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 04:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22320 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229920AbhCVITa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Mar 2021 04:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616401170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WoKk7mGrLBFPYHjSxhI5m6ZJ3T1eCo8ygoYac0Rpup8=;
        b=XdKRA5ppbvlhDYKky+q5phompi7SFKIJptOGbu7MkXRy2qNC4OqI6aZpKPVIps6ajwi6ph
        c1HoMgP7tW0q9yabrsSYo7XaEDrPCd90vbet9BZddso1xb2OCb5J7IP55Z2XiuTofb61U0
        2d5AptjC4ecaADbnGN91ZWWsDquW1Yc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-hqsSi4bcMviNqds-lW01Jg-1; Mon, 22 Mar 2021 04:19:28 -0400
X-MC-Unique: hqsSi4bcMviNqds-lW01Jg-1
Received: by mail-wr1-f69.google.com with SMTP id x9so25419295wro.9
        for <linux-i2c@vger.kernel.org>; Mon, 22 Mar 2021 01:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WoKk7mGrLBFPYHjSxhI5m6ZJ3T1eCo8ygoYac0Rpup8=;
        b=VxqZ8t4ZsSxw4BBUuQXdyndbig3PDHAbbv98Na+z9tpDnGyn6Vw++Naun1hx/yaqLb
         eHuOeI7sUOHRBweoPOYP33PkN6b8JfRMRKGhQJzQQ2wAlkY5YxtsbwkRAAR5LNRydi/s
         +I6GsQNi8QSva1Q7px3L3WRstO3xifLL7VGLXRNYmRXGYc3xBpVDlzewNc8nzkdRw4v2
         Iydf9HZsSDC9++Bby7aCP0LcpF5OgYGsXN3e3VrDcO7OoWeHDRIbbdzSl8NMUax6OAlH
         9rUhFHKrEhALasQ19eaLIYjoBycDcAA82HhdlLQOWlhXgI+DCM5MNcC8XlOXcJpD9JnC
         //rw==
X-Gm-Message-State: AOAM531LaL+DpQVKxqBx6AKe0WFZGqLVTYuCJXgldcjCT9YPMNaD/05u
        xcPItEdCZP/EMG5NyFlSBAAUVpAGPVHyUDnix8BU5IiWoCJ0IYPoz5KM2bhC59bhDy3CcrX2NN1
        OgcVlUkoY7PJ8gk+1qHZa
X-Received: by 2002:a7b:c346:: with SMTP id l6mr14925805wmj.34.1616401167060;
        Mon, 22 Mar 2021 01:19:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/hGKwIQ8AizOzUTlpxccYR1kU76/f9kIiC5G+j9WI50iF5Kv+8CR5Hj4QZ7N0ojmMTnKJkQ==
X-Received: by 2002:a7b:c346:: with SMTP id l6mr14925787wmj.34.1616401166932;
        Mon, 22 Mar 2021 01:19:26 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
        by smtp.gmail.com with ESMTPSA id u15sm14813092wmq.4.2021.03.22.01.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 01:19:26 -0700 (PDT)
Date:   Mon, 22 Mar 2021 04:19:22 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org, jasowang@redhat.com,
        wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH v9] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210322041857-mutt-send-email-mst@kernel.org>
References: <e09c07532f5456816eb91ef4176bf910284df4ff.1616418890.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e09c07532f5456816eb91ef4176bf910284df4ff.1616418890.git.jie.deng@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 22, 2021 at 09:35:59PM +0800, Jie Deng wrote:
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index bc1c062..6ae32db 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -54,5 +54,6 @@
>  #define VIRTIO_ID_FS			26 /* virtio filesystem */
>  #define VIRTIO_ID_PMEM			27 /* virtio pmem */
>  #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
> +#define VIRTIO_ID_I2C_ADPTER		34 /* virtio i2c adpter */

ADPTER -> ADAPTER?
adpter -> adapter?

>  
>  #endif /* _LINUX_VIRTIO_IDS_H */
> -- 
> 2.7.4

