Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF631A6177
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Apr 2020 04:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbgDMCSv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Apr 2020 22:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:38884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727434AbgDMCSv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Apr 2020 22:18:51 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140041.outbound.protection.outlook.com [40.107.14.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFB9C0A3BE0
        for <linux-i2c@vger.kernel.org>; Sun, 12 Apr 2020 19:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwfDlQ1ji5geWL5S343NnkpiwdKjo8PaGILNR4sz1PcD/vUPu6QvCWVZ5tZg4ofGsgFRRyfuJOeQ6E/NZs6h88P0eRJMysNZ0vdOOLldL2KNGzfCmJBH+l7DOtUf/dhLKG6omd88rQrq5FyMS/afNnUQUl8I3EnSCnbUBioO10fHrjX3sOXVKmL9MjTwoigkv6w5jzlFP9BCBPQmjWjgot/GUoS4xHgqrCx0oDJc+HOknVTNp6Gdbh2rSuXQJ8/yydsC94P0U8w7s1Rcbwtem1NQ36iCOoECAvyotJr+wnmI1QOktH0y85Bv4QIoH/h9PvXgmG+JbHmH0gOV6HLFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmgvmKJyoXs4Oy9LrX88D5BfI48kFdzhv/OVTg3G9j8=;
 b=gbXHb6gDn2Nq3g6AmcPJgeTvhPtQfpvpIqaxVXIxwQF5wgKAQcFlF3T0g6NFz5RN/wsiYw1Aon0oBS435gbNJ3N3wKaAvr++jhMXoZ5WUGAJQuc/XqhJXRsEWJCzUlPC1aM5GvR3jRDQLv6GCqiEAYH+lL7w9cUcr2RSGwiquaUjOXaKIZlp2aY9haa0XYo4FKPVnLa5Dokw4+duSus59Vyv5tmUBxn6tttIw/7Cz/7bazn9u/h3gwvQnnpwb5kl9kesV+7P/M2ATuOVI7t9iaezySwnHzG3xZ0iezD+BWnTls1Lch3MFiH74OVYwDKA97SAmk9pQNwbKNwjVpccvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmgvmKJyoXs4Oy9LrX88D5BfI48kFdzhv/OVTg3G9j8=;
 b=s95ztDPMQuUuasPTdhjNUcn/t48peJf9lZIXLgaXRzORDmsseP7IoMRk/utRuJVeXHcGWzKJYwZsY4esXuoJI/ivai8ByK7m1ufRD2cuSVjJ6fJTlX4GZImP+qxPpZQJBAefzdx+Rv92mAfl97lX9FIaZPC7N5yrELwRsDmLBUg=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 by DB6PR0401MB2517.eurprd04.prod.outlook.com (2603:10a6:4:34::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Mon, 13 Apr
 2020 02:18:47 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::bca5:53b2:e6c3:4037]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::bca5:53b2:e6c3:4037%7]) with mapi id 15.20.2900.028; Mon, 13 Apr 2020
 02:18:47 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     19 90 <nineteenalreadytaken@gmail.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "erbolsyn@gmail.com" <erbolsyn@gmail.com>
Subject: RE: [EXT] [v6] i2c: imx: support slave mode for imx I2C driver
Thread-Topic: [EXT] [v6] i2c: imx: support slave mode for imx I2C driver
Thread-Index: AQHWEK2OQ41GVJ6X3Emp2jDBteeJDqh2SiDg
Date:   Mon, 13 Apr 2020 02:18:46 +0000
Message-ID: <DB6PR0401MB2438E758DAE30C809D1559638FDD0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <CALDvbXkDBG1C2orB2PDrE5ox4A+kEf07XKCQoBrhjG+UnJniyg@mail.gmail.com>
In-Reply-To: <CALDvbXkDBG1C2orB2PDrE5ox4A+kEf07XKCQoBrhjG+UnJniyg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [120.244.152.121]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6fbb729a-7489-4ceb-442c-08d7df50ff54
x-ms-traffictypediagnostic: DB6PR0401MB2517:
x-microsoft-antispam-prvs: <DB6PR0401MB25170E399390C79F344D512F8FDD0@DB6PR0401MB2517.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0401MB2438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(8936002)(26005)(186003)(478600001)(8676002)(966005)(81156014)(45080400002)(44832011)(2906002)(86362001)(71200400001)(4326008)(316002)(5660300002)(66446008)(66556008)(66476007)(9686003)(55016002)(6916009)(6506007)(54906003)(52536014)(33656002)(76116006)(64756008)(83080400001)(7696005)(66946007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CtzJF3Kpf4GiLWXAaSVg2p8BKRYI8y4Rt2/Ys3t1V3/RZ3psxa2uk1K5cSNxorMvnsNZla4D8eORBG63FOxqY5uFII3f0418C+CqxhKCqvTR3vpMIkTgBVDkdItwmZz1kptTRFbSqFKFA4nw3FePQxEBurtVNENjt3CsZWErbK0KFNpRu9BCQ0ZfE5LZlikXcsai0Q6VhFrzhcb6gVb8KoyI5g19iuyEsWLxEABZY0XZ3ylmTKQG1hW1xH1VDXUtD3EHAFZlR/DtOXo5cVpNYIUaQk7pft9wdLNQtbC2taVeS9Xg+gSfYOU8chcnp0421Ibl6/74WT74LF1o1b/F8UD0gcTb8DqvJ91oduJ+2q3S/DtbAqW8Y98RhPHrxkjWqzXVsg4dUiTt8EEO9iYoqVtkLVkV6Z4OxmlqVuOz+Hut4GDXR67oDkjYyfZktFckKzpwfrFPQokEiE4/nv5lrmEFq4w034ZU70YIHqE+O8volwFPY5+o25rE1gAe17sn40BiBo31V8bp3MFfqxly4Q==
x-ms-exchange-antispam-messagedata: 5YHrgs5ZmXGDYHq30zdRiXtncOFhHaYMpSEZKsDn/UY0TrN1qbBUgNsEGVbX/GwmcvVUZMhe2MY/ZQXlODNdu5XmmJ3AzacoNE+FBrHnOAyG/sf7Ge0kGFsC7sYr2iVIV0pw/8jeGBA9iKkZY8BNtw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbb729a-7489-4ceb-442c-08d7df50ff54
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 02:18:46.9575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g/UQO1IYh/smRSstjXvPRm/LMFGF875QP2D4dlTjQ/1T1rtvMg6LvrCtdir20tDjm6I9QaU8fLN/Gi7zuXThTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2517
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBIaSwgQml3ZW4NCj4gDQo+IExvb2tpbmcgZm9yd2FyZCBmb3IgeW91ciBwYXRjaCAtDQo+IGh0
dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNB
JTJGJTJGcGF0Y2gNCj4gd29yay5vemxhYnMub3JnJTJGcGF0Y2glMkYxMjAzNjQwJTJGJmFtcDtk
YXRhPTAyJTdDMDElN0NiaXdlbi5sDQo+IGklNDBueHAuY29tJTdDNzEwYzEwYjMzNGVlNDkyYTg0
ZjYwOGQ3ZGVjNGIwNzQlN0M2ODZlYTFkM2JjMg0KPiBiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0Mw
JTdDMCU3QzYzNzIyMjgwODY1ODQ5MTc5NCZhbXA7c2RhdGENCj4gPTM5TUdLR1czT1QweWxyYlRU
QmpxTW9jY25tM1JxQmFob3Bkd2I2d3JpNXMlM0QmYW1wO3Jlc2VydmVkDQo+ID0wLCB0aG91Z2gg
d291bGQgbGlrZSB0byBrbm93DQo+IGZvbGxvd2luZzoNCj4gDQo+IC0gRG8geW91IHBsYW4gYW55
dGhpbmcgZWxzZSBvbiB0aGlzIFBBVENIPyBUaGVyZSBpcyBubyB1cGRhdGUgc2luY2UgTWFyY2gN
Cj4gYmVnaW5uaW5nLiBJIG1pZ2h0IGhlbHAgd2l0aCBpdCBpZiB5b3UgZ2l2ZSBtZSBpbnN0cnVj
dGlvbnMgd2hhdCdzIGxlZnQgb24geW91cg0KPiBwbGF0ZS4NCkkgd2lsbCBkbyB0aGlzIGFzIGZv
bGxvd3MsDQoxLiBSZWJhc2UgdG8gcmVjZW50IGxpbnV4IGtlcm5lbC4NCjIuIFJlbW92ZSBpZmRl
Zg0KMy4gU3VwcG9ydCBJMkNfU0xBVkVfU1RPUCBldmVudCAoaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wYXRjaC8xMjYzODgxLykgDQo+IA0KPiAtIFdoYXQgaXMgdGhlIGdpdCBjb21taXQg
aGFzaCB5b3VyIHBhdGNoJ3MgYmFzZWQgb24/DQpCYXNlIG9uIDdiZTVmOTBmNjg5YWY1YWJiNmIx
Njc1NWUyMTJmNzZlZDk3YTIwZGQNCj4gICAgSSB0cmllZCB0byBhcHBseSBwYXRjaCB0byB0aGUg
bGF0ZXN0IG1haW5saW5lIChzZWUgYmVsb3cpLCBidXQgZ290DQo+IDEgcGFydCBvZiBwYXRjaCBm
YWlsZWQsIGJ1dCBmaXhlZCBpdCBtYW51YWxseS4NCj4gDQo+IGNvbW1pdCBjMGNjMjcxMTczYjJl
MWMyZDhkMGNlYWVmMTRlNGRmYTc5ZWVmYzBkDQo+IA0KPiAtIFdvdWxkIGJlIGhlbHBmdWwgaWYg
YW55b25lIHNoYXJlIHdoaWNoIGtlcm5lbCBidWlsZGVyIChZb2N0byBvciBOWFAncw0KPiBmbGV4
LWJ1aWxkZXIpIHlvdSB1c2UgZm9yIHRoaXMgZHJpdmVyLg0KZmxleGJ1aWxkX2xzZGsyMDA0DQo+
IA0KPiBUaGFua3MNCg==
