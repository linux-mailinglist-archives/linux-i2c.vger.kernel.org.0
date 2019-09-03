Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2AF0A6240
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 09:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfICHK2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 03:10:28 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:52673 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726053AbfICHK1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 03:10:27 -0400
X-UUID: bafe74e696b648aaa1782b88b87259d1-20190903
X-UUID: bafe74e696b648aaa1782b88b87259d1-20190903
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1608273628; Tue, 03 Sep 2019 15:10:21 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Sep 2019 15:10:20 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Sep 2019 15:10:20 +0800
Message-ID: <1567494620.7184.2.camel@mtksdaap41>
Subject: Re: [PATCH v1] misc: eeprom: at24: support pm_runtime control
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Tomasz Figa <tfiga@chromium.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>
Date:   Tue, 3 Sep 2019 15:10:20 +0800
In-Reply-To: <CAMpxmJX7Gq7pZqWx_--efjuNFCyAGq3=z84k5uGuAWvu2kwzOg@mail.gmail.com>
References: <20190902033205.30276-1-bibby.hsieh@mediatek.com>
         <CAMpxmJUYX6AuNedON5queZLNy__uw0h3ae1TWXtOudFPk6EASA@mail.gmail.com>
         <1567410147.32008.1.camel@mtksdaap41>
         <CAMpxmJXeWxB4vYdZxWf60Hi2a9RQi30KkLOaKn6W_0PtvPDqMg@mail.gmail.com>
         <CAAFQd5BTjcvQ4Cu_tftD4uYf0QAJvHyg5qhkFmZX1JmqiiDuHQ@mail.gmail.com>
         <CAMpxmJX7Gq7pZqWx_--efjuNFCyAGq3=z84k5uGuAWvu2kwzOg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK:  N
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 2019-09-03 at 08:54 +0200, Bartosz Golaszewski wrote:
> wt., 3 wrz 2019 o 08:10 Tomasz Figa <tfiga@chromium.org> napisał(a):
> >
> > On Mon, Sep 2, 2019 at 5:11 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > >
> > > pon., 2 wrz 2019 o 09:42 Bibby Hsieh <bibby.hsieh@mediatek.com> napisał(a):
> > > >
> > > > On Mon, 2019-09-02 at 09:23 +0200, Bartosz Golaszewski wrote:
> > > > > pon., 2 wrz 2019 o 05:32 Bibby Hsieh <bibby.hsieh@mediatek.com> napisał(a):
> > > > > >
> > > > > > Although in the most platforms, the power of eeprom and i2c
> > > > > > are alway on, some platforms disable the eeprom and i2c power
> > > > > > in order to meet low power request.
> > > > > > This patch add the pm_runtime ops to control power to support
> > > > > > all platforms.
> > > > > >
> > > > > > Changes since v1:
> > > > > >  - remove redundant code
> > > > > >  - fixup coding style
> > > > > >
> > > > >
> > > > > The subject tag should be v2. Patches start at (implicit) version 1.
> > > > > It's even more confusing since you're saying "Changes since v1" here
> > > > > but the subject says v1 too.
> > > > >
> > > > Ok, I will fix up it and resent version 2.
> > > >
> > >
> > > Please do it after v5.4-rc1 is tagged though.
> >
> > Thanks Bart for reviewing.
> >
> > By the way, I think we also need the DT bindings to be updated, right?
> >

Thanks, Tomasz :)

> > Best regards,
> > Tomasz
> 
> Yes, definitely, thanks for pointing that out.
> 
> Bibby: the DT updates should come in a separate patch and please Cc
> the device-tree maintainers.

Got it, I will add two optional properties (power-supply and i2c-supply)
in DT.

Bibby
> 
> Bart


