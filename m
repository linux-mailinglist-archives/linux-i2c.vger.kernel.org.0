Return-Path: <linux-i2c+bounces-14344-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2A6C94D5D
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Nov 2025 11:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 909703A45D8
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Nov 2025 10:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F82275AE3;
	Sun, 30 Nov 2025 10:08:31 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C58F1373
	for <linux-i2c@vger.kernel.org>; Sun, 30 Nov 2025 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764497310; cv=none; b=ESIMwH53xvYpNH5sVeR+49BkCbv9YgoWIcSFG+fFtJlH6Kxjynadqj6703Pa2tuOv31LSH6QPTgrkrKYLNtT8Nk/Ah32QGFkVOqFVMjzpRpqR5lmEXA4JrD9hoGtr8IxPUiAdV/N4X/bLNhBksJkvnuJWcBKQwn9ycRbXwyHHMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764497310; c=relaxed/simple;
	bh=j3e+pg6mGYDHhDa/t/Aa3f0mefC+V96LEkWZjvXAnoA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=nBvi1kyNeB4Zdb3m6yfuNmERKKbPST8klIPT34ARQCGhQXW9Kr0o4SWh3wcUvqSzt1mQmT7O1k+Ft9I7DcHAEWc8Y/LP+x5MQ5r7JuFi4eJT2qYCKKeYgIj6G3RkCT8Mpfby3aAIyXK+Xlru21kswnq9rYXHZAX50Wa5/j8g5hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-9489bfaef15so184338239f.1
        for <linux-i2c@vger.kernel.org>; Sun, 30 Nov 2025 02:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764497308; x=1765102108;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mLPMd7aNNFQBM6NzdgKIZtl3Df8TeEoQAeaK4fVgfUs=;
        b=CRK05PVuEHjoTonzQmfrLELn96T+ZYyFdkQgCAg6Nc/uHJLoR9B0GIQswaFQHfxl5a
         Y1JoD6gV3A2kEMiRoewJCLtduGoQZP7iCKuzfmpkVHqEI/gp7Na/JT4UGLYfm/iwXuIK
         /aF6NKvhxp8pthxOwPfTmaV2g2nboohGiPPtoAJunLnsbhby1SaD4W7cxAM45nDNgmiU
         Nc3rgiLEMX7f3mIU/lJmXc/dqWnKDkP6DImWmE9Y0gdJ6pySQeze3bF8HzcqQ2srqT6T
         OpWcW09Z+/1uBijEpNgU9w+Ft5aS84NEKgqCQaeSnXsbcorLzUT8QzYmocJH73oTC9zI
         1D5w==
X-Gm-Message-State: AOJu0YwNwBNI68SjLQ1nCfID8/kgFLqn0wCVwyfA60XRbrCk1Az5nVW0
	tgT4Y38qXfFgEwgsped+KERBa8I4tQbCZI+mxB4CV6PTNQFxWvfjAEZUy68xAmhKltHHX/FuPCh
	oWKbpiJ5LU+Jl+0CSA0g1cxf2hhmclV92NLaC70Gc3AWrkWfOhSvq6kcRloo=
X-Google-Smtp-Source: AGHT+IFdVCabjYRZI9pOrqyCrmhp+qHUsferhxKAQXz8mwez0YP5AQRUUxdpKvACT3dOC8USAjcPtgqiFLo1YNFA4pQY8ltOMHw0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca08:0:b0:433:3316:17db with SMTP id
 e9e14a558f8ab-435dd051100mr161999435ab.4.1764497308345; Sun, 30 Nov 2025
 02:08:28 -0800 (PST)
Date: Sun, 30 Nov 2025 02:08:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <692c179c.a70a0220.d98e3.016a.GAE@google.com>
Subject: [syzbot] Monthly i2c report (Nov 2025)
From: syzbot <syzbot+list2708e05be624cdc9b45b@syzkaller.appspotmail.com>
To: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello i2c maintainers/developers,

This is a 31-day syzbot report for the i2c subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/i2c

During the period, 1 new issues were detected and 0 were fixed.
In total, 4 issues are still open and 4 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 750     Yes   KMSAN: kernel-infoleak in i2cdev_ioctl_smbus
                  https://syzkaller.appspot.com/bug?extid=08b819a87faa6def6dfb
<2> 84      Yes   KMSAN: uninit-value in __i2c_smbus_xfer
                  https://syzkaller.appspot.com/bug?extid=0a36c1fec090c67a9885
<3> 1       No    WARNING: ODEBUG bug in i2c_device_remove
                  https://syzkaller.appspot.com/bug?extid=7e6ce34763ef58212c4a

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

