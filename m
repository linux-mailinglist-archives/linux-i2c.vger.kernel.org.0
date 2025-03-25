Return-Path: <linux-i2c+bounces-10019-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A9BA70A6F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 20:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 370327A557F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 19:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891B41EE021;
	Tue, 25 Mar 2025 19:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZZMVw+kY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34171EDA26
	for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 19:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742930937; cv=none; b=dlht9DNz0nJ7ripghDMAIkiFn88fqKcAreWztcVOoYclEE/1TKR4jiBYeWCmMw+4BNobMLpeFirLcj/YR/d4LIOJlrUs5Vndnjsh14zCOUJdKRb3cAfM10S5D82xJS2WDss+POS0XQshlkaAJog6cyOfi2Dlaeodult0Rz4OR48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742930937; c=relaxed/simple;
	bh=+HZNGckBaFScGug7+JH9V5kfFzU8yyY55xQGFmkP4Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGfBq7Rl3aQJw6js1AJnS8rmITsxNBNHn6NVuno+PdbPyesSFbjIXX5Oxv42d4NwiT/RZQ0eX248TozfLVyhxgx9SIm0YsX1BTErTn3OXvs5suLU/Y5nMWK4CrnFdCZPIa4hhNxSzTIE+Bq+yTVryzD5oxGqXbEWafnYUmmWFJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZZMVw+kY; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c5e2fe5f17so58227885a.3
        for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 12:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742930934; x=1743535734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WjcGr9cvAtbGJkn9HvPelEA4m0gZiLDAqN98D6KbDUE=;
        b=ZZMVw+kYv2A1HlnyqG3Lr8l4n9MivkazfAlBB1hEGv8SUzFKpQs8wS4Vgw4sshazf8
         tvq967hJ7DsSdqBvHK6Vt+S3imwX3wLVpYEP+urwDrm9wYEL3h53xUpD+efizuS+34b8
         0LlrtercSECmUJ1bTPCxLh7B63HD8Ma42j/Zfkrnrp2G5Qn0AORK2SwY5WxcvDFgy1i4
         3oIbuTcX2eankW+YyWIg3CLkbwUX0hp8xr8hK4iKtenDpxhFwpUTJb/d9UJPW033456M
         8w9HGOXQd948FO+kgIphbSA73PkHTUA7de3NBbNeF/v426GANAQ5IOtLt4m7V4k9KByK
         3Rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742930934; x=1743535734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjcGr9cvAtbGJkn9HvPelEA4m0gZiLDAqN98D6KbDUE=;
        b=SI73ySxNFM3zbNJEXpSr8ki+Z9GxqscPB170eLfseaG81O8EENMjOLKyEWzIF6fM08
         sczqnjFssf8K+4AIemCUPWRQuZv8/X7yyhmW3eGFcoYW3bpGGJj6fCvkk3d0jL8DGfLy
         1ikJq35d4LxwQRl5TpmrL1QdELOkC+3PatnH6kR+4f4ZABYqJ+xEUuCen1q8t96O4a3w
         gLBAiYOxqOELZgsGyo6gYTK2Ubsl3YrL8M+v+lubepuYsBBEwIKYpzNgT5OlsTRmraCH
         4auOdPHBQv9QA3Rc2mOyfm4AEldyzrHaVZ19UwYg+nBYGv/SFmJS1IiCyHzfrWm2JDdL
         a/rA==
X-Forwarded-Encrypted: i=1; AJvYcCVO9KnmpNo+7I8NfqjFtxOsJnZj09PkLYsGfkWi3edfzMBi3cLyU+pKUq9hKYlDLC0zj67yzRsjRzU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzed9vvqkgUpmZpwMrxoWkIxr0pqDfmT/4iqDdA0NTZG0ALT8Tc
	cp2+0zoyRxTvwqupOhboiHbF6E9iD2IFkYhkwbA7BCl2MGBG8WIEE6EvCEGw2cd5IpPIW9CAND0
	=
X-Gm-Gg: ASbGnctnQADHr3LGMfORUOIeVolIoVsChvDJDB4UdC3232/TG7aqVtneYO5SRQxKfad
	wKdX6AAg+ZJVvOH7jcf99RROBZS85/vs5HiI9Wrbr7jCUAOys5DWDH96nvxfVicySqs7zKJM0Ut
	X+nN4hO9+oVM/Fqsy5EXqk5rDP18L81Lu7mgv7lVv6Xaz62pXDKhVRyar3lBatQr6yxHDZaHfq0
	87UgDHP7BvoN8iqscmf8fmQNv67SIrlZpUoGhge8CskD/zQGBtY/mFbMSAATPqoAzGTotqHvHW6
	X5RGU0uqTJtDV3ARxJ17wEt7L1A3b1OBFOSxqlBOenYvvC3VOjvlFxAVIbOuxTm/JhxPWFJdYD5
	zpXYNynnzCkkVeIMhLLO4sQhHbHwI+YJhjVxG4g==
X-Google-Smtp-Source: AGHT+IHHyJceIKvCgPSBf5o7GHYuvt5+o72NR9FCbDxku//TLL2aFhOO4FYnzlW/RfNRtDnryQbUeg==
X-Received: by 2002:a05:6214:1d24:b0:6e6:61f1:458a with SMTP id 6a1803df08f44-6eb3f2c8664mr230571046d6.14.1742930934320;
        Tue, 25 Mar 2025 12:28:54 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efdbea3sm59157906d6.112.2025.03.25.12.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 12:28:53 -0700 (PDT)
Date: Tue, 25 Mar 2025 15:28:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
References: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
 <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>

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

Index: usb-devel/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
===================================================================
--- usb-devel.orig/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
+++ usb-devel/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
@@ -10,6 +10,9 @@
 
 int dvb_usb_i2c_init(struct dvb_usb_device *d)
 {
+	static const struct i2c_adapter_quirks i2c_usb_quirks = {
+		.flags = I2C_AQ_NO_ZERO_LEN_READ,
+	};
 	int ret = 0;
 
 	if (!(d->props.caps & DVB_USB_IS_AN_I2C_ADAPTER))
@@ -24,6 +27,7 @@ int dvb_usb_i2c_init(struct dvb_usb_devi
 	strscpy(d->i2c_adap.name, d->desc->name, sizeof(d->i2c_adap.name));
 	d->i2c_adap.algo      = d->props.i2c_algo;
 	d->i2c_adap.algo_data = NULL;
+	d->i2c_adap.quirks    = &i2c_usb_quirks;
 	d->i2c_adap.dev.parent = &d->udev->dev;
 
 	i2c_set_adapdata(&d->i2c_adap, d);

