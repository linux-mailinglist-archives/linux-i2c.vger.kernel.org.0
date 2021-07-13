Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA45A3C6CE1
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 11:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234702AbhGMJJz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 05:09:55 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:22191 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234663AbhGMJJy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jul 2021 05:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1626167226; x=1657703226;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Hg4Alnzvkm9RZnd8Fk6mE+xCxkS1Z9+REV2an0huLWo=;
  b=II0Fy8IAG3TRREdR0Tvu+wLEXp5ZvFqpsSNLyDMqJ6ZzKxD7vZgldqlV
   5gO9c9jvXAI01Te0hLusLA81ImwwYFefTKckaFKXtLcXCbKpdQ1t9uyhc
   yBp+3LURC/5Sr9xMgORKBBprMJGMKKNfnTfWNao75Co9iRwIUy9bgtuZL
   kRstVyHdiJ7ZyvscUa77S44XV6Lsj5E8mTg/UdFk61v18dGc4bq6tkDvp
   LllGRTo6BcyZQccZD5GxqFBDfeOqyHXbrggaDCPFfgpp2teXYRkwC3Meq
   Yq0ErZdZ1bkVRjBVxDwAcPSR0bqHpOskUrhRBdA5Nt2NSQ5ykyKTFpYT2
   g==;
IronPort-SDR: lyScv05YkyWWqph18HUoT9ML+4Hjt4sIp0ZOB3FzYQAWzK1EcEkRtXTtatzIP9VouH+u924fEf
 Vn/sd4Vt39VHpuk3XLKOhbuGTHKQrFogEyyPbIqrDkXS4MNdwoJDYg9evq+C886FK05y5K9eAu
 n4E1lOZuy/A/tvwKZMSCda92B9WwZkULHIwKj7F1HAth1c1l6Q3tVIjhf8QvPctcKSwaYfvWCi
 Z3CoQCBHWXRRf8jST5DCmlpfwhj3Lyeliew3Kx/VF2k0AJhtUB360Y8IoCjWcaABscKOQjclfU
 0U0=
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="128047153"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2021 02:07:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Jul 2021 02:07:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Tue, 13 Jul 2021 02:07:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/Rkqgwm1w11LOj1K4Sq87jdrlRoke3whnLoGo5zaA8brzAKQ7aQBEJ5bE49Iamr1Jiy5JjoBXKWJEzNH/awYLqh70ShfEFtAPVqncZQStik+VAIMlto90JKmoD4hoLCBwKxL00pb65gXUozjAEjx2ENOPgTgXjfrbK4zthwMIbO8sRCT91S934QQxEXd0F3cjLO5aiajl25DZ8gl1G85xNfAUVCO05jyl9NB2aQ5Mp5+Wso3JYzTh8BabmkLIATQmcGufPfg9tk9Oa4+R+9+S14i6PCM4BFQrzSR3hS/7eeq2DUwb/k3ojVjxJHwi8G9Mm8rpMxMXm7KqBPMCtbcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hg4Alnzvkm9RZnd8Fk6mE+xCxkS1Z9+REV2an0huLWo=;
 b=E8rm6q7zM9x1AiaxlScOIM+4ojGsLTf3fSbL7nD+2SHDovl2IWoXpbXQE8BRClTO+ZAEQkTZCc8JYdgodPD6KlQ3exlBhvzH0NfaRoHsLLbBfttczlNr3lVjG1L9SV3AXtLTviXdXMy9snPNAs8c1CE9bkjFgAdQLU8mKw0SrrJ7pCYzy0v5OKEqauhtngFvQHhsxHXd6STHnVi0wBeT5X5HzadZVLHN/6FPY1Mr25q9dznopFJobzCgjto35k09VbKAexMpapdMSyh54EnVnkrs0QBFG5whlkAE9sjInI/fL3lviZD07H2mQAYz/Iy6i/nCI4KNInxzrdZKQO1CEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hg4Alnzvkm9RZnd8Fk6mE+xCxkS1Z9+REV2an0huLWo=;
 b=tYatekcnxFzOwAXlojywT9sQbZdl2Nc+6rdLqRpDVrIKg4kRtjo0pH9J6d7uxttEQcHISUyGhzVBN1cRO9QxASL+QO6t6sCG+InSHNoGowYzzbX+P8yTaZsw3PlnLLxmT93kxaL5Wqc1dPYInYjfmo9qpSBd6LjquDRDYQ/Q88o=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM4PR11MB5376.namprd11.prod.outlook.com (2603:10b6:5:397::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20; Tue, 13 Jul 2021 09:07:03 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::44ef:d8cf:6e86:2cd5]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::44ef:d8cf:6e86:2cd5%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 09:07:02 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <wsa+renesas@sang-engineering.com>, <linux-mmc@vger.kernel.org>
CC:     <linux-renesas-soc@vger.kernel.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] i2c: at91-master: : use proper DMAENGINE API for
 termination
Thread-Topic: [PATCH 1/7] i2c: at91-master: : use proper DMAENGINE API for
 termination
Thread-Index: AQHXaBaLO0AD4EQjfk67xnkt2E5KSqtAvLUA
Date:   Tue, 13 Jul 2021 09:07:02 +0000
Message-ID: <b777820b-5b87-1981-4d80-8a5c3373eaac@microchip.com>
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
 <20210623095942.3325-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210623095942.3325-2-wsa+renesas@sang-engineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 841a4002-81fa-4aec-9ac3-08d945dd946a
x-ms-traffictypediagnostic: DM4PR11MB5376:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR11MB5376107EE610E1325B82DC0CE7149@DM4PR11MB5376.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +mjjrsVu71+OqLnAZ5VW8Wt0T9uHANnjr9GfgniQQjbZ1M/v29n8/7XPsSGWXtuXIUmD+QvdSyilcKZw9IjaCRRigFIuLCS6LkFKptPJHKLhsrQ2pQSq2GgJ6RYm/bPMls3NJOnc03GHfmrN4YaXpScz1YwOfzQV9lGi4zQQYyv3cwGiY79YXUEaVr4L8oRumDx66mPcY8BPx/0/drKrKU42j7+6FNesdtCEJDg2IO7X0YvJrgmmiSuIa+ZFEiB7tkNVv8fgVLPNLWokshnykY/Geyx7Y+rqWf7ucqcX+l6ikK33gwEpflmu3kvCdYHZyKpRmuq/haJGiesakj+pURGtCTJ8yjFFPa3CRxGycn3rhSk+OJnoTuA4sN1L/LnEAee+QPeaiXBwL0eTi3IA0sABQfOSQhiMET/MM/OQ6zKNi4gaG7sBhM/EswrNEj3L+jUq3KCmQtIQvrr/NuwUdX9/+0pEhbsO0Fh7v03WBR6sIGTtbum56WP54GXdWK4p98ME6a+ChOQEj++UQmTjdKbWAlSzTwNzX9wG3+JPTGPhzJHX6FaOf12EER4IJUYNeTUzvyhKFckiB7Ij2HM70+lnIsiEdB021bhUfUtjUP4Ux5kQmvNm4powPOkMgh5tepaqJrA8KJ1ixx/lHznIcN13GRBpnfpXXfgSfRGQzYKWKiXzMlGgjkvczT2ErruovMuLcMrs4sEtRIi6b3Zt/Btyaj07EBEq7q3Ao968M7oPq+rgeR3csEFMyxEhVpjU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(110136005)(31686004)(26005)(86362001)(36756003)(66446008)(31696002)(54906003)(38100700002)(498600001)(4326008)(2616005)(122000001)(2906002)(6506007)(6512007)(71200400001)(8676002)(76116006)(4744005)(66556008)(66946007)(6486002)(8936002)(66476007)(91956017)(5660300002)(53546011)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUdRT1I3elkzTzJteDNIMHMrbjM2Z3krYWs0VTdObUdmZXVGTWUwVFZqUVFT?=
 =?utf-8?B?eHVvVjFBckZSRTNxM0NKZGI4M2JIUkZ3aXl6TElvVnFPWXhLdHJjRFVwK2h3?=
 =?utf-8?B?VjBQeU9FYjFxa0d2eGxiaGI5NmVSYUVsYzE3eXVvTWdDNnlGTXE5eVN5TTBt?=
 =?utf-8?B?OXVhQ1FscWRyYUk5b0lPc2hkTWhyTFM4c1dFL2pUNVlwdEd0N1BuTW9wbVUv?=
 =?utf-8?B?djhZV3FNUGh4WmFlRTF5bmxLUFRaWThJcHBKKzlyWFpWYnlTakp2dE9yL0xI?=
 =?utf-8?B?cXJQeTdHd25WejZESlBwWGVBM2RrUi9WbjNRV3JLMUFuT04zUG0xdStpOUpV?=
 =?utf-8?B?azNOTnVxZFVzUVIzSzNncmZFTGxxOCt1VFFLR2pneG9FYTd4ZHMrZjhPeTRl?=
 =?utf-8?B?R2NoeTlGL1psL3hCb1UwRTM3OWd4bUZmWjdVcTZ0ZVd0bFNsa1VwdHFuTG1E?=
 =?utf-8?B?MVlKaDVIb3BsRVg1UTdLSkprUXFpeHg5Zm5HcCtDUkt3dXpYL1J3YUh0cnla?=
 =?utf-8?B?R3kvRS9CS21nSHdIWENZbVlYNngrN25DQlV5dXNIS0c5RnlyRGxpcUVZMUpK?=
 =?utf-8?B?NkN3cCs5WVY2cUxoWmlDL0kwWitKNmNTQTJCZ1crb2kyUlR6SS9FZ3hqczVa?=
 =?utf-8?B?emJkT2Nod2VGM3JaNVovU3N2ZkNVMTNtQ21rY0FwTFJMTUFHam55NFc5RzZj?=
 =?utf-8?B?SGlPUys2WDNxbndDQzdSeERzcW1wN0t0MVpMdGs1NjEwVXUzUFoxbWhQVDBw?=
 =?utf-8?B?azFYQkJNR3pPVm5TQXYwb014T010bkhCVnQvL2R4R0hkRThBV3dZakMyNitV?=
 =?utf-8?B?MDR2cmpOY0R3SUIvSjdZd3ZOaUVBZFR3M0ZERkRtMUNhNnFXTTk4eUdrWDdX?=
 =?utf-8?B?S3kvTVI3bGRIclRnWW9oNi92NzRGQ2xHcDYvb2FkUEc1eU5Bem1VUFN1cnJT?=
 =?utf-8?B?R0FFbnZFWGIzeU5sKzZlcDUyYWM2WmM2ZDBmRFMrODcxV1VEanBLRWN3Mm9w?=
 =?utf-8?B?SlpVSXBpTFE0R1J4QmlJc2RuejN1YVJ0WGtZd2J6VWJSZTNYdGdzZWtzM2FU?=
 =?utf-8?B?WHBuY2pRTEZ1Zmh2NEtSSmdUS2Q2ckhGeUJLU1FOOGJJYytKT29LcUpLQVhC?=
 =?utf-8?B?Q09hVWZSd1JFVk8xQ3poZngzS2wvK1lwNGVtOTYxUjh6NkRQYlNOQVV4N1Zt?=
 =?utf-8?B?OERMZlphU0ptMnRkRFpBQnJqUEF4VSswRUxTNDNMTmhXdWI2dGNRTXZtQ3BK?=
 =?utf-8?B?a3NvTlBQSGEySXFESWZiZXNVRjY3cFlYaDYvUlBxMHVOQ0txTWxFM0QwZ2ZG?=
 =?utf-8?B?TkZKV2xVeDhhZko5MVpHOGVtVDFaKzQxNWQ0R1k2OEJYL2phQ3c0TFhWUkNn?=
 =?utf-8?B?ZjY5cGxMMkI4KzVXRG94SHRvdG1ueVo3OCs2c2hldldEdG1ldlJYb3hUOE9q?=
 =?utf-8?B?KzI4U3lUYS8zUEJnL3lsZWhMQitMbEwwRWFFV1BOVUhyMTBHQUYvaWpRWG15?=
 =?utf-8?B?Q1JiTVBtd0hOTkFOUkozRkNXS0xXeFJqajBkYWRjZkxKOUF4VlZyUFRKd3Bt?=
 =?utf-8?B?M0dBM01tUVM5czAxaTUvL1VTSlZwejJ0VFVYeXpoQm13UEN1UEExdjFyTW41?=
 =?utf-8?B?dXpyNXZxZjVWcEhteng4elRSbGxJWjhncE1TRE8rSFBiU0lyVWs5SmVQWHhp?=
 =?utf-8?B?WjVVZm9oVGpIT01tN0YwaTFYbEJXd0Q0bnhLYWtyR1FSSHpzUlArS2VnNC9Y?=
 =?utf-8?Q?sXWebPjH2kkE3Hafw0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B620F44B4ACB6349943A8DE7B34D1971@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841a4002-81fa-4aec-9ac3-08d945dd946a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2021 09:07:02.8833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6To592eiBacIzx1lm9JkkqnGkTPVn0gJmOb6cRReeh1t5BJIHgPjxp6jd4B8QmdEMi1QuhkZwr8zsNKFeiiYS+ulzXqe+cEfoNkyEwi7KNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5376
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjMuMDYuMjAyMSAxMjo1OSwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IGRtYWVuZ2luZV90ZXJtaW5hdGVfYWxsKCkgaXMg
ZGVwcmVjYXRlZCBpbiBmYXZvciBvZiBleHBsaWNpdGx5IHNheWluZyBpZg0KPiBpdCBzaG91bGQg
YmUgc3luYyBvciBhc3luYy4gSGVyZSwgd2Ugd2FudCBkbWFlbmdpbmVfdGVybWluYXRlX3N5bmMo
KQ0KPiBiZWNhdXNlIHRoZXJlIGlzIG5vIG90aGVyIHN5bmNocm9uaXphdGlvbiBjb2RlIGluIHRo
ZSBkcml2ZXIgdG8gaGFuZGxlDQo+IGFuIGFzeW5jIGNhc2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPg0KDQpSZXZp
ZXdlZC1ieTogQ29kcmluIENpdWJvdGFyaXUgPGNvZHJpbi5jaXVib3Rhcml1QG1pY3JvY2hpcC5j
b20+DQoNClRoYW5rcyENCg==
