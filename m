Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6149BB6B
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Aug 2019 05:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbfHXDYp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Aug 2019 23:24:45 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:14951 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725924AbfHXDYp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Aug 2019 23:24:45 -0400
X-UUID: a0e4b519b90c46ff98dd02db7f03917e-20190824
X-UUID: a0e4b519b90c46ff98dd02db7f03917e-20190824
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1800538856; Sat, 24 Aug 2019 11:23:23 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs01n1.mediatek.inc
 (172.21.101.68) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Sat, 24 Aug
 2019 11:23:15 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 24 Aug 2019 11:23:14 +0800
Message-ID: <1566617000.19935.7.camel@mhfsdcap03>
Subject: Re: [PATCH v2] i2c: mediatek: disable zero-length transfers for
 mt8183
From:   Qii Wang <qii.wang@mediatek.com>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Jun Gao <jun.gao@mediatek.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>
Date:   Sat, 24 Aug 2019 11:23:20 +0800
In-Reply-To: <CAJMQK-gb+A9dwyMqMcA5yaaXak9no8_=urwK0XbLnNAEGyZ_hg@mail.gmail.com>
References: <20190822094516.55130-1-hsinyi@chromium.org>
         <1566547772.19935.2.camel@mhfsdcap03>
         <CAJMQK-gb+A9dwyMqMcA5yaaXak9no8_=urwK0XbLnNAEGyZ_hg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 2019-08-23 at 16:13 +0800, Hsin-Yi Wang wrote:
> On Fri, Aug 23, 2019 at 4:09 PM Qii Wang <qii.wang@mediatek.com> wrote:
> 
> > >
> > >  static u32 mtk_i2c_functionality(struct i2c_adapter *adap)
> > >  {
> > > -     return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> > > +     if (adap->quirks->flags & I2C_AQ_NO_ZERO_LEN)
> > > +             return I2C_FUNC_I2C |
> > > +                     (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> > > +     else
> > > +             return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> >
> > It can be removed?
> See previous discussion: https://patchwork.kernel.org/patch/10814391/#22484435
> but not all SoC's quirks has I2C_AQ_NO_ZERO_LEN.
ok, it looks good for me, thanks.
Reviewed-by: Qii Wang <qii.wang@mediatek.com>


