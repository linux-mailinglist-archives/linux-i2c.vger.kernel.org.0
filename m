Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A01735A663E
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 16:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiH3OZ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 10:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiH3OZY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 10:25:24 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5745126AE2;
        Tue, 30 Aug 2022 07:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661869524; x=1693405524;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ye6bakTcp4BT1njke0a6xD+UFx0F/F6a1X51ZUabtIU=;
  b=DU8txWpVomTkuX9gbtplOZjabMVHMZQ5Eloo1+jIPsLrs7WdsmxKCDgZ
   tBWMufeJK2fPWebBKaxPqnOfRpE+1A6Pht6Rg7FR+9VVqjmsr3otPCdJm
   shKYnHg4XafsftRTk8AQcyjXXT21FuyvQ1zKucPvGUIDy8EW34ySka/oH
   o+QFhjgWB59d3KimXDm+SSRzYcPQw52PhXxNV4FyVA68yfa7z6lsq1+r7
   ZFhSTCZdskXviEZVHiZBG+px3+mEteZQpdsdUZZ1PkdzrO1ZKvTeUJj3A
   sCis8MEOMXNrvVbjOGRH/IOoeBndpXEnZJVCzLAaiog/g53cDx+snj/pd
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="171602486"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 07:25:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 07:25:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 30 Aug 2022 07:25:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFh0EBn0jP/VXPT4reID8AqqWPwYoIG2ScsUI7exUJ8G59nB6mVHggXh0QyEeZ0LmnVe1CyJ9YPUZxS98m3LLR/9tTmDLbPRyQDP0vXv4WTaq/k5GbmhUxe9dC5nfap1jCnXTr+y5cLL64VMp9mKM0brBYU/7WCV1i8H53hlIDPNpq38IyHedsi34tFUa1x3lQ26AUxRY81E1l1sGpiKdfb/FFJro+0qXtyQK+jaQ7VUzquivLBB09RyTZHsYUv8AiJgUCID/ytS+s1JqRq+K1aYAv99W5/SROyBO5sfQDpmmi8NChw9QclfE6gZiP3x6YalNV+Aa0XuvKUsfs5meA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ye6bakTcp4BT1njke0a6xD+UFx0F/F6a1X51ZUabtIU=;
 b=hQQGJcLw6EGsugwQYKa2O6mp4UURSGBni+v/ATMjRc3OlJcM8YIOigediwzaSKK21aZnbru5v2JCMw/UR9dKIyqHNhDbDg6gg9zPb2DMtwGJkJorIXD467apbXZEm7TXM+4tPmqi8BLiyuQhUJ70g3IN4zAbfRBYQL77l3vdTskzYOJHK5E+82+2l5D1S5gjnKto3crAxUKTLoRU8xhdkI+VeyPsLYjzgIKXKH4XOkalejyNI9kYs7SCXqPVzwCCj0c2opUgEJl2Ysa4ys5rWqL3bIywq/UP2EBdPUW1Te211QkEdwIF4BxE06vtXZIH3WszGD5oMITEtmjqqKXKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ye6bakTcp4BT1njke0a6xD+UFx0F/F6a1X51ZUabtIU=;
 b=adznsV9PDtBPVVJb6CHy+ru9Iy74y+L7M+B0++J43+7OWEFk3q+cTLxQPKphzly6q1LJmvptW7rJCh9l/PKUSW9gD3gexzsFNc//fnt1FMfvdKfiwHfXox5Yy01jfQIS0aLvGyySxzft/+8HrP9yeMeykWTJiYPI/sXgC8pc6Q4=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by PH7PR11MB5768.namprd11.prod.outlook.com (2603:10b6:510:131::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 30 Aug
 2022 14:25:11 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::ce2:c2e7:3373:fd42]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::ce2:c2e7:3373:fd42%5]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 14:25:11 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <christophe.jaillet@wanadoo.fr>,
        <linux-kernel@vger.kernel.org>, <wsa@kernel.org>
CC:     <krzk@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <sven@svenpeter.dev>, <jsd@semihalf.com>,
        <semen.protsenko@linaro.org>, <rafal@milecki.pl>,
        <UNGLinuxDriver@microchip.com>, <olof@lixom.net>, <arnd@arndb.de>
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHYttI9ItE0vA92WES0jroLXsIOYq28XuIAgAsscYA=
Date:   Tue, 30 Aug 2022 14:25:10 +0000
Message-ID: <929334dcf3b182035e9685f69e5f45836938b125.camel@microchip.com>
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
         <667f1658-cf29-6b19-fd57-0c62f625d536@wanadoo.fr>
In-Reply-To: <667f1658-cf29-6b19-fd57-0c62f625d536@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a3a1c84-bfb4-4505-b9f9-08da8a93725c
x-ms-traffictypediagnostic: PH7PR11MB5768:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WYK0+4527HGQvwke6xBfkIwoX+O7cOGnw4F+BNcJUo3zd04BncInPYegcesGDigsWk4Ag7kdZPHDyt7S/AecBrf7wiog8N9kZ2ANd6Z3it9oYjFVoZdbXnC0SvuRsxo18luOiTSr6Q75F5h98MZwdK7DkNg28nZkDemRA8TJn2o66nwIRMngE5pvTo2Qi+R5H3Ot3lwcM0Z79EaY1NpRIpO9lKV+XIe3g8XgZDo5QD9FIufJCjk+8nWB5wVHboZ9KQDwJiDnnVjFKcbSIDvnmBeTc7VkCChatON1uPUoawVJMzEEveImqQs6drsjdVPzDoTQjORWAU8NWnDff8M/xbmPKtzGEqSPVLR75GY/sB5wU1nQnpnnVF7i57f2XzZHmXGFqv/hmkDdknbtbQlVKE6NQVS4NvUs34vbW1ZOwPbZ8F/zI2HUJaNx27tzasjNj6UrTPJI8w4MvWISrNx6ZWdUGkYWr9xM+QMEjst5amAnsivZYa/eyItGVkNU65rbAxvapN0fb0mCUDJv0Q0t5SevvXedGXdOJ0mmteZFbYfJOA3lml7Ue2upIvLWOmE/9vfn6StQ4Hs37cx0Q2UYt7Y5vWhQ7i/1sb1lozy+1kkj6yCtYuldTZRo6B9tk0tWLuqzS3zn3C19Un+SQ5wUjK59HAwWc1oaux6B4wnMAkady6enMHT/dKUe9C9SDQW9swidf9uRlI+1iPhepmW9Q3oBBOl9AoYlv1C4TIFy3Y0uR6HqX9Eg7wKAtfRU1oNzO7M2CVXwsspp0flQ2WtnLXY8L/hLwiUVCVcGu1uiE0o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(366004)(39860400002)(136003)(376002)(6512007)(7416002)(4744005)(91956017)(2906002)(6506007)(110136005)(478600001)(86362001)(6486002)(41300700001)(316002)(26005)(54906003)(186003)(2616005)(38100700002)(71200400001)(38070700005)(36756003)(122000001)(5660300002)(66946007)(4326008)(64756008)(66446008)(8676002)(66476007)(76116006)(8936002)(66556008)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXM3ZUlQaUVadS9vdXBjN0syaU5pYURKS3JqNFhXbm1qTjJQYitJWko5UGhu?=
 =?utf-8?B?NmJUOWZvVGs5NkRlVlZHQW00aEVBQXJYcjkzSzcweVJndVZJcG9nZzVvNVJv?=
 =?utf-8?B?dXRSb3FGYUNFNlp6RThPSG9IbVk3K2QvMWpaR1BnOENFa1NpMWoxZ2U1TllK?=
 =?utf-8?B?WFo5dWFmeU4rYzZiU3gvUGtVcGFaN1hrTFB6RVp1ei82aHN5NU1mVVJrQVM2?=
 =?utf-8?B?Tldyd3o2bHBsUDlYQkhHLyt1R0xxamxydGMycDRJMlcyL21uZFdTZllDU29t?=
 =?utf-8?B?ZnAvZHQ0UkNaSXdtNmxpWHhrTUg2MjhZajFFRHJwMk5KZVlJcU5oUXRqeHk2?=
 =?utf-8?B?aWNmelZvQjAvOW5zcGF0cXpXNjE3bWFlckJJMmFML05CWU4vd0FYWVd6TWs4?=
 =?utf-8?B?VkJiYjNReGdGTzRJNWE1YmR2aG1UMFI5SEtsTzcveUZVdmdNWmhyVDFBK3lX?=
 =?utf-8?B?SU1zcUxpREFtM3luVFcwMDJzbHQzYmtTWG91a1NsWWJQU0wwcStLakRDSG4v?=
 =?utf-8?B?VVczSEZGc2hZZThFdTdya1Q3VkxrYVJ0dzYzdzg4RjZLb2RSZ3FnNUp3LzBV?=
 =?utf-8?B?VER3R3BPelNtcHM2eHZzZlBWMnVQcXA5WGhhR1NlMFRGOVZSUXVPL0F2NlRO?=
 =?utf-8?B?bDlqRjIxWkI1WURra09DMnh5azFFOGhkQnAwaDY4SVBBbTUrNThaU2FkbTR6?=
 =?utf-8?B?djdMd3BEcFJ0UXpNMEIvaDJReHZ5SGdzN3dyNCs5WkVGUXNkSlU1SHBXaHRu?=
 =?utf-8?B?c202ZFRDYUt5amxaQ3VXSEtpRzRaWWVObnBQMllzOTNycThHa1luQnRuamNC?=
 =?utf-8?B?TnUrZld1V0ZlUTlET3BFaUw4VzdWUGlpRlVCN2NYZVdUNlJGWnhYcnFvMVRP?=
 =?utf-8?B?Zi9qaGtoMDBRditLOFR0ZldCUE1tU3g4S3N0aFFZNW1yNHRWVnJ6aStLWTdG?=
 =?utf-8?B?WkpKU2dUeC9jTnhwR1JKNndYT3NrTHNyRWVHU29jalY3WlY0bC9FbDlBYzlm?=
 =?utf-8?B?UkQ1VFVDZVRBeFdqZWI4eVRNRXNOVmpMd3JKV1kveVhJeGJDeFpnRXV6ZHM3?=
 =?utf-8?B?RWdLSlNBZmlSWGRkN2VXMFAxWEtsay82SGNTQUhsWGVsZUVZTTdiQUNmTUxQ?=
 =?utf-8?B?Ri9lem9mUXRNdDNxRW1yMXJsZ0tMOUJwMmR0YjFnNml3ZlhBT000LzNPZkZC?=
 =?utf-8?B?Ry9lb1hhbGRwR1NKNkd6L2N2b2x0TEJ5RUtHVUpmYUQrY29EN1QvSnR2K2RC?=
 =?utf-8?B?UkN3K21rQTlKRTNaNC8rVWFPL2FYdWpUbEx5M1ppZ0IzT1NoUlhGc0tZYWZZ?=
 =?utf-8?B?em0vRWw3dDBlRlo1MkVwRzR1UEFVdHVzWnpNdDFYU2tHbnJJT0JNWnM5QjVM?=
 =?utf-8?B?Y2dWbHB3TW9OeUJQczZlbGxFNlhHVmFnYXYwWGUxVDFDMGJaRmwxVEdaZy9v?=
 =?utf-8?B?WTVFYTI1eUNNQVJlaDJyTTRxb09wcCtxTHJNL2NsOVBMQjdCSzlLc0hnaWwx?=
 =?utf-8?B?ZGVPdVFPRkdkVUlzTS9qbXpTOXQya1NZc2FsTVphV3FWbjFMMHpheXdUdS9N?=
 =?utf-8?B?V3NrL1dwejdXU3BjMGt2Q2hDMFA5NnppYTlQQnk2VTRwdklvWFl6SDI2cmQ5?=
 =?utf-8?B?VTJvM1NyeE4vbUZPK2dlNHAvQm5tQTRlSE5kY0tBeDdGRThzM1VBVXZ2c1Ux?=
 =?utf-8?B?TEFaMU1uc0ZVRTZJdjJIVTVHeW1ObXg2VVQyRkJTSXpmMFRJbk9iMld6STMw?=
 =?utf-8?B?V1dLZ2VROWdtQW42eVFaSHZZUjQrbyt1NlJXby84THIxUXlGZ016T0hpdThD?=
 =?utf-8?B?cnd4WWp3d3YrSjAzaExOSDdhR0xWRFo5UlR3aFFZQXJ3WUcyMlZrUDRmejhR?=
 =?utf-8?B?VWRoWXdZUGdIYWNHUWNleFg0azVBYUo0R0RodUgxVXluMy8zdnVSQnpZRi9a?=
 =?utf-8?B?eEFMZ1J2S3RWM0hDdlFPVGQrQnByemNxSjZxSTYyemM0bnIzWGUrbVlxd09U?=
 =?utf-8?B?TjFQRTZmRlM0cjNXdmJkR1htR29rbGhoWXVwRFl1dkR3akE4cXk2eTl2eWxi?=
 =?utf-8?B?MnBleXFPTjQ0Ujd0eW51SzhnMFI3a1ljNUc0UVJCeThLQ1BQMGpQWkEwdDZH?=
 =?utf-8?B?T3BoOUxsYTExVG9iNHhOL3J5Yk1hVGVtNmJncFJZQ0gxRWsvSWp5VVlaZ1JC?=
 =?utf-8?Q?u4I6NeV9OKeiUkwQEjJsSUCKEvuJWrgpez0h8JDtjqFG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE8A1EAF2D1D224E80985FFEB45D7AF4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3a1c84-bfb4-4505-b9f9-08da8a93725c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 14:25:10.9539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQRZCWbSVnDet058TxFN7uACaA1lOQYB94vSxygnL3s3AVa9fIEjm/1MlSuN2JuYUfGL1N87yB1daHhRrxRVeq4mLz5MM7ppx5SMsKFZqvixf2L1yP/0zAj2KLcq4RCh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5768
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIyLTA4LTIzIGF0IDEzOjQ4ICswMjAwLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3Jv
dGU6DQo+ID4gKw0KPiA+ICtlcnJfZnJlZV9yZWdpb246DQo+ID4gK8KgwqDCoMKgIHBjaV9mcmVl
X2lycV92ZWN0b3JzKHBkZXYpOw0KPiANCj4gU2hvdWxkIHRoaXMgYWxzbyBiZSBwYXJ0IG9mIHRo
ZSAucmVtb3ZlIGZ1bmN0aW9uPw0KDQpwY2lfZnJlZV9pcnFfdmVjdG9ycyBBUEkgaXMgbm90IG5l
ZWRlZCBzaW5jZSBwY2ltX2VuYWJsZV9kZXZpY2UgQVBJIGlzIHVzZWQuIEkNCndpbGwgcmVtb3Zl
ICdwY2lfZnJlZV9pcnFfdmVjdG9ycycgaW4gYWxsIHRoZSBwbGFjZXMgaW4gdXBjb21pbmcgdmVy
c2lvbiBvZiB0aGUNCnBhdGNoLg0KDQpUaGFua3MsDQpUaGFydW4gS3VtYXIgUA0K
