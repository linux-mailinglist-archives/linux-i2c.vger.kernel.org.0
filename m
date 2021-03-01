Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71EB5327E34
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Mar 2021 13:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234386AbhCAMXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Mar 2021 07:23:07 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:39520 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234008AbhCAMXG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Mar 2021 07:23:06 -0500
X-UUID: e04229979be24e64a497ae8d3c2e0ca5-20210301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=gs/svU8lhJHXw6APVwlc6cCBq2DNAv6aE+F+Aj/pGlQ=;
        b=JdHO5bevxhGPTCgkH57o2TT1mzqvC3ogHkIr2jTrAHQ0wCMoZs8UxhbVbve1JVfX4q0Pd5axby01PIasKMWbbLWYIdwfcQLKDDxxLs8mCbDRvemb6NM48CjaX+LNnlFGZ4PLIcfOQFHx7cJzrWRJJw0UiaMVfRgJnUshd0LDA6M=;
X-UUID: e04229979be24e64a497ae8d3c2e0ca5-20210301
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1503276849; Mon, 01 Mar 2021 20:22:13 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 1 Mar
 2021 20:22:01 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Mar 2021 20:22:01 +0800
Message-ID: <1614601321.16737.5.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Get device clock-stretch time via dts
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Date:   Mon, 1 Mar 2021 20:22:01 +0800
In-Reply-To: <1612348525-13364-1-git-send-email-qii.wang@mediatek.com>
References: <1612348525-13364-1-git-send-email-qii.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7A2577D5E8F4CF0FD35F7C75FCE434CDC2524106DFD176D68BD41856E5BE214F2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGksDQpPbiBXZWQsIDIwMjEtMDItMDMgYXQgMTg6MzUgKzA4MDAsIHFpaS53YW5nQG1lZGlhdGVr
LmNvbSB3cm90ZToNCj4gRnJvbTogUWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCj4g
DQo+IHRTVSxTVEEvdEhELFNUQS90U1UsU1RPUCBtYXliZSBvdXQgb2Ygc3BlYyBkdWUgdG8gZGV2
aWNlDQo+IGNsb2NrLXN0cmV0Y2hpbmcgb3IgY2lyY3VpdCBsb3NzLCB3ZSBjb3VsZCBnZXQgZGV2
aWNlDQo+IGNsb2NrLXN0cmV0Y2ggdGltZSBmcm9tIGR0cyB0byBhZGp1c3QgdGhlc2UgcGFyYW1l
dGVycw0KPiB0byBtZWV0IHRoZSBzcGVjIHZpYSBFWFRfQ09ORiByZWdpc3Rlci4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KDQpD
YW4gaXQgbWVyZ2UgaW50byA1LjEyPyBvciBkbyBJIG5lZWQgdG8gcmVzZW5kIHRoZSBwYXRjaD8N
Cg0KVGhhbmtzLA0KCVFpaQ0K

