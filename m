Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4073552FC00
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 13:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233787AbiEULcx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 07:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355597AbiEULcF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 07:32:05 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A37A20F78;
        Sat, 21 May 2022 04:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1653132429; x=1684668429;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=j4dHVI57TBBFhwx95D6aEikJWz8eUjEYcXodo42VfGw=;
  b=Tm4Hp9JYMg9aiU4BBLMa0z5FNyGuLw47Oj73YVjYDlsMODSZxQ30HxiZ
   tF7z09cWKtsPOtAFKwy5z1n/kjiao5VVS10hDFa/xadfrjUgQSIQXQ48+
   cWfd95QdsWmtWHc2feL5Uha3dKBWz/nq1+uMVJvbQp0A6ibiZRj37clMV
   t8RtPy9Yx3T7FQpe8KSfjAxgoHqoEuKTUVbRlhlvlIlW6Hm4gYxOLnX7E
   R7hd6xrZaXzNpS9eGD+YianAK8A77i2Dy928w7ukIxDCbfmWizPZUibdy
   nRZo50kWaxlrruA+L1oNC/UQZR59ff4HtgxFrcxA1iLFbQ1Mss2Ai+Pv0
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,242,1647327600"; 
   d="scan'208";a="160023241"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 May 2022 04:27:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 21 May 2022 04:27:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sat, 21 May 2022 04:27:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DunrHIX1Pjs8uwFDpNu0c6xtlQ9vmZ+foFkIjgOnxXP/DaG+PvXp0630sJclx9IO/mikgdHGiM195eUhgxAYUXkMmrtXFg6ZECsufKo1qNgrBw6IiWhyCcWC3ChCO008IAS5Ppb67NpJpOKNq6v0il8pOCoB9fdKe07BGWz1k8ZYexBwAhlUrlJXr7sI/BmDcOkzWqIw66JTnzOC8ReDsOgLOZKUlgUB41gz/chFWroFwBDcxOQpSzL86tl+B0Z9dmavVm/l/3l2Ug3hViDUzTTRNZni6YOJcr4cMjedLVKifm8run6vhqSqB+ZuJ7ewBcwrCPwTjPj6lCjjnW5GbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4dHVI57TBBFhwx95D6aEikJWz8eUjEYcXodo42VfGw=;
 b=QhUgGGWfj+ignmsYCF4/dC1NivUWhp/rBfQLApsM9SmR2TNijmeyOqLeigCM8RqS6zZZwsz4hjoLWxj+N2ubIIkWmcTLhsW7NchvGtUPPJjdhT0lmPuA4RbIZ3ejRiPDXyU53LPcdthf5Vc5hdZ8DqYR7WlbH35RYwyDIQTzwkKHrkeY9Y1JD8fCD4YU/SR4SuTUpMiS/g+0mpNexB8bNMogred4QOhjdVUR8cZFYXxJh2YgT4YqdkBCBsZxQeytfgkTIN3FEnmhRJLAefo8NLSi6LYcfLYQlKAuJun+oLT8caf9kZSdd7JPVMqRQjjCA/I5CKNLnTjbpoS4BhAKRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4dHVI57TBBFhwx95D6aEikJWz8eUjEYcXodo42VfGw=;
 b=DHhwmfRPB5eTut19+o+oCZggJUeT2zOXn76AJ6uYj6fbh1sAuWN3490R+tbLW3r3yqDCejMkGnqNWay6iuTQeIX8/6qMURMuETiViivWfL/905aFPJYiumS8pk4QTdFWtY6kspRqe/MMIx8xnTtyW/k7RAPw2icns8be4nr9Fek=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB4347.namprd11.prod.outlook.com (2603:10b6:5:200::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Sat, 21 May
 2022 11:27:02 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%5]) with mapi id 15.20.5273.020; Sat, 21 May 2022
 11:27:02 +0000
From:   <Conor.Dooley@microchip.com>
To:     <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <ben.dooks@codethink.co.uk>,
        <Daire.McNamara@microchip.com>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3] i2c: add support for microchip fpga i2c controllers
Thread-Topic: [PATCH v3] i2c: add support for microchip fpga i2c controllers
Thread-Index: AQHYaPd+f4ShoXXlSUiSbRSXyUCYia0pHeqAgAAbh4A=
Date:   Sat, 21 May 2022 11:27:01 +0000
Message-ID: <dbf6073c-0814-ec25-cec5-cb3cf9c931d8@microchip.com>
References: <20220516073331.3508505-1-conor.dooley@microchip.com>
 <Yoi1bV95l7+thgS5@shikoro>
In-Reply-To: <Yoi1bV95l7+thgS5@shikoro>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fa3690f-4b99-4d18-2bed-08da3b1cd38a
x-ms-traffictypediagnostic: DM6PR11MB4347:EE_
x-microsoft-antispam-prvs: <DM6PR11MB4347D4F4AE31FED1A518A4DC98D29@DM6PR11MB4347.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FdG0KvZo4yn/ftAW5+RT2LYIMkoXxTFcbgimMeK6Hh2qNn5/LzA/ldfG/5QXh/H1Ef4V8z6nLytnr5Nn+tCq2afJR8Q1YpHQ9fsgBcmGZxmLhQ/UKmWDdDwf+4T/C9KxBpdFSrvHox0QNKVL+KkCojOTTyptwh+OYtn1cbe+Y8lAKwnnMGnX+WRCA8VXtL1VxnA5iPziOZ1OWYIM2mF/IYE0XRyUXtYzOct+i5L6XYxRCcHdXsnE2bsIfkYaUAAaSjJfXoQ7eGUJEqGhLzFFDJmQritlaC3hLkwz0JCUQM2bUdKhg3lwJsNSyfhHVJ86KSTmK63e4R05jf2WujCRpLAMXefOAVTp/85hNTPf13xzimPam7AEroF8BOnMgR7exCb9gvPsy8oIUJ7krtKOxrCbMZQrepjU2AYonwlz9XuvviFhaDa6W/pf+1IMCGTez1xqHJhX8EpxDKNVG6L7cT4ABeS82DdH0LS0l6CHctcFdusfmcZOJzV5u34nO1bczZnA29kccbzaMZ0/TrBKdKQ2keHGSDW2YJV6IsgfKU7+Zmk24LlxgdcE/gSEY0pJZTuAyxpW9ENP+QedTiCp0mZZWXMSerwBd5afEaXPwAI8FTCSw1wBT0EAW/+HMzeHvggg/ncownbwDNChgrYEGGNkR9E/1MxKkD+IJMPn6nBGsDNfPg5aPAx15in2r6Mx/Om5Umr9QJDOTlTDjz7sH0dU/IcCPS3NGstnZ7RekzWhk9lljOL3JzfdW6f5XNNiDqgrlZ4A5rPooaPfEPMyxA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(186003)(31696002)(86362001)(38070700005)(54906003)(2616005)(316002)(83380400001)(6916009)(76116006)(8936002)(2906002)(508600001)(6512007)(66476007)(6486002)(64756008)(66446008)(4326008)(8676002)(38100700002)(122000001)(31686004)(36756003)(26005)(53546011)(71200400001)(91956017)(66556008)(66946007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1VsTFBzbWE2V1hvMWF1cE9CSzcvNUZWL3lkK2pPd1YxNStBM0xnanFDQWlt?=
 =?utf-8?B?cWpralNNVWt0VGlLM05lV05pai9xZkd1M1NPV3NYVng4bnY5RGttNCs3ZDgz?=
 =?utf-8?B?WUlaRjdXbGZXS3JINk5uczdyQlRpM3h0WFBlV0pHMlVHaVRueUJqT0JKMVVz?=
 =?utf-8?B?bGRmSk14ZmFGZW0zWHNLWlVLVFFlU3FEUGQwWEtvQlFnVjgwOSswK0kwREJD?=
 =?utf-8?B?anQ4WVN6c3RrZjZ6SGFlcUE2MGNVL1cxYlk4QVNlck1meEt1T25GbXYzYzhl?=
 =?utf-8?B?bkg5MTErM1Jaei9ES3UxK2dNM0JFdEs3Z0tsMkFnVWp1d2lQWXJIelVSYjBs?=
 =?utf-8?B?M0pnS3hYWVFld1EvSXJuT0tYOVRpaVRKOWV3em9NcEQwSlRGRjR2eGhGMTBW?=
 =?utf-8?B?SGdWV0RkUHpxSFhlejRleGtUR3kzVnp0REZnTFJMVWJla2QyWUxpTzM3VmVL?=
 =?utf-8?B?ZFNDcUpUZlN3ejZlem9CR3ZUNDh5QlBLTU1ialZQcGxyZS9uQnhxU0d0Q24r?=
 =?utf-8?B?QjdkRFUrLzVBeWE4bWZRb00rbU92U3VaeXoxRlJLclEra3JmUUlodFRhZjJU?=
 =?utf-8?B?TFdNZndtZktqSWFPSm9jTjhpcUpaZTRuamJoMFN2QmUyNUlzTWRzUWV2NEJq?=
 =?utf-8?B?d2p5S1d3M2VlM0xKUy9lMS8zLzBDVExTT3k5dDg2T2dkQWJCM0VrWno5ZU9J?=
 =?utf-8?B?dDJpYUNvTmZCb2czY1RXd3dSZWE4emU5SmpkSENrZWU1RHpkcExlb3M0dVdt?=
 =?utf-8?B?djRjU21LdTY1L3A1b0V2dGhYQk1janpoMGdyTVUvL252aTRFbjFrMUx2WlNh?=
 =?utf-8?B?NXRPY3h6NnFIWWcyOVc1OGgwUThoZXhOYlIyNFg2UHdkU0kxREVkbUdMVlVO?=
 =?utf-8?B?c1dicDUyOHh6c3VOZk85NHd5TWFnZVlCZnIyWnRvQkc1c1g3L1NXSnFqMm9M?=
 =?utf-8?B?TnQzY1NOV05ycnJudVczcmJDcE5md3R4eVlhMVgvbytZVUE1eDBnSmJVZlFV?=
 =?utf-8?B?KzZGbkQ4WW1hM2RBMythM3FZVXpMTGVlMlFkN0ZiL3ZBbzR5WGE4dkpmNnlx?=
 =?utf-8?B?YUk2cno2QTJZMDVLdW51d2JENlRNYXNkUm9ZY21qblVsa3BDTWNmR3IvMm1O?=
 =?utf-8?B?aEpPc05qNjBYbEh6d3dhZCs3Y2dPTEN4ZkFGVU1UbHd4WFZxUzN6K2NvaStz?=
 =?utf-8?B?dTExTERpaGE2cjhlMklHUHo4ajdnZys5THBOdFB1dThuK0UvUU9jSDJMTHBz?=
 =?utf-8?B?SUpnRisvc29ZVkVYdlVqR0Y1MWkwUkluY1Vzb2hGVnNqV050NFBwN0cyREs2?=
 =?utf-8?B?V1YxYm44UVJkMjJFcHlWdUdpeGhKM3EvTzhXK0R1VGpLUVlQRFAzcENTM0lO?=
 =?utf-8?B?RWcxTUUwZitzNVhvbGxtNHNtUTNmOVNnWGt3Tm9XTVEvNmdISjZHY1BYT3Ft?=
 =?utf-8?B?VmQybHZmYnRvU1RSZ2R1Q0xRVHM5aUY0MUZrRjNXM3lRdFVXVmhHLzVpOFd4?=
 =?utf-8?B?VWF2TzZOaW5jTWQveE4xR29Nemp6QndsWlR4a0xUN0hybUpBVEQxRmpPSXRQ?=
 =?utf-8?B?d05XaGlDdENVZVh0V0pKZ0xQZXZzM3ZDM00wYVk2NFBiTk1vN1kyMXh2SU1v?=
 =?utf-8?B?NmtHVVZKZGJmMFY5dGtRYUlvRXJzNjJlQWFuaDE0eTdPQWp4dXcvRE8zRTBw?=
 =?utf-8?B?b0FYTGs3UlZjbmx0eXkvdEc1ajJYeUhPMldUZGxsbCtnQVBIenNkV1ZsUTNq?=
 =?utf-8?B?ZkFwNmFqVmFxQWpHemtWL3hBRVBKcldrMG5ZNGQxUEduUEh0UmFVaE1NT01m?=
 =?utf-8?B?TXY4NkloOFlwVGZMbFdITS9jZW1zNk9lY0R0WU1STTdEeXJpZFN5U0RrWmZu?=
 =?utf-8?B?VTZHdVhPaTB5STNFTVRKdFR3bmdhclFBNTNxajZQTUFtTng2b3pZSHMrRXd0?=
 =?utf-8?B?TXVVbVBvK2VtOHVPQVkra21QNXZuY3k5OHRWdVRYay80U2N2cWVyTEtFVzU1?=
 =?utf-8?B?QThuRzYrWUsyV1JHN3oxQzh0cVFSZHFiaXI1dGU5a1BCZTNJemQ1S05rczdJ?=
 =?utf-8?B?dmU3cng0SmQyZFdlcHZud3JxbGg4TTkrazd4YUtJR0FoZXByWi84M21NQWtx?=
 =?utf-8?B?dUVYR08zSSt5M2ZUVXp2UlEraU9SRmt2Zy9HWk5LeVZkdmIvRUhnQkVqMzVo?=
 =?utf-8?B?dS9qd1ZHK2hDZ2xCdno1SUc2RElXUElodVlDa2U3UTQrelF1bEF4VktQR3NL?=
 =?utf-8?B?SHdTY2ZRUHZXN0JHVTNubThaLzBlY1VGeGhlajNmRzhFL092QWNBSkFlSGJy?=
 =?utf-8?B?L1pBRTVSQngyYzdiMEp6bHhQcFQydXIxeFJFY1pPdllqQ0g0UnptZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B53A6E915CE78489E4BC5E5AC032060@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa3690f-4b99-4d18-2bed-08da3b1cd38a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2022 11:27:02.0203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJupAVTgeN/4UyqkqsKQLIIgzYsfphgQTNEkzYmefOTvRV9DUTYK3ISPk1rSj0oJXV8/58O04GQTrXYwhy7fNMkmbMrmVE4kH6dOC2yMaG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4347
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjEvMDUvMjAyMiAxMDo0OCwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gPiANCj4gSGkgQ29ub3IsDQo+IA0KPiBkcml2ZXIgbG9v
a3MgbW9zdGx5IGdvb2QsIGJ1dCBzb21lIGNvbW1lbnRzOg0KPiANCg0KSGV5IFdvbGZyYW0sIHRo
YW5rcyBmb3IgdGhlIHJldmlldy4NCkl0J2xsIGJlIGEgZmV3IGRheXMgYmVmb3JlIEkgY2FuIGFj
dHVhbGx5IGdldCBiYWNrIHRvIHlvdSwgYnV0Og0KDQotLS04PC0tLQ0KPiANCj4gPiArCQlkZXZf
aW5mbygmcGRldi0+ZGV2LCAiZGVmYXVsdCB0byAxMDBrSHpcbiIpOw0KPiA+ICsJCWlkZXYtPmJ1
c19jbGtfcmF0ZSA9IDEwMDAwMDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZiAoaWRldi0+YnVz
X2Nsa19yYXRlID4gNDAwMDAwKQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5k
ZXYsIC1FSU5WQUwsDQo+ID4gKwkJCQkgICAgICJjbG9jay1mcmVxdWVuY3kgdG9vIGhpZ2g6ICVk
XG4iLA0KPiA+ICsJCQkJICAgICBpZGV2LT5idXNfY2xrX3JhdGUpOw0KPiA+ICsNCj4gPiArCXJl
dCA9IGRldm1fcmVxdWVzdF9pcnEoJnBkZXYtPmRldiwgaXJxLCBtY2hwX2NvcmVpMmNfaXNyLCBJ
UlFGX1NIQVJFRCwNCj4gPiArCQkJICAgICAgIHBkZXYtPm5hbWUsIGlkZXYpOw0KPiANCj4gUmVh
bGx5IFNIQVJFRD8NCg0KWWVhaCwgdGhpcyBkcml2ZXIgc3VwcG9ydHMgYm90aCB0aGUgaGFyZCBw
ZXJpcGhlcmFscyAmIHNvZnQgRlBHQSBjb3Jlcy4NClRoZSBoYXJkIHBlcmlwaGVyYWxzIGRvIG5v
dCBoYXZlIHNoYXJlZCBJUlFzLCBidXQgd2UgZG9uJ3QgcmVhbGx5IGhhdmUNCmFueSBjb250cm9s
IG92ZXIgd2hhdCB3YXkgdGhlIGludGVycnVwdHMgYXJlIHdpcmVkIGZvciB0aGUgc29mdCBjb3Jl
cy4NCldvcnRoIGFkZGluZyBhIGNvbW1lbnQgdG8gZXhwbGFpbiB0aGUgcmVhc29uIGZvciBpdCBi
ZWluZyBzaGFyZWQ/DQoNClRoYW5rcywNCkNvbm9yLg0KDQo+IA0KPiA+ICsJaWYgKHJldCkNCj4g
PiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQsDQo+ID4gKwkJCQkgICAg
ICJmYWlsZWQgdG8gY2xhaW0gaXJxICVkXG4iLCBpcnEpOw0KPiA+ICsNCj4gPiArCXJldCA9IGNs
a19wcmVwYXJlX2VuYWJsZShpZGV2LT5pMmNfY2xrKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJ
cmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgcmV0LA0KPiA+ICsJCQkJICAgICAiZmFp
bGVkIHRvIGVuYWJsZSBjbG9ja1xuIik7DQo+ID4gKw0KPiA+ICsJcmV0ID0gbWNocF9jb3JlaTJj
X2luaXQoaWRldik7DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGlkZXYtPmkyY19jbGspOw0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5k
ZXYsIHJldCwgImZhaWxlZCB0byBwcm9ncmFtIGNsb2NrIGRpdmlkZXJcbiIpOw0KPiA+ICsJfQ0K
PiA+ICsNCj4gPiArCWkyY19zZXRfYWRhcGRhdGEoJmlkZXYtPmFkYXB0ZXIsIGlkZXYpOw0KPiA+
ICsJc25wcmludGYoaWRldi0+YWRhcHRlci5uYW1lLCBzaXplb2YoaWRldi0+YWRhcHRlci5uYW1l
KSwNCj4gPiArCQkgIk1pY3JvY2hpcCBJMkMgaHcgYnVzIik7DQo+IA0KPiBNb3N0IHBlb3BsZSBh
ZGQgc29tZXRoaW5nIGxpa2UgdGhlIGJhc2UgYWRkcmVzcyBoZXJlIHRvIGRpc3Rpbmd1aXNoDQo+
IG11bHRpcGxlIGluc3RhbmNlcy4NCj4gDQo+ID4gKwlpZGV2LT5hZGFwdGVyLm93bmVyID0gVEhJ
U19NT0RVTEU7DQo+ID4gKwlpZGV2LT5hZGFwdGVyLmFsZ28gPSAmbWNocF9jb3JlaTJjX2FsZ287
DQo+ID4gKwlpZGV2LT5hZGFwdGVyLmRldi5wYXJlbnQgPSAmcGRldi0+ZGV2Ow0KPiA+ICsJaWRl
di0+YWRhcHRlci5kZXYub2Zfbm9kZSA9IHBkZXYtPmRldi5vZl9ub2RlOw0KPiA+ICsNCj4gPiAr
CXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGlkZXYpOw0KPiA+ICsNCj4gPiArCXJldCA9IGky
Y19hZGRfYWRhcHRlcigmaWRldi0+YWRhcHRlcik7DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJ
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKGlkZXYtPmkyY19jbGspOw0KPiA+ICsJCXJldHVybiByZXQ7
DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJZGV2X2luZm8oJnBkZXYtPmRldiwgIk1pY3JvY2hpcCBJ
MkMgUHJvYmUgQ29tcGxldGVcbiIpOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+
IA0KPiBSZXN0IGxvb2tzIGdvb2QsIFRoYW5rIHlvdSBmb3IgdGhlIHN1Ym1pc3Npb24uDQo+IA0K
PiBBbGwgdGhlIGJlc3QsDQo+IA0KPiAgICBXb2xmcmFtDQoNCg==
