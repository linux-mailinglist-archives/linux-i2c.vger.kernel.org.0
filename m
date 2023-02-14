Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D747C69706C
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Feb 2023 23:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjBNWFa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Feb 2023 17:05:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233212AbjBNWF3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Feb 2023 17:05:29 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2082.outbound.protection.outlook.com [40.107.102.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55ACFC0;
        Tue, 14 Feb 2023 14:05:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wq5P09XYIO8yy+1OTcYZ8XtiN/N7rrOOwhjId34YALSFy4uQ4fhqLiyPQi7MuSqHvm6Enyl0Jm9UgqeKs4GDz3ynJ32pIR5xUZrOIMyuPdPrpBdRoF3wpe4CSgawxFwchMnphPvcNUVozECFeF2JF3Jpq6pUzP5sn8uHTqPWIBbZKKfABkap2TQU9fLf+SeJU3vWfG4gZIqSe7GyHT/jZS3legnpizgQLv0SAXVhcTk6vsZjVS+k+kJoYhy7witemd4L6ON00iqxIEyKFP8IlhKj1z0zEy6EQpSfVA7rpBEVJlsSTPDRUcEFzKthA7ypvFwtOQUMRYyAvlcomHtCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yKdrGFwscJ43rpAm3UDu/7YtVNgBizxNF6XrzADn40=;
 b=JFIAU/w9GJcSzPJbGlbir2IyQrfBacsLQzl/OaFIgi1b8BfhiJHDE17FdY73qH7rQRcUdeoTBPuEfUhKauPruUQzptbS5FVLkWPWYv5/Fc3TJI6mlc1f0SwICUrjrFrXaNtJ8ep4khQIE3Wxlh1ePr6+w/jlxsvHja+nWNkdQ9tHIwAeAlWc+zpPr26bXu23tGkakiLEA3aHIuMx0455ZCYstxN5mbdglLEHxQAa3as26JOE5PTaUVn0Pe+LaMIPE2O8FzsUbkazAN/mhIjOcN4fokJ9pylRqixnGYxXUU+tKHte1rypmimZzuikmnLJeCHyF2lyHNatKUGp3LKdMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yKdrGFwscJ43rpAm3UDu/7YtVNgBizxNF6XrzADn40=;
 b=i+eFhZxNOO3yTisnrkO2eDXp6C4xWfalyIfQhvbS5aKK6RYT08cR58J6Zk1MCUZadY/VVDRfGxAgXNw4cdDNXFD62vH/ft9WmRA96UHCOQ5uXYtbGYcEUYNc0zKlf0Yr5OKpJ2OcnBcdtJ4LK18kV2EpKc0B/ZGh04Oe7p0Bmes=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB4583.namprd12.prod.outlook.com (2603:10b6:208:26e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 22:05:22 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c%5]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 22:05:22 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     =?utf-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
CC:     Grzegorz Bernacki <gjb@semihalf.com>,
        "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        "Allen, John" <John.Allen@amd.com>,
        "Singh, Brijesh" <Brijesh.Singh@amd.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Subject: RE: [PATCH 3/6] crypto: ccp: Move some PSP mailbox bit definitions
 into common header
Thread-Topic: [PATCH 3/6] crypto: ccp: Move some PSP mailbox bit definitions
 into common header
Thread-Index: AQHZPNdAeXBog5CsDEmvMEHcmLGurK7OLPQAgADZqtA=
Date:   Tue, 14 Feb 2023 22:05:22 +0000
Message-ID: <MN0PR12MB61017A594AF2CCD1D75EC798E2A29@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230209223811.4993-1-mario.limonciello@amd.com>
 <20230209223811.4993-4-mario.limonciello@amd.com>
 <CAOtMz3PuzpcrqQb-L9kzY1be4xwhp72fqNqSWnRvAE0Nd4d3qQ@mail.gmail.com>
In-Reply-To: <CAOtMz3PuzpcrqQb-L9kzY1be4xwhp72fqNqSWnRvAE0Nd4d3qQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-02-14T22:05:20Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=ad593d89-6a26-4cad-90e0-d364b1eb5b49;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-02-14T22:05:20Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 9303add2-0d12-4e3c-8415-7f4ef8f51d93
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|MN2PR12MB4583:EE_
x-ms-office365-filtering-correlation-id: 5ea419c0-c42b-45e9-1a8b-08db0ed79189
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G2McxW25s7RhV1OtIPZVlDRysjA69LHUL8Gw3cIEXVeOI63O7vcCP1z20EJXsrxU+nwjs6nbY864GOa+KhUDMBQUQKo55mv5p4cMLSGIHIPGSik+G49tKOemVfTgSDk/VbegQl/VAByuktQMCaGK8coYgquUYuG88dp+pSudJeqoGJ1y8wK/1sglB//LGUZVxgpta6O8OdziTak3r51gdRv4PlUUbJP/oOfdECwRJG3KAu16yNqMwuZIj/ITZXAChXxqVGmAFD/Mt6X6dcgshUJnNqfe0oKQfDdrT626bG8P5RBg9/vmAwnZ460kZlZwMHaN+xNQlSIqn6es9WtXyiuJ+7yJ291FKk7NDnw0PB0nH5qhAk2lIXLp0uCj/K1RjQGlTgHZ84rw5ixH8QZypX0OtGZYGOojt0V9xZFd0EThRUK75FpP7QTCliCYTf2/HS9OKBNkdu0cc5s2eceU70gqkNqy0D0rG5eMl/jYURu7HNkHRwLUUXoJL7Vt1lHxRubjlddmJOi2VuBBH8he1eVeeuXq+jQPIbD6cmbLcE9596nOzGigIWagcHxdxLolFSN1gdZ2JuhSqQpW0N8muN+ICQYeS+GhsFnKvaBV0LXOI/BGVeIiGt1sVwR83q/Y17y55LmX4PnAWXu4/cDipt4SUH+EY8S1lBGleIUpFF1rKbmlJ1QsKDbEcRXM0joalZFyngy/mzVK+vCk9tHmkA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199018)(2906002)(86362001)(71200400001)(15650500001)(122000001)(38100700002)(33656002)(38070700005)(9686003)(76116006)(7696005)(26005)(6506007)(53546011)(55016003)(186003)(66946007)(316002)(83380400001)(6636002)(54906003)(41300700001)(66446008)(110136005)(4326008)(8676002)(478600001)(7416002)(52536014)(64756008)(5660300002)(8936002)(66556008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlhWL3JkTkh3dFJxNE1KLyt2VzV5ZUNzaEdGYnlzUmlOYW5Kd0JJOGVWdmhp?=
 =?utf-8?B?NkF0emNKVEhHejF2R3hKMHBmUisxWU9wZE9kZ3lhQVk5eEc5dlN0RXh3cDVG?=
 =?utf-8?B?dFZGd3JEdjhDYmpSb3ROT1dYQWlWY3lkNnNsNkliSjdOQjZFMHBFSG9kdlBa?=
 =?utf-8?B?eTFpNmxtWFFsVXA5YnFITVEwQTBxWU9QbHdJKzc0dFU1R0JzeWt2QTlNMGFY?=
 =?utf-8?B?Qkc0cGZkQk5mU2JtUTBvWGZvUkViUE1lTkVkU29SOHIwNHZpS2pROStZTVA0?=
 =?utf-8?B?Z2tUVlNJNlE4Q2J2UUttSzBvNVd1THNDRWpmWjQ0ZEE1WlBidHJodXVUSjc1?=
 =?utf-8?B?NXBkVk1pUis5VEdnOGU1U1g5cUR6YWJzZnhXTTlEbCtZcUw1bEFqNHdjcUFO?=
 =?utf-8?B?ejNiemkwa2h2dHUwNlJqUlZnVDVUUHBTWFczN25pMk9JcXU2SCsxSGxvWG9T?=
 =?utf-8?B?V2NEOGEvUlFzSjQ3eUhoUk8zWlV6aW56RGQwU1B1QlRuV1dsd0xWRUZhcFRN?=
 =?utf-8?B?MnkrVjR3MmQ2Z1M2QmlvN3c1eUdCc20wNGl3QnZXMTRzQXBJSk85NmtmZGpp?=
 =?utf-8?B?MTIwYTBKejZ4dmFqOVU3djdRamNVZk1iejhFeWd5dTF2cllLMGNUQzFSVVlq?=
 =?utf-8?B?SFNUaFJsL0JsOUVSSGlHQjFwWFRpM25OTUg3MmpOLzl6d3k2RGFIYXRiMit5?=
 =?utf-8?B?SGJaQXU4U2FlZTVvcWwrTGdWVDJuK3NWSVRYT0Y0NWY1V01xQzArUlg4blF6?=
 =?utf-8?B?cWwvUGpOdHFwQmxMdXlTUUFBYXM1ZWZwWXJiVmRKNC9meUl0VXdlVTlWc2ho?=
 =?utf-8?B?TFpZdGJpQXVVYjdMT0laREdWb0dpbG1yQVU4S2N0WktkaUdUa3RKZWRJVXlh?=
 =?utf-8?B?bGJwSFNINDBnS0JYTThOR0tPczVBL0sxbEVuUWNNbDRCcDJsM2o2aURSbVJW?=
 =?utf-8?B?WUdQZXhTWkxvTkNhSUI0TGphSFB5b1VRcjRDOWVpb1pPU0F1bytraWQ4R1Qz?=
 =?utf-8?B?bWlQenhjREtSVEhRQkJwTFNKdDlVTXk0VkpyeW9OVUNVR1crTFRVeHF3azlY?=
 =?utf-8?B?N1IySjErazYyaHdmWnFLbmtvaVpjYTltcWMxZ3VYOGpjRG44NkN6L25SVUdB?=
 =?utf-8?B?RzVLVW5YUFRXRERrcERhWjl5Y2pRSEpjWENQYU9Bb1FSV3pncDBrUkc4MGlM?=
 =?utf-8?B?UFFKZWVIcWFsY25kWUt5U1ZBQlYyaFNkOHdMdFhoTmpTL1A2RnhGU0NiaHhD?=
 =?utf-8?B?ekxyOUdwQ05mR1B3ME9TOW1yWkN0NTMwN3oxZDdKU2pMRDEzTlg4TmdoaHZi?=
 =?utf-8?B?UGRJR2pEd0N6cFBqSStYMWNpVmFJMmMvTEZXazNIRXVEcTZaTmRsbXdYSFJz?=
 =?utf-8?B?WmFPSHY3UE8yd2FiUDNJRzJtcGFMN3BPd21SOW84clExY3VRQWl1WGQxVzZy?=
 =?utf-8?B?cGQ3ZzZjMk1NNVZaZklOKzRiZzR5RDRkd3lyMC82T2dNbzI2SW5mTG13eFR5?=
 =?utf-8?B?NTZURzl2NW1rQ0pldnFhV3dEL1hjSTNjNHBZVVRuWHpPdXBWV3hBcHMzYU5L?=
 =?utf-8?B?VXNJUDg5THdJNU5OWXpGT295ZSthM1JKNmk0dFJQSWtsckhEWmpOU01lLzc4?=
 =?utf-8?B?UzZ2eWhzOWlBVlBuRDZaajNoVHlxVEdzVmkvajJPOWcydFE2TFJQVnBZeHRo?=
 =?utf-8?B?WnV5UTYyUUpPeDlnOHhodmVIM2V2Q3BGcEsvdFJOSHpVUmV4WFltQXh4R3Vt?=
 =?utf-8?B?WFp4WHB5Qmt5eURXL1oxYlNlVzhiekZHUEVJNHozVDkvY3c5aVcrQkNWdnhS?=
 =?utf-8?B?ekdORm9waTIwR1lEOHJQM2dtcHhBRzNXK2tQZGhPTVNMTGc3RHJOTlRabjl3?=
 =?utf-8?B?UWlaaCt0YmpMVm9uNlRLbVlWK0hRZkpRWUNYUmI4blpUSkJUdS90R3AyUE02?=
 =?utf-8?B?blczR21OYldRcGZCQnJsZEJ1TVZ1dERkR2kwRmtJU0FLZE9PaE1Cb09qdDlG?=
 =?utf-8?B?SVRORzUzSjRhUnl0V09PMFBtTmpFb0pnMW5rdU5iMzBjaE9Sb0ExZnB5QnhF?=
 =?utf-8?B?dlJVM3V2bG4rWnVJcDJLbDNIVE5Tbk1tZjQwRENqYVQzWUZqSHdKT0xqcDNL?=
 =?utf-8?Q?i/WM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea419c0-c42b-45e9-1a8b-08db0ed79189
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 22:05:22.4871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ah/ZXevx1WZ6FqJtP+OnsVD2HOOoRK9bFp/8K2cVqQvREEvbJ7h+UGEC179AShmGigrWQk1abLtobJ9cN2XLiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4583
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFu
IETEhWJyb8WbIDxqc2RAc2VtaWhhbGYuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAx
NCwgMjAyMyAwMzowNA0KPiBUbzogTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpby5MaW1vbmNpZWxs
b0BhbWQuY29tPg0KPiBDYzogR3J6ZWdvcnogQmVybmFja2kgPGdqYkBzZW1paGFsZi5jb20+OyBU
aG9tYXMsIFJpam8tam9obiA8Umlqby0NCj4gam9obi5UaG9tYXNAYW1kLmNvbT47IExlbmRhY2t5
LCBUaG9tYXMNCj4gPFRob21hcy5MZW5kYWNreUBhbWQuY29tPjsgaGVyYmVydEBnb25kb3IuYXBh
bmEub3JnLmF1OyBBbGxlbiwgSm9obg0KPiA8Sm9obi5BbGxlbkBhbWQuY29tPjsgU2luZ2gsIEJy
aWplc2ggPEJyaWplc2guU2luZ2hAYW1kLmNvbT47IEphcmtrbw0KPiBOaWt1bGEgPGphcmtrby5u
aWt1bGFAbGludXguaW50ZWwuY29tPjsgQW5keSBTaGV2Y2hlbmtvDQo+IDxhbmRyaXkuc2hldmNo
ZW5rb0BsaW51eC5pbnRlbC5jb20+OyBNaWthIFdlc3RlcmJlcmcNCj4gPG1pa2Eud2VzdGVyYmVy
Z0BsaW51eC5pbnRlbC5jb20+OyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4g
Y3J5cHRvQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgRGF2
aWQgUy4gTWlsbGVyDQo+IDxkYXZlbUBkYXZlbWxvZnQubmV0Pg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDMvNl0gY3J5cHRvOiBjY3A6IE1vdmUgc29tZSBQU1AgbWFpbGJveCBiaXQgZGVmaW5pdGlv
bnMNCj4gaW50byBjb21tb24gaGVhZGVyDQo+IA0KPiAoLi4uKQ0KPiA+IEBAIC05OSw3ICs5Myw3
IEBAIHN0YXRpYyBpbnQgcHNwX2NoZWNrX21ib3hfcmVjb3Zlcnkoc3RydWN0IHBzcF9tYm94DQo+
IF9faW9tZW0gKm1ib3gpDQo+ID4NCj4gPiAgICAgICAgIHRtcCA9IHJlYWRsKCZtYm94LT5jbWRf
ZmllbGRzKTsNCj4gPg0KPiA+IC0gICAgICAgcmV0dXJuIEZJRUxEX0dFVChQU1BfTUJPWF9GSUVM
RFNfUkVDT1ZFUlksIHRtcCk7DQo+ID4gKyAgICAgICByZXR1cm4gRklFTERfR0VUKFBTUF9DTURS
RVNQX1JFQ09WRVJZLCB0bXApOw0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIGludCBwc3Bfd2Fp
dF9jbWQoc3RydWN0IHBzcF9tYm94IF9faW9tZW0gKm1ib3gpDQo+ID4gQEAgLTEwNyw3ICsxMDEs
NyBAQCBzdGF0aWMgaW50IHBzcF93YWl0X2NtZChzdHJ1Y3QgcHNwX21ib3ggX19pb21lbQ0KPiAq
bWJveCkNCj4gPiAgICAgICAgIHUzMiB0bXAsIGV4cGVjdGVkOw0KPiA+DQo+ID4gICAgICAgICAv
KiBFeHBlY3QgbWJveF9jbWQgdG8gYmUgY2xlYXJlZCBhbmQgcmVhZHkgYml0IHRvIGJlIHNldCBi
eSBQU1AgKi8NCj4gPiAtICAgICAgIGV4cGVjdGVkID0gRklFTERfUFJFUChQU1BfTUJPWF9GSUVM
RFNfUkVBRFksIDEpOw0KPiA+ICsgICAgICAgZXhwZWN0ZWQgPSBGSUVMRF9QUkVQKFBTUF9DTURS
RVNQX1JFU1AsIDEpOw0KPiANCj4gV2hhdCdzIHRoZSBtZWFuaW5nIG9mICJQU1BfQ01EUkVTUF9S
RVNQIj8gSSBzZWUgdGhhdCB0aGlzIG5ldyBtYWNybw0KPiBuYW1lIGlzIGN1cnJlbnRseSB1c2Vk
IGJ5IG90aGVyIGRyaXZlcnMsIGJ1dCBpbiBteSBvcGluaW9uICJSRUFEWSIgaXMNCj4gbW9yZSBk
ZXNjcmlwdGl2ZS4gKEl0IGlzIGFsc28gYWxpZ25lZCB0byB0aGUgY29tbWVudCBhYm92ZSB0aGlz
IGxpbmUuKQ0KDQpJdCBzaG91bGQgaW5kaWNhdGUgdGhhdCB0aGUgUFNQIGhhcyByZXNwb25kZWQu
ICBJIHRoaW5rIGJvdGggdGVybXMgd29yaw0KdG8gZGVzY3JpYmUgd2hhdCdzIGdvaW5nIG9uLg0K
DQpUb20gLSBXaGF0J3MgeW91ciBwcmVmZXJlbmNlPw0KSSdsbCBlaXRoZXIgYWRqdXN0IGFsbCB0
aGUgZHJpdmVycyB0byB1c2UgUkVBRFkgb3IgZml4IHRoZSBjb21tZW50IGZvciB2Mi4NCg==
