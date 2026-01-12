Return-Path: <linux-i2c+bounces-15047-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6608D12B58
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04975300E7AB
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51EDF3587D7;
	Mon, 12 Jan 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDK6PXZg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FFF32572F
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768223526; cv=none; b=f6XKUIvU37Xc1WU07Ve6Vdrwp1Mf3QLF/BEJt6qLZo+CEckkLh4wxyxVPt+mEYMv5Lmlrwixz2me8GEyOc09m3qkJC7a7iXO+pUsq0bjBQ+CHsfxlEnLCuHUuWtjjg3LlHtym/+2uMlk7gMwDgdJDY4pVvJ2CLF1eMuIMo/qBZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768223526; c=relaxed/simple;
	bh=6nuczvPrn2IgArqiQezFr9jtoXxC6FpLvhyVfBSGj0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=FZJS6/VTNCD+Zv33Sw2PQcMnzjcPM6XA8Xu2AIVtMfnOSW5/SwxQ2iySYODo7FfWe00GyTGB3E0luNq777UGo0X7c8imiSowokKi2tyvbcb8FrFUrIJQVnt2D/R8dOjyCd4xt9IHoqBwPAwad/9OkgfhOe2T4iNE1acw/9qCnXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDK6PXZg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a3e79fe2b8so9371515ad.1
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 05:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768223523; x=1768828323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=34fyBDU5e33PxulWg60Z3EmvoVxTl0GF48Qxgk3BXXg=;
        b=SDK6PXZgqmuJX1sj7nH1XZIu8mfC8hnnlZr/PuQC1S3aT49Zv7gz3IGf06tj9/A8HC
         LtVjcbcIwQWa9OivhTa94H1Wpzw59bmrbdnynFv/dlneKtMfGb4957j1nvQryTbm2FX7
         HREvUvzjapmr59N+K5fYach0dycQQU6lpNF/V4CcDnNz30yCwKyvvYQ6lDm/SAdhpb05
         08+g8fFRVJh0EkuUXu3nfC6dEW7IdcSxj9w9bEbSyNXML1p+fWUQzm6Vn5atzzLcTGvh
         8lCSueatsyDPa3Xmg6zwqUmr4YlmmbA0ztzwCsgEW4j3El3fiMG7EEMZC5M321N0sKV0
         z4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768223523; x=1768828323;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34fyBDU5e33PxulWg60Z3EmvoVxTl0GF48Qxgk3BXXg=;
        b=lYDhSvZLCMLjPo9LB9PlD3Q6xF9kfQGdi3yWx6Iyj6zPRBCv+6OMsEi0QO6EPOQ1Rx
         6/N+ABrA498QZIBhU0fEvaLGSlMPtlN4u8hJ6Ny6WI9hWcxi3FxnFNexHKhXEuGwcB4v
         ANGEaMYeOYh2JNbXo3hvrIvsJ8JwfzqKq8YSwbX6jdl6Qunua52x4qOEEsHW4gkleSFO
         G4v/9eKZyvTj1N+IDyEvct4FQW4ZMVwfRegYDB6g2PcWneq8wjx052Gg6Eecu8LzBGO0
         ilMSId9u7f51sDmqMGuRnsI8fJsnHcv+3oeFnC+55m414zVdo8LiyNzPVo/jw/JCQjad
         PTUw==
X-Forwarded-Encrypted: i=1; AJvYcCXeq38XWYLX04pIJJMlupM20CakG3NFSSm+s1Gv6N/cuHWhFpqgcambuLnWf1eWCZCTmk+OYiU3ROE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBm8TZ0LhTGvUf/YgVJUg4YUGtdRCyzgGlfqrfOVyl9Mspx2Jp
	sAuglzQKBDzN4IZ0dCqnCTx0t+has2L7x19z3uBNXe/UPvOlU/3R3PA+
X-Gm-Gg: AY/fxX6SQsx53oKrNI8MMajwh7n+cUUuFZNNMfm6SGCX0K5gZbyLd4RmWlNgx84vB43
	F0CiZFWdY4NzcSikcXkJ1fqPPZWTX8sMcr87Km4xb7PE0qImB3YNH8C/Y2lMXdU9RwTxNL0YygB
	DIgyH0BK9a5GyUgseVwqMsAcUNcJNTf3rJvTjQzYK23JOqSidMUSXpOQd2qVR8kBpOj0Wr6rvyr
	3Owka8pSWZ5zPaLBEvh2RUjdu0gEQm6OFxz5IS/J0blKW/O1CbWzQ8640uNnMwG8UraihbWRbV/
	h/tXyVYhjmJ3hAuxcjYYKmcgzkh7b1tdW+jLkMyIhj4tPiBZcTWpHjvKZgQaaZ3IJ31aarjfzTB
	YaijyCug8JcSZDcdgtrwxEOpLVhz7qWdcBnglMGmlxTiCV0is9j56/0eUScbVNuMH2TG0jpjxLY
	6u0pOI0BHd5oLGPCU0qQ==
X-Google-Smtp-Source: AGHT+IH2+IrFmfi3NKGyj0bnkZn3HYkLAD+A3C0mqqYXS8QhaN1FrkTILMq+H/vee1V6uHXjTUH22w==
X-Received: by 2002:a17:902:db08:b0:29a:56a:8b81 with SMTP id d9443c01a7336-2a3ee4e2e1dmr131365355ad.8.1768223522898;
        Mon, 12 Jan 2026 05:12:02 -0800 (PST)
Received: from [172.20.48.71] ([47.246.98.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81dab89f2a5sm10141173b3a.56.2026.01.12.05.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 05:12:02 -0800 (PST)
Message-ID: <8703d83e-b658-4d95-b6ef-ca5f18aea152@gmail.com>
Date: Mon, 12 Jan 2026 21:11:59 +0800
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
Content-Transfer-Encoding: 7bit

#syz test
diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index 57dfe5f1a7d9..ee41d0469882 100644
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
+	atomic_set(&dev->disconnected, 1);
+	queue_work(system_long_wq, &dev->release_work);
  
  	dev_dbg(&interface->dev, "disconnected\n");
  }

On 2026/1/12 00:32, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    f0b9d8eb98df Merge tag 'nfsd-6.19-3' of git://git.kernel.o..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=11086922580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a11e0f726bfb6765
> dashboard link: https://syzkaller.appspot.com/bug?extid=30b78308ba7e64647ff8
> compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=179ba83a580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=113511fc580000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/4dbba2a806a3/disk-f0b9d8eb.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/2a52c0f94de7/vmlinux-f0b9d8eb.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/5ddf9a24988b/bzImage-f0b9d8eb.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com
>
> INFO: task kworker/1:0:24 blocked for more than 143 seconds.
>        Not tainted syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/1:0     state:D stack:24120 pid:24    tgid:24    ppid:2      task_flags:0x4288060 flags:0x00080000
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   <TASK>
>   context_switch kernel/sched/core.c:5256 [inline]
>   __schedule+0x1139/0x6150 kernel/sched/core.c:6863
>   __schedule_loop kernel/sched/core.c:6945 [inline]
>   schedule+0xe7/0x3a0 kernel/sched/core.c:6960
>   schedule_timeout+0x257/0x290 kernel/time/sleep_timeout.c:75
>   do_wait_for_common kernel/sched/completion.c:100 [inline]
>   __wait_for_common+0x2fc/0x4e0 kernel/sched/completion.c:121
>   i2c_del_adapter+0x640/0x850 drivers/i2c/i2c-core-base.c:1814
>   i2c_tiny_usb_disconnect+0x42/0x100 drivers/i2c/busses/i2c-tiny-usb.c:290
>   usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:458
>   device_remove drivers/base/dd.c:571 [inline]
>   device_remove+0x125/0x170 drivers/base/dd.c:563
>   __device_release_driver drivers/base/dd.c:1282 [inline]
>   device_release_driver_internal+0x44b/0x620 drivers/base/dd.c:1305
>   bus_remove_device+0x22f/0x450 drivers/base/bus.c:616
>   device_del+0x396/0x9f0 drivers/base/core.c:3878
>   usb_disable_device+0x355/0x820 drivers/usb/core/message.c:1418
>   usb_disconnect+0x2e1/0x9e0 drivers/usb/core/hub.c:2345
>   hub_port_connect drivers/usb/core/hub.c:5407 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
>   port_event drivers/usb/core/hub.c:5871 [inline]
>   hub_event+0x1d84/0x52f0 drivers/usb/core/hub.c:5953
>   process_one_work+0x9ba/0x1b20 kernel/workqueue.c:3257
>   process_scheduled_works kernel/workqueue.c:3340 [inline]
>   worker_thread+0x6c8/0xf10 kernel/workqueue.c:3421
>   kthread+0x3c5/0x780 kernel/kthread.c:463
>   ret_from_fork+0x983/0xb10 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
>   </TASK>
> INFO: task syz.0.273:6595 blocked for more than 143 seconds.
>        Not tainted syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz.0.273       state:D stack:26256 pid:6595  tgid:6595  ppid:5924   task_flags:0x400040 flags:0x00080002
> Call Trace:
>   <TASK>
>   context_switch kernel/sched/core.c:5256 [inline]
>   __schedule+0x1139/0x6150 kernel/sched/core.c:6863
>   __schedule_loop kernel/sched/core.c:6945 [inline]
>   schedule+0xe7/0x3a0 kernel/sched/core.c:6960
>   schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7017
>   __mutex_lock_common kernel/locking/mutex.c:692 [inline]
>   __mutex_lock+0xc69/0x1ca0 kernel/locking/mutex.c:776
>   device_lock include/linux/device.h:895 [inline]
>   usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
>   chrdev_open+0x234/0x6a0 fs/char_dev.c:414
>   do_dentry_open+0x748/0x1590 fs/open.c:962
>   vfs_open+0x82/0x3f0 fs/open.c:1094
>   do_open fs/namei.c:4628 [inline]
>   path_openat+0x2078/0x3140 fs/namei.c:4787
>   do_filp_open+0x20b/0x470 fs/namei.c:4814
>   do_sys_openat2+0x121/0x290 fs/open.c:1430
>   do_sys_open fs/open.c:1436 [inline]
>   __do_sys_openat fs/open.c:1452 [inline]
>   __se_sys_openat fs/open.c:1447 [inline]
>   __x64_sys_openat+0x174/0x210 fs/open.c:1447
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f3b2d38df90
> RSP: 002b:00007ffdb4e6d020 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
> RAX: ffffffffffffffda RBX: 0000000000188301 RCX: 00007f3b2d38df90
> RDX: 0000000000188301 RSI: 00007ffdb4e6d0c0 RDI: 00000000ffffff9c
> RBP: 00007ffdb4e6d0c0 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000293 R12: cccccccccccccccd
> R13: 00007f3b2d5e5fa0 R14: 00007f3b2d5e5fa0 R15: 0000000000000003
>   </TASK>
> INFO: task syz.2.274:6596 blocked for more than 144 seconds.
>        Not tainted syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz.2.274       state:D stack:26224 pid:6596  tgid:6596  ppid:5932   task_flags:0x400040 flags:0x00080002
> Call Trace:
>   <TASK>
>   context_switch kernel/sched/core.c:5256 [inline]
>   __schedule+0x1139/0x6150 kernel/sched/core.c:6863
>   __schedule_loop kernel/sched/core.c:6945 [inline]
>   schedule+0xe7/0x3a0 kernel/sched/core.c:6960
>   schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7017
>   __mutex_lock_common kernel/locking/mutex.c:692 [inline]
>   __mutex_lock+0xc69/0x1ca0 kernel/locking/mutex.c:776
>   device_lock include/linux/device.h:895 [inline]
>   usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
>   chrdev_open+0x234/0x6a0 fs/char_dev.c:414
>   do_dentry_open+0x748/0x1590 fs/open.c:962
>   vfs_open+0x82/0x3f0 fs/open.c:1094
>   do_open fs/namei.c:4628 [inline]
>   path_openat+0x2078/0x3140 fs/namei.c:4787
>   do_filp_open+0x20b/0x470 fs/namei.c:4814
>   do_sys_openat2+0x121/0x290 fs/open.c:1430
>   do_sys_open fs/open.c:1436 [inline]
>   __do_sys_openat fs/open.c:1452 [inline]
>   __se_sys_openat fs/open.c:1447 [inline]
>   __x64_sys_openat+0x174/0x210 fs/open.c:1447
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fd7cbb8df90
> RSP: 002b:00007fff0be25800 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
> RAX: ffffffffffffffda RBX: 0000000000188301 RCX: 00007fd7cbb8df90
> RDX: 0000000000188301 RSI: 00007fff0be258a0 RDI: 00000000ffffff9c
> RBP: 00007fff0be258a0 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000293 R12: cccccccccccccccd
> R13: 00007fd7cbde5fa0 R14: 00007fd7cbde5fa0 R15: 0000000000000003
>   </TASK>
> INFO: task syz.3.275:6597 blocked for more than 144 seconds.
>        Not tainted syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz.3.275       state:D stack:26256 pid:6597  tgid:6597  ppid:5934   task_flags:0x400040 flags:0x00080002
> Call Trace:
>   <TASK>
>   context_switch kernel/sched/core.c:5256 [inline]
>   __schedule+0x1139/0x6150 kernel/sched/core.c:6863
>   __schedule_loop kernel/sched/core.c:6945 [inline]
>   schedule+0xe7/0x3a0 kernel/sched/core.c:6960
>   schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7017
>   __mutex_lock_common kernel/locking/mutex.c:692 [inline]
>   __mutex_lock+0xc69/0x1ca0 kernel/locking/mutex.c:776
>   device_lock include/linux/device.h:895 [inline]
>   usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
>   chrdev_open+0x234/0x6a0 fs/char_dev.c:414
>   do_dentry_open+0x748/0x1590 fs/open.c:962
>   vfs_open+0x82/0x3f0 fs/open.c:1094
>   do_open fs/namei.c:4628 [inline]
>   path_openat+0x2078/0x3140 fs/namei.c:4787
>   do_filp_open+0x20b/0x470 fs/namei.c:4814
>   do_sys_openat2+0x121/0x290 fs/open.c:1430
>   do_sys_open fs/open.c:1436 [inline]
>   __do_sys_openat fs/open.c:1452 [inline]
>   __se_sys_openat fs/open.c:1447 [inline]
>   __x64_sys_openat+0x174/0x210 fs/open.c:1447
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f6f3df8df90
> RSP: 002b:00007ffe4db0dd90 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
> RAX: ffffffffffffffda RBX: 0000000000188301 RCX: 00007f6f3df8df90
> RDX: 0000000000188301 RSI: 00007ffe4db0de30 RDI: 00000000ffffff9c
> RBP: 00007ffe4db0de30 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000293 R12: cccccccccccccccd
> R13: 00007f6f3e1e5fa0 R14: 00007f6f3e1e5fa0 R15: 0000000000000003
>   </TASK>
> INFO: task syz.1.276:6598 blocked for more than 144 seconds.
>        Not tainted syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz.1.276       state:D stack:25704 pid:6598  tgid:6598  ppid:5930   task_flags:0x400040 flags:0x00080002
> Call Trace:
>   <TASK>
>   context_switch kernel/sched/core.c:5256 [inline]
>   __schedule+0x1139/0x6150 kernel/sched/core.c:6863
>   __schedule_loop kernel/sched/core.c:6945 [inline]
>   schedule+0xe7/0x3a0 kernel/sched/core.c:6960
>   schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7017
>   __mutex_lock_common kernel/locking/mutex.c:692 [inline]
>   __mutex_lock+0xc69/0x1ca0 kernel/locking/mutex.c:776
>   device_lock include/linux/device.h:895 [inline]
>   usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
>   chrdev_open+0x234/0x6a0 fs/char_dev.c:414
>   do_dentry_open+0x748/0x1590 fs/open.c:962
>   vfs_open+0x82/0x3f0 fs/open.c:1094
>   do_open fs/namei.c:4628 [inline]
>   path_openat+0x2078/0x3140 fs/namei.c:4787
>   do_filp_open+0x20b/0x470 fs/namei.c:4814
>   do_sys_openat2+0x121/0x290 fs/open.c:1430
>   do_sys_open fs/open.c:1436 [inline]
>   __do_sys_openat fs/open.c:1452 [inline]
>   __se_sys_openat fs/open.c:1447 [inline]
>   __x64_sys_openat+0x174/0x210 fs/open.c:1447
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f36b5b8df90
> RSP: 002b:00007ffd7720b280 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
> RAX: ffffffffffffffda RBX: 0000000000188301 RCX: 00007f36b5b8df90
> RDX: 0000000000188301 RSI: 00007ffd7720b320 RDI: 00000000ffffff9c
> RBP: 00007ffd7720b320 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000293 R12: cccccccccccccccd
> R13: 00007f36b5de5fa0 R14: 00007f36b5de5fa0 R15: 0000000000000003
>   </TASK>
>
> Showing all locks held in the system:
> 5 locks held by kworker/1:0/24:
>   #0: ffff8880212a0948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x128d/0x1b20 kernel/workqueue.c:3232
>   #1: ffffc900001e7c90 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x914/0x1b20 kernel/workqueue.c:3233
>   #2: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #2: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1c0/0x52f0 drivers/usb/core/hub.c:5899
>   #3: ffff888073ad6198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #3: ffff888073ad6198 (&dev->mutex){....}-{4:4}, at: usb_disconnect+0x10a/0x9e0 drivers/usb/core/hub.c:2336
>   #4: ffff88807976e160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #4: ffff88807976e160 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1104 [inline]
>   #4: ffff88807976e160 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xa4/0x620 drivers/base/dd.c:1302
> 1 lock held by khungtaskd/31:
>   #0: ffffffff8e3c96a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
>   #0: ffffffff8e3c96a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
>   #0: ffffffff8e3c96a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x36/0x1c0 kernel/locking/lockdep.c:6775
> 1 lock held by klogd/5174:
>   #0: ffff8880b853ac98 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x29/0x130 kernel/sched/core.c:639
> 2 locks held by getty/5581:
>   #0: ffff88814d52e0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
>   #1: ffffc9000332b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x41b/0x1510 drivers/tty/n_tty.c:2211
> 1 lock held by syz.0.273/6595:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.2.274/6596:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.3.275/6597:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.1.276/6598:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.5.282/6719:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.6.283/6721:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.7.284/6723:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.8.285/6726:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.0.293/6836:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.2.294/6840:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.1.295/6841:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.9.292/6842:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.3.303/6904:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.7.305/6951:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.5.304/6961:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.6.306/6964:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.8.313/7018:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.0.315/7049:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.2.317/7073:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.9.316/7078:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.1.323/7112:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.3.325/7142:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.7.326/7193:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.5.328/7194:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.6.333/7234:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.8.335/7260:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.0.337/7304:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.2.338/7305:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.9.343/7345:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.1.344/7367:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.3.347/7416:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 2 locks held by kworker/u8:53/7419:
>   #0: ffff8880b853ac98 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x29/0x130 kernel/sched/core.c:639
>   #1: ffff8880b8524608 (psi_seq){-.-.}-{0:0}, at: psi_sched_switch kernel/sched/stats.h:225 [inline]
>   #1: ffff8880b8524608 (psi_seq){-.-.}-{0:0}, at: __schedule+0x19b1/0x6150 kernel/sched/core.c:6857
> 1 lock held by syz.5.348/7421:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz.7.352/7454:
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>   #0: ffff88802a025198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
> 1 lock held by syz-executor/7455:
>   #0: ffffffff8e3d4df8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock+0x284/0x3c0 kernel/rcu/tree_exp.h:311
> 3 locks held by kworker/0:14/7462:
>   #0: ffff88813ff51948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x128d/0x1b20 kernel/workqueue.c:3232
>   #1: ffffc9000f2c7c90 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_one_work+0x914/0x1b20 kernel/workqueue.c:3233
>   #2: ffff888035684240 (&data->fib_lock){+.+.}-{4:4}, at: nsim_fib_event_work+0x1b8/0x65f0 drivers/net/netdevsim/fib.c:1490
>
> =============================================
>
> NMI backtrace for cpu 0
> CPU: 0 UID: 0 PID: 31 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
> Call Trace:
>   <TASK>
>   __dump_stack lib/dump_stack.c:94 [inline]
>   dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
>   nmi_cpu_backtrace+0x27b/0x390 lib/nmi_backtrace.c:113
>   nmi_trigger_cpumask_backtrace+0x29c/0x300 lib/nmi_backtrace.c:62
>   trigger_all_cpu_backtrace include/linux/nmi.h:160 [inline]
>   __sys_info lib/sys_info.c:157 [inline]
>   sys_info+0x133/0x180 lib/sys_info.c:165
>   check_hung_uninterruptible_tasks kernel/hung_task.c:346 [inline]
>   watchdog+0xe66/0x1180 kernel/hung_task.c:515
>   kthread+0x3c5/0x780 kernel/kthread.c:463
>   ret_from_fork+0x983/0xb10 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
>   </TASK>
> Sending NMI from CPU 0 to CPUs 1:
> NMI backtrace for cpu 1
> CPU: 1 UID: 0 PID: 7485 Comm: syz.6.354 Not tainted syzkaller #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
> RIP: 0010:io_serial_in+0x87/0xb0 drivers/tty/serial/8250/8250_port.c:401
> Code: 75 8c fc 48 8d 7d 40 44 89 e1 48 b8 00 00 00 00 00 fc ff df 48 89 fa d3 e3 48 c1 ea 03 80 3c 02 00 75 1a 66 03 5d 40 89 da ec <5b> 0f b6 c0 5d 41 5c e9 3d d0 48 06 e8 38 4a f6 fc eb a2 e8 c1 4a
> RSP: 0018:ffffc9000f2a78c8 EFLAGS: 00000002
> RAX: dffffc0000000000 RBX: 00000000000003fd RCX: 0000000000000000
> RDX: 00000000000003fd RSI: ffffffff85327330 RDI: ffffffff9aeedc40
> RBP: ffffffff9aeedc00 R08: 0000000000000001 R09: 000000000000001f
> R10: 0000000000000000 R11: ffff888087e80b30 R12: 0000000000000000
> R13: 0000000000000020 R14: fffffbfff35ddbda R15: dffffc0000000000
> FS:  0000555573d50500(0000) GS:ffff8881249f5000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f00b51733e0 CR3: 00000000a834a000 CR4: 00000000003526f0
> Call Trace:
>   <TASK>
>   serial_in drivers/tty/serial/8250/8250.h:128 [inline]
>   serial_lsr_in drivers/tty/serial/8250/8250.h:150 [inline]
>   wait_for_lsr+0x13a/0x210 drivers/tty/serial/8250/8250_port.c:1961
>   fifo_wait_for_lsr drivers/tty/serial/8250/8250_port.c:3234 [inline]
>   serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3257 [inline]
>   serial8250_console_write+0xf81/0x1890 drivers/tty/serial/8250/8250_port.c:3342
>   console_emit_next_record kernel/printk/printk.c:3129 [inline]
>   console_flush_one_record+0x796/0xc60 kernel/printk/printk.c:3215
>   console_flush_all kernel/printk/printk.c:3289 [inline]
>   __console_flush_and_unlock kernel/printk/printk.c:3319 [inline]
>   console_unlock+0xef/0x240 kernel/printk/printk.c:3359
>   vprintk_emit+0x407/0x6b0 kernel/printk/printk.c:2426
>   _printk+0xc7/0x100 kernel/printk/printk.c:2451
>   usb_gadget_register_driver_owner+0x1fb/0x330 drivers/usb/gadget/udc/core.c:1729
>   raw_ioctl_run drivers/usb/gadget/legacy/raw_gadget.c:596 [inline]
>   raw_ioctl+0x17ec/0x2e60 drivers/usb/gadget/legacy/raw_gadget.c:1307
>   vfs_ioctl fs/ioctl.c:51 [inline]
>   __do_sys_ioctl fs/ioctl.c:597 [inline]
>   __se_sys_ioctl fs/ioctl.c:583 [inline]
>   __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f00b518f34b
> Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> RSP: 002b:00007ffe8bc9e9d0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f00b518f34b
> RDX: 0000000000000000 RSI: 0000000000005501 RDI: 0000000000000003
> RBP: 00007ffe8bc9faa0 R08: 0000000000000000 R09: 00362e6364755f79
> R10: 0000000000000011 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007ffe8bc9ea70 R14: 0000200000000440 R15: 00007f00b5510320
>   </TASK>
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>

