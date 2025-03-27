Return-Path: <linux-i2c+bounces-10052-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B5A73664
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 17:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419CD177786
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 16:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E5519F11F;
	Thu, 27 Mar 2025 16:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="T8U1s6Uj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF341922D3
	for <linux-i2c@vger.kernel.org>; Thu, 27 Mar 2025 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091814; cv=none; b=s5n/UqPIRGcBPhKxUmG5QXF6nqrzZrSzzfYxqoalRMH3sRKlgf1RHHs/Q6It4uiPyANWWKS78Z4/X9rFc9oW4tVHafwbtO0wjRrhLagW+hOPj8bCCI0YDmWHvv0SSqiXCNaKxFbMtTSA8dNKbsr9HtU6PdUXjEYTZsXcoOiJrr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091814; c=relaxed/simple;
	bh=yRfsWSmO+wFLjQqhVPDHhzJGHPLVualTW3MOKQsQiAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lb+9Co3TlruhGjRVQLdFIawoNSwf4WCmVOjCiFjg5pxXO/X7xLGehy2zVhjeCcfmdExGUJJ28rCR44oXmykk3GlSl5PuXcLGh/A+ztAWNJvSrxrfCd00kZDTh699iKTsP3JCEGyq/yA4wwA01Jd/r1kBj/2QiR794WczpoUKIe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=T8U1s6Uj; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47698757053so14532341cf.0
        for <linux-i2c@vger.kernel.org>; Thu, 27 Mar 2025 09:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743091811; x=1743696611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n4aGtm3x4RnQEni/5CdY3X2v/FvubHlUYBJ6LerS9tM=;
        b=T8U1s6Ujtr9zTAwLS5tBTAuFJAyK+XjK+4j9NaXJxDQw8R0uPo4ebOtbOTzHbxR8Nr
         MDv8ZvPD9ApYenTASg4Z1tULbH/yz9Qal4DB7XUPdx1TIVXeR/OKEiIisgP2FDvTHovS
         b1BKUmza3sqqWpR0SnjfZvJljYGz2y8/5w7QPUieIdijZGLLTv7y190bKA0grPquPfI5
         22ayKJj+iXd+g/XAcx1j1ow5dQLKJiKpmDbZd7tG+5y9rYAcE3vg6NDnPEzDzAAOUYdu
         hTKHEP+NoeU9WqJ1Jr8jgZLWZAUsc7EhzlERNQ8dAIR4Avla5rUnKYCbW5VBU4rqKcvH
         6/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743091811; x=1743696611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4aGtm3x4RnQEni/5CdY3X2v/FvubHlUYBJ6LerS9tM=;
        b=bcxNUI9nj4FDwCT6oBtJfvkc9stTjBXw24HdwTyGTiH91vKPvQ9KCZUFDR9QvzAj42
         hA9gzzTbQkHo+rG59GmxMxsAKJaha7rDoretzqx2FoM+QAC5o3nu8WOplZyJCJm6JuRW
         aVkgoeQv2fUcBlCFAP+XyuIIFES2kER3h7XO3zTwG95eCRNpBGhRFEg5qqcAWF0coYge
         b6TFJmFA2al/MT+E+BXylia068idb0ltI3dbfNMOWDXIjElqHZQQ7V0tB1mFfmd6QGne
         iPqxdo29UGETPXDEEdvLfKToO0Kn3ifWnbyMlSoUmudBJ3+I0uxtVFvPcpKrdpdTRlku
         3PEA==
X-Forwarded-Encrypted: i=1; AJvYcCVbesKJlAo85NBkiN2T+moLlDsq/v6qZd9kYNtNWXDa/7IEqUQlrQ08ROZooZ8r45dS5SF8FNP/z94=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGC6QjtiVJr+bZaBOQHKy9+EXqdBySlisqDA0LztSBSEw6k5mB
	8zwoftdhN21RwKzgK0yT1xUNLpI9qfAdFnNugk8Kq112bCVj4W1i45Cw8jdRVg==
X-Gm-Gg: ASbGncvA9Drs/X03aw4OsiQCbxwf4uzHmyxF2bbX71pvyoWqLdXjJQalq9LOXOCIBYF
	k71bebMZu8eh7Pok3MVXDpgx28qS8s09iWRpZvlIOI+r6QkulC6oexNHcugSzL1Hg7UEmhupaqt
	2oGfOSmEDiS2qtVE+vwJDGv2x2vwqHqZ51mVzpI8RR30DhBCrudhQWqY630CfbJVtanSDbPcET6
	PSG+iQEZmz1TugDtPxxMVuD5whXxhpziwcn+5U/x1tHOMX1eW0k5X/cmz/bBYcMu8/rtT/QeNhP
	RpkZlwE0BpsVmQNCEZ3v4LCj0m9ij2//1xiDNxpSGtnAgG2eR35lE3DSqAWOvAPc8qIo0A95LtZ
	sXOYoS6JKbk06fov6taAlwaMJwuGzzGucOcqBBQ==
X-Google-Smtp-Source: AGHT+IHrXdhBKku0JlAnw5aFNc3noz3BV8vld9892T4Ikm1iTuBSdMQGuKLfD+Saf5C2J0tikiUE8A==
X-Received: by 2002:a05:622a:2596:b0:476:9001:7898 with SMTP id d75a77b69052e-4776e116edcmr67799011cf.25.1743091810281;
        Thu, 27 Mar 2025 09:10:10 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4771d52010fsm85628191cf.61.2025.03.27.09.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:10:09 -0700 (PDT)
Date: Thu, 27 Mar 2025 12:10:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2 resend] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <c7f67d3b-f1e6-4d68-99aa-e462fdcb315f@rowland.harvard.edu>
References: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
 <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
 <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
 <Z-MKiV0Ei5lmWik6@shikoro>
 <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
 <Z-MrfICsY06DZV-2@shikoro>
 <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>
 <Z-QjIRoOWpoWaL6l@shikoro>
 <c6bed13c-38df-43a6-ba5f-0da03b91f3df@rowland.harvard.edu>
 <Z-RyiI1X9BN43feQ@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-RyiI1X9BN43feQ@shikoro>

The syzbot fuzzer reported a WARNING related to the dib0700 dvb-usb
driver:

usb 1-1: BOGUS control dir, pipe 80000f80 doesn't match bRequestType c0
WARNING: CPU: 1 PID: 5901 at drivers/usb/core/urb.c:413 usb_submit_urb+0x11d9/0x18c0 drivers/usb/core/urb.c:411
...
Call Trace:
 <TASK>
 usb_start_wait_urb+0x113/0x520 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x2b1/0x4c0 drivers/usb/core/message.c:154
 dib0700_ctrl_rd drivers/media/usb/dvb-usb/dib0700_core.c:95 [inline]
 dib0700_i2c_xfer_legacy drivers/media/usb/dvb-usb/dib0700_core.c:315 [inline]
 dib0700_i2c_xfer+0xc53/0x1060 drivers/media/usb/dvb-usb/dib0700_core.c:361
 __i2c_transfer+0x866/0x2220
 i2c_transfer+0x271/0x3b0 drivers/i2c/i2c-core-base.c:2315
 i2cdev_ioctl_rdwr+0x452/0x710 drivers/i2c/i2c-dev.c:306
 i2cdev_ioctl+0x759/0x9f0 drivers/i2c/i2c-dev.c:467
 vfs_ioctl fs/ioctl.c:51 [inline]

Evidently the fuzzer submitted an I2C transfer containing a length-0
read message.  The dib0700 driver translated this more or less
literally into a length-0 USB read request.  But the USB protocol does
not allow reads to have length 0; all length-0 transfers are
considered to be writes.  Hence the WARNING above.

Fix the problem by adding the I2C_AQ_NO_ZERO_LEN_READ adapter quirk
flag to all the USB I2C adapter devices managed by dvb-usb-i2c.c,
following Wolfram Sang's suggestion.  This tells the I2C core not to
allow length-0 read messages.

Reported-by: syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com
Tested-by: syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com
Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Link: https://lore.kernel.org/linux-usb/67e1a1f5.050a0220.a7ebc.0029.GAE@google.com/

---

Resend to the media maintainer.

v2: Move the static definition of the i2c_usb_quirks structure outside
the dvb_usb_i2c_init() function.

 drivers/media/usb/dvb-usb/dvb-usb-i2c.c |    5 +++++
 1 file changed, 5 insertions(+)

Index: usb-devel/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
===================================================================
--- usb-devel.orig/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
+++ usb-devel/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
@@ -8,6 +8,10 @@
  */
 #include "dvb-usb-common.h"
 
+static const struct i2c_adapter_quirks i2c_usb_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN_READ,
+};
+
 int dvb_usb_i2c_init(struct dvb_usb_device *d)
 {
 	int ret = 0;
@@ -24,6 +28,7 @@ int dvb_usb_i2c_init(struct dvb_usb_devi
 	strscpy(d->i2c_adap.name, d->desc->name, sizeof(d->i2c_adap.name));
 	d->i2c_adap.algo      = d->props.i2c_algo;
 	d->i2c_adap.algo_data = NULL;
+	d->i2c_adap.quirks    = &i2c_usb_quirks;
 	d->i2c_adap.dev.parent = &d->udev->dev;
 
 	i2c_set_adapdata(&d->i2c_adap, d);

