Return-Path: <linux-i2c+bounces-7703-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 952AC9B892E
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 03:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54FF5281CB1
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 02:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C681D12C475;
	Fri,  1 Nov 2024 02:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYDxDF4i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C207F136337
	for <linux-i2c@vger.kernel.org>; Fri,  1 Nov 2024 02:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730427319; cv=none; b=N6BX9vrAJxS6PA9bvJkTp0sdPGD4i7MVyEX6JiOSC2kEWVbE1LCzEOMvvFBZ6knIIvshBdzLxbpDZQqsX8HT48QZa4d455O9LUDG9QneCb7gUuWe28A0Rgw9bBCrXEhxziOEydC3np2Lyli2dMOMK0uRl/7uHpeK/yZtrJBSIU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730427319; c=relaxed/simple;
	bh=yJdGIwUEYPOmEs8ij3kiy6zzV0QYlQFlQfm8YmlYIbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8FwaD8bYUkdF4tn1K7CRjAF027/2CNmGv4j9M5xc5chJtZTEqtJFle2ByFZy/f2nSVAObsTrkhL038MDdRB8jwWJXjyjad1W/NlpLGgk0NbrvTFt51SA85fPcuo0FY+j9Mojvj4jEmvUvaTHWUDA8fNrVJ9Gy2oNu+ViShkyH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KYDxDF4i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730427312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJdGIwUEYPOmEs8ij3kiy6zzV0QYlQFlQfm8YmlYIbg=;
	b=KYDxDF4i9Kc/wENqJEJaIOi+KtLmaAZev+0Bd7qTUyzDEycsyY2Czv3y7hoS6ceE3Hd6Sn
	TpWCtBPq4zsO3PPwH6fLGfgyIWywLEx7JdrH+j8j0Cp+ecLZzCxUx666zHtK9Tukdjz4+q
	AgmJFP+WhBj+ePeEFI2RIohB/x/QlK0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-XV4dP4d3NUmyOIWc6__eQg-1; Thu, 31 Oct 2024 22:15:10 -0400
X-MC-Unique: XV4dP4d3NUmyOIWc6__eQg-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2e2d396c77fso1834544a91.2
        for <linux-i2c@vger.kernel.org>; Thu, 31 Oct 2024 19:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730427310; x=1731032110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJdGIwUEYPOmEs8ij3kiy6zzV0QYlQFlQfm8YmlYIbg=;
        b=WPk0QeqArbaFnXTOI1UQOdD9fcGRz5XOn//gqjMTM5tg0cDeq4PvskC+TfhCg9Fbgj
         qstwZOpe7DBff6hYvqmJPhNOuR74BMBuiKwcRDm8ElAxlrdzavc3FM8w2qcSlEWo5HZ0
         ItQRQf7kEUtHmDoQIIUC0wvbFPetk968ZfmjPQrOa3XEUWtXJ9lI0LJHRUprDsTqrpon
         x8SzB9HWEvDb5uCFkT2MTXQHV2Vutu7x8JaWyKrrS5sqUxCCn2wO8SAIdcyUpDQnROBX
         vSOumD4D8tU2aEgdpWOaxGXPBe7kzxW5c206NOk6qnjMptyzGbbHrJw5wMlJ0pOrkI9A
         s5bw==
X-Forwarded-Encrypted: i=1; AJvYcCV0yMMhTTkNw52FRqXhSEZ1BC3qGwGfWjhoT+IDpYrCX8NMVw0xYrWBDuX5f+9+NSerIahA4Eie7VU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmadeo0PEwyv1O2BCHSFX+CYkk7VfEqHt1KBknjxR/WLLM7M6R
	+GklFC4D9w5YjZvjDz4F1Cmj14t8wkBORnGm9BA5XIV2cPbYONRpJa6zlmR0Qj76ZgX3RAqsI76
	zmtg8jcuINwNl9oeYg2qeNHvxxWTl8JGYwQsgj7FuSnM2bfOa614rfZjLdLQ1RXEdamqRQNa0be
	4vGUi22oJpppBDqd+v6RUHbjbaS2mF0R/C
X-Received: by 2002:a17:90b:2d92:b0:2e2:e159:8f7b with SMTP id 98e67ed59e1d1-2e94c29f2cemr2655454a91.3.1730427309719;
        Thu, 31 Oct 2024 19:15:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy16t0It8M5wuxzMCN0u7b3KxhGxysg7D6J/QWKdLqLpcbAtWiRV69Dq4QwYxCS/HPdiOkYmqXnbjdd/QPCCE=
X-Received: by 2002:a17:90b:2d92:b0:2e2:e159:8f7b with SMTP id
 98e67ed59e1d1-2e94c29f2cemr2655410a91.3.1730427309206; Thu, 31 Oct 2024
 19:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031030847.3253873-1-qiang4.zhang@linux.intel.com> <20241101015101.98111-1-qiang4.zhang@linux.intel.com>
In-Reply-To: <20241101015101.98111-1-qiang4.zhang@linux.intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 1 Nov 2024 10:11:11 +0800
Message-ID: <CACGkMEtvrBRd8BaeUiR6bm1xVX4KUGa83s03tPWPHB2U0mYfLA@mail.gmail.com>
Subject: Re: [PATCH v2] virtio: only reset device and restore status if needed
 in device resume
To: qiang4.zhang@linux.intel.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jens Axboe <axboe@kernel.dk>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gonglei <arei.gonglei@huawei.com>, 
	"David S. Miller" <davem@davemloft.net>, Viresh Kumar <viresh.kumar@linaro.org>, 
	"Chen, Jian Jun" <jian.jun.chen@intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Qiang Zhang <qiang4.zhang@intel.com>, 
	virtualization@lists.linux.dev, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 9:54=E2=80=AFAM <qiang4.zhang@linux.intel.com> wrote=
:
>
> From: Qiang Zhang <qiang4.zhang@intel.com>
>
> Virtio core unconditionally reset and restore status for all virtio
> devices before calling restore method. This breaks some virtio drivers
> which don't need to do anything in suspend and resume because they
> just want to keep device state retained.

The challenge is how can driver know device doesn't need rest.

For example, PCI has no_soft_reset which has been done in the commit
"virtio: Add support for no-reset virtio PCI PM".

And there's a ongoing long discussion of adding suspend support in the
virtio spec, then driver know it's safe to suspend/resume without
reset.

>
> Virtio GPIO is a typical example. GPIO states should be kept unchanged
> after suspend and resume (e.g. output pins keep driving the output) and
> Virtio GPIO driver does nothing in freeze and restore methods. But the
> reset operation in virtio_device_restore breaks this.

Is this mandated by GPIO or virtio spec? If yes, let's quote the revelant p=
art.

>
> Since some devices need reset in suspend and resume while some needn't,
> create a new helper function for the original reset and status restore
> logic so that virtio drivers can invoke it in their restore method
> if necessary.

How are those drivers classified?

>
> Signed-off-by: Qiang Zhang <qiang4.zhang@intel.com>

Thanks


