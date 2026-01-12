Return-Path: <linux-i2c+bounces-15055-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A672D12DEC
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 668B8301AD0F
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4D635971B;
	Mon, 12 Jan 2026 13:41:04 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7DA3590D6
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 13:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225264; cv=none; b=qC/LxiMF7vShV/6FjktmWPTeCgpDPdToZxw8gDpN/0L4+QYt23S6GM39XOnRaeH+GGVdpifnap+bdXBHUBVKVeM1ChNjuzTsTso3GGBk0mYpjjumO1NRvcYl71/ab4YKYg2DPSUC+IX0UJBHupoUwY2LShaoM55bJi1FuAudLSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225264; c=relaxed/simple;
	bh=KgTh9aCEqjNU2kxsrdUR+JkcdulufP+E/YocR2xtRTo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uzaEbD0JdJ37qtchcjzTQ/XzG3D9qEjD1F01s2n19vBxqNY6bGfmOiTzMbFiPvRiPRCOfE9m1lsrxfeFnGk3XxyRGLdTS6OEFBuHDJOPE+pdVo3ZYEbYw9Er7lLwTYdjLEioHcc26FWXEeiXLxVwqEzqsTOaA3uLKiYiYsKn+UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7cad3d056c1so11703561a34.1
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 05:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768225262; x=1768830062;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QspblaVrcctTuoZnnAEVSzWlz1BYC/eFYlE+b1V6Yow=;
        b=ahIezYTBZXzkNpJ9uoymlUJPAFi4JZvH6Pz6FSAGIyw3Z1WIkZxTJceMuxzWNLIdD7
         U7jdM5s6PaydJfZs5y2t2/GqeIZGfEZwkjTmOsFJ77pO0NoCkN5OcxSH7CHiMSgD/vvJ
         sEM/N5oD5vSBhZDXUuelkxs9yo2KYztLaVkofCb3iq9A9VVdIFC7l+cQoiWuT2FSAttQ
         S/bP874k94fThJUZleRd04CBMi9CxU3V7nXIG2rwta3G3IWlLcaq6agzyTfhBBpJTiYf
         8fAKQtNDhXfGRc80WYkyCzJ+c7KmJnN5uBQ4zi6OKmye94r5bsEyzylp9/YMpN1FMTlP
         a+qg==
X-Forwarded-Encrypted: i=1; AJvYcCWE8oDTiTzrloLLRr8sb5rn22lrexBfiDmluS3obSGDui8Ud14C16l9TglatIsrCl7tBoqzX6w8SO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzobhsHFt6/K8h8ukxvaBbDnjk/aeqaRVCgVl447jR0a5RBEUqd
	bwy/PCjVH9q6/JtkrIh/DnvQDr5scs+27YvM9b/NG96wF9lDGLQxIPwICoDetm/RYhthgrGK5gJ
	wxY7uVYWfVV6duIWBCEIli1CUugbwmDQiGa8jcFTCQ84pUUAlkks8+9GEdGU=
X-Google-Smtp-Source: AGHT+IHTXjk5oZQ7seUTprYfSCUhEHDbGFAFJPc68UoGeHYjzSdRKJfD8bQ/HwaHFYoC3V0p2z/3K4pf5JNWAwz4ADZ1t3etM8MS
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e645:0:b0:659:9a49:8e15 with SMTP id
 006d021491bc7-65f481b999emr10169173eaf.7.1768225262287; Mon, 12 Jan 2026
 05:41:02 -0800 (PST)
Date: Mon, 12 Jan 2026 05:41:02 -0800
In-Reply-To: <1d3ebfdb-2c12-4388-99bc-3cbcc11eea79@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6964f9ee.050a0220.eaf7.00a8.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
From: syzbot <syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com>
To: coderlogicwei@gmail.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file drivers/i2c/busses/i2c-tiny-usb.c
Hunk #1 FAILED at 12.
Hunk #2 FAILED at 172.
2 out of 2 hunks FAILED



Tested on:

commit:         0f61b186 Linux 6.19-rc5
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=a11e0f726bfb6765
dashboard link: https://syzkaller.appspot.com/bug?extid=30b78308ba7e64647ff8
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11d9b922580000


