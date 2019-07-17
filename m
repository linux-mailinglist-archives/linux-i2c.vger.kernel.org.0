Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5F06BCA7
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jul 2019 14:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbfGQMzk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Jul 2019 08:55:40 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:64509 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725873AbfGQMzk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Jul 2019 08:55:40 -0400
X-UUID: e22df362dd87439ba66bb9b9ee25cbcf-20190717
X-UUID: e22df362dd87439ba66bb9b9ee25cbcf-20190717
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1220891826; Wed, 17 Jul 2019 20:55:23 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 17 Jul
 2019 20:55:21 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 17 Jul 2019 20:55:21 +0800
Message-ID: <1563368121.16970.7.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: Add MediaTek i2c AC timing binding
From:   Qii Wang <qii.wang@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
Date:   Wed, 17 Jul 2019 20:55:21 +0800
In-Reply-To: <20190626133941.GL801@ninjato>
References: <1560240715-22595-1-git-send-email-qii.wang@mediatek.com>
         <1560240715-22595-2-git-send-email-qii.wang@mediatek.com>
         <20190626133941.GL801@ninjato>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: B257EECAC12F9671783A098BEBB779091CBD86B878109E3D551FAA2FD10A1FD32000:8
X-MTK:  N
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 2019-06-26 at 15:39 +0200, Wolfram Sang wrote:
> Hi,
> 
> On Tue, Jun 11, 2019 at 04:11:54PM +0800, Qii Wang wrote:
> > Add i2c AC timing binding to binding file. It can give the AC
> > timing parameters to meet I2C specification at different speed.
> > 
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> 
> I think this is a too specific 1:1 mapping of your register set into DT
> world. We already have these generic parameters:
> 
> - clock-frequency
>         frequency of bus clock in Hz.
> 
> - i2c-scl-falling-time-ns
>         Number of nanoseconds the SCL signal takes to fall; t(f) in the I2C
>         specification.
> 
> - i2c-scl-internal-delay-ns
>         Number of nanoseconds the IP core additionally needs to setup SCL.
> 
> - i2c-scl-rising-time-ns
>         Number of nanoseconds the SCL signal takes to rise; t(r) in the I2C
>         specification.
> 
> - i2c-sda-falling-time-ns
>         Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
>         specification.
> 
> (check Documentation/devicetree/bindings/i2c/i2c.txt)
> 
> Can't you use those to derive your values from that? Which ones are you missing
> if not?
> 
> Regards,
> 
>    Wolfram

I have take a little time to develop a new patch which based on your
suggestions, and it tested OK. Thanks for your suggestions, I will
update the patch after I test it fully.


