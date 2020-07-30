Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B945232A23
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jul 2020 04:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbgG3CjI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 22:39:08 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:5665 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726480AbgG3CjH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 22:39:07 -0400
X-UUID: e070296f14b240c499589d9ae9d2ee97-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=X1UadCFz90FbPm5aWCk0xfL4ZtGAfS8oTL2vDHMeIS4=;
        b=YsY0oMaqZSq5i4rn32G2cf4decDUejbZSjAhbUAOXagl0JeTkPOTr/itiGphda6KzixNFkqg8IY1bWR2omXdxeYGlYyJ5Ro1y6pxPm8Te8HUZ2B5kODghh3HiY2OHAoGUuVjVzVjRmXeKO2vC9QmUWW4RZdla3P/Z76Ska9pv4Y=;
X-UUID: e070296f14b240c499589d9ae9d2ee97-20200730
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 755538541; Thu, 30 Jul 2020 10:39:02 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 10:39:00 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 10:39:00 +0800
Message-ID: <1596076741.11024.4.camel@mtksdaap41>
Subject: Re: [PATCH v2 2/4] i2c: mediatek: Add access to more than 8GB dram
 in i2c driver
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Qii Wang <qii.wang@mediatek.com>
CC:     <wsa@the-dreams.de>, <qiangming.xia@mediatek.com>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <leilk.liu@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <robh+dt@kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 30 Jul 2020 10:39:01 +0800
In-Reply-To: <1595939446-5484-3-git-send-email-qii.wang@mediatek.com>
References: <1595939446-5484-1-git-send-email-qii.wang@mediatek.com>
         <1595939446-5484-3-git-send-email-qii.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIwLTA3LTI4IGF0IDIwOjMwICswODAwLCBRaWkgV2FuZyB3cm90ZToNCj4gTmV3
ZXIgTVRLIGNoaXAgc3VwcG9ydCBtb3JlIHRoYW4gOEdCIG9mIGRyYW0uIFJlcGxhY2Ugc3VwcG9y
dF8zM2JpdHMNCj4gd2l0aCBtb3JlIGdlbmVyYWwgZG1hX21heF9zdXBwb3J0IGFuZCByZW1vdmUg
bXRrX2kyY19zZXRfNGdfbW9kZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFFpaSBXYW5nIDxxaWku
d2FuZ0BtZWRpYXRlay5jb20+DQoNClFpaSwNCg0KQWZ0ZXIgeW91IHJlbW92ZSBJMkNfRE1BXzRH
X01PREUgTWF0dGhpYXMgbWVudGlvbmVkLCB5b3UgY2FuIGhhdmU6DQoNClJldmlld2VkLWJ5OiBZ
aW5nam9lIENoZW4gPHlpbmdqb2UuY2hlbkBtZWRpYXRlay5jb20+DQoNCkpvZS5DDQoNCg==

