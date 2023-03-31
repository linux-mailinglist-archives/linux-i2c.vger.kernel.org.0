Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E43A6D2225
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Mar 2023 16:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbjCaONZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Mar 2023 10:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231801AbjCaONX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Mar 2023 10:13:23 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163385FC3;
        Fri, 31 Mar 2023 07:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpsH2f//362BMw8SVqn6q1wfaapFcsw65qVjnWSj+2Ql4P7YFOtmtnNFejqIHn4nThsbLQu6VRmbK8zOIXuDwC+2iARoN/emQeRlulwq1O0/+xUQiAtu2rvqdPkBvGDrM7bPlzcp9TJ9UWUTLuuwldVchutNAfVFRU5I05nTkQ9Jpk8kmgNOble2DJLGo2jQg5iW9SJgBrpJAses2SYnKVIVa4mh0zC6a9FbveT+4+AvQKZkRS/qjjSpxyiwLqL/ZyadcIVVokuTeOBGUruf+b4lkbARv3RvekM4Z6VkX/MhMZBPyi7HwfjZeGU+gjtDOdPFKkFVQrVRXBLi+qd3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvVXxOvKEHnMgwWyEecjySIqf6Ju8bwNOcHmKxJ/WeM=;
 b=RXNic/Ovd000YtQRyQeFegq/syBhLVhRa/NQQSvIO5Lc6wUn94f3HlvtEHtFHWSjjhqna3At7c5w1qV/a/h/9WU1e/204iuHR681xARx/W7K/j814zk0ZZzOc829CrQohfUv1NDobc3x0/iThQdpOVubDpJh5cnaA9NJeglLcdNVCunN88ZZz3IHo0RWkBqWP2nJxHbXsY6M0loslRtvBG5klLPPCGXMdhJps4grY32/d4cNGRgqNjdishBlKZqtL9AA53Tqo3IfZXJX5m/nWDg8uurME5w+f3S2dzSfV378adfPmbKV75DWeBIWj3HhCLySare9nUXfr7uBJH5FPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvVXxOvKEHnMgwWyEecjySIqf6Ju8bwNOcHmKxJ/WeM=;
 b=ogzfDKo93c9oOFbKLxAtxCz1qprxbViGKBS6g7WVH+IhHJtmQTuD6rhnEvx+ZC9JePZO2jWBi/MeSL9wklvhZrPe+QBrS86o7mAhAG4OHpgtALCipOvGxWMWqHWwt2N9NsOLrJH6nGPhJYOesS8KF0A2ryjk9oPkb3MSb+nkn+s=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB5783.namprd12.prod.outlook.com (2603:10b6:510:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Fri, 31 Mar
 2023 14:13:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 14:13:17 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     =?utf-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
CC:     Grzegorz Bernacki <gjb@semihalf.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Held, Felix" <Felix.Held@amd.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 5/6] i2c: designware: Use PCI PSP driver for
 communication
Thread-Topic: [PATCH v7 5/6] i2c: designware: Use PCI PSP driver for
 communication
Thread-Index: AQHZYor3UJ3e0VfSWEeLE2KVbHireK8UycYAgAACwQCAACPnwA==
Date:   Fri, 31 Mar 2023 14:13:16 +0000
Message-ID: <MN0PR12MB61014694E6D8BCD9E6E7152AE28F9@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230329220753.7741-1-mario.limonciello@amd.com>
 <20230329220753.7741-6-mario.limonciello@amd.com>
 <c298b247-1bdc-340c-ad7d-df3653cc9027@linux.intel.com>
 <CAOtMz3P5eCLZiQiPDs-iG6EdwLZHsNeEmSpPXFjJXcEBQ=retg@mail.gmail.com>
In-Reply-To: <CAOtMz3P5eCLZiQiPDs-iG6EdwLZHsNeEmSpPXFjJXcEBQ=retg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-03-31T14:13:15Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=aea5a4ca-3779-4162-9888-ad46922f8ded;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-03-31T14:13:15Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: ed3721d6-dcd2-4970-b001-979d52e92a0c
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|PH7PR12MB5783:EE_
x-ms-office365-filtering-correlation-id: feecd5ba-8a7a-4469-0669-08db31f212c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VHjxvP+9KZdkjBD6eERF/RvhIt+loEZEKt1ViWxr74appGjEIju4/P8lyagq+b+cBL+x6Fmsf45XhgQ7wwISqTRo7l2VCx20ndAaROZBpJg4ir35ocsa4PDdBI5YZTLbPQKc+3QTZ59glCgX4SQp5DmXlgiWgwjycFLq68yKwG6zUMzSmTmgOgbOXc06fF8tI/peHq6TwSGaH7p/2Ql5dUUJEdWdDhvHhWrchRwGcH1hcGrNJfy6hq6u/cVYuopTB8u46WKyAWrQyEOXXwkb3we4An0Yb90t2DQ0EVhoRPR0HPkFpMYDsVmQ4xeCRL67NJr40377EUZNfme0lZhFQIAKgk9SNf3VmDIqmjFRD8qi/zj1QLQLYrL3VDko7ENioQKxfjprV7gw8LO9jxxu1NYnskxRxfIMhS2o/qcA7AtC1C1P3M8nwlToCXrvAuOUkeb+zK+M8lyh9m2Om6kfN4mijEN9wN58/qPiEJh86LBWROzTw0oIYQk1M56YDEqNJ9KskyGuINbb2uMGq8iE/CwWPShRikxdMxkYw9uo9CEEvtL9UFonl68pvqxkW0T6DLwDzC/6EDR95XnWSb7lvqtACMHIX2LAJcOhEHWQX1XCLhQDCRmYMM6Mvetz3mKx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199021)(478600001)(38070700005)(6506007)(83380400001)(71200400001)(55016003)(2906002)(33656002)(7696005)(38100700002)(66574015)(5660300002)(54906003)(110136005)(8936002)(9686003)(316002)(52536014)(122000001)(86362001)(186003)(26005)(53546011)(41300700001)(4326008)(66476007)(76116006)(8676002)(66946007)(64756008)(66446008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWNSaDZrQnZJZXIwa0wycHhYdEY2UEJtWWloeTBTRFA0VFY2MUZKeDR2eUo5?=
 =?utf-8?B?bWdQOHZIdkxsTVgwV2NCMUpEeDRycG5tNFhaZVFsRkJrR0F6dmYvSjRBM1BC?=
 =?utf-8?B?YnhpZE5maktxQklBODF2NzNMN2V1SWE1eis1c1lLUnRxQzFDVlBUTnNZL2Zq?=
 =?utf-8?B?b0c1MVBRVmU4Rlg0N1ZZSXlpTjlXODgwcjdGQzhkb1l2S0FXbEM3QW5sbkVk?=
 =?utf-8?B?MlJiMUtJL1BxNVZ1cjcyZ1B4WUxDSjlQNTdQZjN0cFlmWTZSY3pPYURZeVBS?=
 =?utf-8?B?VjhxUXZ3bWZwczdkblRWZ0ZnSnNjdmF0VW8yWUFYS1FNMlBJT25BK0tPelV3?=
 =?utf-8?B?M0FnV0ZJekdFeW4wTWpOTW5pZThPRG56aUR6VU9pN0U3R045d0tJUlp4T1M5?=
 =?utf-8?B?TjRQY3dDVVhxZGUrSU12ckFqc2FXeTd6YVlHd3FDaVI1NXF5cXFOcXVqOTRn?=
 =?utf-8?B?ZlFDS0pITW5LSmJRMUZibEZoTzdrdEVXVXAxVHUwcVFORXF5ek5yWU9HR0hE?=
 =?utf-8?B?QnNSdmpDeUpoYlBLS1NMMkxoVjg2WWxqcWh5cmpqOHdPd3NUTnpXRTBoNWo5?=
 =?utf-8?B?WXduVzEzcjAwbVo3UDVZcXNGVW5zdGkrdFIzZUYxN2toSkZvQ1hycEEzL3VZ?=
 =?utf-8?B?WlpvQ2dpWVFTVjU2NU9mcTZQcjE1MlZpMk5VU2g5dHJwTmJOSmVadS9xOFBT?=
 =?utf-8?B?YmxYa1AwTGRaMU1MNG5MZzdrbjJMUHZtd0FveGJzZnhUaUZoOXljcmtvS0Zw?=
 =?utf-8?B?YVFmbVg2S2RpcWo0S0NuSm52K0ZsOFJwWUEvWkUydVYxNXQ2SDlPV1NoUFhS?=
 =?utf-8?B?Z2dOdlozN3dCdzdlTkQvQU5SZTQ0KzlkQ3pYSFBUZ2Yzd3dOQXlhS2NGUFZ5?=
 =?utf-8?B?YkRFRlovTDU4aVFVM0w4dnJwcUZKb2QvSzNGS0ZUV0grRmZQNVVWamc5aHpq?=
 =?utf-8?B?TGxqMy9HUFdndWFncEFWNUVzR3h0Y3NBYlM2OTAwK0xlMHpGckZpTXdzSSs2?=
 =?utf-8?B?ekh2dG92cGhSMDRDdWlXSTY3dTY5SDUyOEM2cVFCYkRaci9NZzZrMEY3M3pn?=
 =?utf-8?B?TzFBMkRHaUlQNHUxMEowcjRoTXFKUzhlSnV6b1BvS0dmTS90c0ZETXhIdU9I?=
 =?utf-8?B?RnpRbXZDRjhOUTVpMmhsOThzVlZQak9tUW9LVWZZeDBCcEVwS0Y0MUtMOGNJ?=
 =?utf-8?B?UmwwUE0zTm5ETFdQRUZmNXJsNmxyYStpbnNFb2VOMWVOTWpQQUdyYlFTRUZz?=
 =?utf-8?B?YndzWGxLRlI2NkFnRzdpQUFTYyt5MzhZcVFGNnMwTjdoRHNFejNpMWllZloz?=
 =?utf-8?B?VEd1SC85OGNsbjlLamZKLzdybkhsYlQrakhBOE1LaUpRcm5jMkYzRjhQTDJW?=
 =?utf-8?B?MDRZeDBUV0l3Q3NjckRzb1lLbktmOTRnRXN1R3NZc050V0Uwd3NnODNLajBz?=
 =?utf-8?B?STJ1dWprc1J6eW9URlN3N2J5SXc4Y2R5aXJia3VWeFRqZ2JncDV6OXBVdE9j?=
 =?utf-8?B?dmhIRUV6cnBVcXNQR2M0N0hxT2hncnQrNG1UUzBxVlVLQTRYVUdkdzdDWVU3?=
 =?utf-8?B?SzU1WnpkQ1VCMEFHS3Z0Y2xNY1ZNUzNIU3ZlK09JZWllV0NvSEVSeTFZY24v?=
 =?utf-8?B?TTV5alRmV0NZN3IwVWlFY0d0RExQVHdDcU5KSk8xQkFYK0FqcGVPRllWMERF?=
 =?utf-8?B?UzRlTzRRY0pzQU1BSXo2ZFpRR0cxM2xnQ3JXNlhIeGVVZlYyRzRyZnJ4YnYv?=
 =?utf-8?B?a2JSQnEwL2ltT1c0L1RsUmU1eVVLNzluR3cwOEdXNzBTREViTWtzWnJOVGtp?=
 =?utf-8?B?a1hQK3AxYUlIZG9ET0RWL2w2QWZLcURlQlZIOHpTa2hpMGQ2ekpMS0tmVGhv?=
 =?utf-8?B?V0dONmMxbkdNaFQ5MXgzeGloaVNCQm90cWZVejdYOG9pV0FlZlhPbllQdTFW?=
 =?utf-8?B?UUtSUmZiNlc3N2hqQjU1WTRCYlMyM2llMXY2RGxwT3JlMUdKNFo2TzVDdVQ5?=
 =?utf-8?B?WDFadmt5VEltcXRnT2paK3dISWsyMFhYY0l3OUNTVEtPWUlUM2NQU3pRQVpG?=
 =?utf-8?B?cldEd1dnZ2pWZCtlNTh3bXh0MUpIL1hCTUFxM1NEZTUyM016Wk5yQ0FpZ1J3?=
 =?utf-8?Q?90KQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feecd5ba-8a7a-4469-0669-08db31f212c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2023 14:13:16.8967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: STmvPNEmUrquBYoa/taa7MiqsrfnfeU1xNjwhIn6xLFeZ+3M2Ru1wSMXiy/H0ePBdCYJoHOUD65gkL0tadHiCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5783
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFu
IETEhWJyb8WbIDxqc2RAc2VtaWhhbGYuY29tPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDMxLCAy
MDIzIDA3OjA0DQo+IFRvOiBKYXJra28gTmlrdWxhIDxqYXJra28ubmlrdWxhQGxpbnV4LmludGVs
LmNvbT4NCj4gQ2M6IExpbW9uY2llbGxvLCBNYXJpbyA8TWFyaW8uTGltb25jaWVsbG9AYW1kLmNv
bT47IEdyemVnb3J6IEJlcm5hY2tpDQo+IDxnamJAc2VtaWhhbGYuY29tPjsgTWFyayBIYXNlbWV5
ZXIgPG1hcmtoYXNAY2hyb21pdW0ub3JnPjsgQW5keQ0KPiBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hl
dmNoZW5rb0BsaW51eC5pbnRlbC5jb20+OyBNaWthIFdlc3RlcmJlcmcNCj4gPG1pa2Eud2VzdGVy
YmVyZ0BsaW51eC5pbnRlbC5jb20+OyBIZWxkLCBGZWxpeCA8RmVsaXguSGVsZEBhbWQuY29tPjsN
Cj4gbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDUvNl0gaTJjOiBkZXNpZ253YXJlOiBVc2UgUENJ
IFBTUCBkcml2ZXIgZm9yDQo+IGNvbW11bmljYXRpb24NCj4gDQo+IHB0LiwgMzEgbWFyIDIwMjMg
byAxMzo1MyBKYXJra28gTmlrdWxhIDxqYXJra28ubmlrdWxhQGxpbnV4LmludGVsLmNvbT4NCj4g
bmFwaXNhxYIoYSk6DQo+ID4NCj4gPiBPbiAzLzMwLzIzIDAxOjA3LCBNYXJpbyBMaW1vbmNpZWxs
byB3cm90ZToNCj4gPiA+IEN1cnJlbnRseSB0aGUgUFNQIHNlbWFwaG9yZSBjb21tdW5pY2F0aW9u
IGJhc2UgYWRkcmVzcyBpcyBkaXNjb3ZlcmVkDQo+ID4gPiBieSB1c2luZyBhbiBNU1IgdGhhdCBp
cyBub3QgYXJjaGl0ZWN0dXJhbGx5IGd1YXJhbnRlZWQgZm9yIGZ1dHVyZQ0KPiA+ID4gcGxhdGZv
cm1zLiAgQWxzbyB0aGUgbWFpbGJveCB0aGF0IGlzIHV0aWxpemVkIGZvciBjb21tdW5pY2F0aW9u
IHdpdGgNCj4gPiA+IHRoZSBQU1AgbWF5IGhhdmUgb3RoZXIgY29uc3VtZXJzIGluIHRoZSBrZXJu
ZWwsIHNvIGl0J3MgYmV0dGVyIHRvDQo+ID4gPiBtYWtlIGFsbCBjb21tdW5pY2F0aW9uIGdvIHRo
cm91Z2ggYSBzaW5nbGUgZHJpdmVyLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmlv
IExpbW9uY2llbGxvIDxtYXJpby5saW1vbmNpZWxsb0BhbWQuY29tPg0KPiA+ID4gLS0tDQo+ID4g
PiB2Ni0+djc6DQo+ID4gPiAgICogQWxzbyBpbXBseSBDUllQVE9fREVWX0NDUF9ERCB0byBmaXgg
YnVpbGQgZXJyb3JzDQo+ID4gPiAgICogRml4IGVycm9yIG1lc3NhZ2UgYWNxdWlyZS9yZWxlYXNl
IGludmVyc2lvbg0KPiA+ID4gdjUtPnY2Og0KPiA+ID4gICAqIERyb3Agbm93IHVubmVjZXNzYXJ5
IGFzbS9tc3IuaCBoZWFkZXINCj4gPiA+ICAgKiBGaXggSVNfUkVBQ0hBQkxFDQo+ID4gPiAgICog
RHJvcCB0YWdzDQo+ID4gPiAgICogRml4IHN0YXR1cyBjb2RlIGhhbmRsaW5nIGZvciBDZXphbm5l
DQo+ID4gPiB2NC0+djU6DQo+ID4gPiAgICogUGljayB1cCB0YWdzDQo+ID4gPiB2My0+djQ6DQo+
ID4gPiAgICogUGljayB1cCB0YWdzDQo+ID4gPiB2MS0+djI6DQo+ID4gPiAgICogRml4IEtjb25m
aWcgdG8gdXNlIGltcGx5DQo+ID4gPiAgICogVXNlIElTX1JFQUNIQUJMRQ0KPiA+ID4gLS0tDQo+
ID4gPiAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDMg
Ky0NCj4gPiA+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLWFtZHBzcC5jICB8
IDE3NyArKystLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ID4gICBkcml2ZXJzL2kyYy9idXNzZXMvaTJj
LWRlc2lnbndhcmUtY29yZS5oICAgIHwgICAxIC0NCj4gPiA+ICAgZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1kZXNpZ253YXJlLXBsYXRkcnYuYyB8ICAgMSAtDQo+ID4gPiAgIGluY2x1ZGUvbGludXgv
cHNwLXBsYXRmb3JtLWFjY2Vzcy5oICAgICAgICAgfCAgIDEgKw0KPiA+ID4gICA1IGZpbGVzIGNo
YW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDE1NCBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gT25l
IG5vdGUgYmVsb3cgaW4gY2FzZSB0aGVyZSBpcyBhIG5lZWQgdG8gaGF2ZSBhbm90aGVyIHZlcnNp
b24gb2YgaWYgeW91DQo+ID4gd2FudC4gTm90IGEgc2hvdyBzdG9wcGVyIGZvciB0aGlzLg0KPiA+
DQo+ID4gQWNrZWQtYnk6IEphcmtrbyBOaWt1bGEgPGphcmtrby5uaWt1bGFAbGludXguaW50ZWwu
Y29tPg0KPiA+DQo+ID4gPiBAQCAtMjE0LDcgKzk1LDcgQEAgc3RhdGljIGludCBwc3Bfc2VuZF9p
MmNfcmVxKGVudW0NCj4gcHNwX2kyY19yZXFfdHlwZSBpMmNfcmVxX3R5cGUpDQo+ID4gPiAgICAg
ICBpZiAocmV0KSB7DQo+ID4gPiAgICAgICAgICAgICAgIGRldl9lcnIocHNwX2kyY19kZXYsICJU
aW1lZCBvdXQgd2FpdGluZyBmb3IgUFNQIHRvICVzIEkyQw0KPiBidXNcbiIsDQo+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgKGkyY19yZXFfdHlwZSA9PSBQU1BfSTJDX1JFUV9BQ1FVSVJFKSA/
DQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgInJlbGVhc2UiIDogImFjcXVpcmUiKTsNCj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAiYWNxdWlyZSIgOiAicmVsZWFzZSIpOw0KPiA+ID4g
ICAgICAgICAgICAgICBnb3RvIGNsZWFudXA7DQo+ID4gPiAgICAgICB9DQo+ID4gPg0KPiA+IFRo
aXMgbG9va3MgbGlrZSB3b3J0aCBvZiBiZWluZyBhbiBvd24gcGF0Y2guIE1heWJlIGV2ZW4gZm9y
IHRoZQ0KPiA+IGxpbnV4LXN0YWJsZS4gSSB0aGluayBpdCdzIHZlcnkgdXNlZnVsIHRvIGhhdmUg
YW4gZXJyb3IgbWVzc2FnZSB0byBzaG93DQo+ID4gY29ycmVjdCBpbmZvcm1hdGlvbiB3aGF0IG9w
ZXJhdGlvbiBhY3R1YWxseSBmYWlsZWQuDQo+IA0KPiBNc2cgaGVyZSBpcyAiVEltZWQgb3V0IHdh
aXRpbmcgZm9yIF9QU1AgdG9fICVzIEkyQyBidXMiIC0gd2hlbiB4ODYNCj4gd2FudHMgdG8gQUNR
VUlSRSB0aGUgYnVzIChpMmNfcmVxX3R5cGUgPT0gUFNQX0kyQ19SRVFfQUNRVUlSRSkgdGhlbg0K
PiBQU1AgbmVlZHMgdG8gUkVMRUFTRSBpdCBhbmQgdmljZSB2ZXJzYS4gSWYgeW91IHRoaW5rIGxv
Z2ljIGhlcmUgaXMgbm90DQo+IHN0cmFpZ2h0Zm9yd2FyZCBhbmQgc2hvdWxkIGJlIGFkanVzdGVk
LCB0aGVuIHdlIG5lZWQgdG8gY2hhbmdlIHRoZQ0KPiB3aG9sZSBzZW50ZW5jZS4NCg0KVGhhbmtz
IGZvciBjbGFyaWZ5aW5nIGl0LiAgV2Ugc2hvdWxkIGp1c3QgZHJvcCB0aGlzIGh1bmsgdGhlbiwg
aXQgd2FzIGNvcnJlY3QNCnByZXZpb3VzbHkuDQoNCkknbGwgd2FpdCBmb3IgTWFyayBvciBHcnpl
Z29yeiB0ZXN0aW5nIHJlc3VsdHMgdG8gc3BpbiBhZ2FpbiB3aXRoIHRoZSB0YWdzDQpBbmQgZHJv
cHBpbmcgdGhpcyBodW5rLg0K
