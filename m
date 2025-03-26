Return-Path: <linux-i2c+bounces-10035-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B30A71A3C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 16:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44687164D7F
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 15:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D902A1F4193;
	Wed, 26 Mar 2025 15:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="q9DYFxPv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0481F1908
	for <linux-i2c@vger.kernel.org>; Wed, 26 Mar 2025 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743002905; cv=none; b=ODzHaQs6k/DA0TNXAgoTiEpCHRITUWgJ9A3M5uMlA7XWzEcDRYTPmy1SOsZ2JV1IdTFpJ0q6OaTx14L16tHsC7WxGFGOcVJyYWQwKkDMZnyCdu+dqlW417rG7T+teAKB0RuqI58pXXS7/LoScfXVutmj0SSRBqJw5spUFCmNxZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743002905; c=relaxed/simple;
	bh=In8mradJdyTsnSMN/Zx5eut5oPE9f935FbSWzJQjo2c=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lthffWyCdXaNdvf5oLlEVFhwVcIO7K8iOuz27i5w4uoPQINKuRf6/RC+QYUGUR1wvDmfOR6JMajsDqbE/EesJ3qtr5bixxI8a/q8n+uO8q+huejOU6dBfw9KZaCe6DJTFJCNd3D2JbteexhWHqWmsLzCNs+Q+olYoLgPiOLKum4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=q9DYFxPv; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e8fc176825so56279226d6.0
        for <linux-i2c@vger.kernel.org>; Wed, 26 Mar 2025 08:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743002902; x=1743607702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lJkS3jBwTRqrbFKeqmQ5FYC+7YoE9yU80iE+FHpuAHI=;
        b=q9DYFxPv3ld2sh8neyVmUbZq3kLmMX+yaYLY7LWZ8n4n8fpHDPlcoyT9TS3vmWqnNx
         degK4/It7KNADfJ4bmGuywhNrb6EIz7cCCuirzqrp0B29Pt3PzNQKq4YxVkF8ad6EOAR
         Q1k1QdNtL2vZ9kMSpdeuW9ukEplrwSCvBGTl45v5bCjzTSMVm2NEZonq94pdxvXeEWMr
         gfdLeMGgQvbgg+VZ3rRKMYgjF6nbKOml1cz9Bds+XouiWY+1tB7we2PADDlW177uwJWa
         2812a3Fo3plJGCYYuKC6FkWCHiC72cHWEhMf4RBpcQtW+mgHuEu7WFtclcU6zhckmzsN
         UReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743002902; x=1743607702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJkS3jBwTRqrbFKeqmQ5FYC+7YoE9yU80iE+FHpuAHI=;
        b=a3I/xOYLgYSn9SsFvdeH9leILel0mohDhQ2+/VrJPON9cpA4xBCktxKkjqagmRx4tk
         M4JUS/pQHkfumY9DvIqKVsn4gv+OZ7sGN+VuIClWU89Q+pidM1JR9HmX+V3mJ2ifZXLD
         Mawy1PZr+r1je8smb/L/W8/rLY3Kn9CFQWCLxjnaCa8771aKLnLxJO9WZAKufViZ940D
         NfbtNG8Ki3bBiOqQkFYrM607s8TBWVnn/i3TBjoc/V9R96zVYar7haD0n++YHGkX2lLc
         AhwSyqPWByKovXPRWSu2D01L9YSUKhqRgtexROETuCSvTU1KU5uwX+xXINMqroZZ+zK1
         ZSOg==
X-Forwarded-Encrypted: i=1; AJvYcCW7oO4APnvrYoxyW9oujgGEdHWpddmVRVgtnVBRmcM/DYwJY66aXqY+L1A85NY6UZAswA5615QFlH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YznH0ivI7n7tJy8WFnCncA0ZihNnlptSdLgA+ivzFNQqIyVrtI/
	HPfWhonZsllHUMAwStWc02SIDnL4nMpaXs5tQaBcU+hS5EyVgo37OOqBhWHMoQ==
X-Gm-Gg: ASbGncs1iL6JwsZ1E9jVwTNafn/+2luFNspVA6Say4mfz7SuxG0zDcoXpRSerBdwT00
	b/3J3CVn6WqYi5eZQ0Hqtfoib5BodkWNxZ15WHgtcD6hs+b3EvJzbpLNHR/JbsW4+KWIaDGGtyO
	pqIekbb+AZ8Fbc03rt/4cwJUDS6jHZlij2j8AMakU1f2lqwBMGKV5lIj4JAZFJwgj9ya6XOWsON
	fjnQTJ3FIhbukGOSDdjr9COy028MuABWff+toxeIBQopCKI0zDJujy2s6tspG66BQTsY/7ucUI9
	8H2xo5i2A6y+NlKKt2B/jFzVPu3xHNvbqiNjF36PP2+BiwutVfsnpEiKrDII/67dxXzdNkw3/WX
	SAuWiJ2d3lkYzVLXI++j59LmnEI83xKy76n9xZA==
X-Google-Smtp-Source: AGHT+IGDdKxmHGc9gI357CBTixi7+PlBZCZDHIkgl+JsQcb4TNnysAcWbF5MH9GPPMx+dnQUp1PRmw==
X-Received: by 2002:a05:6214:224c:b0:6e8:ffb6:2f8e with SMTP id 6a1803df08f44-6eb3f332a55mr397418106d6.32.1743002902039;
        Wed, 26 Mar 2025 08:28:22 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efc568csm68569916d6.92.2025.03.26.08.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 08:28:21 -0700 (PDT)
Date: Wed, 26 Mar 2025 11:28:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>
References: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
 <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
 <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
 <Z-MKiV0Ei5lmWik6@shikoro>
 <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
 <Z-MrfICsY06DZV-2@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-MrfICsY06DZV-2@shikoro>

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
Link: https://lore.kernel.org/linux-usb/67e1a1f5.050a0220.a7ebc.0029.GAE@google.com/

---

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

