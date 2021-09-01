Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 770FA3FD6DE
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Sep 2021 11:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243659AbhIAJgf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Sep 2021 05:36:35 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:58170 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S243446AbhIAJge (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Sep 2021 05:36:34 -0400
X-UUID: 44ae3897094c468daaa54e4632996d3e-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ew555gf5jExHb5Vlc3ltqdvDC2/JOgxJvsZMzh/OBuI=;
        b=jGH0mGrNJWU1CTIx5Qc0crw921MwO2Oj/nOxn2C8tkMDFKVffbcDm1zxehInAWcC/JxOz3FBfUuVfHF9b1dAB6wi+Lprd4t5acmsJmlu2httSYsh/n4hnBz+JRaC3BPu5CRsgDxTI2gEHvJlN9Otze6vNWrGTVub0KTjS8lwvy4=;
X-UUID: 44ae3897094c468daaa54e4632996d3e-20210901
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1920947468; Wed, 01 Sep 2021 17:35:35 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 17:35:33 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 17:35:33 +0800
Message-ID: <1630488932.11251.8.camel@mhfsdcap03>
Subject: Re: [PATCH v6 7/7] i2c: mediatek: modify bus speed calculation
 formula
From:   Qii Wang <qii.wang@mediatek.com>
To:     Kewei Xu <kewei.xu@mediatek.com>
CC:     <wsa@the-dreams.de>, <matthias.bgg@gmail.com>,
        <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
        <ot_daolong.zhu@mediatek.com>, <yuhan.wei@mediatek.com>
Date:   Wed, 1 Sep 2021 17:35:32 +0800
In-Reply-To: <1630147859-17031-8-git-send-email-kewei.xu@mediatek.com>
References: <1630147859-17031-1-git-send-email-kewei.xu@mediatek.com>
         <1630147859-17031-8-git-send-email-kewei.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gU2F0LCAyMDIxLTA4LTI4IGF0IDE4OjUwICswODAwLCBLZXdlaSBYdSB3cm90ZToNCj4gV2hl
biBjbG9jay1kaXYgaXMgMCBvciBncmVhdGVyIHRoYW4gMSwgdGhlIGJ1cyBzcGVlZA0KPiBjYWxj
dWxhdGVkIGJ5IHRoZSBvbGQgc3BlZWQgY2FsY3VsYXRpb24gZm9ybXVsYSB3aWxsIGJlDQo+IGxh
cmdlciB0aGFuIHRoZSB0YXJnZXQgc3BlZWQuIFNvIHdlIHVwZGF0ZSB0aGUgZm9ybXVsYS4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEtld2VpIFh1IDxrZXdlaS54dUBtZWRpYXRlay5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYyB8IDM1ICsrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygr
KSwgMTAgZGVsZXRpb25zKC0pDQo+IA0KDQpSZXZpZXdlZC1ieTogUWlpIFdhbmcgPHFpaS53YW5n
QG1lZGlhdGVrLmNvbT4NCg==

