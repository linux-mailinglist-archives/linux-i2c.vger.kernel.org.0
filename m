Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7511A2DF010
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Dec 2020 15:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgLSOr6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Dec 2020 09:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgLSOr5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Dec 2020 09:47:57 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B092C0617B0;
        Sat, 19 Dec 2020 06:47:17 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id h22so3474107lfu.2;
        Sat, 19 Dec 2020 06:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GBZZga1bTUHx2Z1R/owFBp5nls4Qr2mZBMFwnXXuDwY=;
        b=Rfh0jTBKoWveuq0jpJfKi7Y84L7qUgobXCGjFzCurh/D3mZcpwxf5hYndxodAxf5Yk
         6yfsBRSAkelLjYGBMXOTbJV465uteq+2rzCPBtSTFzjZOmzpRbbA797cqepGa6AvMNum
         jbm+xiGtj+FtBwJycKmHONqhs7B7bKi9u/ZpVDfg6qdZ21+fFRXl5MXH6QLini839JaF
         D4y+wHJZ7dH5x+BsQ16dsLU+0Kg8nQRquBnJyzydMWHqVGFXRw4kz2j88hFqvIfVK4UD
         /Miqv0wLDQCU1U3wUqatykDXNvNV3JiDDiNxAZMxn3PzQi271i17+Wq1GvUNv9xRrlL9
         401A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GBZZga1bTUHx2Z1R/owFBp5nls4Qr2mZBMFwnXXuDwY=;
        b=Ewec1X3JG5tgY90jgj5h2WpLGHK6nhQIT3mXeFGR7VR4i/ANtMrxOy6j+Kjdyt7iMy
         DLYc42krKheSpyj/5OI/3jdE+9AgIXzBsOmMIvryMOXMosBRaFistl4e6phtRtba0hfU
         6skY0Msic2o1hgSwBk1W8h2HffinFwj7NQi55dhSdNptQk6kRFolprrA1QWyyQsjI5P0
         gPF4q357Y+jd7g3TUoN76NQuqjY6J7ZKOxbZa0dfpihP7fbc+A1OEjLEQidFmMAHnvyS
         ZK8RD6WvVUIA/VpFteUqS2QUQb0mhxY7YqxWh2SiAeEb+ATBfLrYgaPomn8uhx/DQjsC
         pBAQ==
X-Gm-Message-State: AOAM533Pe0FJdOXg8wyuvdBj5YFHaKg4BYvc60WFdwO5H58VUVEnTe+1
        RQHitlVF3Xa4oIb6XCA4j/YSAYTtvqydL1Ww+pdYlUjW
X-Google-Smtp-Source: ABdhPJwgk+kUhCbjtRQswLLp9Mq+lxZDz5a6zIVDc5xfV/fZ6SSPb5SU8DqHumpxh+NFX2z6pFTiXFZnCgDS3s9m1io=
X-Received: by 2002:a2e:8947:: with SMTP id b7mr4066856ljk.116.1608389235860;
 Sat, 19 Dec 2020 06:47:15 -0800 (PST)
MIME-Version: 1.0
References: <CABP=6zaXWU8OLxzvn0YJ-K+07Jju+LW-VE3isrnzDnAi5YN7Pw@mail.gmail.com>
In-Reply-To: <CABP=6zaXWU8OLxzvn0YJ-K+07Jju+LW-VE3isrnzDnAi5YN7Pw@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 19 Dec 2020 11:47:05 -0300
Message-ID: <CAOMZO5C0mTr2hrGxvPZB3WyxOR+8ozmXbtpnLf1Q=JB9WaF8+w@mail.gmail.com>
Subject: Re: [PATCH] i2c-imx.c: Synthesize end of transaction events without
 idle interrupts
To:     Kevin Herbert <kph@platinasystems.com>
Cc:     Biwen Li <biwen.li@nxp.com>, Leo Li <leoyang.li@nxp.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Wolfram Sang <wsa@the-dreams.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Biwen Li <biwen.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Kevin,

On Fri, Dec 18, 2020 at 2:53 PM Kevin Herbert <kph@platinasystems.com> wrote:
>
> From feaf638fb9b9a483c0d6090b277f34db21160885 Mon Sep 17 00:00:00 2001
> From: Kevin Paul Herbert <kph@platinasystems.com>
> Date: Tue, 15 Dec 2020 16:50:34 -0800
> Subject: [PATCH] i2c-imx.c: Synthesize end of transaction events without idle
>  interrupts

Your patch is corrupted. Please use 'git send-mail' and submit it again.

Thanks
