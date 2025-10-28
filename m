Return-Path: <linux-i2c+bounces-13853-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0953C14C3D
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 14:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66C441B252E3
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 13:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9BD330D25;
	Tue, 28 Oct 2025 13:08:33 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121CC308F11
	for <linux-i2c@vger.kernel.org>; Tue, 28 Oct 2025 13:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761656913; cv=none; b=pffsgDuon1qeQGxaVY5w/PbOxLI1vNDNBfA/EZJeCqNpL/mfbdiMpP8V/erj8hYi00UeQdc2eiZ4XVmZutZRgCVUwKuWNAyrcfYg8dx1fueVMQS8lINxPkM8D1kZUAVw1deH/ahjZxHoWnAly6+WTKdQI+QwreFVKC5XM07pit4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761656913; c=relaxed/simple;
	bh=xLHgF9+jSMNtBQ2sQ0wJ+W+4e4IrQ/mAuGOKtLd2Kc8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RgvJeFPT7WVJmY0j0xG57ZTHlr+zOcjMW0aEdhuGYf9gwFVw6O7AyhjcjGO2VTOp+JiUhnwOKpwzbLHSzo6gDLWyPWBWwUL12ParYC1Dynu9zHSPZEyknuRzgPBt5z1tZwlBbXDZKUNmU2KrOtn/mmu3bMc0J+pQdCtr8I06ZF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-430db5635d6so74620595ab.3
        for <linux-i2c@vger.kernel.org>; Tue, 28 Oct 2025 06:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761656911; x=1762261711;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iEMDpGeJcdM8ih4UyCIvTGZihHZxrUOC2mI8PP6H5/E=;
        b=tnCB8WKB8G/r+6L4zuCiuIdrAglR8FpDHAUW2iVT2HrarjpgBBRkGzuAYkydcsF2od
         vaJtqkDV5FVANYYPIMl8YaswUqVNUMAt3nNhdXwUZ47X/3hyYa0P/X84r9TNP35T/hKJ
         LKEAjB105wKP+bVUrsUcjdvyCujR1GyPlwllXY4YQW6Za5FKD+4wp4yG8T18vcYIpsrq
         ein2THJTM+6VQwVBJAzY4QIIdprbpLNbJKixgtNueJPpXKD5Uw4m7Cjmg4uiZUmvODAU
         pVpXBEs4/WZEqr8CQFnt8yduImWoMq+26csMMK0zcbnb1vMUHJcXt+DzXxX6ZLUKw6OX
         kUyg==
X-Gm-Message-State: AOJu0Yzata254zBu1Oh79u7WbPRKcJjgwono3kk6NvRSDhVbb1C6KoL0
	iAvMulZzBR1G1Q5p8VAl+XJMdLuzqJ/b29Z5AIvaEJyzae5+f3LsNYN/AV7Qp7PV9MjETcCvFju
	AAr8Xv2cQytlJ4JP37RkPyc/i0dOhNZeKev8OroYUIfqVy7IePfo/HLJDrmg=
X-Google-Smtp-Source: AGHT+IFY6RHhEJTH7EjQ4I5zlecu14QoNUN/CBaxVE95ObGYvwHDrk96i31CRuo4zfx/IG3j/sQ4L/FceqrabLxyRTq00n6yVa3q
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3009:b0:430:aec5:9bee with SMTP id
 e9e14a558f8ab-4320f6a7762mr48011265ab.7.1761656911151; Tue, 28 Oct 2025
 06:08:31 -0700 (PDT)
Date: Tue, 28 Oct 2025 06:08:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6900c04f.050a0220.17b81f.001c.GAE@google.com>
Subject: [syzbot] Monthly i2c report (Oct 2025)
From: syzbot <syzbot+liste32750d0dd9019b06ac1@syzkaller.appspotmail.com>
To: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello i2c maintainers/developers,

This is a 31-day syzbot report for the i2c subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/i2c

During the period, 1 new issues were detected and 0 were fixed.
In total, 3 issues are still open and 4 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 682     Yes   KMSAN: kernel-infoleak in i2cdev_ioctl_smbus
                  https://syzkaller.appspot.com/bug?extid=08b819a87faa6def6dfb
<2> 65      Yes   KMSAN: uninit-value in __i2c_smbus_xfer
                  https://syzkaller.appspot.com/bug?extid=0a36c1fec090c67a9885
<3> 2       No    WARNING: refcount bug in i2c_get_adapter
                  https://syzkaller.appspot.com/bug?extid=76501d32a94a432940a8

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

