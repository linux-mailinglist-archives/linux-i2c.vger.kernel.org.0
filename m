Return-Path: <linux-i2c+bounces-15052-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F97ED12CA2
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08FB9306E46A
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11551359F88;
	Mon, 12 Jan 2026 13:24:06 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9462635971B
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 13:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224245; cv=none; b=QEP69RzTsqDlUCyuD975BA9fHfBQCHHIaR+mayTDV08MFmCf4XPxaDXSHipAohXpq8J3r+6mHi8FQVVwLbYEAdm1KXv7nSuNCyy/OFDIqpe4oO2iujCNv7+SITDrh+ymSKwsj/TFiQ/v8Pq98eCBtCvSGZ966N9Pb/RkJaGvSTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224245; c=relaxed/simple;
	bh=dI0qQ/gthUuSpdAO+vPcYC0bF3hKoy5di8aKUXm160o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=o2z2Yb6zGIujF29GiDWP4y7rcIqfVxyG354g2n3BBuakbFD24rihcuhSxK0VfBU436UNwaxAMxwzGJkuxiI33I0p1b4ej2xyboJoR9ldgtJ9nVN232yn+gmU9LKXCLOX9kkxUMw5gckUmQg9lJJ28b79MOI/KtuE/8JKOg1Sjd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-3fea6c3e817so12578897fac.1
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 05:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224243; x=1768829043;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Qq5PPFdzFMQw5BFvLom5EAoJCCfmWW/4DcqKtyulo4=;
        b=p5WFa+CQpCkwrXfAtrt+uU1Q37FqqARAODd5k7+x15qy8E3zyDvplMIigJw6jyqQXo
         //DydvdeudP82NyUz+v9hk6UnOB5iYv2D5pINd9tzdBkQf9iDQM0dAut32Fmojvq8oQ2
         2I68dZLFm6YrGj5uOnkhqs3XT805/Gf1+uS/FBEqX+fm1KjFOEsO1WrCYoo1FNpo9Fyg
         f/SxW6TszYql85v6XOZ83Jifq9JaijGNUerGPk+0Z5jQ5LlR5nNoOUp7Ha2prG9EkM6d
         u+PkAF10sqIv7349Mozw8jL2vygaTDwLYeB5hNjJnGY4X8iWIhSOE0fzzDOAEAO/Da/o
         F18g==
X-Forwarded-Encrypted: i=1; AJvYcCWR5GdyD/chdKvlH9CGAw5CgNJLKTE8BXH3TuZVzbJt8ZRDKAegrTw4Z1ZrSCDUA/XzpaXpum0RTRE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz7eL2mIRv4+llHLGRf0m3+Ol7j4I4iO7sJwoPBRWcFjw6D36c
	qoN44s3pTOnjkKiCr9sLlnCerZAq27Ug1dqNMfA7M0OrbBZQVY/XAFfHxg6HCOHAZRKYW5t7Qqw
	vNL+iQIBj68kyQEbw/0lj6ipOKxABIOSCPOCe4y1fvh5iqU2olZdzG8aIars=
X-Google-Smtp-Source: AGHT+IEHYcad4nYOub7J/of10vEUHantgA438E+UvdANmU1zG8u6CSsxiqfBaj0oEf6pIkG6exspvZDG1iY7Q0sK/4DJkbbbZwTh
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:da18:0:b0:65f:6532:6874 with SMTP id
 006d021491bc7-65f65326ce0mr5022238eaf.24.1768224243569; Mon, 12 Jan 2026
 05:24:03 -0800 (PST)
Date: Mon, 12 Jan 2026 05:24:03 -0800
In-Reply-To: <8703d83e-b658-4d95-b6ef-ca5f18aea152@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6964f5f3.050a0220.eaf7.00a6.GAE@google.com>
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
Hunk #5 FAILED at 229.
Hunk #7 succeeded at 299 with fuzz 1.
3 out of 7 hunks FAILED



Tested on:

commit:         0f61b186 Linux 6.19-rc5
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=a11e0f726bfb6765
dashboard link: https://syzkaller.appspot.com/bug?extid=30b78308ba7e64647ff8
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17c239fc580000


