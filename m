Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C86B646D8E0
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Dec 2021 17:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237056AbhLHQxy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Dec 2021 11:53:54 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:33753 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233028AbhLHQxx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Dec 2021 11:53:53 -0500
Received: by mail-il1-f197.google.com with SMTP id w1-20020a056e021a6100b0029f42663adcso3912989ilv.0
        for <linux-i2c@vger.kernel.org>; Wed, 08 Dec 2021 08:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Y2MKn0H4DmrM0L6Iz1p6QeMbYkp5ONn3ncEFOG9HuPY=;
        b=OOy31vEMlVire6/NmXAAHX1l30wFYGXkhDb41SIJ3siR03uwjXXPtgy90ok3q7AZFE
         sxQL7bSbITZUC+kcDNi8LQnTSHQo1XxIvKeT+dx2FSf28+TJEsEKtjyTUPgzhYzm0g1z
         0BOLFST1qoJEN0UQnKOAmb8VS3Q/+PxZMr+PRhp4w83RwAa9xb8xYOg0QnNUAQGXsNrX
         ojWcW281v94tfRpafa0V6K8fyCrRQKweawXPfGVaxpXZ0r4M0kzQRoDyR9GW1apxSxiB
         BJz4TyvMijMER925rEBfpNZj9wcRFNF1UfZXz50OraiDw7Sd/1SLnqrm27NkAt5F6KKk
         hjxQ==
X-Gm-Message-State: AOAM530Mju17dhVxwlJtdK2T03AvN4SwhyrjoMA6MjwiRDfCX1R8qmAz
        aOxJzxFVO9fqr+l58d+/JZMDwF4q9LxaMVfdVu4Y7zNsaFzZ
X-Google-Smtp-Source: ABdhPJyc/riIjsNBQquRKBx3zhx7T0mOnltc1lRv7qgl6QjY5+31fT0TFfCdocEuGFSE/lTjXS8RldIflBOMK6IqQjFPpAs7TNHi
MIME-Version: 1.0
X-Received: by 2002:a92:d8cf:: with SMTP id l15mr8724262ilo.59.1638982221538;
 Wed, 08 Dec 2021 08:50:21 -0800 (PST)
Date:   Wed, 08 Dec 2021 08:50:21 -0800
In-Reply-To: <000000000000b5e7f105d0d2d165@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001bab9705d2a549cb@google.com>
Subject: Re: [syzbot] WARNING in __i2c_transfer (2)
From:   syzbot <syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com>
To:     dwlsalmeida@gmail.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab+huawei@kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com, wsa@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

syzbot has bisected this issue to:

commit f90cf6079bf67988f8b1ad1ade70fc89d0080905
Author: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
Date:   Fri Aug 21 12:58:47 2020 +0000

    media: vidtv: add a bridge driver

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=152b58b1b00000
start commit:   cd8c917a56f2 Makefile: Do not quote value for CONFIG_CC_IM..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=172b58b1b00000
console output: https://syzkaller.appspot.com/x/log.txt?x=132b58b1b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=221ffc09e39ebbd1
dashboard link: https://syzkaller.appspot.com/bug?extid=e417648b303855b91d8a
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17a68531b00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16b91d89b00000

Reported-by: syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com
Fixes: f90cf6079bf6 ("media: vidtv: add a bridge driver")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
