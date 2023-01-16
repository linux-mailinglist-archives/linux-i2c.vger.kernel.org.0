Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C97C66C7D6
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 17:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233144AbjAPQfX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 11:35:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233320AbjAPQed (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 11:34:33 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40E32A164;
        Mon, 16 Jan 2023 08:22:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SILqpynywpYtopuxNjC0TQSZHqU07RUkmbmPwQYiwHqpWodllGNxx7QeZcAbZdx3o4oadUTDhSHqb2vsRW5T683nfZyyKTcP/7cMDyu3kHwIJApKDTCw8BLYjq5goM6YvW1s8QQQFiS4oXRXG31KuBiQi/WAif+jGSOgBEd3O9t1O/mcianTOfjUkm7MCAdaGRQKpI74h6F9+9kbe4R1R0gsDi++5cTXjcoEXLaaRrFHsn+v0xajqYC/aLVNkoEpUPURfGh0VNIWI7hzENrVBfTfo1W0v2yF8xrvn1WBKVIaV/oSSJi9y1BiO7U/QvCc3zYbPaEhwHTYCg2bqBxjbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xv4EQIzPL/+rqGiMwaBL+DW5qUqwBj7IOIAzGI26w14=;
 b=DUnxmMeUY9IrtZvqBkfrpxYZaFr4xZUd9g1L8SLJLKK3d6xM1DyWfpZnzhV0YEkq3h+jBZ+T7gaC0TKWKEU8z1dPqKcnpJ7pVdxGQqPX++TGrZHymVHfQxYT8arT/GZmvzucmhwDUQERg+nO+rj6+c6uXL/5xRZ6GcsSZedG95Rd9wgpQZQjGjlzIKT6BumfBh8afgPTi+krrW3+919KOn8+zB5OCrRQTWMoCfMfYQMl/Q/UxPUo0G3swPVx5EMeu1shm4LY2woYDffA6Ii4n8cZ/ar3U6Wo6FEi9iISYjfKxHLKRP3ifCUrvSczlvJUZuJTpgTU1IwRmHFvLDdvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xv4EQIzPL/+rqGiMwaBL+DW5qUqwBj7IOIAzGI26w14=;
 b=qRs4WieswN7XRmiPvz4dSaVDDEiEJK3+/rR3b3dyS0hjCjEhHjZazxOd0QNARWMGL9pofp2LuR7N+oH+LW97w5rPrGde6BfceKvHtmMJ0fPpI/atOan9di4rXurU8snJt1FBVyLAzrklJj4vdp8D70mhd8thgpivVrAKqPhNJJY=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Mon, 16 Jan 2023 16:22:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a%8]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 16:22:09 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?utf-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
CC:     Borislav Petkov <bp@alien8.de>, Borislav Petkov <bp@suse.de>,
        Hans de Goede <hdegoede@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "rrangel@chromium.org" <rrangel@chromium.org>,
        "upstream@semihalf.com" <upstream@semihalf.com>,
        "M K, Muralidhara" <Muralidhara.MK@amd.com>,
        "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
        "Ghannam, Yazen" <Yazen.Ghannam@amd.com>
Subject: RE: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Thread-Topic: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Thread-Index: AQHYyc72PJa6vYxdLkqirPQlPSziYK3iUqGAgAY0t4CAAdIHAIAAAecAgAAIyYCAANl4AIAAAI8AgABCL4CAAASeAIAABw6AgAYtMQCAACBVgIAx4oEAgHLm34CACvFxAIAAJw0AgAA+O1A=
Date:   Mon, 16 Jan 2023 16:22:09 +0000
Message-ID: <MN0PR12MB6101E79DA61CB0154C4819B2E2C19@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <YywvmueFj/ibyZdf@smile.fi.intel.com>
 <YywwEvkZK1R9mJfE@smile.fi.intel.com>
 <c0c8bdce-26a0-ad3f-749b-7585d947608b@redhat.com> <YyxrdpUyc+kp48kX@zn.tnic>
 <33d5cc27-474b-fdec-a6b0-84ac16f7d386@redhat.com>
 <CAOtMz3M=BTZUTRMHWGULwMDWmGdOzHKo=UcZeg3sP8_ndVYk2g@mail.gmail.com>
 <YzG657ZFeEvLd6hm@zn.tnic>
 <CAOtMz3MWnmdMbw_CKxBKVt=TJpLNJuZUzpxvnDi+QnigaLozLA@mail.gmail.com>
 <Y7v2j92Ol6dL3FLE@zn.tnic>
 <CAOtMz3PG4nku-O7dh+1U_DA05HAmQboTqwUQkCkrXQLV9bFjPw@mail.gmail.com>
 <Y8VFVmhqP8dpqZcQ@smile.fi.intel.com>
In-Reply-To: <Y8VFVmhqP8dpqZcQ@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-01-16T16:22:07Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=9789f006-043e-44a5-843f-3d694d1f82fb;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-01-16T16:22:07Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: d96ef13e-9ecc-4939-ab9e-9c16dc0bf9e7
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|DM8PR12MB5430:EE_
x-ms-office365-filtering-correlation-id: 1f96eb43-9a84-4a06-2b46-08daf7ddd0fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3UAo5M12aKGi5/jMT/pgIvYJCqIMewrNPDV+CI6ZK4F7xnM7zR9WNecSJt7M4edOxRkAYwm/qBCnhlsugU5WNpAiwxKeGBqu+8Eq3eHbPeH80+K9H6ThzSGL3DM8TRIAfviRMB1Ai/unPupicxUjbT2fgI+E7o6uZ1JeyIDPLA0o9L3qNdwwcLXzbXKdjcCOZNr2YZm7qIdH5EUfqjRdWGbGyFS74U1q6N/0fFu61hjZ/uDQOHN9y6fpw5Ylj8D9XEfgFOBRtFUKYzoe5nxy54RUm95WHQAbLfmnp1Jp7nI3pCHwL5GOUdNGItfSD9hUKyGZqdWt+ZupqGufGzPcJahKjWFhhu5n6KB+c5wNdHgvoCQ0CcD/zlIjTuanpW7bW6qSmwI3QVtTFzjo87yhd3By5nKOBq9fixN/FEBCtPgFacZ4ajaDXB0Xkaw+h+I7P6SHC/DOMdjlIAB94nxubJENIwzqra5n6OXVc/4idJS6JXnLVjhH5onEsccqkCl2fmIV1y8E7CTVeYGxA2t6nOD7bqPbYbNMq14+kw7Y/G0ZecAw82Tc3A7+pt9nuOj3mlmG0X/zKp27W4eiRQMbaw+C7BLxFOkUHslji/NCEtcRwUSGmJL+FXqlm9uq/Qt0e4p9OzGSh+b6LF4xCeexuHtD/rjdJDBfXIgCI5EBs7VYhLmnTeeq8qcwmEQwD5S7kRsL3mnts6zrQhA9azLWSQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199015)(83380400001)(33656002)(122000001)(38070700005)(86362001)(8676002)(38100700002)(55016003)(5660300002)(7416002)(2906002)(8936002)(66476007)(64756008)(66946007)(76116006)(52536014)(66556008)(66446008)(4326008)(41300700001)(9686003)(186003)(6506007)(26005)(53546011)(66574015)(54906003)(316002)(478600001)(7696005)(110136005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0RVTXQyazZ4ejV2QTdNeUtWV1M5QUQvVFV0Tjg4TTl4eWlkbDZreWE4VGRF?=
 =?utf-8?B?VTZxOER4azZETGdidTVIUGZPbS9Jc1A4VnpGOFcvTDJuNGhGbFllVGhFMURY?=
 =?utf-8?B?WXJneFlENDlmTmRpcFlpRUtJQVBFRWxtZ2JZdmtlQlBEUTlVc1pvQlRKV0Z4?=
 =?utf-8?B?SmQ3bkkySXAvc2JydzdNMFlEc2RTZEY3R0NMNW0yai9WQ29yTzJjMWwxR2Fy?=
 =?utf-8?B?NXRLUENJUjc4elNabE1IRWFHQXdSd0R6S2xVVCs2Qm5hT1J4WnV5L25udE0v?=
 =?utf-8?B?c0xwaEMzbzRuamJDa3NoamNBcFFwK0VKcXJJQWVjblNhMlBYeDZIdXAxbFVz?=
 =?utf-8?B?U2hHakp0dXEzNkNmbVlZSUNxMXlQdEpzQStINWNnRTNNRnc4aVliUEpxdHhl?=
 =?utf-8?B?a24zRWpRelYrTEVWUW5oeEJHMFJyUUE2cXJabVRoVHVDTTVYT0szYmkyd3A1?=
 =?utf-8?B?b0VTZUFGSWI2NENhOXhjS21Kc1J4d1grM09JaWFXVGo3VGd1bFBpOUdVUUgx?=
 =?utf-8?B?UVkyaUVmK1Y1cXFFbTNuWVMrTVBUN3YwanFyYVhTQ01uZ1RrTFVCY1hnU0xi?=
 =?utf-8?B?NzJLQW85MEt1amVDY2hUc3hwUEdveldXdFdPQzFXSnhyeFd2SlE3aW4xMCtm?=
 =?utf-8?B?N1JySkdNZmpSVHFZMmFydFhSY3IxWDhJajJ5K2g3Y1VTSUdCMWpNYzhab2cv?=
 =?utf-8?B?QmhPYzFxYnNCNDBkOEpEK1RWdENwNkFvb0sxT0ZBNFp5cjYyOVR6Q28yWjhW?=
 =?utf-8?B?LzFNR2E0TitPZUpGVUFJYXRMU2hlRnhwK3A1cGY5NU5sazd1cFdzQXRtQlpD?=
 =?utf-8?B?Q1FKNlk3ajJkV1JIb2I2OXBCaFM4cE93cXU3dkNqalYvMWhOSHZoUHhmbzR6?=
 =?utf-8?B?WWppV0xGVG0wbDZ4dG9wUWRiN0gzZ2huSjNocUtDc0VMZDJKckxRVUcxemZy?=
 =?utf-8?B?U1U3NUIrNDRobUU2ODVZbTZhc2grdmZidS8vSHVQMXU3VzYvdXdFRU9rZnM4?=
 =?utf-8?B?OEl3Nkd3dmJSM2huVmFRMUpBMW9BVEx4dmgxNUlsdmFpR2loMmZMMjd5YWNZ?=
 =?utf-8?B?V3V2dmlndkxtZU1hdUlEZEpkeTViSmJIdldoelRvRXRKdFlxKzBOVWhUNFN4?=
 =?utf-8?B?bjdITDQ3RXlFZlp0bWVPcUsvam1XZUJDWVJvWFN4bTdiNDg3VFVxZks0TVpl?=
 =?utf-8?B?d2RqVzlxYUVJNnZLNTJXSHBPOUp4dFZnSWlTd2hMd0hLcW10Nmg3TG90T2RR?=
 =?utf-8?B?TVdxMVZlUU9ORFQxd0IySUZ4ZHU2SEphY1VnKzZ0eTdQV1l0VmtQak56YlN1?=
 =?utf-8?B?TDRQNzZ4ZjNNZUZFUU0zN0NwNjNkN01rYVphTHE3UHpiZVllWHI1elJ0R0R1?=
 =?utf-8?B?U3B2VXloaHFZQklCUml1bU1VZlU3U2NvbEFOQU53NnFyV3liS3haN2dEWGxR?=
 =?utf-8?B?Nit3OXg0cnljLzd2R3BZNW1iY3VPbmZXSVJteDRDcFlUZ1Z4Y2dwaFUvZTBm?=
 =?utf-8?B?Zk9GR0NKM3dBKzliR3VPY0pPNk1odTdrd0hyRyt6QkJMQ1dIY2Z4N3JmVXFW?=
 =?utf-8?B?MWlKT1JxRHYyaU1wMkZRRlprQlhWZGdQbjM3KzBjSThkYXB6VnFvMUFCTVlU?=
 =?utf-8?B?bnJRZjdBNXJqd0REZk5TTnk5TlJ1VzZaQVVzQ3FvYkZEd1ZYWDNkd2l4Wi9a?=
 =?utf-8?B?bjhuamJ1dlRmWU8zVG8zZTdUS0NleVI5VTdGSUFIbjFqaWhmSVhrVUN4Rktu?=
 =?utf-8?B?ei9pMitIV2U1QlErVGt0Y1h4eVQ4bkNPVWZJeHlYU0RZSFd6UHFHdko5T1gr?=
 =?utf-8?B?RjdKeGFWVllqaDN0TTE3d2d3cWhXYkRKdVJqT1RONyt1Y0hHNXZ4ZzdHdWlQ?=
 =?utf-8?B?dG5TUSswc0ZCOFZtZUZuTU1zUE5UMHBKTHhwVU1FV2FGRkxld1BPd1lwZm5r?=
 =?utf-8?B?cDJlaXdqdndhYVpTKzdUZVdoN25GVTg2RkRPcHNEN280NWVwOTlkSEVzL2VE?=
 =?utf-8?B?Y3NBUytubWRiQlNjN3oyWDFOaXNla3NQVzNld0hNNHdWNlYyTFJrU1R2eXBo?=
 =?utf-8?B?bXo3R0s0a2pKejJReDFoQzJZUjQ2S25CME1KL1NFN0xHc2VYOFpYMFFHNkFD?=
 =?utf-8?Q?YLXw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f96eb43-9a84-4a06-2b46-08daf7ddd0fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 16:22:09.1832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rswZwjfUXDdj7A/rsdnPl9WLLMhWRKYdD48ZvY5eW6QOsHKffJONP5YSo36e8ZXF3sHsliXaCwjiZGqLM3dc0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5430
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5k
eSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgSmFudWFyeSAxNiwgMjAyMyAwNjozOQ0KPiBUbzogSmFuIETEhWJyb8WbIDxqc2RA
c2VtaWhhbGYuY29tPg0KPiBDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+OyBMaW1v
bmNpZWxsbywgTWFyaW8NCj4gPE1hcmlvLkxpbW9uY2llbGxvQGFtZC5jb20+OyBCb3Jpc2xhdiBQ
ZXRrb3YgPGJwQHN1c2UuZGU+OyBIYW5zIGRlDQo+IEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29t
PjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGkyY0B2Z2VyLmtlcm5l
bC5vcmc7IGphcmtrby5uaWt1bGFAbGludXguaW50ZWwuY29tOyB3c2FAa2VybmVsLm9yZzsNCj4g
cnJhbmdlbEBjaHJvbWl1bS5vcmc7IHVwc3RyZWFtQHNlbWloYWxmLmNvbTsgTSBLLCBNdXJhbGlk
aGFyYQ0KPiA8TXVyYWxpZGhhcmEuTUtAYW1kLmNvbT47IENoYXRyYWRoaSwgTmF2ZWVuIEtyaXNo
bmENCj4gPE5hdmVlbktyaXNobmEuQ2hhdHJhZGhpQGFtZC5jb20+OyBHaGFubmFtLCBZYXplbg0K
PiA8WWF6ZW4uR2hhbm5hbUBhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIC1uZXh0IDEv
Ml0gaTJjOiBkZXNpZ253YXJlOiBTd2l0Y2ggZnJvbSB1c2luZyBNTUlPDQo+IGFjY2VzcyB0byBT
TU4gYWNjZXNzDQo+IA0KPiBPbiBNb24sIEphbiAxNiwgMjAyMyBhdCAxMToxOTowMEFNICswMTAw
LCBKYW4gRMSFYnJvxZsgd3JvdGU6DQo+ID4gSGkgQm9yaXNsYXYsDQo+ID4NCj4gPiA+IE1ha2Ug
aW5pdF9hbWRfbmJzKCkgYXJjaF9pbml0Y2FsbF9zeW5jKCkgc28gdGhhdCBpdCBleGVjdXRlcyBh
ZnRlciBQQ0kNCj4gaW5pdC4NCj4gPg0KPiA+IEkgZGVzY3JpYmVkIGVhcmxpZXIgaW4gdGhpcyB0
aHJlYWQgd2h5IHN1Y2ggb3B0aW9uIGlzIG5vdCB3b3JraW5nIC0NCj4gPiBsZXQgbWUgcXVvdGUg
bXlzZWxmOg0KPiA+DQo+ID4gSXQncyBub3QgZW5vdWdoIGZvciBydW5uaW5nIGluaXRfYW1kX25i
cygpIHRvIGhhdmUgb25seQ0KPiA+IHBjaV9hcmNoX2luaXQoKSBkb25lLiBXZSBuZWVkIHRoZSBw
Y2kgYnVzIHRvIGJlIGNyZWF0ZWQgYW5kIHJlZ2lzdGVyZWQNCj4gPiB3aXRoIGFsbCBkZXZpY2Vz
IGZvdW5kIG9uIHRoZSBidXMuIFdlIGFyZSB0cmF2ZXJzaW5nIHRocm91Z2ggdGhlbSBhbmQNCj4g
PiB0cnlpbmcgdG8gZmluZCBub3J0aGJyaWRnZSBWSUQvRElELiBEdWUgdG8gdGhlIGFib3ZlLCB3
ZSBuZWVkIHRvIHJ1bg0KPiA+IGluaXRfYW1kX25icygpIG9ubHkgYWZ0ZXIgYWNwaV9zY2FuX2lu
aXQoKSB0aGF0IGlzIGludm9rZWQgZnJvbQ0KPiA+IGFjcGlfaW5pdCgpIHdoaWNoIGlzIHJlZ2lz
dGVyZWQgYXMgc3Vic3lzX2luaXRjYWxsLiBUaGF0J3Mgd2h5IHRoZQ0KPiA+IHRyaWNrIHdpdGgg
c3dpdGNoaW5nIGluaXRfYW1kX25icygpIHRvIGFyY2hfaW5pdGNhbGxfc3luYyB3aWxsIG5vdA0K
PiA+IHdvcmsuDQo+ID4NCj4gPiBXZSBoYXZlIGEga2luZCBvZiBjaGlja2VuLWFuZC1lZ2cgcHJv
YmxlbSBoZXJlLiBPciBpcyB0aGVyZSBzb21ldGhpbmcgSQ0KPiBtaXNzZWQ/DQo+ID4NCj4gPiBJ
IHdvbmRlciBpZiB0aGVyZSBpcyB1cHN0cmVhbWFibGUgb3B0aW9uIHRvIGNvbnRyb2wgb3JkZXIg
b2YgdGhlDQo+ID4gZHJpdmVycycgaW5pdCBieSBmb3JjaW5nIGxpbmsgb3JkZXI/DQo+IA0KPiBC
dXQgd2hhdCBleGFjdGx5IGRvIHlvdSBuZWVkIGZyb20gTm9ydGggQnJpZGdlPyBJcyBpdCBvbmx5
IGl0cyBleGlzdGVuY2Ugb3INCj4gZG8geW91IG5lZWQgdG8gaGF2ZSBmdWxseSBpbnN0YW50aWF0
ZWQgUENJIGRldmljZSAoaWYgc28sIHdoeT8pPw0KPiANCg0KVGhlcmUgaXMgYSBuZWVkIHRvIGJl
IGFibGUgdG8gd3JpdGUgYW5kIHJlYWQgUENJIGNvbmZpZyBzcGFjZS4NCg==
