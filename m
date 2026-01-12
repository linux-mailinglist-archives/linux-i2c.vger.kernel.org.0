Return-Path: <linux-i2c+bounces-15054-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F53D12DDA
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D97C5300698A
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F73535970D;
	Mon, 12 Jan 2026 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5iK3xu9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0BE3587A1
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225141; cv=none; b=gFAt1d6geIBYlOfcf2OsDlgaIVfURF/niFS8UvIIXl2+k27N1IyxAIrx7VgdGgg4abenZCdkrB9ljh2Wnu1SJ3+fWW7jsigKGC4nBYwJGiLOU6S2TmwS0iZM6L7J/mmVHJk5BRt/H4mlyisx7l44acRsTv4WdrU7iIoTs9igDxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225141; c=relaxed/simple;
	bh=BEKOAgfZdvF9H0+sfavBzNkkUjeKE9wyzY5Z2TiciTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=SPpczsZZsquUdCzVsWFz1DdpDaNzUQhraG7133noz95Jz14+wE4JTSvcZWjTthfBCbEvMwFVM/vELUKGPJDyxa8F5PZjCA/7ESGtvPV1OFYEVBLFvc/2L1+v7X4h24fW8mYniKlxYt/Ou5qAQSuH18685r17Fj4S+4hueZ0XrHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5iK3xu9; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a2bff5f774so19967665ad.2
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 05:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768225139; x=1768829939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=swUSC8SebLSD19Jg7UA9pgyRWCV7Jh/P7a2meW6Eekc=;
        b=S5iK3xu93l0wLY2tg70Jlw9ufr5yFecGvbS+h4bIQDP7VOjBnBV4p0RjIWODtJMuhb
         hensCTz4js4n+AefRp372OrfxT5T/b+sLaQu36aM33b4esIBTQT+sr39Y9j98Z5GlhTm
         Sj7+Fi1OVvZHvwX2GB74F7Zvzv3nx28O0hnpeLcDVonambn5usNaDlYcPWp2Rp/Qya4W
         HtoOqq0CrseTVj7h3BIdlM2GK3t36Pq7VAFc0ohNXbBjV6Lo+7jRzWhI1whKGznjWiAc
         DD8QRT26K7T1sJmv+jWng7qtDv+ASAbn47J+20laP4F7fhJJ/BxpcN8GMNsxdD+4Ojl7
         d8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768225139; x=1768829939;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swUSC8SebLSD19Jg7UA9pgyRWCV7Jh/P7a2meW6Eekc=;
        b=FHdpTcoaAvEYGEj6R0rWJxEI2ypJ1nRkcy7QJZRFVmmnFwo4zolnMx2xSKssozp+Qt
         MMZLG1aLRjRVZb3cGxGbQvAXvi9QXXwEk41Bb467mXNDtC5Yij+1d9nMn75pMlaJdbs0
         ekZ9pLx0YfBYV27olLYBQDPDpVw+fnFYImNzE0/IQUJb3nIqY6CmleAxzDl0og9eyEbp
         KDRVxKLjI4GjbXL7vT6QByY4R3Tq3sJu15eVu/D1sqaBl/1tPqbo4bslQO7vVQiiEzfr
         RrM0WPM2eekqQ1KeAZlReoxR9EBYFUCVX/+SYVdV0XplF9glA9DB4WmM6v70K/bg0ywU
         UITQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8fSnWEWVIFXxINTgfwx2d/dWMYd49Byvlxwi5CAajvXuY6uBtOE8v1sjMAe2TUUtVY7KyJPDX/Xc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvJOHAmFe4smKjxiNipOp9zehvIGusinqu2ZvLJwbyUtmvJAxG
	qjLp9p1tCZShxczHG/bXFA+AW2q2oiqYyCv/PDRnubOKRq9y9N+diq3JMc18AsG9
X-Gm-Gg: AY/fxX4wvyaG3YOiS34nuGeCu5SY/afcRAGx9y5xkIcg/rVlTgryK0RxvF6eTSTgkdZ
	ZSPiWPu6SQSw9N5M2ntAs9qNsnQFymiaRlHlkxxx946LaJWkSlTma9pu5+bqN2YJuhVUsi0gead
	jEZuH21E7+lanIYwOwa4oPl7uLR3/3zkSPbP/tfPpkv5gSLQcyPOU8CF49uWADWQqWsfnlWVod+
	Kkfb/zQJPd9j86PDMVzMFYnYeY1i5g078mNKlZ1jQSh8Ckrd5PQPBhOvQ8uGrsCR4a8IdeGAt6d
	bhfhB3JCCiawWvCpO2TtYWNqasELrDUQ5Vdx/otl8a+8A0kfkM6N8oaurBiZWiAYC1aO8qAVfox
	xvZCMHWQ3OFbUuHbn13LKTfJM9dKdwdEsgnZbtmaCyULWNkwmYCyChTTJG7xLNgb0j3o/sZ9n7D
	MeAAD/0HXV5F9gaKMa8g==
X-Google-Smtp-Source: AGHT+IGN5nT6g76E98AHmHhpKIZ4WXd9Pph9NcnSci9vGNp6nnXs7ptUMXMojBjq8Wx4aRZs5RbayQ==
X-Received: by 2002:a17:903:90d:b0:29f:6ca:a35b with SMTP id d9443c01a7336-2a3ee425ac0mr138296845ad.1.1768225138972;
        Mon, 12 Jan 2026 05:38:58 -0800 (PST)
Received: from [172.20.48.71] ([47.246.98.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a2a3sm179108345ad.13.2026.01.12.05.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 05:38:58 -0800 (PST)
Message-ID: <1d3ebfdb-2c12-4388-99bc-3cbcc11eea79@gmail.com>
Date: Mon, 12 Jan 2026 21:38:55 +0800
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
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
From: Wei Peng <coderlogicwei@gmail.com>
In-Reply-To: <6963d09e.050a0220.eaf7.0070.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/drivers/i2c/busses/i2c-tiny-usb.c 
b/drivers/i2c/busses/i2c-tiny-usb.c
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
+    bool disconnected; /* set to true on disconnect */
+    struct work_struct release_work; /* work struct to release the 
adapter */
  };

  static int usb_read(struct i2c_adapter *adapter, int cmd,
@@ -184,6 +187,11 @@ static int usb_read(struct i2c_adapter *adapter, 
int cmd,
      if (!dmadata)
          return -ENOMEM;

+    if (READ_ONCE(dev->disconnected)) {
+        kfree(dmadata);
+        return -ENODEV;
+    }
+
      /* do control transfer */
      ret = usb_control_msg(dev->usb_dev, usb_rcvctrlpipe(dev->usb_dev, 0),
                     cmd, USB_TYPE_VENDOR | USB_RECIP_INTERFACE |
@@ -204,6 +212,11 @@ static int usb_write(struct i2c_adapter *adapter, 
int cmd,
      if (!dmadata)
          return -ENOMEM;

+    if (READ_ONCE(dev->disconnected)) {
+        kfree(dmadata);
+        return -ENODEV;
+    }
+
      /* do control transfer */
      ret = usb_control_msg(dev->usb_dev, usb_sndctrlpipe(dev->usb_dev, 0),
                     cmd, USB_TYPE_VENDOR | USB_RECIP_INTERFACE,
@@ -219,6 +232,15 @@ static void i2c_tiny_usb_free(struct i2c_tiny_usb *dev)
      kfree(dev);
  }

+static void i2c_tiny_usb_release(struct work_struct *work)
+{
+    struct i2c_tiny_usb *dev = container_of(work, struct i2c_tiny_usb,
+                           release_work);
+
+    i2c_del_adapter(&dev->adapter);
+    i2c_tiny_usb_free(dev);
+}
+
  static int i2c_tiny_usb_probe(struct usb_interface *interface,
                    const struct usb_device_id *id)
  {
@@ -268,6 +290,8 @@ static int i2c_tiny_usb_probe(struct usb_interface 
*interface,

      dev->adapter.dev.parent = &dev->interface->dev;

+    INIT_WORK(&dev->release_work, i2c_tiny_usb_release);
+
      /* and finally attach to i2c layer */
      i2c_add_adapter(&dev->adapter);

@@ -287,9 +311,9 @@ static void i2c_tiny_usb_disconnect(struct 
usb_interface *interface)
  {
      struct i2c_tiny_usb *dev = usb_get_intfdata(interface);

-    i2c_del_adapter(&dev->adapter);
      usb_set_intfdata(interface, NULL);
-    i2c_tiny_usb_free(dev);
+    WRITE_ONCE(dev->disconnected, true);
+    queue_work(system_long_wq, &dev->release_work);

      dev_dbg(&interface->dev, "disconnected\n");
  }


