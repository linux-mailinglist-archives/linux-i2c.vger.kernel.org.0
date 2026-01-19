Return-Path: <linux-i2c+bounces-15268-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A45D3A95A
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 13:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 009A1309CB58
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 12:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C95035FF65;
	Mon, 19 Jan 2026 12:46:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D8135EDBA
	for <linux-i2c@vger.kernel.org>; Mon, 19 Jan 2026 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826787; cv=none; b=DmGhuLittuqDRJRahp20pk2HEiCkYRwwTYPqn7o8WAa9LcIesqcCu1IRB9F+9AA8DrFYpENo27+K/zPGHSihZ6RhSlUTYW9TxBxz7y6AhN4X54jY8LAof/DbDlXQzefOmPvTguP2I8Gl8Z20hIYN35q2u2ndBH12gdW5bBXxZxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826787; c=relaxed/simple;
	bh=VynyOq5eNt7k8lABQPh5UVRXFOYbtiUHRfMzaUJ+qhA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Ik7Ce0cBVELt/Q3Hu65ef0syB66OnsJy61Lt0taHdqJ0HVAvDmFMGK9qYNyIetN65ckzHrtparYJHCm8c2F+sIfDIqRd/xupMmUH3NEl8rJvfOJ92cVdjqP9n5KxO0Uxv4v3GtQAiB9wradyMC3G1RbxGoL2STF27Lqvnej+9q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7cfd14607b0so7904999a34.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jan 2026 04:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768826785; x=1769431585;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ufA+U+Qi1VJL0gtcSKv7pb7miX4NN3f0kCP8qtgeZ4E=;
        b=JZNkq15PMeHBxYho7hYMZ9KaiHwiGQcHENALDS6Z0QuhbuAqnkwGKB2jcUBEtZ3C2U
         rA1q0IlYPJBbN0/jv3o67YIyjtsYlgxbgeEyqY4H/Xe2qSXlGH6NC2apcwG88xPLkKvn
         x7oYM6BWHsiTZ73IpOgtyS9cUiiwy8Me/dNV67rCRQjTbc+wmWmc7Kum3UjMQ1w6MpIJ
         03Yp7ozfho3rNDr9AYdPPwbbh92S1WFNx4QFEYUqELhiJEL24wbpVSolWbL6mVaN29Tx
         pMW9XOAVxANkV+P7WETn/Fx5BnxSuA3kHOK7AsXSr/dL/9tyEb4Hb7065EUvelGEhjlo
         SsIg==
X-Gm-Message-State: AOJu0Yxo+3LCBk20PwFj/I0xTq24kTqXh059OMaSWYCphDhG7mUrujjs
	f0cftLzeYV0eL0p91Q4RKH7H1WqhlfTYX1VAYj7fcf7ePz9wFbmp28Lh8VWHdNmgnKhplbehyhS
	TGxLEbBEjSIxgcH7yoWTYWfZ2rCj+iTCB45w3Za7RW6D0nI+JaRAsfIsXBbw=
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:6ae3:b0:659:9a49:8e02 with SMTP id
 006d021491bc7-661189b2f4bmr4976810eaf.68.1768826784860; Mon, 19 Jan 2026
 04:46:24 -0800 (PST)
Date: Mon, 19 Jan 2026 04:46:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <696e27a0.050a0220.3390f1.0049.GAE@google.com>
Subject: [syzbot] Monthly i2c report (Jan 2026)
From: syzbot <syzbot+listcfea26b37e6395424056@syzkaller.appspotmail.com>
To: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello i2c maintainers/developers,

This is a 31-day syzbot report for the i2c subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/i2c

During the period, 1 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 4 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 848     Yes   KMSAN: kernel-infoleak in i2cdev_ioctl_smbus
                  https://syzkaller.appspot.com/bug?extid=08b819a87faa6def6dfb
<2> 103     Yes   KMSAN: uninit-value in __i2c_smbus_xfer
                  https://syzkaller.appspot.com/bug?extid=0a36c1fec090c67a9885
<3> 4       Yes   INFO: trying to register non-static key in i2c_register_adapter
                  https://syzkaller.appspot.com/bug?extid=4718cc0f82054afeea8f

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

