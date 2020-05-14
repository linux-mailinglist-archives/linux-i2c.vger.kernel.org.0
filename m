Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71F81D30C1
	for <lists+linux-i2c@lfdr.de>; Thu, 14 May 2020 15:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgENNMi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 May 2020 09:12:38 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:17810 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726011AbgENNMi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 May 2020 09:12:38 -0400
X-UUID: ffb2655aca6c4f53a10c6b67a900e55e-20200514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wLQhmETTZlxg34vSnmnfE6W4u7Qd+rsjjMqaMdw1wcs=;
        b=E33x7ygSK0v9jioLCEP22NmSD2wIPnyINGNAi+H0bpFnkdwAMmuNaskLXAI4G96zinqS8Btb8GdAit5+RZ+XbjQu4XaHrIB/4kE62NvOuOJOwsdqg1sUb7mZXvxbDJFOQQN+LxLxoPUZWLznZ95eNZnY/rT68OAp51WWvB6fUOs=;
X-UUID: ffb2655aca6c4f53a10c6b67a900e55e-20200514
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1887685178; Thu, 14 May 2020 21:12:35 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 21:12:31 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 May 2020 21:12:30 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [PATCH v2 1/2] MAINTAINERS: add maintainer for mediatek i2c controller driver
Date:   Thu, 14 May 2020 21:09:04 +0800
Message-ID: <1589461844-15614-2-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

QWRkIFFpaSBXYW5nIGFzIG1haW50YWluZXIgZm9yIG1lZGlhdGVrIGkyYyBjb250cm9sbGVyIGRy
aXZlci4NCg0KU2lnbmVkLW9mZi1ieTogUWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4N
Ci0tLQ0KIE1BSU5UQUlORVJTIHwgNyArKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KaW5kZXgg
ZTY0ZTVkYi4uYzBmZGYxMSAxMDA2NDQNCi0tLSBhL01BSU5UQUlORVJTDQorKysgYi9NQUlOVEFJ
TkVSUw0KQEAgLTEwNjU4LDYgKzEwNjU4LDEzIEBAIEw6CW5ldGRldkB2Z2VyLmtlcm5lbC5vcmcN
CiBTOglNYWludGFpbmVkDQogRjoJZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvDQogDQor
TUVESUFURUsgSTJDIENPTlRST0xMRVIgRFJJVkVSDQorTToJUWlpIFdhbmcgPHFpaS53YW5nQG1l
ZGlhdGVrLmNvbT4NCitMOglsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQorUzoJTWFpbnRhaW5l
ZA0KK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW10NjV4eC50
eHQNCitGOglkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQorDQogTUVESUFURUsgSlBF
RyBEUklWRVINCiBNOglSaWNrIENoYW5nIDxyaWNrLmNoYW5nQG1lZGlhdGVrLmNvbT4NCiBNOglC
aW4gTGl1IDxiaW4ubGl1QG1lZGlhdGVrLmNvbT4NCi0tIA0KMS45LjENCg==

