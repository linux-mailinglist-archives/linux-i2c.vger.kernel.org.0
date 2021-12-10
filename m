Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B9246FABD
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Dec 2021 07:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237045AbhLJGr0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Dec 2021 01:47:26 -0500
Received: from mail-dm6nam11on2058.outbound.protection.outlook.com ([40.107.223.58]:47969
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236723AbhLJGr0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 10 Dec 2021 01:47:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtFQJJyxF9WITzlpx/QYRH7+9U9HFOP2H779r4PXKCPUQGuE+vyTShSjvVRZzD1ZioK+pQehff+pgnOTXrJfgYMFpz2OI6wBrvxxIkMAqGwuKoErsE3yuPDombdEiswigWBKe3YuG7dT3sP8iy50f35zt58mgCXN/KXwNQhsd4P3IUYdWrLskp4mmovj5ilb59+sbQzBG7TCBWODbW85HzbY/eobolxKTKr0AOGZYSAzl3qAI11HLUZCf6paC5oxSoKYQOXzNGBZGTlKkeJ655Tt94+c8XjpKq9OKNcVFZucCYZaup4VHj3f5RwdK8h7R0JaquR2QM06v8F8h6ucnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQv+ZVoV2XQfTYYZUoBcizguDDM8P99uG7n9ik+HUPE=;
 b=nJjK/91vf0hoQbX9m/vN4CBcS8kJ19/CkudineWjgRVp/O541HkQCwIuhVkjL5/N10PwKntW2lgS4FsJ/dAu5gtUfci9HPY1qXyMUpfE9lpok/Hzo03ND13YimSUKaPryEn5TSLLULxmMtr09PqUi05HBjcX6Te5AIOghyxxBz4Zrsb59vAvrLluOhItHoaGP9X/z7ZjdnZ+kna7MBa6SYp0erzZUwOjurSAW60VFP35Kru2+NtZvuMBvaQcIRm+1NbrKv1gwsCkryucv+98thz0SQOq/x9oMk8lOTLrC+i8YMZ2eY/Sa1mHs6oXTHdDPGuSM8UTZwyORlr75ic0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQv+ZVoV2XQfTYYZUoBcizguDDM8P99uG7n9ik+HUPE=;
 b=SSA+zPuCCO7DXflAQp9usal08mFwYZ3mN/p+jfQEJu9CBKxm14t29e4Q73AksULeIXOUFk5JBw7pAqVdn7s1CPAcOCQbDDKIi4Y2ldd9oeE3qPoRQ6IJXezADbVbaihGZc+Rry3fkzEdxaohkjiTzJu9v2CfvOE6S1Zic9cJAqsXATjb2KBu7J/Fzggp8/582cRX03zJo0clH0PSnB7CkbnM6n6ziBdTISQagKE4SDrwn5HOJ4pxdtrqum8Vb3gfRMy7m59kc7X8rDBvA5N9+5GGM9k7XaKzEV2pU3q4PxkAN8/24Y+qd/Q36npp0oLjVBqhjZniSKNEVRBEGbGNSQ==
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BN9PR12MB5306.namprd12.prod.outlook.com (2603:10b6:408:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 06:43:50 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::18e7:e0b1:5caf:b4b5]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::18e7:e0b1:5caf:b4b5%6]) with mapi id 15.20.4755.022; Fri, 10 Dec 2021
 06:43:50 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Subject: RE: [PATCH v2] i2c: tegra: use i2c_timings for bus clock freq
Thread-Topic: [PATCH v2] i2c: tegra: use i2c_timings for bus clock freq
Thread-Index: AQHX7RnfsU0kwMZA6UCM7iIywP8mGawqvdGAgACCvqA=
Date:   Fri, 10 Dec 2021 06:43:49 +0000
Message-ID: <BN9PR12MB52739E656160D234F5694C54C0719@BN9PR12MB5273.namprd12.prod.outlook.com>
References: <1639067318-29014-1-git-send-email-akhilrajeev@nvidia.com>
 <c9eceaba-df4e-0e75-d6a7-87cfdf45fced@gmail.com>
In-Reply-To: <c9eceaba-df4e-0e75-d6a7-87cfdf45fced@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59e17acc-0aee-4734-85b2-08d9bba86ca7
x-ms-traffictypediagnostic: BN9PR12MB5306:EE_
x-microsoft-antispam-prvs: <BN9PR12MB53060BCC21EA6D198860EF72C0719@BN9PR12MB5306.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oZtZIVn4CBvVaKVYtN53KvOHxYlJ3bJY8OpxIRCeDFZdw7XqHGo288aPfnHpgXbTq7d+oxKEGF6aUpy+EwihqpUjXYWsp6R3JwP4IqhWddHJngbG/L1oPoN6uDaANB3s3t1s4OCpDDOxFTQAzWnCqO9SbSEcAurlrj52+ZDUvUwiduqkMIrdkus5e+RwJwn0/rQ0AnJ9KBOrVv9BerHvDD6p1Jj/aMJuORRmDSLatsa8eT6EzOCQRAfN738kAZMEJaIRMktqP5TD+fCl0sIk1NauDvWhPqfjrb+b2JIrbwYkC6V9hqvooeMkxsZN1MnxqboouY97La5QxEmQFyWsBh/v3WMPtb7bteUC0eA4ta6wrHeA1Tgu31HdItKBU+34lYux49wY6eetHXOiCM/FEN0p0LtsYTGr0x1oDbyUGApEZxYYJuYDHr5Q4sk55SNSthC2/olI3OV5Ko7D3eRGqbHkGb57J5bEJuEJnlsf9zWCNzdjnLoFqk5dxNMTldprVRW1P5KV97bOHtqVAXlfIrBQJMJlpTiUaVLkMOIDnQca8oh1aKu36GWMBtQ7UosRuEbD8PY0ddFD36qwQ/QWL6MhvBejJfRU+KlTza6kWIsdguDA0fZSlMnqCv5munNrRSy/bJ1xItWR0baVGrlYD8WAWEf/vinTyCvtRHvXvwWqSgqeNFoQPKgpTG4WvIiNJ05O2xoP7Io0o8u8thzu9g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(508600001)(38070700005)(2906002)(110136005)(8676002)(66946007)(55016003)(66476007)(4744005)(86362001)(52536014)(64756008)(26005)(76116006)(186003)(5660300002)(7696005)(9686003)(316002)(71200400001)(66446008)(122000001)(8936002)(38100700002)(6506007)(83380400001)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bytlSkF5L1ZyRGVBL1BDK25SbXlBbDlaUHJnM2F5YkgrNThySThKaytFb1Ni?=
 =?utf-8?B?WThkbzVJdDRvOGorTHlYWWJHWXJTOHlPbjkySGNIeGRHN0diZU5maFlKTG1O?=
 =?utf-8?B?UWZ4ZXhMdVN3TjJMUWpPNlZCWERSaFhnLzVLZFVYM2hGK1ErWk5pSEdpMTd1?=
 =?utf-8?B?WTNOMm5WNWJleis2c3kxZk5xZUJLbGlpNHJnZ25FQW9zOG1HeVlxcFVJRlJU?=
 =?utf-8?B?Y2xLcGlJeFNPa3FPMHVpcnloZW4ra0tLU0t1NGRMNTVVUDNmSUFQWmtSaFBT?=
 =?utf-8?B?MkxOeWdESGd3V3E4TXlFaktxWXpoaGt6bkNFQlh3OElFam9yemxWeEN0b0RD?=
 =?utf-8?B?UWdwanM1bGtRNWVMbXhUUDlpdGVtWE1iOTBIKzJBUmU2bS8yZFZ3b01pc0Fx?=
 =?utf-8?B?amp4TWpFWWFqLzRQSS8rajdWOGFLTnh5a1oxNVgwYVRSQjRhVzF4YWl5ZE45?=
 =?utf-8?B?eHZZR1VMSG1iYy9PMjZ3OU04dFVPbGEvTmVRU0J0QnU2SlRDYUgzd3FYZ3lG?=
 =?utf-8?B?ODdzaEkrbmdlTlRTaHIzVWFyNVVwdmxFTUhUK3RsQkZNTUpqTXlMNU9BdTdS?=
 =?utf-8?B?VGFBSDA4RzgyRVEycFpXd3RQUkFyVHBwc2NoNUJsKzhlQnlaUUlsK3dHN1lK?=
 =?utf-8?B?emlUV0VkMTNVT3NWMXpvZVRJQng0Zm1jZGJqYkJ0UUsvTGZEekFCYUJDcDVr?=
 =?utf-8?B?R2dEcTR1dDBCZXZYQWFTWXVqMGs3YWZHbTJ6WURrNUtHWjFNVCtRU0VUMlNY?=
 =?utf-8?B?MFc1NXVJb3JwYkxlK09oT2dPZnRkbm1nNDRvWG5BVVRyU0UxaTZVNU5zZDJC?=
 =?utf-8?B?SHU0amhwdGRLZWtSV0M1c09Uc3JhaXBKTm14TThWWkJ4WDlnZ0NDL2JlK05V?=
 =?utf-8?B?eE43SG5DRUlWbC8wemZmdGpibHJPWFhXQjR3OUoyV1p1bkpDbUNyemZ2Rk91?=
 =?utf-8?B?SFlsMTRmSzNhTmVSekFjM2U3Uk0yZkRrTkc1SXZSVzg0dndUSkkrbFVYSyt3?=
 =?utf-8?B?Tm5jOVJoOFBWb3c3T2ovMnlQMUlOVmNVcUV1V1BZdnJSSTlkNWkvWFRCcHBo?=
 =?utf-8?B?QlROV0xxRTBKcUIzZ1IwNkYvMWtQNjcwZ3Bmb09ncVY4V2VtRVFrc0JYV1Va?=
 =?utf-8?B?U2szYUlxQURlbVc0VzYvM1RJdDBsWlkwU2ZOUlRFNk94MGVrNHp4TFlRZi81?=
 =?utf-8?B?cWNWSEY5ZFFyMmM3OHh2R1AwREJJYjFOanNHRi8wd2JIeUZNZEE1OGhDTzJl?=
 =?utf-8?B?UnRlL1B2TWNVMTh4endwSGVldktRNmk2c3JNTXh1YjMyVWUwV2poS3lwOGUw?=
 =?utf-8?B?Y2FpNW9kT2RseU9FWGdkd3hVVEp4U0tIWmRxalNNTXFwMm9rMkwya3hyTUcy?=
 =?utf-8?B?K0x5K2pSWE5iL3psZkU0dmpQU3NmSWN4cjJlbkRqZ0hIUTdhaWNTR2lUcjQ1?=
 =?utf-8?B?dDN6TFN0Q3BITzZnNE5oVTNOVDlQeDZKdUEya1d1RFUzZ2hOcHo5QlRDSEpv?=
 =?utf-8?B?Rk9VV2xETHBReXhuWnBYeUZzblpwMXJTQUhvazljWXVxS1k4K1l4MmhNc1NS?=
 =?utf-8?B?WWp4cWZxVzFVN1ltb0ttbGRlWis4aUpYS0R6UGx3eWhQMWR1RURsSGc0MVdq?=
 =?utf-8?B?TUtPUWN4S1d5T0xCbEFiOHBlNjdzYlJpV2s0T1VaZzFvakNKaTJDc3dEaXpO?=
 =?utf-8?B?Q1dHenJScitSSzRMV0ZKNlZka0dCWXhEQVVPcFhDSFFucXVBMi9wY1diVTVC?=
 =?utf-8?B?MDBQSnZIdEtXQ1lsZnU1NDVNUURVdmVzZGlEbzRLNU5kR2VlQ2M4STZZSGV6?=
 =?utf-8?B?QjRVSW8vY3o5Q1RGVlc1Q1p3SGNqVmlReUpWN08wczFFK1pzRGlHbmtRVHAy?=
 =?utf-8?B?R2Ircko4SVVLSmhYNm9GM2d1ZU1acVl0cjR6dDR0YS8vdk9kUnBXb0NzNzNP?=
 =?utf-8?B?TmJSeklmWFZCVlU3WVJSSUl0cnNYZ09kR1ptMG5xeXVWQnJaSzh4bmdwSG9x?=
 =?utf-8?B?anN4SG9kRlF1NzhmQ2c0OCtMK05yRlV2VHA3MzgvUDVidHI0WlFHcEFaT3pZ?=
 =?utf-8?B?Q2RMcTF0aTFrK0twTkdrVUlYREQ0NFlXWTRNRGxOVXVPU3ZGT0RQTG1nSFlh?=
 =?utf-8?B?bEU5LzkzTjFOT1pseHczMHN3ay9HNTlYVjV3MmFLc21XaTRaTitFQWppdTda?=
 =?utf-8?B?b0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e17acc-0aee-4734-85b2-08d9bba86ca7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 06:43:49.9273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hAECDULynHtFwF7HEaO2p8i1NB/MGppkrLvzOpV1O5Zs0bN7abaQfIic9vyVEmsbOxbr8U8d/a7VVG7uOR338g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5306
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAwOS4xMi4yMDIxIDE5OjI4LCBBa2hpbCBSINC/0LjRiNC10YI6DQo+ID4gLSAgICAgZXJyID0g
ZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKGkyY19kZXYtPmRldiwgImNsb2NrLWZyZXF1ZW5jeSIs
DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZpMmNfZGV2LT5idXNf
Y2xrX3JhdGUpOw0KPiA+IC0gICAgIGlmIChlcnIpDQo+ID4gLSAgICAgICAgICAgICBpMmNfZGV2
LT5idXNfY2xrX3JhdGUgPSBJMkNfTUFYX1NUQU5EQVJEX01PREVfRlJFUTsNCj4gPiArICAgICBp
MmNfcGFyc2VfZndfdGltaW5ncyhpMmNfZGV2LT5kZXYsICZpMmNfZGV2LT50aW1pbmdzLCB0cnVl
KTsNCj4gDQo+IFdhcyB0aGlzIHBhdGNoIHRlc3RlZCBhdCBhbGw/IEFwcGFyZW50bHksIGl0IHdh
c24ndCBjb21waWxlLXRlc3RlZC4NClNvcnJ5LCBpdCBnb3Qgc29tZWhvdyBtaXNzZWQgYXMgdGhl
IGJ1aWxkIGRpZCBub3QgZmFpbCB3aGVuIHByZXBhcmVkDQp0aGUgaW1hZ2UgZm9yIHRlc3Rpbmcu
IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuDQpXb3VsZCBmaXggYW5kIHVwZGF0ZS4NCg0K
PiANCj4gZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jOiBJbiBmdW5jdGlvbiDigJh0ZWdy
YV9pMmNfcGFyc2VfZHTigJk6DQo+IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYzoxNjM1
OjEzOiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYZXJy4oCZIFstDQo+IFd1bnVzZWQtdmFy
aWFibGVdDQo+ICAxNjM1IHwgICAgICAgICBpbnQgZXJyOw0KPiANCj4gQlRXLCBNTSwgRFJJIGFu
ZCBtZWRpYSBtYWlsaW5nIGxpc3RzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoaXMgcGF0Y2gN
CkV2ZW4gSSB3YXMgd29uZGVyaW5nIG9uIHRoaXMsIGJ1dCBhcHBhcmVudGx5IHRob3NlIGxpc3Rz
IGFyZSBzaG93biBpZiBnZXRfbWFpbnRhaW5lci5wbA0KaXMgcnVuLiBXb3VsZCByZW1vdmUgdGhl
IG1haWxpbmcgbGlzdHMgZ29pbmcgZnVydGhlci4NCg0KVGhhbmtzLA0KQWtoaWwNCg==
