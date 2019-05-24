Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E286B29045
	for <lists+linux-i2c@lfdr.de>; Fri, 24 May 2019 07:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727243AbfEXFFr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 May 2019 01:05:47 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:45240 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726601AbfEXFFr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 May 2019 01:05:47 -0400
Received: by mail-vs1-f65.google.com with SMTP id k187so4947512vsk.12
        for <linux-i2c@vger.kernel.org>; Thu, 23 May 2019 22:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tKVly6OsjAP22H8YmM5rdYdS5YdPghJ8QErKTSHa7AM=;
        b=YYbVYxF6Q9/uYNoqs8vrH9SJmroJSJaP37lSIzKdWSzQBcJ/xpe2IYe/QqzKtLyQQD
         +mgzMgT2mWRdPK2QGhjlfc3yBnWAp5Ugakm4AXKL10W+s6VPjL7KSE/mPQqdO2jAuY9R
         jf4ODaHOOT2EB/XZicSIGzsKK8LptVeP+GAkepgZi4qO4rN/gLOtSbDi0mtSiw5If5Vl
         xWec84BewQq084f38kXoEm2IzhMH45y7lMNMpOu6fWzJsvZC8dynWdPX2BRPH1exFtTS
         6ObR92e+wS3VYIC0gN9Rx7wm/IRdcq5Vc0Ji0MLRNS/TOHs/bRN/0WfvlzFiBfPd18Uj
         7+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tKVly6OsjAP22H8YmM5rdYdS5YdPghJ8QErKTSHa7AM=;
        b=ni5ydUvw05nIkJEBvhoeiIHcU2Fvfa5bepDwemseX2++fCPdjUrhfasyqPU5LS7Xv0
         ShpAfLmE3KyrcAgwETUhFhv49B+3BO8kHdTOXIxhcBLgHgxlhEIoKx5qtx1feqe5ROzm
         d6rXAfv0eLOdCWPMHvdAA65u4UXYKQ3SUkA8JzI+S6RLZQ2FiYrVFvlcB/0NSiItZNnu
         IRr3m1NgplbXvM3WsLbWSbN8q98LgENDOE+4i4jtv35jThRJvZRoFEY4A/KrZcPw5CfZ
         hZWP+xGaiLfCuZ0w7dtV38N8otoWViqCc3meb++te8jEvZ5N9ZtBn2RK9xs4unPfXNHr
         FsVw==
X-Gm-Message-State: APjAAAVLgL9WzGtk3aAbslHzzIsUrJZRWhmAXx+H1EvZm5sfTWL7okTj
        6XYVXhQkB7Z+TM0kNBWtrRlBGmy5NsAl5kIO+JBiQ7n4Pt8=
X-Google-Smtp-Source: APXvYqzGNNHs++eX29nKjNVR+rLrBktRKrwzetThjxGfSuRn9WRNWCLdhEHXEO68Z8lWnHq60qbFVQOvuEi4IDCpLJo=
X-Received: by 2002:a67:ca9a:: with SMTP id a26mr21338403vsl.92.1558674346247;
 Thu, 23 May 2019 22:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <1558515574-11155-1-git-send-email-sagar.kadam@sifive.com>
 <1558515574-11155-4-git-send-email-sagar.kadam@sifive.com>
 <20190522194529.GJ7281@lunn.ch> <CAARK3HmMVibudG2CFLBoMSAqnraXyirTL6CXYo1T_XJEuGJy7Q@mail.gmail.com>
 <20190523123435.GA15531@lunn.ch> <CAARK3H=BPT3aGUGiQvov5aqFRNVTSeyqJ-bNGw6uEoU7c8iiJg@mail.gmail.com>
 <20190523135350.GA4985@kunai>
In-Reply-To: <20190523135350.GA4985@kunai>
From:   Sagar Kadam <sagar.kadam@sifive.com>
Date:   Fri, 24 May 2019 10:35:35 +0530
Message-ID: <CAARK3Hk42cAPwiLiKMRJgau3WesCEtQkpvaG_KwMCfnV6ih3PA@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC.
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, peter@korsgaard.com,
        Palmer Dabbelt <palmer@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 23, 2019 at 7:23 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > Ok, Great. Do we need to write to him about this patchset?
>
> Nope. Hint: You can dig in the mail archives studying older patches to
> see how things work. I do this as well because things may work
> differently per subsystem.
>

Thanks Wolfram for confirming on this.
I will do check in the mail archives for additional info.

Regards,
Sagar Kadam
