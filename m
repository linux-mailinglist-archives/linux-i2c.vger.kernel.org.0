Return-Path: <linux-i2c+bounces-7704-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8826D9B8A6C
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 06:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 456192828A1
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 05:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5857149DE8;
	Fri,  1 Nov 2024 05:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYD9qxns"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64074142624;
	Fri,  1 Nov 2024 05:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730438576; cv=none; b=BjTU3MQOIv+ollAFSG/uvmLI0bYJG56QrJIIzkn3i5v1o/NLC7603GbRAjzuAesFki0MqNZ4g+N8N78enxFVLrqFArpc2SUC1lMA1PjvjHBeXHe/2DHito3q4B3QPdVQ+AsiCmofgANBVtrkwCuTYumv3zTlwQgRm9zVOItS9lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730438576; c=relaxed/simple;
	bh=pGNjlh/5TANRkDFAanOu/LKbRP8oaSiAvvCfhO4t6yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6Kcvv3qxJLw+YOwTM2OafQK8pwIiHp4QQvy9RW6fnDxoR5duxlf2jtPFP5kcaKMZSLR7lyuTUAk7QJALXGKKNLYTUbHRzoNRuDcet4nBbLk1aSGUaDpDjThdonkf26bLJQ8e0jYhkL9vf1mTEUB2ySNutK5m/BYuVti3Sp9TW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYD9qxns; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730438574; x=1761974574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pGNjlh/5TANRkDFAanOu/LKbRP8oaSiAvvCfhO4t6yI=;
  b=YYD9qxns7tfTKNWnEINwY5oeJvXljPRcGawyhfCWqzP3K7nexPS+Kdm2
   U1wKHQXNqFeYLkksa+mzqGjct60JItoDsUcQTWH+QggQzUbUDHJtsCBap
   trIDOL6eVYYIC2YufcRnYU5RT4A8uV4tH8NywAnZpQviOV7/QNbBbYVN/
   Wf96U5njp8QgfXkEYfuJPQ8ItGlrpGs/xzDuCSgZ7W5S6u/sn8RCcT+Xw
   9LFYYKltlTM0LHoY0BggSSFiM9/33emXHC/JvwAMbnevER1UI8tov4pcB
   ACVCn918QNYGdEQVZMR1MZSPpVrrlg25JW7spIdn5HyBnnzfduiKlRTmu
   Q==;
X-CSE-ConnectionGUID: jA2xccugSsu1flMsUGDkeQ==
X-CSE-MsgGUID: E8OGjcz2QgarRGZ/LjKR8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30314687"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="30314687"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 22:22:51 -0700
X-CSE-ConnectionGUID: TVbU//UlQUCwNIzd8pgqTg==
X-CSE-MsgGUID: R6mTecEmTzu92S+st927WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="83678534"
Received: from qz-dev1.sh.intel.com (HELO localhost) ([10.239.147.28])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 22:22:44 -0700
Date: Fri, 1 Nov 2024 13:20:11 +0800
From: Qiang Zhang <qiang4.zhang@linux.intel.com>
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
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
Message-ID: <ZyRlC-5V_NTKgzXh@dev-qz>
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

Hi,

Per my understanding to PM, in the suspend flow, device drivers need to
1. First manage/stop accesses from upper level software and
2. Store the volatile context into in-memory data structures.
3. Put devices into some low power (suspended) state.
The resume process does the reverse.
If a device context won't loose after entering some low power state
(optional), it's OK to skip step 2.

For virtio devices, spec doesn't define whether their states will lost
after platform entering suspended state. So to work with different
hypervisors, virtio drivers typically trigger a reset in suspend/resume
flow. This works fine for virtio devices if following conditions are met:
- Device state can be totally recoverable.
- There isn't any working behaviour expected in suspended state, i.e. the
  suspended state should be sub-state of reset.
However, the first point may be hard to implement from driver side for some
devices. The second point may be unacceptable for some kind of devices.

For your question, for devices whose suspended state is alike reset state,
the hypervisor have the flexibility to retain its state or not, kernel
driver can unconditionally reset it with proper re-initialization to
accomplish better compatibility. For others, hypervisor *must* retain
device state and driver just keeps using it.

> 
> For example, PCI has no_soft_reset which has been done in the commit
> "virtio: Add support for no-reset virtio PCI PM".
> 
> And there's a ongoing long discussion of adding suspend support in the
> virtio spec, then driver know it's safe to suspend/resume without
> reset.

That's great! Hopefully it can fill the gap.
Currently, I think we can safely move the reset to drivers' freeze methods,
virtio core has no reason to take it as a common action required by all
devices. And the reset operation can be optional skipped if driver have
hints from device that it can retain state.

> 
> >
> > Virtio GPIO is a typical example. GPIO states should be kept unchanged
> > after suspend and resume (e.g. output pins keep driving the output) and
> > Virtio GPIO driver does nothing in freeze and restore methods. But the
> > reset operation in virtio_device_restore breaks this.
> 
> Is this mandated by GPIO or virtio spec? If yes, let's quote the revelant part.

No. But in actual hardware design (e.g. Intel PCH GPIO), or from the
requirement perspective, GPIO pin state can be (should support) retained
in suspended state.
If Virtio GPIO is used to let VM operate such physical GPIO chip indirectly,
it can't be reset in suspend and resume. Meanwhile the hypervisor will
retain pin states after suspension.

> 
> >
> > Since some devices need reset in suspend and resume while some needn't,
> > create a new helper function for the original reset and status restore
> > logic so that virtio drivers can invoke it in their restore method
> > if necessary.
> 
> How are those drivers classified?

I think this depends whether hypervisor will keep devices state in platform
suspend process. I think hypervisor should because suspend and reset are
conceptually two different things.


Thanks
Qiang

