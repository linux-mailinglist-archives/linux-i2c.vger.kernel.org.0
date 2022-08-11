Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1949B58FC7B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 14:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235315AbiHKMjG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 08:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235314AbiHKMjB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 08:39:01 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED8B10A0;
        Thu, 11 Aug 2022 05:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660221539; x=1691757539;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=bE0qzrIObsI+BtUiF3tzgzIbyUq1Er8KrNkIhEWyvsQ=;
  b=QstXJm8BGUieKKIL/a48e5w3oX4m5d4nRZpvlj1tg1OAG7SLrJmGX7/b
   FoPcL32r8a5XrHR/jwEQKWwR0dWh0ohgy08GrIIV59lwWWv05Zgx4EgmO
   QiMMIwn0HV9/VGOGAZJgdjN2WAb5vpz+mBUuv6UxzvoMKZFvZVKy6G8wg
   6tjLZeBdtQ4dmsdZlh2jkB8zMpBjUm0pnBRrXXrgpI+uIRfaOUVPtuHrp
   Z/aLrzfN/8v9d7EgCjzLu37bckFAkJ4o4jLR6jLeEHfP4QJSXhjQN+EPO
   lHqPIsndN2iiuT5gGTNAG28MNyFqyIAynpHYowAA6pVoI/qG3ljsuZ53r
   w==;
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="175982234"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Aug 2022 05:38:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 11 Aug 2022 05:38:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 11 Aug 2022 05:38:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fexl94dGVboKXu5Fl9RwRMaqlcWdayZRIBMhVG6i7evtdJ7YndN7c/2V4i5Sj/zq1oaLiESvUmE4XwdbNogUrK62Vy2NwCHMVwYj40pBvD+F13L9Kfk1p9WblUnnBH0G9Gq7fte3dtxJL6D28vmaO+AeM1HNz5xP3Az67rhKdKaUAf9TOt3YCqNwDbuWrHh2ha9u4adsQx7Gnw9U0XdPyLRIxk3pjs7t2J//q8A27aqW3zdsVhWqvBU7aGQ9yROHNGTPSY5aw7kwh78rCQTCMzgScomR5LouOtAmQoF6XhZG46egv2S3E5bw8RLintcflMy3C+EufzIS14XNsSbpog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bE0qzrIObsI+BtUiF3tzgzIbyUq1Er8KrNkIhEWyvsQ=;
 b=NY+FCSY6/cyiNR1y2RMkzk8sd4lISkpesjN9VAOAuT3Wzw2v15imtjqFwFwy25EVWJXersX+BbA2uK4UQHl4NMNxDQX2ymU88zRqFL6tfPtuqH+VuFdVpLJ7OMDMQ6idbULMruNB+HsiWE26BY6n42EHNEqh8oA7zWCc1TkSDAOoVeYFvbCB0XkRruLXb9solqXBIvH2FlnNzeL9FpF4YgkkSxH9PNUehNX+iawr6R4aC8GmVpBoeNjC9LE394TL4407gQV+jzc6YKW2FOk8OAfHXS4bH9mResQSvVBl5n5ScJ/Z9+qAS2+eswN20JmT3Xu3RTUu04Hqvm+ppv24Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bE0qzrIObsI+BtUiF3tzgzIbyUq1Er8KrNkIhEWyvsQ=;
 b=cReRVv81sSQlDQ1kb253662USmBX2undpGkdrSSUpwSKjf1dBn2w0RsH3tDjrCiU1m7eHJMzuRmkwepvWBmauDF/jhm4SI1XL7nUXhqoIhCysmQbR8khNuEddeE6meT6oFrAyBqf/bfw/dz5Ki09ohTLSrBCPeZZ0/iB0UY7IGM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by LV2PR11MB6047.namprd11.prod.outlook.com (2603:10b6:408:179::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 12:38:52 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 12:38:51 +0000
From:   <Conor.Dooley@microchip.com>
To:     <wsa@kernel.org>, <Daire.McNamara@microchip.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andreas.buerkler@enclustra.com>, <Lewis.Hanly@microchip.com>
Subject: Re: [PATCH] i2c: microchip-core: fix erroneous late ack send
Thread-Topic: [PATCH] i2c: microchip-core: fix erroneous late ack send
Thread-Index: AQHYqJ8aiQaoH2WqLkSz/xb60fnlCq2pqowAgAACwYA=
Date:   Thu, 11 Aug 2022 12:38:51 +0000
Message-ID: <a79262e2-a190-677f-034b-56757a085280@microchip.com>
References: <20220805074346.4123650-1-conor.dooley@microchip.com>
 <YvT1/LOr4udX+jhP@shikoro>
In-Reply-To: <YvT1/LOr4udX+jhP@shikoro>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c5bfa52-5840-4dbf-627e-08da7b9671f4
x-ms-traffictypediagnostic: LV2PR11MB6047:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g3p7WbMa/t/rtqwePE5kRCk6odOy2pXycwxnF68JFNWPD3MAr0ZyOvLRwU5BA0mcpBNnRV4s1ylXj1lzm8xYOLULlsdVUODvliruxHSAwesv+GVhK4PHYfMsvweUATq+ryDsJnnPSOTsKENvLUUMMly7dmtpmA9kzcjvYXDLDBqkMRfSNK7rElKFL98hkFlrTxQkMOrBaW0FCzXGER6FgVq7om5RnA0RSU1QZNQ69h6QExJzikAHsqssNIZOpOK5al8GmN2sJzhGq5XtBKjkAlL3sc4IUsAndNutH4ogcPq1KomygDsPOuQ8pmJexILJKmWmzTuAZFyiu4WojGv1gOK9dsNr4EPfOfLIMEL8PBdk559XXhlyDrDIqW/ENInmLy8Odo+7ZMjn5QPH3q2H4dBIseLapirM11GCuKxSeg6DocaEt22CvRvri5RQAdXtZSKxq7nUJKMDrybwf0BZN1Lkf+lb36QJc2wITehrAyXg2Q5aidYVRBIYVx76JbMcE/CVL/cKFrA0sH18Qy1pP4EXXypEB5YtLSOgW8Guzqercxp/U3yY6SbE1PxktWYiBhUoczXIRArA5jC1MfQhjloGuybHUqvEBQHuSDA7vUzJHQefC3MbmkiZeTY+E+gA2TtDio6raW8AvhDdSUOxdG0WtXMQfuiyGzrvkl1wACBVWSq5aRv2Iel926ZdiS3elhBohRlDMMALoRaUWN63rexHOlbVs4iDLYyP3YwCYILH9a8JDdJ6a9hZ94EEMW0CZD/BUeLDpVSqxTyFvMORWHkLdqSUZtTscPUVLoSxlAJU3RKgCs3t3thQJlvzM5tLWuqn7iKSCCwF1o16Qe9lBv3rwxz1pvwidF1a6tG3w/tnfAxYAFk3T94eJM0S6hTA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(396003)(136003)(366004)(376002)(316002)(122000001)(71200400001)(76116006)(38070700005)(41300700001)(66946007)(66476007)(8676002)(2906002)(66556008)(66446008)(64756008)(91956017)(26005)(6506007)(53546011)(38100700002)(6512007)(5660300002)(186003)(36756003)(31686004)(31696002)(83380400001)(86362001)(478600001)(8936002)(110136005)(6636002)(6486002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWdtU2JUMXZoYWtqaFVKK0JVVVZmYzZBaEZsS1FVQ0s1cGU0V05iUUhudEMz?=
 =?utf-8?B?ODFGK215OGhTZWsvTlhmWHlYN1RBZWpNaUgxOXg3eTc3ckQrbXQ2dUo0Vktj?=
 =?utf-8?B?OGhmRlgrcWFEbmx2U0p1NDkzTTltSnJXTmpMVUI2VXpxZERsM3lTelFuWjRW?=
 =?utf-8?B?T0taZCs4YmVyU3FJQWR2Q2pCM2QySkd4elA5dFczWS8zVEV5RDJqdEZ6cDNY?=
 =?utf-8?B?Mjh5MnVUcXhFajlBS2puMzlNalN3aENzQnlyNDd6eEZqZFZkTklaUVpKRU4r?=
 =?utf-8?B?Q1pqV2U1L09jNHE1UU1PTmkvcFdUcTRpc2xZakdRWDdJTFlxQlhDc0x2dHk0?=
 =?utf-8?B?Z2ljcmt4TXY4YjdMSFl3WTVvNzBsdy9NNzBmTDliS2h6ZkV1eVJFUzlPTFB6?=
 =?utf-8?B?STBmZTZobUlrVVkxQ0hEVVFSWmxqOUQ0bVFnVGxLaEZpeWZnSTA1aGN5WDh6?=
 =?utf-8?B?RlZMUnhobHZOa1NPS0p6aG51Mng4Q0xyMjFRLzZSZThKNWIwSHhjMzhmVWlI?=
 =?utf-8?B?WndNSmk1UGtVZlJkMnFSSy9JRFZyREVvWUtvajRVdmJXb25kVytJeCtja050?=
 =?utf-8?B?WDlaR2xRM0w5d0R0VEFnbW1sVHVqdnVmWVNJdTdhOGp4VW10NGRJS2R4OE9V?=
 =?utf-8?B?bUxZWktrdzVXYlJ3ZktCcjBMdnlZN3hrMGJYQjZxbnZ1RjMvVWxpakpPWW91?=
 =?utf-8?B?THhucld4REU3Sy9XV2VEVXE3SWVocUI0U0VXQ2pUdEdrNWt0bm5VV3FLRGJw?=
 =?utf-8?B?QURHcS9WODlpUkJudzdEeTVkdzAwa0JLSmtDbEhWR2oxaWVidFVTZkIzSFJO?=
 =?utf-8?B?Mk9ESjBxcDRSRHVvcGpSZkV2UXV2UXBubGhmWFJqNmVQSlNIOGJqdGdFSUJL?=
 =?utf-8?B?aVIxZWlQaDgvcHlZd0lvU0xWUElsM0tRQTl0UnBNOVByYWczZlpBRDgwVTd6?=
 =?utf-8?B?MHo0MVd6aFA3OWs4N2pKcjBiSDkrdmxMZEpRWUtreGIzM3lvdVYzMDIxOXhw?=
 =?utf-8?B?cngwd09WZW1jckZVUk9jRjhaWUpzSGZweW5nMXFyY2RwUHlmZHJJcW9yemF0?=
 =?utf-8?B?c1FFL3lVYUNOeThIWUxockNiWGhaK3dHSnJwajFVb2lRVmttWC9VQXd1eFNz?=
 =?utf-8?B?SXhsMldaaVhYQVFkNnYvTHRYcnlVZFRkOGV3UGFwWHc3VUdxbWhPMDROWE1n?=
 =?utf-8?B?c1RCZVA0emZETEp2SFZBSHFCaXRZR0paMTl5NHVYdjJxQTA2QWpuelpqalVi?=
 =?utf-8?B?UlJlSG90ZnF5VXFWTUVDK203OGR4KytMaGl5SFQycmxHZlJqbHdiU3pwcUNG?=
 =?utf-8?B?VmpDUGd2RHFNU0M1aTRIekZkTkFlQWZjbEF3M01sZTZuRzlwcFpkdXQwTUFM?=
 =?utf-8?B?MWdIczBBVzZ3b1l4WVpXc0k2L1ZQVWF4UHJLY01ETkxSaUsyMGxhQjM4cC9s?=
 =?utf-8?B?VDNPYzZsMWdrc2ViWXBhQ09LVU94RzVwVWs0WUpyQnJFKzlhQjhPSDlWdGJl?=
 =?utf-8?B?Tys4b0lXVCt2TEN0bWRwQTA0ejJjajgxM3ord3o0R01jNjRjVGhBTFU5R3Fw?=
 =?utf-8?B?RVM5U200UmNTQno2alRQeXNwc0JOK3RPUXFoVGJZQVZ1VXNmZUZEektFWDlm?=
 =?utf-8?B?Rk9DUCtQMnkweWswY2l4Q0o0L0xRTno2cWc2QUE3ZWJKdWlOUUU1Sjh1RUpn?=
 =?utf-8?B?YjBUemFWaXM4cVZNdHhibVRVbHo4R1FsaEdUNkU1U1V2OGdmdm8yTW1VVFpk?=
 =?utf-8?B?TTFiNjRqVURqT2hCVmZZTWk4N0M3ZWhHREdEMWJoSnUzU2JvT3BuL3RRaFJn?=
 =?utf-8?B?RWpua3pNYXh3REwyYWEzaGYrSndEYXp3UUZJS2swTC9Rb214ZU92dzQzcUNy?=
 =?utf-8?B?SjFKaVNpZXpPZERXZ1dEenByek5mS3IyL2NTcm84ekZIU2E4dWxJRUh4TUJU?=
 =?utf-8?B?V3BlNS9sa0dVRGYxS3l6YXhBTFo4aVVSRFRIcjFWdjQyemsvMXgvcDhGRHA3?=
 =?utf-8?B?SmxXWVhRaGh5WStWYnJZSkZlOUJUb0pDWHJjSjBHRExjb0o5R3pidlpVejl6?=
 =?utf-8?B?V0Jtdml0b0VhNDBpbzlMejl4VG81VGNKNUlIcmdDZGZKd08veEJncmtSNXZt?=
 =?utf-8?Q?NJ4lyzBLGNnpwhpZG5ExOGuEQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BAFEE531D7CE0419B0AE7BAF167628D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5bfa52-5840-4dbf-627e-08da7b9671f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 12:38:51.3186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qPS4Gsa3aNPbtHGl2UbUvxK8W8PW6SlpPxWMyhMi8yO3IbZWsIEkipdn49edUSLEu4BwJru880Sr6DExenR6SFCMG1kGoTU+kDN38PxYtCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6047
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTEvMDgvMjAyMiAxMzoyOCwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gT24gRnJpLCBBdWcgMDUsIDIwMjIgYXQgMDg6NDM6NDZB
TSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPj4gQSBsYXRlIGFjayBpcyBjdXJyZW50bHkg
YmVpbmcgc2VudCBhdCB0aGUgZW5kIG9mIGEgdHJhbnNmZXIgZHVlIHRvDQo+PiBpbmNvcnJlY3Qg
bG9naWMgaW4gbWNocF9jb3JlaTJjX2VtcHR5X3J4KCkuIEN1cnJlbnRseSB0aGUgQXNzZXJ0IEFj
aw0KPj4gYml0IGlzIGJlaW5nIHdyaXR0ZW4gdG8gdGhlIGNvbnRyb2xsZXIncyBjb250cm9sIHJl
ZyBhZnRlciB0aGUgbGFzdA0KPj4gYnl0ZSBoYXMgYmVlbiByZWNlaXZlZCwgY2F1c2luZyBpdCB0
byBzZW50IGFub3RoZXIgYnl0ZSB3aXRoIHRoZSBhY2suDQo+PiBJbnN0ZWFkLCB0aGUgQUEgZmxh
ZyBzaG91bGQgYmUgd3JpdHRlbiB0byB0byB0aGUgY29udG9sIHJlZ2lzdGVyIHdoZW4NCj4+IHRo
ZSBwZW51bHRpbWF0ZSBieXRlIGlzIHJlYWQgc28gaXQgaXMgc2VudCBvdXQgZm9yIHRoZSBsYXN0
IGJ5dGUuDQo+Pg0KPj4gUmVwb3J0ZWQtYnk6IEFuZHJlYXMgQnVlcmtsZXIgPGFuZHJlYXMuYnVl
cmtsZXJAZW5jbHVzdHJhLmNvbT4NCj4+IEZpeGVzOiA2NGE2ZjFjNDk4N2UgKCJpMmM6IGFkZCBz
dXBwb3J0IGZvciBtaWNyb2NoaXAgZnBnYSBpMmMgY29udHJvbGxlcnMiKQ0KPj4gVGVzdGVkLWJ5
OiBMZXdpcyBIYW5seSA8bGV3aXMuaGFubHlAbWljcm9jaGlwLmNvbT4NCj4+IFNpZ25lZC1vZmYt
Ynk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+DQo+IEZpeGVk
IHRoZXNlIGNoZWNrcGF0Y2ggd2FybmluZ3M6DQo+DQo+IFdBUk5JTkc6ICdjb250b2wnIG1heSBi
ZSBtaXNzcGVsbGVkIC0gcGVyaGFwcyAnY29udHJvbCc/DQo+IFdBUk5JTkc6IFBvc3NpYmxlIHJl
cGVhdGVkIHdvcmQ6ICd0bycNCg0KSGVoLCB0aGF0J3Mgd2hhdCBJIGdldCBmb3IgZWRpdGluZyB0
aGUgY29tbWl0IGluIHNlbmQtZW1haWwuLg0KDQo+DQo+IGFuZCBhcHBsaWVkIHRvIGZvci1jdXJy
ZW50LCB0aGFua3MhDQoNClRoYW5rcyA6KQ0KDQo+DQo+DQo=
