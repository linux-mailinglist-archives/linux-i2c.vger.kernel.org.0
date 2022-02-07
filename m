Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 017CB4AB442
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 07:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiBGF4R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 00:56:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239521AbiBGC6n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Feb 2022 21:58:43 -0500
X-Greylist: delayed 302 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Feb 2022 18:58:41 PST
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62D6C061A73;
        Sun,  6 Feb 2022 18:58:41 -0800 (PST)
X-UUID: 53c36fb67ba949e386a1a20f13f085c8-20220207
X-UUID: 53c36fb67ba949e386a1a20f13f085c8-20220207
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1957338035; Mon, 07 Feb 2022 10:53:35 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 7 Feb 2022 10:53:34 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Feb 2022 10:53:33 +0800
Message-ID: <9b43f53bfe6d69c840c697a8b414eb19588826ea.camel@mediatek.com>
Subject: Re: [v2 1/2] dt-bindings: i2c: update bindings for MT8186 SoC
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
        <caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
        <yuhan.wei@mediatek.com>, <ryan-jh.yu@mediatek.com>
Date:   Mon, 7 Feb 2022 10:53:33 +0800
In-Reply-To: <YfRkP7Wf7lzarVrf@shikoro>
References: <20220125110413.18988-1-kewei.xu@mediatek.com>
         <20220125110413.18988-2-kewei.xu@mediatek.com> <YfRkP7Wf7lzarVrf@shikoro>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 2022-01-28 at 22:46 +0100, Wolfram Sang wrote:
> On Tue, Jan 25, 2022 at 07:04:12PM +0800, Kewei Xu wrote:
> > Add a DT binding documentation for the MT8186 soc.
> > 
> > Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> 
> Applied to for-next, thanks! But you forgot to add the ack from Rob
> which he gave when you sent v1.
> 
Hi,

I'm sorry for my mistake and thank you very much for your reminder. I
will pay attention to this problem next time.

Thanks
Kewei.

