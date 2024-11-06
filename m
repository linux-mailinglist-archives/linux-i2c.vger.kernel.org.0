Return-Path: <linux-i2c+bounces-7825-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 363419BE284
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 10:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1EEB1F2438F
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 09:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F025E1DA624;
	Wed,  6 Nov 2024 09:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cVnv89Mh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1648C1D9663
	for <linux-i2c@vger.kernel.org>; Wed,  6 Nov 2024 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730885346; cv=none; b=Vfn0oxGChvd9JiA9xP3jFd/qTn363gCFt7ZOyt8lUcStdHYk2p7KlPOrH3W1vqZdOZfTj6gpz+p5tBpV2jq9yzDgIknIAAyL6//XLZ2ZgUDSBUQXrjO8RzbDmSpuoEv+vy4ZwqM2p8EtA3fHj7L5F1D+2drn5Vx0VPuvDKw1lNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730885346; c=relaxed/simple;
	bh=gD3ymZXOf1Xp+zXbXqMleltiFT4RiaNkSbFjDmEzFhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEJPN+/KRFkXVq7nVUfd2TjhedjDstJpX/keHNEii6AlspF29SwwMdNl4kpFCWfcWyxbLbkDba8KXNwVZ2crQ2Qus62ROK2TpJqKWn7WM5nSAsKBJkDub1BYjqsE/tausAxJxXzJc21rSzmvwp05pMfcbYLDQO8iz6L+gQwhuUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cVnv89Mh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730885344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ejx68tuVg9mOD/4Icv7MBobbv6b7kreS3ffjJVREaDU=;
	b=cVnv89MhJWBZ58C3N3XRameb0iWnJD1wOZyl8dcq45mlEPpCYVnT5TAsohe4GcjnpvTawG
	qFDkkFT8zTFRqT0+jNmFCri/n0YgKFAHIYyXQ+K/mkDlANjFJ073Heyn5/gYyOzdAAoFOb
	41+RVn72C+7fO6aByVKhbNrzTBNacI8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-QhaSK-zqPRK-14q-YnMDVA-1; Wed, 06 Nov 2024 04:29:00 -0500
X-MC-Unique: QhaSK-zqPRK-14q-YnMDVA-1
X-Mimecast-MFC-AGG-ID: QhaSK-zqPRK-14q-YnMDVA
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43159c07193so55155195e9.0
        for <linux-i2c@vger.kernel.org>; Wed, 06 Nov 2024 01:29:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730885339; x=1731490139;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ejx68tuVg9mOD/4Icv7MBobbv6b7kreS3ffjJVREaDU=;
        b=eT3STyZVyJI7Ch1UWIghslF/nRqOTZyymimgQq+LsCIQ6NqoAszMXLurXHXTBUs5zv
         JlPuc1ffFxe4/hyrzQODOCk3TdNj12Vt4v7xNUbC8rD6HQ+NPs+HvO4o5r6Bfw05TA0q
         QEsF6crF4DvbedTdo2YeuV5+bmCGpsB8p9M9xDW5TNhGa440pev7jT5YzeqVZPl32Sya
         bf4hKJYiRA25J+5fZvkQdgYjZ404RIns73GHyvLrQZqFbgSU89VMqZDNFWQ5OEN3RCKm
         rjRPBFDzeuOg7oE3fV/k48tNb/xWzq66MkiD0BAEHpbunJwsUSBYVPVmhqE4qZMa2HcL
         nqzw==
X-Forwarded-Encrypted: i=1; AJvYcCUsljPP+D+rOKYjtE5RW30kKyqkmuTaoVXLBvJPvNPMrz1scwlEZALhrLi3H1x3lAViOGEtVNRYkeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YztzmtmbpIcyndE9qSxulXtVkTLlpEE74UOq3Yin4x8BLWl5aPP
	C1JxpkAeJXbuGj/aDrfcNZ80yUiEf0VTj7+wj+WIYTQIIBFJ+2zayCkn/Tapd561qe/Ew6sDyjr
	ZX4bSBkCuNi16c8VIAKwhXC4zRMPReledkkxqX8iumIQ10Y5U3hLWcjy60A==
X-Received: by 2002:a05:600c:4689:b0:431:52a3:d9d5 with SMTP id 5b1f17b1804b1-432831cb9demr222901305e9.0.1730885339674;
        Wed, 06 Nov 2024 01:28:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWjjkdr5r4V7Q+Qj0G1hCbvfLQeB4lT/9xr2DmAO0MVtWQKCdBKQf0iOb506nFA0FTNUYXlA==
X-Received: by 2002:a05:600c:4689:b0:431:52a3:d9d5 with SMTP id 5b1f17b1804b1-432831cb9demr222900675e9.0.1730885339211;
        Wed, 06 Nov 2024 01:28:59 -0800 (PST)
Received: from redhat.com ([2a02:14f:178:e74:5fcf:8a69:659d:f2b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa5b60cfsm15505215e9.7.2024.11.06.01.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:28:58 -0800 (PST)
Date: Wed, 6 Nov 2024 04:28:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: qiang4.zhang@linux.intel.com, Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jens Axboe <axboe@kernel.dk>, Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gonglei <arei.gonglei@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"Chen, Jian Jun" <jian.jun.chen@intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Qiang Zhang <qiang4.zhang@intel.com>,
	virtualization@lists.linux.dev, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] virtio: only reset device and restore status if
 needed in device resume
Message-ID: <20241106042828-mutt-send-email-mst@kernel.org>
References: <20241031030847.3253873-1-qiang4.zhang@linux.intel.com>
 <20241101015101.98111-1-qiang4.zhang@linux.intel.com>
 <CACGkMEtvrBRd8BaeUiR6bm1xVX4KUGa83s03tPWPHB2U0mYfLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEtvrBRd8BaeUiR6bm1xVX4KUGa83s03tPWPHB2U0mYfLA@mail.gmail.com>

On Fri, Nov 01, 2024 at 10:11:11AM +0800, Jason Wang wrote:
> On Fri, Nov 1, 2024 at 9:54 AM <qiang4.zhang@linux.intel.com> wrote:
> >
> > From: Qiang Zhang <qiang4.zhang@intel.com>
> >
> > Virtio core unconditionally reset and restore status for all virtio
> > devices before calling restore method. This breaks some virtio drivers
> > which don't need to do anything in suspend and resume because they
> > just want to keep device state retained.
> 
> The challenge is how can driver know device doesn't need rest.

I actually don't remember why do we do reset on restore. Do you?


> For example, PCI has no_soft_reset which has been done in the commit
> "virtio: Add support for no-reset virtio PCI PM".
> 
> And there's a ongoing long discussion of adding suspend support in the
> virtio spec, then driver know it's safe to suspend/resume without
> reset.
> 
> >
> > Virtio GPIO is a typical example. GPIO states should be kept unchanged
> > after suspend and resume (e.g. output pins keep driving the output) and
> > Virtio GPIO driver does nothing in freeze and restore methods. But the
> > reset operation in virtio_device_restore breaks this.
> 
> Is this mandated by GPIO or virtio spec? If yes, let's quote the revelant part.
> 
> >
> > Since some devices need reset in suspend and resume while some needn't,
> > create a new helper function for the original reset and status restore
> > logic so that virtio drivers can invoke it in their restore method
> > if necessary.
> 
> How are those drivers classified?
> 
> >
> > Signed-off-by: Qiang Zhang <qiang4.zhang@intel.com>
> 
> Thanks


