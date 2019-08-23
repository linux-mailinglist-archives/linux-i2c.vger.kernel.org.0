Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8519A9FD
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2019 10:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730896AbfHWIOH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Aug 2019 04:14:07 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46459 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404028AbfHWIN5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Aug 2019 04:13:57 -0400
Received: by mail-qt1-f195.google.com with SMTP id j15so10370363qtl.13
        for <linux-i2c@vger.kernel.org>; Fri, 23 Aug 2019 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+iEZzmAuZ9VlWo1rY1HoUVRqOc3pQbx/jL7+3U6XUrE=;
        b=KQoYmM1kiPcUeWePSRh/MATRSKtGHbDYwmscEnDEJex+ScfK8GC0Pn565Cm8BTQ7fS
         TN0P76B44uAatP3B3BZ61Hp3/1ZaAhV2sP1r/Qzr+VQI42UarAvsX6fIFMwnvDohlRBM
         i/SnM/kjB9KyiVRKnmaBnb4WhhIpto3GuckqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+iEZzmAuZ9VlWo1rY1HoUVRqOc3pQbx/jL7+3U6XUrE=;
        b=jFoq5mD88zRQfc8iLZ2iuuL/P+uL4/e4PyNGOqCDzs2Y+AjMwuyAJCCC1xD3/qoa3D
         5FjkuiYyZmpMQQ31Kmu9X+AWB69f7+XpH1jzoFDtzSh5Q+MkQuakjvADhND02QeqI1v3
         Av3Ccq67aWkf8Pdy258WCAEJVbRJ4PDzS81hvpmnuOMbiEhjV/mjKd+DqjPi49+ZyzIl
         gYmbj+GHVgUdx8IBQw9xmHk9v89dKWZdqimy0A4MbZ4Gef2EkojmhhzphLKhS1gPugUv
         rm2NX4GfSLzsyQVbSBSxNsR6VKVo9+M36s/lnVKXkrgSGNi81gKr5iH0TUScFhGxIU8/
         WUHQ==
X-Gm-Message-State: APjAAAVwWIO50eB0ncIYce8R/bpiclPo5HlY5d191SpA4qBKGpxDx09F
        U9j0KBMxKQwEMZMloy+yhEXON0pEDclEeaxkzUNr6w==
X-Google-Smtp-Source: APXvYqxNnLStOk4ZXp11RN7jSj7XJVMznct6ojLcGz5Yls6xfN9NE4mhgE85LSRowXYs50aMoWOgyWYV7b4IKr4cJAE=
X-Received: by 2002:ac8:1e1c:: with SMTP id n28mr3591243qtl.78.1566548035657;
 Fri, 23 Aug 2019 01:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190822094516.55130-1-hsinyi@chromium.org> <1566547772.19935.2.camel@mhfsdcap03>
In-Reply-To: <1566547772.19935.2.camel@mhfsdcap03>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Fri, 23 Aug 2019 16:13:29 +0800
Message-ID: <CAJMQK-gb+A9dwyMqMcA5yaaXak9no8_=urwK0XbLnNAEGyZ_hg@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: mediatek: disable zero-length transfers for mt8183
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Jun Gao <jun.gao@mediatek.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        lkml <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 23, 2019 at 4:09 PM Qii Wang <qii.wang@mediatek.com> wrote:

> >
> >  static u32 mtk_i2c_functionality(struct i2c_adapter *adap)
> >  {
> > -     return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> > +     if (adap->quirks->flags & I2C_AQ_NO_ZERO_LEN)
> > +             return I2C_FUNC_I2C |
> > +                     (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> > +     else
> > +             return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
>
> It can be removed?
See previous discussion: https://patchwork.kernel.org/patch/10814391/#22484435
but not all SoC's quirks has I2C_AQ_NO_ZERO_LEN.
