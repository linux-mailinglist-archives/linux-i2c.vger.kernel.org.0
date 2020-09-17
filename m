Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0CE126DB02
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgIQMFA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:05:00 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:15182 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726758AbgIQMEs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:04:48 -0400
X-Greylist: delayed 376 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 08:04:24 EDT
X-UUID: 3c4e808601d644bfa1eedc9e13c6260e-20200917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/UJsD4aGQKHNNlqhauTDQNH407lOgYDSC2QDQ6aS8Wg=;
        b=Rm4KKLoT/jbqBs2wZFipna7q4iSgc+QEylFgeR1uxwR2Kd0WMW9krrzP7RY2KeOKnD8UQR/GE6GQaAwZfPchZDnm0mSYFach38y3zpI+OOzss516hB1LtEoH5SW3xJ01QkH6bp8PLimyU3vdgSEKp7LyEPXWNChBs+tDpV/Oe2w=;
X-UUID: 3c4e808601d644bfa1eedc9e13c6260e-20200917
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 143507253; Thu, 17 Sep 2020 19:58:03 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Sep 2020 19:58:00 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Sep 2020 19:58:00 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [PATCH 1/2] i2c: mediatek: Fix generic definitions for bus frequency
Date:   Thu, 17 Sep 2020 19:55:41 +0800
Message-ID: <1600343742-9731-2-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600343742-9731-1-git-send-email-qii.wang@mediatek.com>
References: <1600343742-9731-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhlIG1heCBmcmVxdWVuY3kgb2YgbWVkaWF0ZWsgaTJjIGNvbnRyb2xsZXIgZHJpdmVyIGlzDQpJ
MkNfTUFYX0hJR0hfU1BFRURfTU9ERV9GUkVRLCBub3QgSTJDX01BWF9GQVNUX01PREVfUExVU19G
UkVRLg0KRml4IGl0Lg0KDQpGaXhlczogOTAyMjRlNjQ2OGUxICgiaTJjOiBkcml2ZXJzOiBVc2Ug
Z2VuZXJpYyBkZWZpbml0aW9ucw0KZm9yIGJ1cyBmcmVxdWVuY2llcyIpDQpSZXZpZXdlZC1ieTog
WWluZ2pvZSBDaGVuIDx5aW5nam9lLmNoZW5AbWVkaWF0ZWsuY29tPg0KU2lnbmVkLW9mZi1ieTog
UWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtbXQ2NXh4LmMgfCA0ICsrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1t
dDY1eHguYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCmluZGV4IGVmYzE0MDQu
LmExOTc4ZWIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQor
KysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQpAQCAtNjgxLDggKzY4MSw4IEBA
IHN0YXRpYyBpbnQgbXRrX2kyY19jYWxjdWxhdGVfc3BlZWQoc3RydWN0IG10a19pMmMgKmkyYywg
dW5zaWduZWQgaW50IGNsa19zcmMsDQogCXVuc2lnbmVkIGludCBjbnRfbXVsOw0KIAlpbnQgcmV0
ID0gLUVJTlZBTDsNCiANCi0JaWYgKHRhcmdldF9zcGVlZCA+IEkyQ19NQVhfRkFTVF9NT0RFX1BM
VVNfRlJFUSkNCi0JCXRhcmdldF9zcGVlZCA9IEkyQ19NQVhfRkFTVF9NT0RFX1BMVVNfRlJFUTsN
CisJaWYgKHRhcmdldF9zcGVlZCA+IEkyQ19NQVhfSElHSF9TUEVFRF9NT0RFX0ZSRVEpDQorCQl0
YXJnZXRfc3BlZWQgPSBJMkNfTUFYX0hJR0hfU1BFRURfTU9ERV9GUkVROw0KIA0KIAltYXhfc3Rl
cF9jbnQgPSBtdGtfaTJjX21heF9zdGVwX2NudCh0YXJnZXRfc3BlZWQpOw0KIAliYXNlX3N0ZXBf
Y250ID0gbWF4X3N0ZXBfY250Ow0KLS0gDQoxLjkuMQ0K

