Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1FA54B316
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 16:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244443AbiFNO0O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 10:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233764AbiFNO0M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 10:26:12 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5293F2D1D1;
        Tue, 14 Jun 2022 07:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655216769; x=1686752769;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=UF/zz4c5C5a/BN/JNRDeX3rDuPWLc0K5+fpgn90e8Hs=;
  b=eH0YgkU8nZOaOEhT69wOrYivBNrSgd0/EATnqusUQu2PkxXXdzEsZo3c
   qEQXahWgb0BfGZubtyPIw8QK65pVc8AUSWJhPchRxnl+FKC1XtMllho/J
   DxNOXbHk3WPgd05vhLm4lBKfEBKKYg9IlSsHOYtshggnbQnFBq5BjbsB8
   L4NsaRgtikPAHEkpd3uoZWRAiU3iHLtFz73Q/XebBsB7/o1z6fPLeBEMw
   8saNO8Fn2zqMbUZcuCQ1YJ0AHMqsNHmTzeBZhxfwmdtLq4xZ1nTP38MKj
   nA0pL+bTYUuBw+QwwgXUhIDcoGmVJw/nZd0USM2JekMGLkGsmiOeqEHI8
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="163300053"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2022 07:26:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 14 Jun 2022 07:26:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 14 Jun 2022 07:26:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeV3F2vJUWbjwvtnpa7g/k4OXnAVP2gxFcMIylPx73hxolE7K5A+1mJXTjJP0zR5A93aQgbGjmrVAMRz9sckSvdA74WRac5BDL4pmnVfMY1CHwf9OmucdhVrpjoTVYBh37vqnJXQ3Z7dhDH6f6nLRMSw0pCVe2eupe3wWJ8jqgg5FoBGf8fkU/YTsuZJvEsrsYIZbrKUzrYE9+/RB2rXJ+j9+Kh96UjUuSyNcx5srgPSkFffA4SEePzAaXxsyM/A4IAAD0O0erp8fS/gvDlkqSVY2g4W/HILte2OPYyrvV+SZg1n2/r9SjGDd0hp4L8em7W5foCRwkkfzoQFmCJpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF/zz4c5C5a/BN/JNRDeX3rDuPWLc0K5+fpgn90e8Hs=;
 b=OxSmpJfjTdUEtP63chpMweqLA03rsG19OjL31Zb9jKIA8AAMYvChIWmWkdGHQiQb3Nc50N6DcLdFosQBHnYWzwQ7wayrDY208bEvcDm9/HINsXBA3NHPKKN1uaO5H1UU7vBwCimec5RVFcVuiQBjWWp8r2s+Ixi+RvcsQ0QjOFWKRw6aZfjz6WBNO2l65IUtQL63Ud5IEbqlCeppxNw1NCou9lTGvRDAVloFaTVmtUMHbI7klrCMeho/PKrup9XGTpVpe9X2H9qkIe6Jx1HPRRKWjwSYkHh5FCBUiqz0qqNd+RBTpNzJbLYEZSvCORNyK6LbpzcIBwkd1SW1/DIbMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UF/zz4c5C5a/BN/JNRDeX3rDuPWLc0K5+fpgn90e8Hs=;
 b=ihSa+airXlxZQrqUKYJJEA+1YyJC/inD5GnBWyM6RnA7Iw3Xc5yXSW9UDfqDCckzKAqB6MzPyyntp5fUmh+4zdGUzrLFMJYZg+TT7PuJvyY/fBzQHwSZd1243L06F9N8ZtglEHOg7fxr0Tvrfy6886W5nM3F78AVaE91Cy1WnZI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DS0PR11MB6520.namprd11.prod.outlook.com (2603:10b6:8:d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Tue, 14 Jun
 2022 14:25:55 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 14:25:54 +0000
From:   <Conor.Dooley@microchip.com>
To:     <Codrin.Ciubotariu@microchip.com>, <peda@axentia.se>,
        <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>,
        <kamel.bouhara@bootlin.com>
Subject: Re: Regression: at24 eeprom writing times out on sama5d3
Thread-Topic: Regression: at24 eeprom writing times out on sama5d3
Thread-Index: AQHYf/qo03wBsLUalkur2KxlbCQAAw==
Date:   Tue, 14 Jun 2022 14:25:54 +0000
Message-ID: <c26cb513-9cd3-6e87-9345-21d57e5a207d@microchip.com>
References: <074b39c5-55fc-2bc1-072d-aef1070e284d@axentia.se>
 <2bb4868b-90ab-887e-bf13-9de8b79231bd@microchip.com>
 <YqdQoJbsgwjQ9PYh@shikoro> <0ce8b9d7-8a9e-cded-1762-71e230f4246c@axentia.se>
 <ebadf90a-066d-1cbe-b15a-3a99e3ab2bd5@microchip.com>
 <0dd2fd90-07c1-f693-1782-e68a7b2efbf2@microchip.com>
In-Reply-To: <0dd2fd90-07c1-f693-1782-e68a7b2efbf2@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f785c62-bf6c-4ec5-0bb6-08da4e11cabf
x-ms-traffictypediagnostic: DS0PR11MB6520:EE_
x-microsoft-antispam-prvs: <DS0PR11MB65204CC8B2B43F5330C22E9A98AA9@DS0PR11MB6520.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rlUFooKQ/oO+M1oRZfjearTe5lI2+2S+BreslSPwcf6urT9bywKBkPaF1YvaT7thk1zqaKmLmI+4/Y0+KCRphqLbpqSrNcJiR+WxI1I7eX3pdAGlBxid8zMEqZ72fCQmZNOs2+mXQlKL//iquqUJ+MAKO3zkWfyhhJ4F+d6sZfNqdh2eouDV2ERm4e45eQ9ASVD71ZHxtHl9wW0Bulb5NPklnORXLbUIi6wrAwkZOhYsQgb0dhYXXs/4Hln/VKzdDO6bhfC/Zzt8h9y+7RWEGetEYm6tzw5+nnHClvL+07L/Ftt3OMTvirOf3T6tgVlgXfU0GD0OYpcjCb5W53IkGaKwggVjgfobCxspZ75CQo2pXRCVPIUfCkzwDi88hN/mQTrj4b3NuoS3wmem9jnAl0SMPo7I3bi4947M95Tb45No+zF2fUDFUnzRb4JU/ZkP7py4NOQ0LoUrBkAH1f+cE1c70q6BcDaY2iF3M1ek+DPqSdalHQ8Pc5ZodKrzkey3yxeO/mguC0+nrGVwlemQkIQAGHZXLNpoaixbqngyf1vJTQFdupr7HkIHgoBgkpjbk8FzpQv/EvTHOm+LATSAEI1ew3lJxJP5WGFICifoPX5C7DAB6tbPF0OulzmtZzq19bbiRxfwXs2/WnCfd9TN3EMFccSBysAiA9f4KJlewsjxnl0Q6aT2r1Mh3hLThe76gvPqpl5UjmC3qja0Gyzesr4jPHmfPgHeyfPTZWP7G3Rji1QCFLBGrkm2m5P8bDJcGHJhRFDgzBWRiUg5y3kplKr1k8HBQJL0Ee7XI9uwGZw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(38100700002)(31686004)(8676002)(66446008)(66556008)(122000001)(5660300002)(26005)(8936002)(6506007)(6486002)(76116006)(66946007)(6512007)(316002)(36756003)(66476007)(64756008)(38070700005)(91956017)(71200400001)(921005)(53546011)(186003)(2906002)(2616005)(110136005)(86362001)(31696002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nm5BRTE3RXZCYWJKdnFEb0IvTk5RKzE0SHA0UkJPeHJVejFWUlhPWlRXYldp?=
 =?utf-8?B?d0ZiTXZYMVFaNFhNZzBFbE9RVnFkZ2RweVR1NFBEL3JwdWJwdEdjY0JwdzZ2?=
 =?utf-8?B?ejZlZUt2NldzL0xiVlBQS0pvRnZhNmI5RTRNYmtsa3NnS3JEaDdmT0s4NFFQ?=
 =?utf-8?B?R0pqTE5jamdtR0JLZ094QlVqemhzdmJmQUwvaWxwZkNqaEJ3YXRkUlNwelhH?=
 =?utf-8?B?d2ZIQTlHSTRxc1F4VlJTeTFEdGJOSGo5c25ObXV2OG1yTE9iVDhzbzIvRXZi?=
 =?utf-8?B?SXBSYWtuMXY0Q1lBRmtNb1ltcDcraUFPLzFOVXVHcHJuaGw5SWlDQXJHbDFV?=
 =?utf-8?B?Z1BxMXlqTjBkelNDVUcyaThXWENnOG1vY3I5WXBXMkFKcnUvaGRDOU1jTGxN?=
 =?utf-8?B?KzFKZEZqdlF4RmdFOHNjc095bXdiK1o5Sk1rKzBzU3luelVIQlkweVBiWTR3?=
 =?utf-8?B?VUh6Mit6SDlZNk5USkU0RTQ2My9KaDdHcnZoeGozS3BqbnF5aHpGR2M0ZnJT?=
 =?utf-8?B?KytqWGVOeEdEenpzZk9IVjR4WWR1enZnM05HOVgxRFBBUUw4bVZVRnE4TmVz?=
 =?utf-8?B?dWcwK2krUHc1Zkl1MUhvOENlUDBhMWxTbERHWnZpQUs5TGxBVzlVTzVZREhL?=
 =?utf-8?B?YlBOR3NoK2wxSUIzUnVkbmVuSmpUS0ZmMmNpdGlsNUFhSmZtWXFSSVk1L3B3?=
 =?utf-8?B?a0FteWxJY2xvZzQrYmJ4VVc4WEJBay96R2VnQXJsWWtRSzBNNFNCcWh1OHgw?=
 =?utf-8?B?YUovLzUvYzRGakVKdnlDc0FlaEtkSkM2SXcrS213a2pXNXIzcUhhZVN5QUNa?=
 =?utf-8?B?UExQYUxxMkU1d0FxSjBCamUwcGh1SDlVZmk5OFByTUY2T1F3VGV0enB2YVQ5?=
 =?utf-8?B?dW1LaUJaelNTV0NiVi9udDJtV3dkblV3UWJocitvQ2NYQjZBdVZRVmhsdEdD?=
 =?utf-8?B?QmxrMENsaUlPOTlvZnZCbytWU3RFVlFNUnROMTNLZ094bXFrZmFCeVBDTDNw?=
 =?utf-8?B?Q1JDNGxEVTEwOVJhZzB2VHlabExHbldpd0VTSTNGZmpDV1FrUXZZQzdQV0xh?=
 =?utf-8?B?S0ZiY2pZbkVxbHZtNjVUNXc4UGFPTjkxdmxJTk1ob3k0UWdaUDJMS1c3ZUFZ?=
 =?utf-8?B?U1o5UHd5MVRpajB5UjlubUFweHh2dE13Zlh1Z04zNzFxc1QwRWF3YkRnRWtj?=
 =?utf-8?B?SysyZHFabmxiS1BHc2YyNXZuc0x0MHZSR2JYQ3Fkc3JCdVZpbVFxMHI0dDN6?=
 =?utf-8?B?TDhMeExoWjlCWnFOTE9GVC9PNTNOeEJHazN3NERVaWhHeXlWMW1BODhXbGRJ?=
 =?utf-8?B?MFIvS1h1SjBBTUZET3JzNWpuQ2RNYWNOR0lJZEEyVk0yZlhEYWxCQXlMNkVB?=
 =?utf-8?B?MTE3T1dsZFlBdlEyVTFkTHNxVnl0SVhrVm1xS1JmL3BORDJCMWlQY2I0VnMy?=
 =?utf-8?B?SGtxcTZQS2VvN1BvMThZeXZDK2JrTHhuUDJOdC90dGt2OWtGcUJUWVBKMkpU?=
 =?utf-8?B?ZjlPZXM5QmRzMHlGL3ZMQTQwTFNUV2tSNHVLWE50RzVqMENZT0VJdVVyS3Zy?=
 =?utf-8?B?S2tmVHBZZ1Fldzh1Z3hiRS83REtwTVEvKzY5b0p6NU00bWN1Lzd4R3BCZVJM?=
 =?utf-8?B?ei96ekZZUnltMHVGSTZpdXBJcFhrYXJzSXViN3FQWGxia2FsWkdteEdmYTFZ?=
 =?utf-8?B?VGVBcXY0TWVsRWJ6c3pGdk9GU3FrZm1XditNTUtXdThxaGxyS1VQeUhocHl3?=
 =?utf-8?B?ckQwdGlFVWVYdDhGbjRESExHOXQ0eHdCN2k2WEVQVHlHUUNkUmx1NUJSSk5w?=
 =?utf-8?B?WGFhcnkxSmN0YkV6UFhZbk8xbmpxUTMxUHgzRjBFa1EvWkVySW03QW5rTHdz?=
 =?utf-8?B?dU94cjFmQmFJQThoWmFlMkZSSitmUUwxVERLSUhNZC9FWjYzWis2dmViRDJG?=
 =?utf-8?B?ancxeGRFa1F5QUwwOXZTZHowdXVsT1JIaXZ0Nm9vV0hwUGpRVnkxQ2Vxb21K?=
 =?utf-8?B?ZDlMV2s3RWl3NlFWK0xLRldQT1NlLytxN2VPZjVqRXZRbjNlRDlOWElRbnZS?=
 =?utf-8?B?VzgwOXdQWGs5RXRXNWxDc2RoY1RiNUQxL1VQOVVOMldoTTIzVGZoUUV6OUE1?=
 =?utf-8?B?dlBwYzdJZHhXU1R1Uzh4QnozSnFQVmp4TXVPcHFVTjBKUGxGUlRVdVp5RXR2?=
 =?utf-8?B?NlA1dE1qN0tNdUZjUFBzTUdVbmw5QmRHdUI3bnZBY0VjWFFoRjEycmUyaml2?=
 =?utf-8?B?UUU2S01YYjRlMHUyVmJWNEdOUDg2bnlOVUdadVlmc2RtaEE4ZkpOdDlTMlpD?=
 =?utf-8?B?S1hQZ2U2cW1OUnJqVnVLREhqVHBEbEZVK2hGWGtVcEpKbGVoY3ZJQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBEEDC02764FBA49A37D849BF97E897F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f785c62-bf6c-4ec5-0bb6-08da4e11cabf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 14:25:54.8963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jENBESuaY6JQbrXqPLH7ut4uX+5l5NyNhUmUPiGM+4ByutoX/sDXMpDXxqzUAqoNQ0JDWcxIQGNmys2csRJIKoDS6uH2fucu7BjLEycjZUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6520
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTQvMDYvMjAyMiAxNDo1MywgQ29kcmluLkNpdWJvdGFyaXVAbWljcm9jaGlwLmNvbSB3cm90
ZToNCj4gT24gMTQuMDYuMjAyMiAxMToyNSwgQ29kcmluIENpdWJvdGFyaXUgd3JvdGU6DQo+PiBP
biAxMy4wNi4yMDIyIDE4OjQzLCBQZXRlciBSb3NpbiB3cm90ZToNCj4+PiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
DQo+Pj4gdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPj4+DQo+Pj4gSGkhDQo+Pj4NCj4+PiAyMDIyLTA2
LTEzIGF0IDE2OjU4LCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+Pj4+IEhpIENvZHJpbiwNCj4+Pj4N
Cj4+Pj4+IGNvdWxkIHlvdSBwbGVhc2UgYXBwbHkgdGhpcyBwYXRjaC1zZXQgWzFdIGFuZCBsZXQg
dXMga25vdyBpZiBpdA0KPj4+Pj4gYWRkcmVzc2VzIHlvdXIgaXNzdWU/DQo+Pj4+DQo+Pj4+IEFu
eSBjb21tZW50cyB0byB0aGUgY29tbWVudHMgSSBnYXZlIHRvIFsxXT8gOikNCj4+DQo+PiBJIHJl
cGxpZWQgdHdvIHRpbWVzLCBidXQgaXQgbG9va3MgbGlrZSBteSBlLW1haWxzIGFsc28gZG9uJ3Qg
cmVhY2ggdGhlDQo+PiBsaXN0Lg0KPj4NCj4+Pg0KPj4+IEkgcmVwbGllZCB0byBwYXRjaCAxLzMg
YW5kIDIvMyBidXQgaGF2ZSBub3Qgc2VlbiB0aGVtIG9uIHRoZSBsaXN0cyBhbmQNCj4+PiBwYXRj
aHdvcmsgYWxzbyBhcHBlYXJzIHRvIGJlIGluIHRoZSBkYXJrLg0KPj4+IERpZCB0aGUgcmVwbGll
cyBtYWtlIGl0IGFueXdoZXJlPyBTaG91bGQgSSByZXNlbmQ/DQo+Pg0KPj4gU2FtZSBpbiBteSBj
YXNlLiBJIHRob3VnaCBpdCBoYXMgc29tZXRoaW5nIHRvIGRvIHdpdGggbXkgc2V0dXAgb3INCj4+
IE1pY3JvY2hpcCdzIElULCBidXQgaXQgbG9va3MgbGlrZSBpdCdzIG5vdCB0aGUgY2FzZS4NCj4+
DQo+PiBJIGNhbiByZXNlbmQgdGhlIHBhdGNoZXMuIEhvcGVmdWxseSBpdCB3aWxsIGhlbHAuDQo+
IA0KPiBJIHJlc2VudCB0aGUgcGF0Y2gtc2V0LCByZXBsaWVkIGFuZCB0aGUgcmVwbGllcyBzdGls
bCBkb24ndCBhcHBlYXIuDQoNClRoaXMgb25lIChhbmQgdGhlIG90aGVyIG9uZSBtZW50aW9uaW5n
IElUKSB3ZW50IHRocm91Z2ggZm9yIG1lLg0KQW55dGhpbmcgeW91J3JlIGRvaW5nIGRpZmZlcmVu
dGx5Pw0KDQpJIGd1ZXNzIHlvdSBjYW4gYWxzbyBhbHdheXMgZmFsbCBiYWNrIHRvIHVzaW5nIHNl
bmQtZW1haWwgdy8NCnRoZSBjb21tYW5kIGZyb20gdGhlIGxvcmUgcGFnZSBpZiBmb3Igdy9lIHJl
YXNvbiB1c2luZyB0YmlyZA0KaXMgZmFpbGluZyBmb3IgeW91Pw0KDQpUaGFua3MsDQpDb25vci4N
Cg==
