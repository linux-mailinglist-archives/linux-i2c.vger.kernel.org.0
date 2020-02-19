Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C887164089
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2020 10:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgBSJiu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Feb 2020 04:38:50 -0500
Received: from mail-lj1-f175.google.com ([209.85.208.175]:39051 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgBSJit (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Feb 2020 04:38:49 -0500
Received: by mail-lj1-f175.google.com with SMTP id o15so26325676ljg.6
        for <linux-i2c@vger.kernel.org>; Wed, 19 Feb 2020 01:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Aqb8hCUjZhy4zZZbMwx1aD9r/DbIZtj+UUXgQci2n5M=;
        b=jPr6F4/AwBWxBmww6n993pa6stYiWQG+moMhrkHJXQaj5tYk8boBA2lGJiG45Avjkw
         c2o2c15W8THMmvL3RH6DarJkuu5jKmhbq5XXvcE+oCpPF2yTD4dp2VoUnv/bipFntRGq
         VSeBQu/4macgri4MfG2lVCBQ7Wcj51Vd7EK8As6hgdxNTVjlXJvrsorirR0XIX1vjlSG
         kiHuVtl6NytPJRxoZm5zmqvbjDAcALeSDwS668HmQAa+cCeHB5JMMcS6zF2HTa4cyDKA
         0UCTqknkbW5ngs8oh4zH582WSvY1jZMhXU+Zty8b5HdLKqRSWCVP5VbQh0CocZmXVMEL
         y1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Aqb8hCUjZhy4zZZbMwx1aD9r/DbIZtj+UUXgQci2n5M=;
        b=M/grnln5iIoLDz6EsZ1uhJleAMmWTW9gSh/XFsJHbtw1uczDR00w+qG7m8W8pKtlrt
         dgoK4j5pRm+4ByMV+DshP+p5gqq/eUjb8ZrdFFmlJVOLfZpTZs/YE3pEueNUjT0ziK3D
         UE+J0cnZjQCjsUU2Ks/NgmyFD2TpcHjW0gZljOAlecCTwjXuHmFOfh8O12UJUgmjxxVb
         Y5e1cOoyBmPEthMIFs+0f2O3vkz/v32FK63gjJxeCGLmtgibiRs6a0/Ctw4iumUJIUFZ
         QoUF+vJsWhgu9V6c0wmCHQUGoZ6VSOtPnaIvCXqX8vTZZv2ImUDe2/gEtWwPAxwo30hn
         RqMg==
X-Gm-Message-State: APjAAAUhE+++QeppOUFu2f/cp86FZOezMgT2YPHtTHFZRjPdYuvYnHoi
        famPfiHkNThuqfDJLDn22jEwNzfScFFKVRgVgCX6jckh
X-Google-Smtp-Source: APXvYqxmzVb8b77JLTvnWkBzR21GcOdTEnZ3psyXppsqoBMefL57hri2d8l2nJmbZfNQEh3h7LJr1zBwsKqrKJOonFI=
X-Received: by 2002:a2e:3619:: with SMTP id d25mr15052406lja.231.1582105127627;
 Wed, 19 Feb 2020 01:38:47 -0800 (PST)
MIME-Version: 1.0
References: <CAHb3i=uXLgjT-emHeJzHGG5L_0z94ZwDYcX5vtaDf8+Eh90ziQ@mail.gmail.com>
In-Reply-To: <CAHb3i=uXLgjT-emHeJzHGG5L_0z94ZwDYcX5vtaDf8+Eh90ziQ@mail.gmail.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Wed, 19 Feb 2020 11:39:24 +0200
Message-ID: <CAHb3i=vA76p6iXt0Q8ZECSj8r_Ltv_c7U1W21r_aD4HsLuJPrA@mail.gmail.com>
Subject: Fwd: npcm-I2c driver
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Just a reminder,
please take a look at this patch.
This patch is a new driver for npcm-i2c.
The patch has been waiting patiently for several months now...


https://patchwork.ozlabs.org/patch/1198846/


Thanks,

Tali Perry
Nuvoton Technologies


---------- Forwarded message ---------
From: Tali Perry <tali.perry1@gmail.com>
Date: Mon, Feb 17, 2020 at 3:52 PM
Subject: npcm-I2c driver
To: Wolfram Sang <wsa@the-dreams.de>
Cc: <linux-i2c@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>


Hi,

Just a reminder,
please take a look at this patch.
This patch is a new driver for npcm-i2c.
The patch has been waiting patiently for several months now...


https://patchwork.ozlabs.org/patch/1198846/


Thanks,

Tali Perry
Nuvoton Technologies
