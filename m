Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4436F6A9A1D
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 16:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbjCCPBM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 10:01:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231395AbjCCPBG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 10:01:06 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E196262DB7;
        Fri,  3 Mar 2023 07:01:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNHGLaDkG3UjC1ItCyTF8LCX54vCXpx52WmcKzjPj6D8yy0wBSV0E5fNIimU63N4QUYXDGJAdkV4qHS49/pKEarH8Fid90ZHaKkWlEW5W73XfpXGYr/HLOo2EkGRnildQ3Sy+0La2MNWZ3BlP/ML3m0G6LM868yOYedvpF2A7e4syiqyjrOYep4hsQr4u5+psBS9KCLkXVBWUXZZXoRXG7HYNgf8r/cyFQc56r2SWQ1eaxhoe2h/8KKr7qg67iCvGZmTrjhQhYjNL22AaSFO4a3vWSkBoCN9b5PWKDagWjX+MK1oJTM5c+xdx5o52XFFlgFdyu2M63HYxbjoOknbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBAULjSyNdHfy53kO9AGJaI2cDLLd7FHeBgnvEyZqzc=;
 b=M5a6OBvEVilKSfIQjOM0sYU/ibNfvN2dMcCNAdJTvJA30bnw5sg+2xlMow2Ndv7u9nH4/OkjADkda2bdCjK9lJW6qkFmXw67SIwEOLMM9gdzhQfwkk+TRuC4Ybd7uacS1UHnNwcpM47lc0CXE+6CtbcgSZ3cIx6QOR9ElbHIoCjj+7IWzELNc8ezdQy4lii8KpmlwOqj+BuiCS+QFRTnJf5gcW2VDSwVAPG2E6seyKRejWM2E1jOqYmMPGoRBJC4n3u36IAja7joaI/AD8uXyayMBrdW555cU/jHnYflqmVOt6B+IKt4T77zSQDlkfZjM50pSRQ5q2y+Bz7qb2nQ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBAULjSyNdHfy53kO9AGJaI2cDLLd7FHeBgnvEyZqzc=;
 b=HfPVffMWnMfD42r53SG9n4dqpRs8usuuFYHOJC4LiuMCQTIlmB8g2i26k9x8XaXCbj2O97rCPliHBDdswSDCj+Na9BiaLlV0HQb88Uk8xqO8DfcgVaU+tXFZwwBsHxjFPnftB/u7ymPYf6LJS+07SeqZ6pW5pr84nHZr84rnfZs=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB5627.namprd12.prod.outlook.com (2603:10b6:303:16a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21; Fri, 3 Mar
 2023 15:00:55 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 15:00:55 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Grzegorz Bernacki <gjb@semihalf.com>
CC:     =?utf-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>,
        "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 8/9] i2c: designware: Add doorbell support for Skyrim
Thread-Topic: [PATCH v2 8/9] i2c: designware: Add doorbell support for Skyrim
Thread-Index: AQHZTT9B8+HCyU60+E2+nOjqTPhusK7o9OAAgAAx9RA=
Date:   Fri, 3 Mar 2023 15:00:55 +0000
Message-ID: <MN0PR12MB61010A9EEBEC94330A7E9702E2B39@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230302194235.1724-1-mario.limonciello@amd.com>
 <20230302194235.1724-9-mario.limonciello@amd.com>
 <CAA2Cew5YyufrBZqAA4A5R=1vf_dn=c3ftwziTjzFSm8S5LJZGg@mail.gmail.com>
In-Reply-To: <CAA2Cew5YyufrBZqAA4A5R=1vf_dn=c3ftwziTjzFSm8S5LJZGg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-03-03T15:00:53Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=33c4db55-2bc6-42d0-9fcf-feb4e17b8c07;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-03-03T15:00:53Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 96d5a7d7-cde5-43e1-9a19-e7b60b3c1962
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|MW4PR12MB5627:EE_
x-ms-office365-filtering-correlation-id: d88f6f95-a824-4878-05d5-08db1bf816e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: INeXjvklBHoIpd6nS97cSxlsTgtfFOdDP9z/vFbjOXUNVNAHYkEKHjor5o7nkZHeOk1AfqHRsxS/axmAKKluJAIFT72vuZq1kKT6mF4oTBGe54sFBuNa2l9+LeKP3VO0n6Vo66ZI2sktDsRFdtmUdPyoNE+IF+8IqDAegm6zyuGncaRYRxywhD9Dj/Nqs5gzNJgTDreK6wtHczH95hwEHG7LRzK4oxjWC6ha71xjOybBTPqm/rBm46R9oIYecddkLyznGXAgxbLZBWjwRg9+Klfvt0CBSuYsPQ+LeIfJ5cXzpUjlvRfcUYNrWx/ZY34iiBqcVyzxNgqJ2/UXg4A+iSn7hJq0SW80kqCFYk/+ybbnFujtK0ehorApOOEvciQe46gG7pADE6R8sJ33GE4HsVq1u/hMpdojIh0F5Ja2gDR+pNvcKJ3xktydc+y6coSJrPK6Sqr8Oz+i5FTjxcYpiyGpR5C80fmI/PAoXnapiilKfWNqKgBkeYN8QngkkvvG1Jlg8FRk3tBW85zJzNw6PkwchRseEyZrR8ov7k66wD6i1HI/NyU+lSUamYO/rZF9TtLm1kShy69n8bgIUic+KBrgcae/B2Hf40LFxUmfTRkxUarVtghqkxnOyi1NFMHGRY7gkx9Gc/V2Mrb+PHfuzXGzkxQtys1UeYsC7iOH2OIOo5ZrTXp7/rBl+4h4kH/W
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199018)(38070700005)(9686003)(6506007)(26005)(186003)(53546011)(54906003)(316002)(76116006)(55016003)(5660300002)(478600001)(966005)(71200400001)(7696005)(2906002)(33656002)(86362001)(8936002)(52536014)(8676002)(83380400001)(6916009)(4326008)(66556008)(66476007)(66446008)(64756008)(66946007)(66574015)(41300700001)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0N6L1JTNXZGRUphRTRUSldZWjNLSkdNTXNtdm56Wk53ckJ5NjhxU1Nwb1ZQ?=
 =?utf-8?B?OE9SVlpaS1V4QXNZaUxZY1o0UFR6V2VlbVY3M3pWN1JQb2doZ2ZpQjhPdkpo?=
 =?utf-8?B?VkFtMUV2NDZ3ZHlOVTk2WU1HN0RsblQ4YTlzT09qQW1jMUFmNDVnOENjeVlm?=
 =?utf-8?B?WFQ0ek92NDNRNlJGTGRLeGdzWWNXZTNPRXpQYWNDM2Rzc2tpRno0aFlDeGtK?=
 =?utf-8?B?ZDJ3alMzRnowMFB1TU1QaXpKdGs2ekFPZG5pa1huL0lteHZpMVo5OUJZSSt0?=
 =?utf-8?B?MXZrc01zR3JzbUZsNE5RSTEyWHFuNTZ4RXJ4WVY2TEhBT2hPd1dQNExpU2RR?=
 =?utf-8?B?bXJFU3hTU285YWd2QXM0cDFiRWJ5M0JUU1FtZWM5dXUrZ2wySlpqTnFlRnFz?=
 =?utf-8?B?Q0I2Q0p5L0hUYTEwZGY1S1FCSWQwRGhPckEzWnRWWnBFKy9SNTZjTDVPaEY4?=
 =?utf-8?B?ZDZoRDZZNU9LM2VpbXFVTFlZNEQzU1kyRHJiMDg5YmZJYWlZNFA4WHFUVmts?=
 =?utf-8?B?SVd3RnpJbFQ5UEEydDE0SFYwV2hhandOa1hsVHY1WUR0YXBweTVLcVNSbExx?=
 =?utf-8?B?QTZHVG5rYVhXc01sMU5qZ3R4QjU2QmxWV3l4RHBMaDhnTjByUjlCZ1lZYXJo?=
 =?utf-8?B?NXNzY0dFckNHRG9vWktOZmEyNDBRWUsvaWM2S0hCRjZZaWtTMmY5VGo4ZERl?=
 =?utf-8?B?Nm5SQVRXTUZwQ0FNOUVucHJ3NmdadlFEY21xZy9hZ2xqWEJqcmFqWTkzSDRk?=
 =?utf-8?B?SDdocnVUNHVjRkpScFZ3c0ZMZXBFVDdBSmxuOE5ZYUNjdy9yWStvalVrbVBW?=
 =?utf-8?B?eXo3VFpZWWFiNHI1RmRPb1dYSmx4aGxNbjdwMVlFK0gyTVRuNWhiYjg1RHVk?=
 =?utf-8?B?cHcrTmtnR0lpakV3Mkx4ZFZQWC9mT1l2QWM0ekFML1hpQndXaGcxek5NR0Uz?=
 =?utf-8?B?K3ZwTnBmUVFUZldpdWh5ZDRmK2I5eGJPa1ZkZ0VpWGJGZkJWajdiTjRpQlRF?=
 =?utf-8?B?a2hiMlJaWjB3My96eUhtWW9CUCsvcXVRL0VMREl4SGRYMlJRV2J5SHE5WTNE?=
 =?utf-8?B?ei8zRDBXRGVheDRCOHBGS1IzM1phUWJwN2VKUTIxL1BUbUlqcDhJTVEvZWJ6?=
 =?utf-8?B?UDVIeFcwa25mekVIQTJtUUpqMDhKWHkvTTREZUp6T1NzZHRZSFQrWTNPdlQr?=
 =?utf-8?B?bjFNM010VzM2VTR6WG81eGpnVE93Q2RSYmpCSGdkZ09MSW9rVFpqaGlJMEVx?=
 =?utf-8?B?Vm4zWUFOVzlTbWg1em5SRVBncjZxWGJxSFYwdEZubkpWZXY5Sm4rM05sSXN1?=
 =?utf-8?B?eTdVYm1RYnZHcVZzdHRwa0orNnBjVVIrU2tJc3dBWmdWSFo5YXVrOGtkcUto?=
 =?utf-8?B?b2E2UHlQUk5QbXJSSzVoOXdqeWwwT1FFck5nRU5nYm9CZWpUcGI1L1piNXZ2?=
 =?utf-8?B?cExQRW10bmZuR3RVNWc1OU1SVjAvb2lYRUNEeGdTMmRkNjBOcUZlNVRrcXEr?=
 =?utf-8?B?am53dmlhdDlma0hwcnRNVGl5TG9DaGUvMkxtNXpmUS9IWTIyN2xlbks4YjQz?=
 =?utf-8?B?Q0FHenRDTkVScVp6VjhBTWpTUktqWmhISGNobjRjcW9WQkExckhKaW5taDRa?=
 =?utf-8?B?YlZQc0diR1ZDOHkwaGt1WDBFTjI4WWVGbFdBUWpVTjUxdXVJU2hQckNDTWFw?=
 =?utf-8?B?Wm56UXZxem1aYXAvN1NmZ1NERW5ORm15ZjZRQVd2aGd0dnEyT1ZYOU93VWo5?=
 =?utf-8?B?VWVTOWFSOUl5R1RycUNCU0w5L0ZwU1lzZVVyMnFORE9GZFBPOVNHdmM2eXp2?=
 =?utf-8?B?bks2dlpoaXY0VFZ6Z2RWbDRIS3M2VVlMK0hWMmN5cWM2TzhYMnZSUFhZNHNQ?=
 =?utf-8?B?RENWSWcwWkx5cHk5SXRzeDVUZFdZMFRDb1JxeG5sOU5vZXdkV0pEN0l1WGNl?=
 =?utf-8?B?aTYyKzBaaFQ1Uk9xbDhQQW5qQzAveGZqcFVzRS9Td2JjMk1ZTDdzNHVzNmZN?=
 =?utf-8?B?bWZYTXkvYUtHckI2bHVlczJveklSQ2pRbXJKRjFXdEtwTklmRWMvU3pXaTJ6?=
 =?utf-8?B?eFdmL3kvc1lQdWNWS1JIYnlNK0FyVnFnRFR1amg4ZURUeVFsRDc0MHJ4R1JH?=
 =?utf-8?Q?6XjA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d88f6f95-a824-4878-05d5-08db1bf816e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 15:00:55.2979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vcslFkBtBiABfVHinQhOomKtCOcgXQhEd9bZ314KcLKnZHtVJHK1z6h/C/iYu3mKoYKZi6qVDRI4xAf+C5TN5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5627
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3J6
ZWdvcnogQmVybmFja2kgPGdqYkBzZW1paGFsZi5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWFyY2gg
MywgMjAyMyAwNjowMA0KPiBUbzogTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpby5MaW1vbmNpZWxs
b0BhbWQuY29tPg0KPiBDYzogSmFuIETEhWJyb8WbIDxqc2RAc2VtaWhhbGYuY29tPjsgVGhvbWFz
LCBSaWpvLWpvaG4gPFJpam8tDQo+IGpvaG4uVGhvbWFzQGFtZC5jb20+OyBMZW5kYWNreSwgVGhv
bWFzDQo+IDxUaG9tYXMuTGVuZGFja3lAYW1kLmNvbT47IGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9y
Zy5hdTsgSmFya2tvDQo+IE5pa3VsYSA8amFya2tvLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+OyBB
bmR5IFNoZXZjaGVua28NCj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT47IE1p
a2EgV2VzdGVyYmVyZw0KPiA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbT47IGxpbnV4
LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgOC85XSBpMmM6IGRlc2lnbndhcmU6IEFkZCBkb29yYmVs
bCBzdXBwb3J0IGZvciBTa3lyaW0NCj4gDQo+IEhpIE1hcmlvLA0KPiANCj4gSSBhbSBub3Qgc3Vy
ZSBpZiBhZGRpbmcgYSBuZXcgQUNQSSBJRCBpcyBhIGdvb2QgaWRlYS4gQWN0dWFsbHkgd2UgYXJl
DQo+IHRhbGtpbmcgYWJvdXQgdGhlIHNhbWUgZGV2aWNlcy4gVGhlIG9ubHkgZGlmZmVyZW5jZSBp
cyBpbiB0aGUNCj4gY29tbXVuaWNhdGlvbiBwcm90b2NvbCBiZXR3ZWVuIFBTUCBhbmQgQ1BVLiBU
aGlzIGNvdWxkIGJlIGVhc2lseQ0KPiBkZXRlY3RlZCBhdCBydW50aW1lIGJ5IGNoZWNraW5nIGNw
dSBpZC4gVGhlcmUgaXMgbm8gbmVlZCB0byBpbnRyb2R1Y2UNCj4gYSBuZXcgaWQgYW5kIGNyZWF0
ZSBkZXBlbmRlbmN5IG9uIHRoZSBGVyB2ZXJzaW9uLg0KDQpBbiBBQ1BJIElEIHNlZW1zIG1vcmUg
c2NhbGFibGUgdG8gbWUgdG8gcmVwcmVzZW50IHRoZSBkaWZmZXJlbmNlIGluIHByb3RvY29sLg0K
T3RoZXJ3aXNlIHdoYXQgaGFwcGVucyB3aGVuIHRoZSBmb2xsb3cgb24gdG8gU2t5cmltIGNvbWVz
PyAgRG8geW91IGFkZA0KYSBuZXcgSUQvY2FzZSB0byB0aGUgY29kZT8gIElmIGl0IHdhcyBhbiBB
Q1BJIElEIHRoZW4gaXQncyBhIG9uZSBsaW5lIGNoYW5nZQ0KaW4gdGhlIGZpcm13YXJlIHRvIHJl
cHJlc2VudCB0aGlzLg0KDQpXaGF0IEknbGwgZG8gZm9yIHYzIGlzIGRvIHdpdGggYSBDUFUgSUQg
aW4gdGhpcyBwYXRjaCwgYW5kIHRoZW4gaW50cm9kdWNlIGFuIEFDUEkNCklEIGluIGEgbmV3IHBh
dGNoLiAgWW91IGNhbiB0ZXN0IGl0IHdpdGhvdXQgdGhlIEFDUEkgSUQsIGFuZCB3aGVuIGl0J3Mg
d29ya2luZw0KcGF0Y2ggdGhlIEJJT1Mgd2l0aCB0aGUgbmV3IElEIGFuZCBzZWUgaWYgdGhhdCBj
b250aW51ZXMgdG8gd29yay4NCg0KPiANCj4gdGhhbmtzLA0KPiBncmVnDQo+IA0KPiBjencuLCAy
IG1hciAyMDIzIG8gMjA6NDMgTWFyaW8gTGltb25jaWVsbG8gPG1hcmlvLmxpbW9uY2llbGxvQGFt
ZC5jb20+DQo+IG5hcGlzYcWCKGEpOg0KPiA+DQo+ID4gU2t5cmltIGRvZXNuJ3QgdXNlIHRoZSBw
bGF0Zm9ybSBmZWF0dXJlIG1haWxib3ggZm9yIGNvbW11bmljYXRpb24NCj4gPiBmb3IgSTJDIGFy
Yml0cmF0aW9uLCBpdCByZWxpZXMgdXBvbiByaW5naW5nIGEgZG9vcmJlbGwuDQo+ID4NCj4gPiBB
ZGQgYSBuZXcgQUNQSSBJRCB0byB1c2UgZm9yIFNreXJpbSBhbmQgd2hlbiB0aGF0IElEIGlzIGRl
dGVjdGVkDQo+ID4gdXNlIHRoZSBkb29yYmVsbCBpbnN0ZWFkLg0KPiA+DQo+ID4gTGluazogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaTJjLzIwMjIwOTE2MTMxODU0LjY4NzM3MS0zLQ0K
PiBqc2RAc2VtaWhhbGYuY29tLw0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmlvIExpbW9uY2llbGxv
IDxtYXJpby5saW1vbmNpZWxsb0BhbWQuY29tPg0KPiA+IC0tLQ0KPiA+IHYxLT52MjoNCj4gPiAg
KiBOZXcgcGF0Y2gNCj4gPiBOb3RlOiBUaGlzIEFDUEkgSUQgaGFzbid0IGN1cnJlbnRseSBiZWVu
IHJlc2VydmVkLCBidXQgYXMgU2t5cmltIHJ1bnMNCj4gY29yZWJvb3QNCj4gPiBpdCBzaG91bGQg
YmUgZWFzeSBlbm91Z2ggdG8gbW9kaWZ5IHRoZSBCSU9TIGFuZCB0ZXN0IGl0IG91dC4NCj4gPiBJ
ZiB0aGlzIGFwcHJvYWNoIHdvcmtzIGFuZCBoYXMgZ2VuZXJhbCBhZ3JlZW1lbnQgaXQgY2FuIGJl
IHJlc2VydmVkLg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndh
cmUtYW1kcHNwLmMgIHwgMjkgKysrKysrKysrKysrKystLS0tLS0tDQo+ID4gIGRyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1wbGF0ZHJ2LmMgfCAgMSArDQo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLWFtZHBzcC5jDQo+IGIvZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLWFtZHBzcC5jDQo+ID4gaW5kZXggMTA1NTg0
YWJjZjhmLi5lMWE0ZDMwMDJjODAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1kZXNpZ253YXJlLWFtZHBzcC5jDQo+ID4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1kZXNpZ253YXJlLWFtZHBzcC5jDQo+ID4gQEAgLTczLDM0ICs3Myw0NCBAQCBzdGF0aWMgaW50
IHBzcF9zZW5kX2NoZWNrX2kyY19yZXEoc3RydWN0DQo+IHBzcF9pMmNfcmVxICpyZXEpDQo+ID4g
ICAgICAgICByZXR1cm4gY2hlY2tfaTJjX3JlcV9zdHMocmVxKTsNCj4gPiAgfQ0KPiA+DQo+ID4g
LXN0YXRpYyBpbnQgcHNwX3NlbmRfaTJjX3JlcShlbnVtIHBzcF9pMmNfcmVxX3R5cGUgaTJjX3Jl
cV90eXBlKQ0KPiA+ICtzdGF0aWMgaW50IHBzcF9zZW5kX2kyY19yZXFfYW1kaTAwMTkoZW51bSBw
c3BfaTJjX3JlcV90eXBlDQo+IGkyY19yZXFfdHlwZSkNCj4gPiAgew0KPiA+ICAgICAgICAgc3Ry
dWN0IHBzcF9pMmNfcmVxICpyZXE7DQo+ID4gLSAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0Ow0K
PiA+ICAgICAgICAgaW50IHN0YXR1cywgcmV0Ow0KPiA+DQo+ID4gICAgICAgICAvKiBBbGxvY2F0
ZSBjb21tYW5kLXJlc3BvbnNlIGJ1ZmZlciAqLw0KPiA+ICAgICAgICAgcmVxID0ga3phbGxvYyhz
aXplb2YoKnJlcSksIEdGUF9LRVJORUwpOw0KPiA+ICAgICAgICAgaWYgKCFyZXEpDQo+ID4gICAg
ICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+IC0NCj4gPiAgICAgICAgIHJlcS0+aGRy
LnBheWxvYWRfc2l6ZSA9IHNpemVvZigqcmVxKTsNCj4gPiAgICAgICAgIHJlcS0+dHlwZSA9IGky
Y19yZXFfdHlwZTsNCj4gPiAtDQo+ID4gLSAgICAgICBzdGFydCA9IGppZmZpZXM7DQo+ID4gICAg
ICAgICByZXQgPSByZWFkX3BvbGxfdGltZW91dChwc3Bfc2VuZF9jaGVja19pMmNfcmVxLCBzdGF0
dXMsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoc3RhdHVzICE9IC1FQlVT
WSksDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQU1BfSTJDX1JFUV9SRVRS
WV9ERUxBWV9VUywNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBTUF9JMkNf
UkVRX1JFVFJZX0NOVCAqDQo+IFBTUF9JMkNfUkVRX1JFVFJZX0RFTEFZX1VTLA0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgcmVxKTsNCj4gPiAtICAgICAgIGlmIChyZXQp
IHsNCj4gPiArICAgICAgIGtmcmVlKHJlcSk7DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKHJldCkN
Cj4gPiAgICAgICAgICAgICAgICAgZGV2X2Vycihwc3BfaTJjX2RldiwgIlRpbWVkIG91dCB3YWl0
aW5nIGZvciBQU1AgdG8gJXMgSTJDIGJ1c1xuIiwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAoaTJjX3JlcV90eXBlID09IFBTUF9JMkNfUkVRX0FDUVVJUkUpID8NCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAicmVsZWFzZSIgOiAiYWNxdWlyZSIpOw0KPiA+IC0gICAgICAgICAgICAg
ICBnb3RvIGNsZWFudXA7DQo+ID4gLSAgICAgICB9DQo+ID4NCj4gPiAtICAgICAgIHJldCA9IHN0
YXR1czsNCj4gPiArICAgICAgIHJldHVybiByZXQgPyByZXQgOiBzdGF0dXM7DQo+ID4gK30NCj4g
PiArDQo+ID4gK3N0YXRpYyBpbnQgcHNwX3NlbmRfaTJjX3JlcShlbnVtIHBzcF9pMmNfcmVxX3R5
cGUgaTJjX3JlcV90eXBlKQ0KPiA+ICt7DQo+ID4gKyAgICAgICBjb25zdCBjaGFyICpoaWQgPSBh
Y3BpX2RldmljZV9oaWQoQUNQSV9DT01QQU5JT04ocHNwX2kyY19kZXYpKTsNCj4gPiArICAgICAg
IHVuc2lnbmVkIGxvbmcgc3RhcnQgPSBqaWZmaWVzOw0KPiA+ICsgICAgICAgaW50IHJldDsNCj4g
PiArDQo+ID4gKyAgICAgICAvKiBVc2UgZG9vcmJlbGwgZm9yIFNreXJpbSBhbmQgbWFpbGJveCBm
b3IgQ2V6YW5uZSAqLw0KPiA+ICsgICAgICAgaWYgKCFzdHJjbXAoaGlkLCAiQU1ESTAwMjAiKSkN
Cj4gPiArICAgICAgICAgICAgICAgcmV0ID0gcHNwX3JpbmdfcGxhdGZvcm1fZG9vcmJlbGwoaTJj
X3JlcV90eXBlKTsNCj4gPiArICAgICAgIGVsc2UNCj4gPiArICAgICAgICAgICAgICAgcmV0ID0g
cHNwX3NlbmRfaTJjX3JlcV9hbWRpMDAxOShpMmNfcmVxX3R5cGUpOw0KPiA+ICsNCj4gPiAgICAg
ICAgIGlmIChyZXQpIHsNCj4gPiAgICAgICAgICAgICAgICAgZGV2X2Vycihwc3BfaTJjX2Rldiwg
IlBTUCBjb21tdW5pY2F0aW9uIGVycm9yXG4iKTsNCj4gPiAgICAgICAgICAgICAgICAgZ290byBj
bGVhbnVwOw0KPiA+IEBAIC0xMTUsNyArMTI1LDYgQEAgc3RhdGljIGludCBwc3Bfc2VuZF9pMmNf
cmVxKGVudW0NCj4gcHNwX2kyY19yZXFfdHlwZSBpMmNfcmVxX3R5cGUpDQo+ID4gICAgICAgICAg
ICAgICAgIHBzcF9pMmNfbWJveF9mYWlsID0gdHJ1ZTsNCj4gPiAgICAgICAgIH0NCj4gPg0KPiA+
IC0gICAgICAga2ZyZWUocmVxKTsNCj4gPiAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gIH0NCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtcGxh
dGRydi5jDQo+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLXBsYXRkcnYuYw0K
PiA+IGluZGV4IDg5YWQ4OGM1NDc1NC4uNWNhNzFiZGE5YWMyIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1wbGF0ZHJ2LmMNCj4gPiArKysgYi9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtcGxhdGRydi5jDQo+ID4gQEAgLTUxLDYgKzUx
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9pZA0KPiBkd19pMmNfYWNwaV9t
YXRjaFtdID0gew0KPiA+ICAgICAgICAgeyAiQU1EMDAxMCIsIEFDQ0VTU19JTlRSX01BU0sgfSwN
Cj4gPiAgICAgICAgIHsgIkFNREkwMDEwIiwgQUNDRVNTX0lOVFJfTUFTSyB9LA0KPiA+ICAgICAg
ICAgeyAiQU1ESTAwMTkiLCBBQ0NFU1NfSU5UUl9NQVNLIHwgQVJCSVRSQVRJT05fU0VNQVBIT1JF
IH0sDQo+ID4gKyAgICAgICB7ICJBTURJMDAyMCIsIEFDQ0VTU19JTlRSX01BU0sgfCBBUkJJVFJB
VElPTl9TRU1BUEhPUkUgfSwNCj4gPiAgICAgICAgIHsgIkFNREkwNTEwIiwgMCB9LA0KPiA+ICAg
ICAgICAgeyAiQVBNQzBEMEYiLCAwIH0sDQo+ID4gICAgICAgICB7ICJISVNJMDJBMSIsIDAgfSwN
Cj4gPiAtLQ0KPiA+IDIuMzQuMQ0KPiA+DQo=
