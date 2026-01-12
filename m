Return-Path: <linux-i2c+bounces-15053-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE95D12D05
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 655ED30021F9
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D787221F0A;
	Mon, 12 Jan 2026 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtZJwFrR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C961E230E
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224684; cv=none; b=rpkrdglN8zFBsL9BoGKE0KhmoHWmh1vUUCkzxdl4WU8iCJOSrvslQh0FQm0rIr9e5uO4UvJzoIprXe15IJ7u1jFEnaHnhxeCeNgucqUwYgV//fe4acykJy4xD80yC/MIQ8cU/prtD976Ua4DdAMtO9RXGVEHB5V/sOa9h6eB+Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224684; c=relaxed/simple;
	bh=IvRuR/u1t/U+ODZn8JoJlCSewXAZyKKQ2Z3JJthN8tU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=qeMbHFmR5EeL0JXIJouNZwtVd+H2jV1NfKsjuuL7d/rB/ERDrs+rP3nfKFyFWEmzwKrg57n0+630m6jjd4OqFZOFT3yYku1Yf3jah7sygn+2QNinFfo8/7GvAod2h6CAsa7Ht6yzBArXzR1tfloHjVcuCVwOIijobO7eQ36Cda0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtZJwFrR; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7c32c6eb79dso77797b3a.1
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 05:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768224682; x=1768829482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/PipOGdMf07goSto3xV6V2h0Ud3tUjt4vk9HBm9j3g4=;
        b=KtZJwFrRAB6gpy5Ll6YBY90d+DEzPVAeAAJeSrJ+AQrub1LqlKgUsJEx48qOMUkA2u
         E6XU9/TKVsZBIpBoAQcwk3ImwpPouQ+n7YhEwsXXhfVDsQUYdiZDcNyUdWyEod7ifU4t
         VYOt+UHLThQ65d7ZM87tJziGB5NqcQHcOfDdF6hVR0pfaYt1nnW/chqzr9E5Qt3zpo1k
         EGFnmy59Ha9k65KFoZUndy5RQwHZNDnIcpv67m9IYMuhqbMYS8UhtVh6QlWrAmGfUkLO
         VFvK28g4mZrA1DRbU8Mlx0bOXrDjv6nszRsQCAl3zDn5lPV4BgHIz/C0W60uiPzdHMjm
         AX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224682; x=1768829482;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PipOGdMf07goSto3xV6V2h0Ud3tUjt4vk9HBm9j3g4=;
        b=TzEr99ftGi36rQvY8n9J2jL6OmCUf2HsTN2T8yrZ369Z3XkW+ejUvPAnK388oMkXvA
         cJ6K9Kqf+xZMHCHZNSgMgNmSlO0H5caoxqm2juCrQmpTBr1cWCCJzOz3ido4IywTqi5c
         7due/bVyVm6l61g/DAT+iwfBHy8xLULO9BlLyWuNjUvJNqrjx0g1T4neuEyinMkFoBEC
         AqjOxlqAfFo+06xw4oBvjWoy6DXuEQbbrqZk5x3+wV1GXB58jwIuW3JZpHRUp+cOYoPG
         T9zVPIpW0S4Vgo98+sl5GOKV4AwUeWhod0d7NZxGpMnDhgvieuQUYQdAo0+Zi3G21N3l
         cipw==
X-Forwarded-Encrypted: i=1; AJvYcCUHhC9UDs1mCrS2iIqHpoyQw9/3irbw/7YzpByL+HQjOpkk7qsAfcusyxNWD1znEsMiJKTep8F89xE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNlG3bhbKkzm8AqNfBl0QK8DPIlgtvcHDrmk5+kxHX7bTqJ+s4
	7G6GMtGQbOG2LD3DFHZZTVkPdvAgQPNgO5VmPpQu/yXs8wlg78aMtzLi
X-Gm-Gg: AY/fxX6EeHG43u8R33YHXW0TVlBBQwOBeXGvhK1DzP/mNMDd6AyVhcLKpVdqOfPHF/9
	11O64Lb58ydtbtrWFK2YAspAs4RUClMVDZVP4SEmaXt38Bk+GciaW/I/d1qFihVvCR22X5GPz76
	56JvvoqpXHn8Sdjhp4TGtFGtXYAWx98PFPc79Y4L5p96c+tZUNdvCgmZMY1yTbovRB2NF+qB0cl
	yaf4ad9O1PQDQTobKuDztPrIXPQgegDkDBm8te2yHvvQ2xZJ9gMxcx7rMe3Kt0hxUTFZOxL7Ugl
	LUoFqJbM9/pHgGkbTGZJ95NR3hkpN3yDyzE7RxcaT/XorfO1FodsFtK1G41R3N02YsKki+ROjAD
	zADO8eneyc3nNfL8zabnzgN/nMxmRAtGBVIhQ2D2AotfPuZTCw3nUaFCbkmXj2fxKQrL6p0/OQP
	U/28CLzFafTWV2jJJAVw==
X-Google-Smtp-Source: AGHT+IE4SuIy2Fo34RQ51O2BUDaNAwWp4QtK5Ka3V9h5k6xwfQMNDL1w6vGaPaBEmyy7OIQYdhPCTA==
X-Received: by 2002:a05:6a00:1acb:b0:81f:475a:d242 with SMTP id d2e1a72fcca58-81f475ad32bmr3220064b3a.4.1768224681586;
        Mon, 12 Jan 2026 05:31:21 -0800 (PST)
Received: from [172.20.48.71] ([47.246.98.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e7cdaa87bsm8884840b3a.17.2026.01.12.05.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 05:31:21 -0800 (PST)
Message-ID: <86bdd498-2012-4bb1-956b-47d91c2a334e@gmail.com>
Date: Mon, 12 Jan 2026 21:31:18 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
To: syzbot <syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com>
References: <6963d09e.050a0220.eaf7.0070.GAE@google.com>
Content-Language: en-US
From: Wei Peng <coderlogicwei@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <6963d09e.050a0220.eaf7.0070.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

|Sorry! Please ignore the previous patch. It was sent by mistake. The 
correct patch is attached below. |#syz test
diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index 57dfe5f1a7d9..79b7c97514c9 100644
--- a/drivers/i2c/busses/i2c-tiny-usb.c
+++ b/drivers/i2c/busses/i2c-tiny-usb.c
@@ -12,6 +12,7 @@
  #include <linux/slab.h>
  #include <linux/string_choices.h>
  #include <linux/types.h>
+#include <linux/workqueue.h>
  
  /* include interfaces to usb layer */
  #include <linux/usb.h>
@@ -172,6 +173,8 @@ struct i2c_tiny_usb {
  	struct usb_device *usb_dev; /* the usb device for this device */
  	struct usb_interface *interface; /* the interface for this device */
  	struct i2c_adapter adapter; /* i2c related things */
+	bool disconnected; /* set to true on disconnect */
+	struct work_struct release_work; /* work struct to release the adapter */
  };
  
  static int usb_read(struct i2c_adapter *adapter, int cmd,
@@ -184,6 +187,11 @@ static int usb_read(struct i2c_adapter *adapter, int cmd,
  	if (!dmadata)
  		return -ENOMEM;
  
+	if (READ_ONCE(dev->disconnected)) {
+		kfree(dmadata);
+		return -ENODEV;
+	}
+
  	/* do control transfer */
  	ret = usb_control_msg(dev->usb_dev, usb_rcvctrlpipe(dev->usb_dev, 0),
  			       cmd, USB_TYPE_VENDOR | USB_RECIP_INTERFACE |
@@ -204,6 +212,11 @@ static int usb_write(struct i2c_adapter *adapter, int cmd,
  	if (!dmadata)
  		return -ENOMEM;
  
+	if (READ_ONCE(dev->disconnected)) {
+		kfree(dmadata);
+		return -ENODEV;
+	}
+
  	/* do control transfer */
  	ret = usb_control_msg(dev->usb_dev, usb_sndctrlpipe(dev->usb_dev, 0),
  			       cmd, USB_TYPE_VENDOR | USB_RECIP_INTERFACE,
@@ -219,6 +232,15 @@ static void i2c_tiny_usb_free(struct i2c_tiny_usb *dev)
  	kfree(dev);
  }
  
+static void i2c_tiny_usb_release(struct work_struct *work)
+{
+	struct i2c_tiny_usb *dev = container_of(work, struct i2c_tiny_usb,
+					       release_work);
+
+	i2c_del_adapter(&dev->adapter);
+	i2c_tiny_usb_free(dev);
+}
+
  static int i2c_tiny_usb_probe(struct usb_interface *interface,
  			      const struct usb_device_id *id)
  {
@@ -268,6 +290,8 @@ static int i2c_tiny_usb_probe(struct usb_interface *interface,
  
  	dev->adapter.dev.parent = &dev->interface->dev;
  
+	INIT_WORK(&dev->release_work, i2c_tiny_usb_release);
+
  	/* and finally attach to i2c layer */
  	i2c_add_adapter(&dev->adapter);
  
@@ -287,9 +311,9 @@ static void i2c_tiny_usb_disconnect(struct usb_interface *interface)
  {
  	struct i2c_tiny_usb *dev = usb_get_intfdata(interface);
  
-	i2c_del_adapter(&dev->adapter);
  	usb_set_intfdata(interface, NULL);
-	i2c_tiny_usb_free(dev);
+	WRITE_ONCE(dev->disconnected, true);
+	queue_work(system_long_wq, &dev->release_work);
  
  	dev_dbg(&interface->dev, "disconnected\n");
  }


