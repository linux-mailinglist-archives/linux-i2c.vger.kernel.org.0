Return-Path: <linux-i2c+bounces-10018-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26861A709F2
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 20:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A992F7A40F5
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 19:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6C61ADC86;
	Tue, 25 Mar 2025 19:07:04 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED44198E6F
	for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742929623; cv=none; b=cFK01GkUk2fBUniMrpNowI92oI0TBTXfqv3Lm0tG2ZIdCo1nwQ2zGzS4Tsp09RT8y0vXsSPuXjMLyvEv47TuCSdtqkNXqLYpoijo5tu73USFCO9+CvGcGRilBHjzQdhSA11uIFB3Q35B1oC4h6ihny/A3a/r6k25qbML9lgijro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742929623; c=relaxed/simple;
	bh=WOM/LLp0RgmVJoWJDMoK3chj3lsZU2VAedMMvNUKJrk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TOLKdWbzLqV28ofJuPZNdkOzv5GsI5IU2sSDqw1zvLINgrET3WACw8dcp3VAslfzb6ZFpFxV+jXxkDloT/ClghJMchY0VtmdE4DI1LUO0Ww3gPyfuAJ1FCQjSbCtHS8o+2ELNtXUdBnWZ1d9x5ADSYFULha6ski5kVkEdDNz92I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d5b38276deso33494255ab.3
        for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 12:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742929621; x=1743534421;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsIsSKwvnvgu9UvmVVPieDuoJRM8nMXrJ64iZfB2uCc=;
        b=nPoaBcTaJeFFVM/GpxBoRnlUbdKr4baT9ZwoORV+ftc5sGSxoO/2Y8SP3cz0wR7+Xz
         7zAqWnKUi3HFq43PEzNMaMsewOOVAD1gMmxbgAUhv0jLaZQuvq1864AemLY+7F3XSLnH
         Jg20LMH1Fh5lVi/54fkUECaOV3Ht1YW/PmpuyNQUrOlfetM+CRmWwywyrKhsAV9yKpqj
         etcsDUE0frreRBq1T6JG954G+IAe7lkMGQANY+oVI8MjzZBb379jABRzwkyMkLftY6Aj
         VfYGQ+j+Wg1uoTgDKR2OmMINTH0RS2+lqJbrS5NKn8KF/s16QIG8H3rMbpyLMadgN/ZV
         YLGg==
X-Forwarded-Encrypted: i=1; AJvYcCVzCkUeUCS3uxN10w4Fb4lyH7mwyXqyEmQoBYeg/ckZ0ASPfdOPnaamFZeuQNaXnGISnQWdDKU2q60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3pm2sVGY1S1WQLwgBK6svUy62LqQpZN4MD3xDa8dU5TzUvxhU
	PuP3YIKoO/3yHlfab9cBnwrIsWdXdXdmtizl8nWz3/Ijrzx7tPgdxMVaPvFgZoTH7bgxEn55Dbj
	GIU4qiXsoEftKKi5Df9q7qds3jZA3VWFcYlbARI+wdrBzWJK8VkWyslw=
X-Google-Smtp-Source: AGHT+IGPKv4GLrmy6f48OwPKgG50sMNIwGNkNf1MrfozlyeG1piUknHPlp7DUKLvYSUoScAO8IdC/7+fA/Lmxz1Tf1C42fuLvLTP
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2683:b0:3d3:f7ed:c903 with SMTP id
 e9e14a558f8ab-3d59605a645mr207012955ab.0.1742929621482; Tue, 25 Mar 2025
 12:07:01 -0700 (PDT)
Date: Tue, 25 Mar 2025 12:07:01 -0700
In-Reply-To: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in dib0700_i2c_xfer/usb_submit_urb
From: syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com, 
	wsa@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com
Tested-by: syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com

Tested on:

commit:         5fc31936 Merge tag 'net-6.14-rc8' of git://git.kernel...
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17c1324c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=27515cfdbafbb90d
dashboard link: https://syzkaller.appspot.com/bug?extid=c38e5e60d0041a99dbf5
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1459643f980000

Note: testing is done by a robot and is best-effort only.

