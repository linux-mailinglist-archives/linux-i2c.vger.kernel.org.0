Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 841FB6B2806
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 15:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbjCIO7R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 09:59:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbjCIO6z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 09:58:55 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7511F6B69;
        Thu,  9 Mar 2023 06:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6kWpjHzlN+17YSv7u8BJzT5+/9oKGo/yWceLyQz4CV7goTsHYiA4Bk4PqD/fay7R4Qk1Ry1Vq43diTdodo5iWgiGkkFF8/ToJjJRhfhKZ7zxhTfXkicN9jLDAtuSQkfj9ZJJzLgZnhojZMEgmnkw2Bn/MxeOxynMEttm35mPAwy62a6Tz/qBVI46DRalizZpDfbquE4dIxuivDyht1TbqDmfcyS48mAZTkl3rSMTeDx74pgbZf8LXlaHOtkrH1Vbi6pErnEyX/LSsITTsNG49529GmkyUh2MRB8MTQin6s6OQXOa/NlYh2iy8tpCjJtarQYc7BFOPqZsm1UmXunkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyq8XhKkUSpgpSZN91MdBQJ5jmdMNaQ6vtpNr+nIwlg=;
 b=PNmPIa7qYCAxMI/+uFcsS0blloygB2YSKYcJDw0jAKwBoDaAe33goyGyMl3Iny3muhVIfriZJmJjF22HvGMuE3Bu9fKKigX/r3JM+sEFnrOxZQlSkHVRo4u59FwTc5cScdaRPtrzLTobTWx+W8flH64lEBW+v51rdmWiSplkCOgJlP9sFBQb+DUFVZ3XW3yZDlc5gvtaVX1o7anGjUHv6bj/ummdXee8T9rvMdTjNnEBv35gHVnJNzXGbMRPstE8yG05qHJz6plv/9zNxztpG7J4ZqXG4+PhuXyRReWhaSpKSfiRqKmByQCf4SzRVtYOZ9WSRNpVfNwsUUKoSQfqkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyq8XhKkUSpgpSZN91MdBQJ5jmdMNaQ6vtpNr+nIwlg=;
 b=SIOeRq/waS8WAllUYoh7rwXuo1j6ndjUTZTJMQMhnxsbjTvsbidMizod6F6VCPv0XZ4s+4q3guApoWlfLluy5hf+WlqALlvtv9OR2cDjldvWbPjsPJPZEPKqSmkYfC5ei20Y5+wSfCF1ww2C5TnKXbAJfYdNMt2oVF1j+W+hMsdr+dWb9VG/ibfOMRxFlkDXlI5MN0bURRjfdk5si0mU08S4rhSvGhJntjlLqVRoTGnyLjSVmjPf500+GBy3/XRitgzSfrxAirF6Js1GQbPgLecGJe1uA2CETJYoE68tm/6y1bfVey8Gya/BQuJRKClz12N5B8/69d0xBj2Q02GAJA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by VI1PR10MB3197.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:13c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 14:54:56 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ec7c:461d:e331:1a85]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ec7c:461d:e331:1a85%6]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 14:54:56 +0000
From:   "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To:     "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>
Subject: Re: [PATCH] i2c: lpi2c: cache peripheral clock rate
Thread-Topic: [PATCH] i2c: lpi2c: cache peripheral clock rate
Thread-Index: AQHZUo0Ux+LFtgRY6UWCEi5vR2StlK7yhDCAgAAE7wA=
Date:   Thu, 9 Mar 2023 14:54:56 +0000
Message-ID: <efeedfe844926b3a8484dc3f9913fa3792238b4c.camel@siemens.com>
References: <20230309134302.74940-1-alexander.sverdlin@siemens.com>
         <3718474.iIbC2pHGDl@steina-w>
In-Reply-To: <3718474.iIbC2pHGDl@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|VI1PR10MB3197:EE_
x-ms-office365-filtering-correlation-id: 169fadb8-b7ea-47e6-72a1-08db20ae3f85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8YzNxfM30hiESAusXb4S5fkAoZjTR1lo6/QWgfuVAbDYN+h3KZfxBQ5hET/nFoNt7ZLFV8cr8K//Oi2vYI7kp39jqRKvXbdrKs5PUspxAx5Rt7Nni3sp4Rv+kRC+Kb65jI7rGvDyK4gc9SYtK2knr0Gc2SVpHKSu+ZXEoUv+xuzGz0L2/idGfkdHqruhGyNjgmd+S/0wt0eiMXBDyLhHTLYcpm6vOancedItVjHhmIpEjlpkwAF6R89U6FguNcFP9pBbMOty/R+DDVDeNChNQa5oxXimRSyrkpMVZAoK7C3NotYD2zHDf+4fYaH32cE69vUs2tJyzpSQWDUbzYfsj/hQRXK49W7o4PcgNbwcb3EapwZkvCUgUESKrq3O3a6FhLmo3lI2wNZP3CNzKeiqh9X3txQCwXLjMYd6D1AS8z/UaNpEKev9RcQ3GsaW+/4EsMNIrSpGtgJE5I2XkAY4wl8rc375babtGDQwbROB94BWNHIFXaJBKxi0oOj9twxzONcZK+1l9O+mz3GIHlHAN6faC5sivQTPa56sTBWg0Xk7UyuUSc890BcGZq//7ALuOwj/fNrIb7CUVOtT7FxPhBsSfFiE8P2jctow/GRkODhZcBmM3idJ1OB0wo4sD+K3X5cIikrSxxOyZg2fko3Qk8kmvdB3g9utPZFsv04u9D4r5Xc8UOOZKGAVgNRhcOdKxC9cU7Zm9hJAgEfaMy+Td69P4BBgzgp/vWPxTg4RpPw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199018)(36756003)(6486002)(122000001)(26005)(38100700002)(82960400001)(55236004)(2616005)(186003)(6506007)(6512007)(41300700001)(83380400001)(66476007)(8936002)(66946007)(15974865002)(66556008)(8676002)(6916009)(4326008)(2906002)(64756008)(91956017)(66446008)(76116006)(4744005)(5660300002)(7416002)(71200400001)(316002)(86362001)(54906003)(478600001)(38070700005)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFBTRi85eGYvWkpDUmxXbE9uK3VGeUhMTmprUCtRdUNiS2JTNmdNb29xelR0?=
 =?utf-8?B?enZ4NVo0OUVJS0xUYXZYaTE3WlhqOUtEbjgrVmk3bGFTc0o5M2xvY2RiNzFt?=
 =?utf-8?B?Y002Rlp6N0FPMUN1aHpZSmJJYkcwMXk5OG1XU2EzL09qdUthbjdtenBhNU9x?=
 =?utf-8?B?Z3hQYVdhblpJM283VXl6QW5RSUpudUpZaHR6bmxHUHpQM0lhaHpBOGxZTVRX?=
 =?utf-8?B?U0QxQTQrUFRrb1QwUzNIcEh2aytQTzRXZG0xRlBpMU5CMGI2bDVQeUh4OGZD?=
 =?utf-8?B?bytRYllNZU1Gbk5adGlaR0JWRHVpYVhEZEoyMXJSREplOGlIQmZLbll0ZENT?=
 =?utf-8?B?WWFBVlBGQWtIL2pxSE00eWVSd0h6RmVsRzZweXBqb0ZMMGZGMWdFZWhQbEpE?=
 =?utf-8?B?ZGhSTDQ4QjZ2cHQvL0prSy9lczJUbjROR00rbHMvRmxjRUhFcUF2TlVKdlRy?=
 =?utf-8?B?Tm1WMWFXekxNYkM4YmU0THZWNjNnQVUyZTk4LzhWVGdMaXVEZndEejZ3T20w?=
 =?utf-8?B?SlV5V2hzRm9rcEdTTDlPQUIveU5CcXo0Zk8ycEV6d09DK3VLV0J5NjNER3dJ?=
 =?utf-8?B?YzRObEdYNS9hQUttN3QwS0VpNVRncDlreGl0YUJremV1UXVXby94R2pVU21H?=
 =?utf-8?B?cjNOMkNKN3NnaWZVaEdQNElXTmc2Y3BRblppZ2RaSkd1a29YWjNiQ05nMFlR?=
 =?utf-8?B?ODE3L0tKb3JUMkcyMTYvK3dqTnpCbWQyRzZzQ2RYMTQ2QlVFUUFkdmR3eFVK?=
 =?utf-8?B?UW1yNXJKcy9IVHpVNEcxK3UvWWlzN0xNcFYwdnJNUDJyQURpeFJzcTdUSHBn?=
 =?utf-8?B?RjY2R1BkaVdDNFN0Y1FUTk96eWNXSHk5ZnRiSFlTN1cweUUyczM1R0xUOU1y?=
 =?utf-8?B?UExNYk1WLzVCejRQYjF4SGZ0VlV0czN1bTg1L2hmM2UrTDZsQUJxRWIvd3h3?=
 =?utf-8?B?Y0RPMVIrbUxidFd2dHpDOHNmaGpYTzY1MU5QR3VVQUMxWXBtbEVpMDZFeEMx?=
 =?utf-8?B?dFRSSHBMcVpJRnBoaXZ4M29qd2FwV0QyTzVmeHVwNjlVYURvQnRDVFU3dU02?=
 =?utf-8?B?b0NIRHJ0REtvOFcxbHFramJzUjlYWmlwazVXSFhhN0NPa0dnbGJaaW9Pazk0?=
 =?utf-8?B?T05FbytHTVJiSzA2R1Rtb1pnd0M2ajRpbWpWNDBTdEdCNGVXdEZaYjRYcXJM?=
 =?utf-8?B?NmRVVFlNa1BEUzZoSnBzOUVmRHFZSXJmU1NIL2M0aDRROC9uNVZuNlJQRlJ1?=
 =?utf-8?B?Q1RKR0I1RlY3aG91L2trVFk4Q2RQQVRjbHJ6M3FxM1YrUDNBR3FTWHh0dkZ4?=
 =?utf-8?B?TTZ6NmlqRDNJV01VRWtXTGczWHV3dDZ2MDRWRVo5SWFDMEpqUzhqQTlQWjNU?=
 =?utf-8?B?VjRsYlFxZklOWjJOblN5ZVh4RUlMbFk5UlJYczRBblZkT3hwL3RrWXd1U3R6?=
 =?utf-8?B?NTFKMEJUUkdUcC82QVFXZXlkZXE2U0pFdWdtSDdQSlMxQWtEWC9CR2VFNDdB?=
 =?utf-8?B?cTlJL3N6NFZUNVhGZnNxV0RFQi9zUjFObUFwRUlMOFRjZWdCRUMyRHVISkRR?=
 =?utf-8?B?MDZFZ1FjZjNTSXc2SHJPTlBxTkt1Y1MvQWVNVk9xOG5oR0RxSittRmI4dVcr?=
 =?utf-8?B?S3NlLzFZYm40U0F6ZlVBUVc5ayt1VjlvcklTWmtVY0E1U0xLKzZsMWlBa0Qz?=
 =?utf-8?B?ZkgvQmYrSDczSWo3WHptdzY2amZ6Zi9VV1RNUS9UOWU2WGtabW1MNVhLYWxm?=
 =?utf-8?B?dXpjTFpNVTBXSHNsdlNPOElGdU9aSTB5RjJxMDJEZ0NGRUVTNjBJaTdWVXlk?=
 =?utf-8?B?S3h2eE9USUc1OXdmY3dlV2psTUEvOW51YnY1VlRqM1VUeWs3QTNYUGRoNnlp?=
 =?utf-8?B?ZDZYUFpHQk9RQTJCdStkbkdhRzBiVFhNSHh5NDlRUjBMNVU4a0prS0VFWEto?=
 =?utf-8?B?ZjZ2UlhvV0pnY2FxdlVaNGY3d2JzOVltWndYbVBWWkZwQ2ZXd2dOQ2E2dTN3?=
 =?utf-8?B?UXJJa1d0djEyeWlaY3NybGNMZWxJZGpKeWFxUVFFb0l3ZmxjQlRlV1BTb0Vw?=
 =?utf-8?B?V0VRdUVlbEsvUW9CTjVHWFF2MFZobjlJWi9TZnZQUVBKcUZVUWROQks3VEVl?=
 =?utf-8?B?QjB0YldwSk5kNVU0WjVsQVBpdEh4TFduRGRPK2pUa0c0eG5vQmJIZXFvbWdY?=
 =?utf-8?Q?vl5Ik4QbGVsEbUBaChQqYGc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6720A8E1F58C224A8AEB3A7B3E1B5A2D@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 169fadb8-b7ea-47e6-72a1-08db20ae3f85
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 14:54:56.4853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tZEBM4Mi0yg+CbgsxTiamshKiNccH3EeO/RIjW12T5dwTOuxMS/wyAp1d2aGnWMMCl7bjFSZFgtSLNmsMLWqc4DkTzT+8SCcSSfKRRRFbnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3197
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,
        SPF_HELO_PASS,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkhDQoNCk9uIFRodSwgMjAyMy0wMy0wOSBhdCAxNTozNyArMDEwMCwgQWxleGFuZGVyIFN0ZWlu
IHdyb3RlOg0KPiDCoEZyb206IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGlu
QHNpZW1lbnMuY29tPg0KPiA+IA0KPiA+IE9uZSBvZiB0aGUgcmVhc29ucyB0byBkbyBpdCBpcyB0
byBzYXZlIHNvbWUgQ1BVIGN5Y2xlcyBvbg0KPiA+IGNwdV9mcmVxX2dldCgpDQo+ID4gdW5kZXIg
bXV0ZXguIFRoZSBzZWNvbmQgcmVhc29uIGlmIHRoZSAoZmFsc2UtcG9zaXRpdmUpIGxvY2tkZXAN
Cj4gPiBzcGxhdCBjYXVzZWQNCj4gPiBieSB0aGUgcmVjdXJzaXZlIGZlYXR1cmUgb2YgdGhlICJw
cmVwYXJlX2xvY2siIChvbmUgY2xvY2sgaW5zdGFuY2UNCj4gPiBpcyBJMkMNCj4gPiBwZXJpcGhl
cmFsIGNsb2NrIGFuZCBhbm90aGVyIGlzIHBjZjg1MDYzIFJUQyBhcyBjbG9jayBwcm92aWRlcik6
DQo+ID4gDQo+ID4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09DQo+ID4gV0FSTklORzogcG9zc2libGUgY2lyY3VsYXIgbG9ja2luZyBkZXBlbmRl
bmN5IGRldGVjdGVkDQo+ID4gNS4xNS43MSsuLi4gIzEgVGFpbnRlZDogR8KgwqDCoMKgwqDCoMKg
wqDCoMKgIE8NCj4gDQo+IFdoaWNoIGtlcm5lbCBpcyB0aGlzPyBNYWlubGluZSBvciBkb3duc3Ry
ZWFtIHZlbmRvciBrZXJuZWw/DQoNCmZvdW5kIGFuZCB0ZXN0ZWQgb24gZG93bnN0cmVhbSB2ZW5k
b3Iga2VybmVsLg0KDQpbLi4uXQ0KDQo+IA0KPiANCj4gV2hhdCBpZiB0aGUgcGVyaXBoZXJhbCBj
bG9jayByYXRlIGNoYW5nZXM/IEkgZ3Vlc3MgYSBub3RpZmllciBzaW1pbGFyDQo+IHRvIA0KPiA5
MGFkMmNiZTg4YzIgKCJpMmM6IGlteDogdXNlIGNsayBub3RpZmllciBmb3IgcmF0ZSBjaGFuZ2Vz
Iikgc2hvdWxkDQo+IGJlIGFkZGVkIA0KPiBhcyB3ZWxsLg0KPiANCg0KR29vZCBwb2ludCEgVGhh
bmsgeW91IGZvciB0aGUgaGludCENCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMg
QUcNCnd3dy5zaWVtZW5zLmNvbQ0K
