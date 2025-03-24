Return-Path: <linux-i2c+bounces-9995-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC97A6E30E
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 20:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23CB51664E9
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 19:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E57266F16;
	Mon, 24 Mar 2025 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LipMvCuu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1BE13BC02
	for <linux-i2c@vger.kernel.org>; Mon, 24 Mar 2025 19:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742843329; cv=none; b=Vi4tp0d4uZvQuuyiVrbRGU9xupET5+ehcvQsQGdvSKLb7nx8tICBB7umAxyAnIjSdO1Zu9FbXlCWZjtbxjlzNSNnRCD/UskHGH69fuMGFBLetwYmqNgTdYABJd1KpHd3nCctzPAySfJ7KPS+/jb2OC0JUHLvBtt2nS4VaLZ7Jc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742843329; c=relaxed/simple;
	bh=1rymG9tMU7d+EpOLvZQFkNyqfGP87y3hoGgfLC166/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvZBGz6b35Im3H0xmRj5TL7RKy4tjCOth6wfDSSoIpcv6itJgx2CcJKn5SncB9GX0fFl51/hWwbsyooaEgJ4IWk7RoAwMjyXF5ls6pR+j3WYMZ79FuSrnfKyqVgmDSopKwTBtiLy8GhQSCBZlCZwDeT7maEcLtajXb11mSrjzXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LipMvCuu; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4774ce422easo6518961cf.1
        for <linux-i2c@vger.kernel.org>; Mon, 24 Mar 2025 12:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742843326; x=1743448126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e1dTQfcrbRLKQGYdsmVW0rTSaepqHTuYnIg8Unhl8ec=;
        b=LipMvCuuqAVFW/ay6G7/+fSJxc6SfY4PY6zXm+Vs9uIRu1FoBWfbjXGTdGz7jzspUb
         CMHZ9FygTiMqIvHgd6MQl5bvVm191GCzO9VRcTKOkaCon60HWVoM4tCsmOnmiCuc/jOe
         flhJvb6RV3o1qeYCJnRtgl0/s25v4MqjWPI9jqZp+PhkyVMPz3bem9tSi/S9ldO2HgRO
         tCab37lZEGNaTbWiZUlOl57IB9KVCfxUzlqHME+s+T+HHMazu0OVE7ijp8471oMpF0Zm
         KYV7qwLnIm+JWCW3e0xq/g8aCEnK4XAXvBnJIcmA4WJbr5XkO4thQhgT1cu/gqOAWUTg
         eqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742843326; x=1743448126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1dTQfcrbRLKQGYdsmVW0rTSaepqHTuYnIg8Unhl8ec=;
        b=d5ujM0ag4YbtRz895Pt75sv0Pb+KMu0dfJasERXS7EiFx73tQoKKDDk9LxiT+FNUWT
         d3AZ2ktBl3mUrtf+86IXJgQ1sMxMg3z9qz9Kljb1LnbWmECID2f+Un5HGLBi7PTRtlLE
         78/SLFOIh63mmlk+AP9bBLuPSaEjJ408XnEGGGJEqM+JQI1eRqf6fWbVW29kOomHB+Mb
         df5KysMxG4JKChR6hRRtDqLvYdmIIe/FnFLmjN4QGtadReMGZeX+2OVOIrE3AVRw2hjo
         3uriC1Nyu9Eq9PUMtCGm5FdTUY8z58ImeAv15LQj9qYzEIs9bYGBeT2+EBcS9DNZz3RU
         iZBA==
X-Forwarded-Encrypted: i=1; AJvYcCWiDzJ+smiwLjILp5edjACww6t0/HJJBRu6zYDa0tBroaC7/kp8zoBSHGFoVVeEqfvGgwSBOZr8gFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKJlZ9OK3q/EA4cg2mQJPn88mBlK8B8dblz9Gs40FZKek4O0Sm
	59u6gH7JXExcSE1wPsh0UDmDx7oSiMLcdwhKr+P2UlTbqwQAQcU3wyrfJMsquQ==
X-Gm-Gg: ASbGncu8pGb//6xwy+4zTxnVG6joCp1F6Fa6AJ6sOw8ez6tAuTbX3PqP1d8V8fFa3cE
	qalX+urR0ONd+7snPC+T40NmRO72PNSDd3+1cHe4DWJ7y3v4QW3ELLuMV7SXgSBG4xRIlw4wzVJ
	1OWEFU7kBIpkcf/N8kIrjraPj8hqyHaSzeBCLK7VcfZtsOfzf4Pmw8+Rwhr1kemxNw9bzVtGjhI
	TWtgctpZ8a/aPbgW7IP/0mdCNaTr+xSBXElLcS3/nx41TCGzAm+jEmQd+SUu47zpdclDWADN/Uh
	GnYY4cKljJG9R9HjggAdcpW9gtSGcQyh92W7sdvhBMcj87WVdY6Ojn+koe8BezCbw3Ep9KFK9GY
	fKzbq9t0Mq9tdggxNwEXTN93O03k8giTtWVoYVQ==
X-Google-Smtp-Source: AGHT+IHHVjLyxs4xugjYg38o07zQ3r4VavLlX0Whe/aSGbbSEHsuX248QsM4WBhcDUcE3xWJGlSOXA==
X-Received: by 2002:ac8:5ac3:0:b0:477:1f29:e80f with SMTP id d75a77b69052e-4771f29e85fmr239847391cf.4.1742843326471;
        Mon, 24 Mar 2025 12:08:46 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4771d159a42sm50755791cf.11.2025.03.24.12.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 12:08:45 -0700 (PDT)
Date: Mon, 24 Mar 2025 15:08:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-i2c@vger.kernel.org
Subject: Re: [syzbot] [usb?] WARNING in dib0700_i2c_xfer/usb_submit_urb
Message-ID: <acfa19a7-9d24-4cd6-9d1d-580a9ac7473c@rowland.harvard.edu>
References: <67e1a1f5.050a0220.a7ebc.0029.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67e1a1f5.050a0220.a7ebc.0029.GAE@google.com>

On Mon, Mar 24, 2025 at 11:18:29AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    5fc319360819 Merge tag 'net-6.14-rc8' of git://git.kernel...
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=15445e98580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=27515cfdbafbb90d
> dashboard link: https://syzkaller.appspot.com/bug?extid=c38e5e60d0041a99dbf5
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13ea4c4c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15435004580000

> ------------[ cut here ]------------
> usb 1-1: BOGUS control dir, pipe 80000f80 doesn't match bRequestType c0
> WARNING: CPU: 1 PID: 5901 at drivers/usb/core/urb.c:413 usb_submit_urb+0x11d9/0x18c0 drivers/usb/core/urb.c:411

> Call Trace:
>  <TASK>
>  usb_start_wait_urb+0x113/0x520 drivers/usb/core/message.c:59
>  usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
>  usb_control_msg+0x2b1/0x4c0 drivers/usb/core/message.c:154
>  dib0700_ctrl_rd drivers/media/usb/dvb-usb/dib0700_core.c:95 [inline]
>  dib0700_i2c_xfer_legacy drivers/media/usb/dvb-usb/dib0700_core.c:315 [inline]
>  dib0700_i2c_xfer+0xc53/0x1060 drivers/media/usb/dvb-usb/dib0700_core.c:361
>  __i2c_transfer+0x866/0x2220
>  i2c_transfer+0x271/0x3b0 drivers/i2c/i2c-core-base.c:2315
>  i2cdev_ioctl_rdwr+0x452/0x710 drivers/i2c/i2c-dev.c:306
>  i2cdev_ioctl+0x759/0x9f0 drivers/i2c/i2c-dev.c:467
>  vfs_ioctl fs/ioctl.c:51 [inline]

It appears that this problem was caused by the fuzzer requesting an i2c 
transfer containing a 0-length read (I2C_M_RD) message.  The dib0700 
driver translates this more or less literally into a USB read request of 
length 0.  But the USB protocol does not allow such things; a 
request of length 0 is always a write.  Hence the WARNING above.

As far as I can tell from the source code, the dib0700 simply isn't able 
to handle 0-length reads.  Should the dib0700_ctrl_rd() routine be 
changed simply to return 0 in such cases?

Alan Stern

