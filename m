Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5DD34FDE1A
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Apr 2022 13:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238602AbiDLLku (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Apr 2022 07:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352372AbiDLLhr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Apr 2022 07:37:47 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C22FA
        for <linux-i2c@vger.kernel.org>; Tue, 12 Apr 2022 03:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYxT0b95ptHz+SZSc1mVXMODJICQd2ibZkeCi3mtuQuAjndcvqdsQGScYVV8ZNxajMbqwwGW1XfpZAZS58Sas2aiWrCa9xf7bMSddxACj+wg8OZFpv0gDorfq+6KL99VMWE/4vGawocde879uC2eZ1s6vKf3yi/ZDFdn3dT0TVrSIu3zzmCEMKFXbS0nmX2d+3MUX7EBRClEiemDf57SyX6WFjxotGXcSR/mHhBOLLT63d9FpQAXlZJwONJenH8pSXMiKj87jG3NXN+BK0yAQ3N7bMIHPUxiy2IdYG8edahlrXpMLAOJU58zKbR2pbEJ1B2BmmBTYotdFCSysjAocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acLxaK1G8E9f8LW1m8dQjAktksVZ4DWBhQV4trZjv9Y=;
 b=chUwEb+lt8f8E5mhTAG8FXM984TQ9TqMmDBekjGB3f5MMR1M0/Iusra+k/KGIK6t5/2/A4jJQe1M0ZYgFwsxPaHtSzgm58s+lK2+PJuB8MGEYKhRC4QGtr5KdTbPiC8HllhqUso+LTUt/0alD2RcbxSvHgr+4+FqWYIGkXvnzceul1qiZZulWS69MgXQ3hyyyiu5U+DejwLga6LjJJKXD4juYBcnnDBWE2OFwdkGinwcb8KzQ4IeNkm6LJoLKek7ifUsNp9q8xlKJy4XxCtmDeIpXlFCo89YvVbVygtGBLTwR6DndQExa669XW0QDL66m7jFCT23E6vCRfsAuV70AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acLxaK1G8E9f8LW1m8dQjAktksVZ4DWBhQV4trZjv9Y=;
 b=aFeqsqu+EiXJuXtKL24Fd43zUphydx8iakpHxSZlxp9ONiekBwn7qofDArYiqjnLnnoTnktLpL6aHOadEmo1u8MwOjGbj52YJDgOFuRA07ijtUZjAkJTqpYk4b1XrIHG6tBNulu1x68el/VrrFo4A5xtGFgpHBuvZ1kSMFrXsS4=
Received: from DM6PR02MB6635.namprd02.prod.outlook.com (2603:10b6:5:221::18)
 by BN6PR02MB2787.namprd02.prod.outlook.com (2603:10b6:404:fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 10:16:34 +0000
Received: from DM6PR02MB6635.namprd02.prod.outlook.com
 ([fe80::59e2:11b8:8cdc:6e1b]) by DM6PR02MB6635.namprd02.prod.outlook.com
 ([fe80::59e2:11b8:8cdc:6e1b%6]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 10:16:34 +0000
From:   Shubhrajyoti Datta <shubhraj@xilinx.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        "wsa@kernel.org" <wsa@kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        "chiragp@xilinx.com" <chiragp@xilinx.com>, git <git@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v2] i2c: cadence: Add standard bus recovery support
Thread-Topic: [PATCH v2] i2c: cadence: Add standard bus recovery support
Thread-Index: AQHX5P+4nJkK++Fah0WtMtDDVwc5cawaZ18AgD35WgCASX/A8IBLAfTQ
Date:   Tue, 12 Apr 2022 10:16:34 +0000
Message-ID: <DM6PR02MB66357FC379697BE4447664CFAAED9@DM6PR02MB6635.namprd02.prod.outlook.com>
References: <20211129090116.16628-1-shubhrajyoti.datta@xilinx.com>
         <YaTA1j/yrCe1gGOv@kunai>
 <3d326b8430017ef67f5e0f99bb708e00113e0bc7.camel@calian.com>
 <DM6PR02MB6635F09BB6D8A90F09DE8009AA3C9@DM6PR02MB6635.namprd02.prod.outlook.com>
In-Reply-To: <DM6PR02MB6635F09BB6D8A90F09DE8009AA3C9@DM6PR02MB6635.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c3338b0-2991-4202-2c66-08da1c6d85bc
x-ms-traffictypediagnostic: BN6PR02MB2787:EE_
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-microsoft-antispam-prvs: <BN6PR02MB27871A7BF9F196E8D6C8080FAAED9@BN6PR02MB2787.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0r959KW8ZhYM34hV2e8nEyZRbWdWzsRBHc0xEZBBlepyE9awH+9xh/J+LCoy+lRD/x3A2lljQIrDsPRZcNSIeAKpXT1b0VgJeWsLJpeff985BT84F6a3KSWPsvVrO9af3fPmBCkCPeHJQX0N18U0OCBPUs0iLyw91W3WTUUbfT2WMei7c8hY8WuoIBUNPh22AFYHvNdt4D/sQDscybTjoQ7rfdsZJWOY6tnOVG+g8yJbkWUiAYAtx9U0xy+PppfXKL/ZQK2v/HUVD7hhBZCTMCLP2XiwTHCqNoQ9X7oT/FW5woTDp6ab/wB1mFZZhUP1K0QtqsClam2rxNq18PacZpSgBiw+mer89Ik/QyLCSZazNjarzC8ngh6V0LCHJ8zHwW37tiMKDAsku1gxJrL6TZCVOw3UG4hDzpRh3+sYZ5hEKg50KK10bEmmnPKjus31yIAw+7/9dUCbNSsAmH65AfUhZpUGoLDV+226BL129FmRcMXQayecJLxTyt9Eeh69w5+/dSwTjYgLss8dFKUehzLssW3I7ZbnhAAkNYchFWvLqs5JCRjGyMWe/g9FrNEPLcPlHZZ6L5bJnkTnTwTlTXutFE1xvb73WfIFyLvNtv525xm6i8Y63tVw6ScZ70YpZmZsFTZ9Fj2uw9M4V8IZArKB842Adtry8f/CMY15JQ6uBa4LbBMhkZnyoscsmjebmEgs/QwVHFXU8f2QZCbxqGaD7acaxfm9V8b6Rt8HpNTbp4m2jBMfWR0Dy2NO1G921XZTpSYe/SRjNrw8uQtEqPCGPpU/gynJDfnNFrr6m3+uDxiUVTQOTOkQTtD21lniLap6BM80x4TsQmES8w38kg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB6635.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(86362001)(53546011)(2906002)(55016003)(4001150100001)(52536014)(15974865002)(6506007)(5660300002)(83380400001)(71200400001)(122000001)(8936002)(33656002)(7696005)(66556008)(66946007)(66446008)(64756008)(9686003)(508600001)(76116006)(186003)(26005)(38070700005)(66476007)(110136005)(316002)(54906003)(4326008)(8676002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cW5NVWNqODIzaTU2RGo1ZVlEbEZsYlV5UHhiV25ZWWRZSW1BMy96NmVmTDMy?=
 =?utf-8?B?ODRMdmxFSVhMSXd1L0JFWUZ4bVJrZXlqd3NkNVgwQ29pTEtkMEg1bjVkd2Nk?=
 =?utf-8?B?VWNaMUduMFJTeTFKYVhWQWVyWkxWV0JOZkRSRG9TaUV0b3V0aFkyYk04L3hO?=
 =?utf-8?B?ZnlBUStkVW1ybHQ1eGl1ejczWGxPTzRkSG5wSGszVkkrWE9PWUhYMlZtWFBa?=
 =?utf-8?B?VDRPWnh1L1VqUW1UZjZrOUgwTVo4S0ZkbjVRclJXbHNSSEFJcExXcXNaY1ha?=
 =?utf-8?B?Q3RyNlNsK2h3R1g4eCtPR1p6a09ycmhCQURXeHhRWkswOTRiMkVmSERLVlB0?=
 =?utf-8?B?Tncvc3VkQkprSmI4UmlYYVRncW5ydVlxRGd0aTZxVExYZFEwck1hN0dKK2RX?=
 =?utf-8?B?cnNMblJCdWU3dVZTRDdZby8yQ1ppY3djUGVyQXdQejhtalNVQVkxZkhmY1NF?=
 =?utf-8?B?Vytrd1M0T05qRlcweUxHdmVTd0p5TTNqRlpKTk5oeG1WU3MreEhQZW9yNVh6?=
 =?utf-8?B?T01YYldDZ1F6S21GcjlCSmNTSmFlbnY4SVdMS0FlMVorTExGWGc5VW84K3Bx?=
 =?utf-8?B?RFpialZDUG1KSEVNTm9IYXc2ZFdrV1pOUjNuV1M2eC9mUTE2R3FSWlhMR3Fv?=
 =?utf-8?B?Uks4b051YU43RG96dk8xMXdZREdVcHROV0xoOEphT25XNGMxUFUvZzZaQWtQ?=
 =?utf-8?B?WDBxaE1IeGxFVkxMWE1zWHlyT2p2VVF3aHR5UzhObkg2NUNHaGZ4TzF5enZ5?=
 =?utf-8?B?elFxSDBMdnZiOCtueFRCbjdWVmNQREZhOUFIOThyYlNGdDE1WWRZalQ1bXRn?=
 =?utf-8?B?N1dhS1MvQXYvRzV0OTNJc29qZy83YXF5bC9pNEhuN1dHMmQvNDVDVXJ0UFhU?=
 =?utf-8?B?ZWNxY0xJS3hhaUd2VXpiNUZrZ1A0ZFBDcnJsSk8zMWZnS1RPcy9rblRvUzlp?=
 =?utf-8?B?WC9QeXZDc0dCL1lTdXBnMTMxWk1CTHBTck5KRnRLYXFncHFaU2JndTlPZll0?=
 =?utf-8?B?bTIxeDE0SjZ5aXE3RkVhbjVXU2F1L2x0dDVibytWbG1YeThtelhyTG0rdlNm?=
 =?utf-8?B?UUthTWJhdnpRN2tRT21SQVZiN2d3d25mMVhNOHFTa01uSVhLVGwyL0tPekt0?=
 =?utf-8?B?ZVlGMmhrb2J0ZExBVEJnRWJDeXQ3ODJ6V21Id0Rad3F5a0d4cWUyWkFmWEpF?=
 =?utf-8?B?U0p2L09CVG95cVl2RmVTWksybUV2NlhEMjRIbVlTQitULzZEOGtPeURoY1lJ?=
 =?utf-8?B?bGU5b045djBRK254VHJlbXFSZ0REZkFjSTJlaW9nVllvTi9lbC9zQURaYTdD?=
 =?utf-8?B?czk3a0ZmdGwrOUJYWks1RzZ5K3hnQk5KaUFZUUc4QWpHbG5sRnc3cTJxeGZy?=
 =?utf-8?B?VHlEUnpjM1lWbThxQ1NZT0ovOVo5eVVmQUdwSmhRUTB1NE43bEpiQ01BNVVw?=
 =?utf-8?B?eTN4dDE0b2h6bXF6WUFFZTY5aUx0R1FsZXFmWVNzRFgxQXMyanJxSm1vK3RL?=
 =?utf-8?B?RmZaUFprUC96UEhKbkdHU0xMZUs2UU52a1RTdXRiZ3YxMnBGUDZpekNlNFMr?=
 =?utf-8?B?Z0haRFJaWVJyTHc1cnFBZmxNWm8yYlVlL2JqbjNHQlBuWDBOV2IvaDlDY05s?=
 =?utf-8?B?cFd3VU04b1ZBdG13QWFHcVdhbHo5WVV6R0ltclRYTS9FZEZNbDFyanlDa0RC?=
 =?utf-8?B?MmsvTmRRQzQwQVFvZ2MrTHJydFJ0enpYZmc0Sm41ejRvMW83STExaGZyK0ZR?=
 =?utf-8?B?UERxUW1WaGI3NW1KV0pYUzAxODBNMTYzSUYzb0V0Y0pzV3EwVFkxYkRvNEhH?=
 =?utf-8?B?UGNjZW9xOHlnYUwvR0dMUXhjcWJRL1lsWGwxWHZWTWd0N2h2b1J6Y2k1aHdW?=
 =?utf-8?B?dGoxeEx2ODF6UDA1dWxKdlplcXBMZmJ4bGlsV0pOKzZOQ0xOTzErRGtFa3ky?=
 =?utf-8?B?L0FsUDZvR2Z0Zlo5bXFGVVpQY011MHh3L3ptc3pVNUFGdWFyb2drc2hoUTNw?=
 =?utf-8?B?dVpmN2JiT0U1TmUxRG0wbjREcTdrck5xOU5hUkJPcGxoZGZURHYyM1g2Sndo?=
 =?utf-8?B?UzUwWHhxallJQ0JKRk1CTzVJRG9mVjMveWltQTRPeGJpOG9hM0hVNmg2Nmxr?=
 =?utf-8?B?NjRXM0N5OUVXUFBzM0hhUzltd1NIcXZ5WnpzbFB2cDk4VVlIN2NOMEtBZ2Ro?=
 =?utf-8?B?L0tYaEZ6aG1TVUVPaHlnQzlBeHZrR0Z3N0M0NVJLZ01PNndVeVRHQmh1R3VY?=
 =?utf-8?B?LzZZSElPa3dmSGI2S0pVWlJnMGkweGxkSHgydlM1NWFnNDJncE4ybS9sa1BX?=
 =?utf-8?B?VXlwOWdURndVR1ZaeStRU3NURk8yaXdGdk1TTTk0M1ZDMDEvbUREUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB6635.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3338b0-2991-4202-2c66-08da1c6d85bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 10:16:34.6592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ImDfrvBr4HcxGNRCPaalHJjuz0NsOvMuVCUg+lByDRD703nxGUigw+2qtn/EAYvBGGOBH/sne0TH5Xxe5XpMoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2787
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBSb2JlcnQg
SGFuY29jayA8cm9iZXJ0LmhhbmNvY2tAY2FsaWFuLmNvbT4NCj4gPiBTZW50OiBTYXR1cmRheSwg
SmFudWFyeSA4LCAyMDIyIDM6NTUgQU0NCj4gPiBUbzogU2h1YmhyYWp5b3RpIERhdHRhIDxzaHVi
aHJhakB4aWxpbnguY29tPjsgd3NhQGtlcm5lbC5vcmcNCj4gPiBDYzogTWljaGFsIFNpbWVrIDxt
aWNoYWxzQHhpbGlueC5jb20+OyBjaGlyYWdwQHhpbGlueC5jb207IGdpdA0KPiA+IDxnaXRAeGls
aW54LmNvbT47IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyXSBpMmM6IGNhZGVuY2U6IEFkZCBzdGFuZGFyZCBidXMgcmVjb3ZlcnkNCj4gPiBzdXBw
b3J0DQo+ID4NCj4gPiBPbiBNb24sIDIwMjEtMTEtMjkgYXQgMTM6MDAgKzAxMDAsIFdvbGZyYW0g
U2FuZyB3cm90ZToNCj4gPiA+IE9uIE1vbiwgTm92IDI5LCAyMDIxIGF0IDAyOjMxOjE2UE0gKzA1
MzAsIFNodWJocmFqeW90aSBEYXR0YSB3cm90ZToNCj4gPiA+ID4gRnJvbTogUm9iZXJ0IEhhbmNv
Y2sgPHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+DQo+ID4gPiA+DQo+ID4gPiA+IEhvb2sgdXAg
dGhlIHN0YW5kYXJkIEdQSU8vcGluY3RybC1iYXNlZCByZWNvdmVyeSBzdXBwb3J0IGZvciB0aGlz
DQo+ID4gPiA+IGRyaXZlci4NCj4gPiA+ID4NCj4gPiA+ID4gQmFzZWQgb24gYSBwYXRjaCAiaTJj
OiBjYWRlbmNlOiBSZWNvdmVyIGJ1cyBhZnRlciBjb250cm9sbGVyIHJlc2V0Ig0KPiA+ID4gPiBi
eSBDaGlyYWcgUGFyZWtoIGluIHRoZSBYaWxpbngga2VybmVsIEdpdCB0cmVlLCBidXQgc2ltcGxp
ZmllZCB0bw0KPiA+ID4gPiBtYWtlIHVzZSBvZiBtb3JlIGNvbW1vbiBjb2RlLg0KPiA+ID4NCj4g
PiA+IEd1eXMsIHNvcnJ5IGZvciB0aGUgbG9uZyBkZWxheS4NCj4gPiA+DQo+ID4gPiA+ICAJaWYg
KHRpbWVfbGVmdCA9PSAwKSB7DQo+ID4gPiA+ICsJCWkyY19yZWNvdmVyX2J1cyhhZGFwKTsNCj4g
PiA+DQo+ID4gPiBBY2NvcmRpbmcgdG8gSTJDIHNwZWNzLCByZWNvdmVyeSBzaG91bGQgYmUgZG9u
ZSBhdCB0aGUgYmVnaW5uaW5nIG9mDQo+ID4gPiBhIHRyYW5zZmVyIHdoZW4gU0RBIGlzIGRldGVj
dGVkIGxvdy4gSSB0aGluayB0aGlzIG1ha2VzIHNlbnNlDQo+ID4gPiBiZWNhdXNlIG90aGVyIGlz
c3VlcyBtYXkgaGF2ZSBzdGFsbGVkIHRoZSBidXMgYXMgd2VsbCAoZS5nLiBicm9rZW4NCj4gYm9v
dGxvYWRlcikuDQo+ID4gPiBNYWtlcyBzZW5zZT8NCj4gPg0KPiA+IEl0IGxvb2tzIGxpa2Ugb24g
dGhlIHN0YXJ0IG9mIGEgdHJhbnNmZXIgaW4gY2Ruc19pMmNfbWFzdGVyX3hmZXIsIGlmDQo+ID4g
dGhlIGNvbnRyb2xsZXIgcmVwb3J0cyAiYnVzIGFjdGl2ZSIgaXQganVzdCBiYWlscyBvdXQgd2l0
aCBFQUdBSU46DQo+ID4NCj4gPiAgICAgICAgIC8qIENoZWNrIGlmIHRoZSBidXMgaXMgZnJlZSAq
Lw0KPiA+ICAgICAgICAgaWYgKGNkbnNfaTJjX3JlYWRyZWcoQ0ROU19JMkNfU1JfT0ZGU0VUKSAm
IENETlNfSTJDX1NSX0JBKSB7DQo+ID4gICAgICAgICAgICAgICAgIHJldCA9IC1FQUdBSU47DQo+
ID4gICAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gSSdt
IG5vdCBzdXJlIGV4YWN0bHkgd2hhdCB0aGUgQkEgZmxhZyBpbmRpY2F0ZXMgKHRoZSBYaWxpbngN
Cj4gPiBkb2N1bWVudGF0aW9uIGp1c3Qgc2F5cyAib25nb2luZyB0cmFuc2ZlciBvbiB0aGUgSTJD
IGJ1cyIpLCBzbyB3ZSdkDQo+ID4gaGF2ZSB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIHRoZSBjYXNl
IG9mIGFub3RoZXIgbWFzdGVyIGRvaW5nIGENCj4gPiB0cmFuc2ZlciBhbmQgdGhlIGJ1cyBhY3R1
YWxseSBiZWluZyBodW5nIHVwLg0KPiA+IEknbSBub3Qgc3VyZSBpdCdzIGNsZWFyIGZyb20gdGhl
IHB1YmxpYyBkb2N1bWVudGF0aW9uIGhvdyB0byBkbyB0aGlzPw0KPiA+DQo+ID4gVGhhdCBtaWdo
dCBiZSBhbm90aGVyIGltcHJvdmVtZW50IHRoYXQgY291bGQgYmUgYWRkZWQgaW4gb25jZSB0aGUg
YnVzDQo+ID4gcmVjb3ZlcnkgZnVuY3Rpb25hbGl0eSBpcyBpbiBwbGFjZT8NCj4gDQo+IEkgdGhp
bmsgdGhpcyBjYW4gYmUgbW92ZWQgdG8gYSB3YWl0IHRpbGwgdGhlIGJ1cyBpcyBub3QgYWN0aXZl
IHdpdGggYSBzdWZmaWNpZW50DQo+IHRpbWVvdXQuDQo+IEFuZCBvbiB0aW1lb3V0ICB3ZSBhc3N1
bWUgdGhhdCB0aGUgYnVzIGlzIHN0dWNrLg0KPiANCj4gSWYgeW91IGFsbCBhZ3JlZSBJIHdpbGwg
c2VuZCBpbXBsZW1lbnQgYW5kIHNlbmQgdGhlIG5leHQgdmVyc2lvbi4NCg0KUGxlYXNlIGxldCBt
ZSBrbm93IGlmIHRoaXMgYXBwcm9hY2ggaXMgZmluZS4NCj4gDQo+ID4NCj4gPiAtLQ0KPiA+IFJv
YmVydCBIYW5jb2NrDQo+ID4gU2VuaW9yIEhhcmR3YXJlIERlc2lnbmVyLCBDYWxpYW4gQWR2YW5j
ZWQgVGVjaG5vbG9naWVzDQo+IHd3dy5jYWxpYW4uY29tDQo=
