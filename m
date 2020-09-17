Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA2E26DB33
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgIQMFC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:05:02 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:61005 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726773AbgIQMEs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:04:48 -0400
X-UUID: 71a43a36754643aa88dbddd9eb1235fa-20200917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6RsFN3FgI09QCmEIV64IUurK2wRwXLViWE4DI22IWEY=;
        b=CevI0gAxzwQWnyHIN7cLsYBuCJ4gsX+/9Ypq1hApsLwTuKwpCdLm7AbvEKtcEQIZqmT4fs2ZwKx7qe3LKFygV8nRO2KmKEcXofj5NYBpVBQMOtJQD5e01JB9AvKKyUah16Ao0E+1oLm8UFn79auPIBHUQyM8PpvWo6m06VNITeE=;
X-UUID: 71a43a36754643aa88dbddd9eb1235fa-20200917
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1923396637; Thu, 17 Sep 2020 19:58:02 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Sep 2020 19:57:59 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Sep 2020 19:57:59 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [PATCH 0/2] Fix some definitions for bus frequency
Date:   Thu, 17 Sep 2020 19:55:40 +0800
Message-ID: <1600343742-9731-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhpcyBzZXJpZXMgYXJlIGJhc2VkIG9uIDUuOS1yYzEgYW5kIHdlIHByb3ZpZGUgdHdvIGkyYyBw
YXRjaGVzDQp0byBmaXggc29tZSBkZWZpbml0aW9ucyBmb3IgYnVzIGZyZXF1ZW5jeS4NCg0KUWlp
IFdhbmcgKDIpOg0KICBpMmM6IG1lZGlhdGVrOiBGaXggZ2VuZXJpYyBkZWZpbml0aW9ucyBmb3Ig
YnVzIGZyZXF1ZW5jeQ0KICBpMmM6IG1lZGlhdGVrOiBTZW5kIGkyYyBtYXN0ZXIgY29kZSBhdCBt
b3JlIHRoYW4gMU1Ieg0KDQogZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYyB8IDYgKysr
LS0tDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0K
LS0gDQoxLjkuMQ0KDQo=

