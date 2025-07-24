Return-Path: <linux-i2c+bounces-12026-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42244B10DBF
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 16:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40AF11891B8D
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 14:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033202E041A;
	Thu, 24 Jul 2025 14:37:05 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6525F274B27
	for <linux-i2c@vger.kernel.org>; Thu, 24 Jul 2025 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367824; cv=none; b=sXsjj2ypCpqff1ztqScle7rFiEz6V6h4KrjP+19SjvjylFA45m7oawzO/5wPr6qucQSm+2iFzbwKUFehnaEFB90fWQWUn3k8UVRIaU2rP5yU0LUXEa0zO/vO3ZCkCZTBQc1y7ZC27D8fYHWsP8SUrdevSQl/v9SDrVrUbPvjQPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367824; c=relaxed/simple;
	bh=lrZGovMfzr3uWw6ywdu3gQ7QC2dY2ZiLkUdsg73gBYQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YDMGbs0g8X02VuvM9M6hpOV0WB3lkyZw0NPEz67SaODgrM4UfofhijU5xOep94tBIPlsRDAJBC3iR6xvutB68L8nXw28fRTEw61/pbkZz2VcTOGIoIXkzil1CB64pad0KheFEJIR0K43ymiVmJe7r7b3/t3I0oIMo8NY0FQPIws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddce213201so11600035ab.0
        for <linux-i2c@vger.kernel.org>; Thu, 24 Jul 2025 07:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367822; x=1753972622;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VnsYI8YKyGb65+gy6ObeUjKR0Rc4w8XZ4XYDxw2JU78=;
        b=Po6s04DVG8dttnyyq6LiakMNYhOqyjcDrq9q7NGZr6Koffj83fEUmLDFDkpPzUx9fx
         +xTVBaAuNdeHW08OK0LVHYDQwgbt7b5BuFAAdZDaIr2JC5dLFHcgy9/fMk9R/aaahxbN
         f4yMVUnZY15Gomt8ZqkG3O59kuWWjKAnB9uJrPstYueUMPyRZRq5qgxgTN5u03YN/Oyy
         m2Zl99EUu5Qg28r8FwMvt093VefM0VWbsjIqy6fVmiNX5hrNWP4H7Ka0qWiNLdBSckSw
         Yu9qE7YVOcnOwTv0eFCLZOu993B+vNmmTFGj9o4BU4wYTs82FtHFI99reHrVohoWjQNA
         AQvA==
X-Forwarded-Encrypted: i=1; AJvYcCWQdFz05lHMuk6ZTBKhH/z6zg5VEaGzV2HAUCT+JYdoVhW243P0sJSeviIzly1TwITokd2+6mi3XGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZagr6mu+EV9l4079o6jgyc+hCRecImv8latXl6rYq4pV67GLy
	bdP2P1h5+Xy64L6tDRXebBbATB/A2FOgodv2CfLyJaGvrAM0KrrHedZjTI4ZkUf384IOo/w0lx0
	2rYF8yDX36QUp6HC+cbP4+fkydyjfDKQDLrH9B2RHNm53VwuXrdjxLR/NlFc=
X-Google-Smtp-Source: AGHT+IERoU1yT7l8iHA7Ue4j2KCrPAHlncDFmBiCxEjvwU8YdVsV4w5ZKsyuZX04fkC70WLhUX8b5zz2uwits1ygwE6y0PLFxSFZ
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3497:b0:3e3:b4ff:15e3 with SMTP id
 e9e14a558f8ab-3e3b97cf3bbmr31859135ab.4.1753367822441; Thu, 24 Jul 2025
 07:37:02 -0700 (PDT)
Date: Thu, 24 Jul 2025 07:37:02 -0700
In-Reply-To: <681853be.a70a0220.254cdc.0045.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6882450e.a00a0220.2f88df.002a.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in osif_xfer/usb_submit_urb
From: syzbot <syzbot+4687ab80180e5d724f51@syzkaller.appspotmail.com>
To: andi.shyti@kernel.org, gregkh@linuxfoundation.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 56ad91c1aa9c18064348edf69308080b03c9dc48
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date:   Thu May 22 06:42:35 2025 +0000

    i2c: robotfuzz-osif: disable zero-length read messages

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15b114f0580000
start commit:   4f79eaa2ceac kbuild: Properly disable -Wunterminated-strin..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=a9a25b7a36123454
dashboard link: https://syzkaller.appspot.com/bug?extid=4687ab80180e5d724f51
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103081cc580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17ba139b980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: i2c: robotfuzz-osif: disable zero-length read messages

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

