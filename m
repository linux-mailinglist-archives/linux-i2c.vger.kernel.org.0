Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38F9A86138
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 13:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbfHHL5R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Aug 2019 07:57:17 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35622 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbfHHL5R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Aug 2019 07:57:17 -0400
Received: by mail-lf1-f65.google.com with SMTP id p197so66591405lfa.2
        for <linux-i2c@vger.kernel.org>; Thu, 08 Aug 2019 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GqSpTLaS1GlrJIlW+mnuZv+AyENZSG73UP9QIEWWeVw=;
        b=IdhZtin1Tj+kcvzAiOQ5PWNTjIOIoG0SMzL29Uiw4+6raf/RuOMMgPY2vDMNwh9MXq
         V3zsONhhnXi8wsD2trQ/wOH0natMo5WOqtTI5eA4E/ITgXZa7nv7Lbhh/absQNwUR6dM
         QQu3jLqokL3ZxWtDQgUbj4eIAZiVZiwXhayHo/znV7ewWGLjrawZO3z4V3CGUCRwtT5g
         i0cXGYSL0wlH1dbJ7Ruw6zjxMSitgOc9Wb0s8e2LUMBbgtxFSintuMXl3R43dVf/qmyp
         8Gpn4eIBhPO94aWk1+Ag296q69tcQ4376lS70G614K/O15hr6qV3F5VJZtPyuab+oxjW
         jRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GqSpTLaS1GlrJIlW+mnuZv+AyENZSG73UP9QIEWWeVw=;
        b=dwA1NBPEjauaU6g9RxYaTa/8FKDqdcVU4pLtnT8AJGRYUNkKXuNv9ljLc+nE86Yaae
         enckkIsuToo8XlzzzVrAs/osACADgoSSzEl5DqStcKU/ALSd6iRqpol9mnUWszOxvJlv
         HhaAx2lcVwK6J8dsSEdne+7sFx2vO+jO5M8rd2OOe6bGKYLwGmbs2NcNER603ln4O8/E
         yqA9SwwWq56i7HDeprWIDU5VAl1iGWN0pCkSe+DyX4S2Zm+Zi2onYcqZ1X5fRcWrujqD
         HW0iH6XlBvZAI8d11o+oWoEhbDb+H1xPcnEg3RQT2xPASL0wX4TqCncnPU+R1oz9hH8I
         EojA==
X-Gm-Message-State: APjAAAXWkAZkBh8pwiezZ1y5KKMv1o1fGagai9zED6sCRP8sJSUvRtLJ
        fdBWIDCdGI5nihrdN30qB32QSbETogOBu1ymO5s=
X-Google-Smtp-Source: APXvYqyl1vGeCbujrhthHWbwAty0CnABo4Xc3PQPbtZx+bv1Z8QtQvsiVUkIHKn+F1v4SOUlkWdaH4LzB5UZaPd1rHs=
X-Received: by 2002:a05:6512:146:: with SMTP id m6mr9050444lfo.90.1565265434948;
 Thu, 08 Aug 2019 04:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190807203153.11778-1-festevam@gmail.com> <CAOMZO5B_3d2DYMzpchJmM9CnRL0gN6-8zGeB_zorN-0cL8rbKA@mail.gmail.com>
 <20190807211317.GA5193@shell.armlinux.org.uk> <AM0PR04MB421142CCB25E76ED53148E7480D70@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB421142CCB25E76ED53148E7480D70@AM0PR04MB4211.eurprd04.prod.outlook.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 8 Aug 2019 08:57:38 -0300
Message-ID: <CAOMZO5BB+WEWE8ohB9yeCKCSAAqB+n9LEAaSb7WR5H1NXSJ08w@mail.gmail.com>
Subject: Re: [PATCH] i2c: imx: Fix endlessly clk warnings
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Wolfram Sang <wsa@the-dreams.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Aisheng,

On Thu, Aug 8, 2019 at 8:02 AM Aisheng Dong <aisheng.dong@nxp.com> wrote:

> I think the problem of this patch is that it breaks the defer probe of DMA enablement
> which seems like a normal case in kernel. e.g. DMA driver probed later than I2C.

Please note that prior to commit e1ab9a468e3b ("i2c: imx: improve the
error handling in i2c_imx_dma_request()") there was no DMA defer probe
support at all, so the path I sent does not break defer probe. It just
restores the original behaviour.

> I wonder if there's a real customer requirement that wanting the I2C slave devices (e.g. RTC)
> to be probed early but using I2C with DMA and build DMA as module.
>
> If there is that requirement, maybe the correct way to fix this issue to explicitly disable I2C DMA
> in DT rather than simply fallback to polling mode for all the cases including the reasonable defer probe.

We should try to avoid fixing things by changing existing devicetrees.

I will submit a revert patch soon.
