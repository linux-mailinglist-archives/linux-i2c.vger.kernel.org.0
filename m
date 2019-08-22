Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC5F98D92
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2019 10:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732323AbfHVIYx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Aug 2019 04:24:53 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:43278 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731207AbfHVIYx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Aug 2019 04:24:53 -0400
X-UUID: 01fbca1311e54c78adea42e8c0d5164f-20190822
X-UUID: 01fbca1311e54c78adea42e8c0d5164f-20190822
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1885262594; Thu, 22 Aug 2019 16:24:38 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 22 Aug 2019 16:24:35 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 22 Aug 2019 16:24:35 +0800
Message-ID: <1566462278.26641.1.camel@mtksdaap41>
Subject: Re: [PATCH RESEND] i2c: mediatek: disable zero-length transfers for
 mt8183
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        <linux-arm-kernel@lists.infradead.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Jun Gao <jun.gao@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Qii Wang <qii.wang@mediatek.com>
Date:   Thu, 22 Aug 2019 16:24:38 +0800
In-Reply-To: <20190822055737.142384-1-hsinyi@chromium.org>
References: <20190822055737.142384-1-hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: CDD14A64F1E5A4DF5E573825EDBC482C6C80C91A52820B01E0AE08A9F54881602000:8
X-MTK:  N
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 2019-08-22 at 13:57 +0800, Hsin-Yi Wang wrote:
> When doing i2cdetect quick write mode, we would get transfer
> error ENOMEM, and i2cdetect shows there's no device at the address.
> Quoting from mt8183 datasheet, the number of transfers to be
> transferred in one transaction should be set to bigger than 1,
> so we should forbid zero-length transfer and update functionality.


<...>

> @@ -933,8 +942,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>  	i2c->dev = &pdev->dev;
>  	i2c->adap.dev.parent = &pdev->dev;
>  	i2c->adap.owner = THIS_MODULE;
> -	i2c->adap.algo = &mtk_i2c_algorithm;
>  	i2c->adap.quirks = i2c->dev_comp->quirks;
> +	i2c->adap.algo = &mtk_i2c_algorithm;
>  	i2c->adap.timeout = 2 * HZ;
>  	i2c->adap.retries = 1;
>  

Why do you need to change this part?

Joe.C



