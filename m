Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002CB35D6F3
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 07:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243087AbhDMFPS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 01:15:18 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:39567 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242475AbhDMFPS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 01:15:18 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 95CF2891AE;
        Tue, 13 Apr 2021 17:14:57 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618290897;
        bh=WLT2HRmZG+yAD2euirij3ShXl7XLE8a+E/Bxplpap7s=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=B/QVZvY68FT5CrvG/ciW/pXXpPbCxY7k8rojo7ksR0KSdYKt2RgKGtxeLXbMTpvjV
         stUFbXFNYw/plsciz/dM62J2S2T0C33hdrIldAI0LxJOfJA2CkvMLzvdF9XiVbbTNP
         2++uz30eqij6pvZtS2XcjFlH8fNcwIO67axrpcREN32pwD8rMt5TQhNCyoWv7pM6Xj
         vYDU+Z6fiZz0OtaL7fG52q87M8y3SI8bgYQR7Z+nQDFlYbKYxIIbWTKehpkWAVsZAA
         1UwFrqTmDIK5tYUdSyoktbhD9aOjdfM5YaSADQch37upebQ3Y0z2Vvpd92lHoKpCic
         FCgM9rpqckDIA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B607528d10001>; Tue, 13 Apr 2021 17:14:57 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 17:14:57 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Tue, 13 Apr 2021 17:14:57 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] MAINTAINERS: Add Chris Packham as FREESCALE MPC
 I2C maintainer
Thread-Topic: [PATCH v3 3/3] MAINTAINERS: Add Chris Packham as FREESCALE MPC
 I2C maintainer
Thread-Index: AQHXMCNDm/XTR0fU0EG5EYtvCWa2D6qxHnEA
Date:   Tue, 13 Apr 2021 05:14:56 +0000
Message-ID: <2e4e208d-d410-5b60-6992-1a9b8d23f7d4@alliedtelesis.co.nz>
References: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
 <20210413050956.23264-5-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20210413050956.23264-5-chris.packham@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE77EC9DFF6F6A47BAB233B462226C72@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=bX_5FWTj0mLFruiLH2MA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=ST-jHhOKWsTCqRlWije3:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxMy8wNC8yMSA1OjA5IHBtLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPiBBZGQgQ2hyaXMg
UGFja2hhbSBhcyBGUkVFU0NBTEUgTVBDIEkyQyBtYWludGFpbmVyLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQpT
b3JyeSBmb3IgdGhlIGR1cGxpY2F0ZS4gSSBoYWQgZXhpc3Rpbmcgb3V0cHV0IGZyb20gYW4gZWFy
bGllciANCmludm9jYXRpb24gb2YgZ2l0IGZvcm1hdC1wYXRjaCBseWluZyBhcm91bmQuICJbUEFU
Q0ggdjMgNC80XSANCk1BSU5UQUlORVJTOiAuLi4iIGlzIHRoZSBvbmUgSSBpbnRlbmRlZCB0byBz
ZW5kIChhbHRob3VnaCB0aGUgY29udGVudCBpcyANCnRoZSBzYW1lKS4NCj4gLS0tDQo+ICAgTUFJ
TlRBSU5FUlMgfCA3ICsrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
DQo+DQo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+IGluZGV4IDU2
ZTllNGQ3NzdkOC4uM2JjNzdiYThjZDA1IDEwMDY0NA0KPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiAr
KysgYi9NQUlOVEFJTkVSUw0KPiBAQCAtNzEzNSw2ICs3MTM1LDEzIEBAIFM6CU1haW50YWluZWQN
Cj4gICBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1pbXgtbHBp
MmMueWFtbA0KPiAgIEY6CWRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gICAN
Cj4gK0ZSRUVTQ0FMRSBNUEMgSTJDIERSSVZFUg0KPiArTToJQ2hyaXMgUGFja2hhbSA8Y2hyaXMu
cGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPiArTDoJbGludXgtaTJjQHZnZXIua2VybmVs
Lm9yZw0KPiArUzoJTWFpbnRhaW5lZA0KPiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2kyYy9pMmMtbXBjLnlhbWwNCj4gK0Y6CWRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBj
LmMNCj4gKw0KPiAgIEZSRUVTQ0FMRSBRT1JJUSBEUEFBIEVUSEVSTkVUIERSSVZFUg0KPiAgIE06
CU1hZGFsaW4gQnVjdXIgPG1hZGFsaW4uYnVjdXJAbnhwLmNvbT4NCj4gICBMOgluZXRkZXZAdmdl
ci5rZXJuZWwub3Jn
