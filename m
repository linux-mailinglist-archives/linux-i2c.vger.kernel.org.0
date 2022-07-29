Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15D39584F56
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jul 2022 13:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbiG2LFR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jul 2022 07:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbiG2LFQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Jul 2022 07:05:16 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9976CBF5D
        for <linux-i2c@vger.kernel.org>; Fri, 29 Jul 2022 04:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coGI3V7UQeK6oPAWwKhSRt+G2xDisllDklp3smZFxIK8bZM/mLWmgFH+zSRUH039u9B5vX49ND+/slFEGGdMacdkOkXUFtgEbfJyCEym9DEk5plw+bgFct544ZcBjrHjwPxAfkQLV0rVOadlZqJm42syULB4wK8OoFniYPt2rEVS682fywHytWGpaQ4DnKTYEHNRg1Q/ltiQSp68Mg+WuaZo3tX8QCIVDuAQZncZiAXXfGjvoEII7qOFpoHSu50fVDbGqazT67aphw6CzM8MHvemE8eoRRK37KPDdgbsidMERCPjgX68gGTWyvw56+JOR1EVzr0BqFwtJxhOWSDnVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kdntbiTsPdfUumwYVd8wK35lAGcvc8RfrB9VgLO67A=;
 b=MYE5erxf8e5Lk4E/zvtdxGjwEwsWbTaonC+OFLyEtLtUpRGxCyLEKDwK4766YmuD/2uV8TlgCvVwzCNZ4OI2cJN/uJ827M5ttT3jyZHw2cAOCushsQWL8RNE6YdSeOf7NiqAyiCEWTjMiCMVGeA0BhN9xbVa9IFSRynWGQmPdLHEgCFgjNQbfhv9d1F108wFOxmltKGs2M7PsvuUSiVgdR3ds/IXZpI4CvRdk2aWkFb8HRp0+pmcDwt1CLvtuhl1stTBUTy85/etSXKmFv9EPfdNFWk3dvsRd9GEW9NhM+bOCAi9Lpgk5KE9lhyPHJ/yGjAEVTp3KzJ/RjLuhIVivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kdntbiTsPdfUumwYVd8wK35lAGcvc8RfrB9VgLO67A=;
 b=pjxuZxndRdONyAetbs62WodB93B+W+BLXd1mKEmncR7dvpx+oAbNq7EVyd6BZnvc2UNwdFKQKWjqnpLpQ9hoiDyb0Ha3TRi3YkK582YsKTVQ5QFSsgV05cXEc8NUlEav10skHW0w0390KKbFD1EUKrfCjVlYAh0flb5Si3uzjDM=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by BY5PR12MB4034.namprd12.prod.outlook.com (2603:10b6:a03:205::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Fri, 29 Jul
 2022 11:05:05 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::c070:5fa5:52c4:5d43]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::c070:5fa5:52c4:5d43%5]) with mapi id 15.20.5482.012; Fri, 29 Jul 2022
 11:05:05 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     "Simek, Michal" <michal.simek@amd.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "git-dev (AMD-Xilinx)" <git-dev@amd.com>,
        Chirag Parekh <chiragp@xilinx.com>,
        Robert Hancock <robert.hancock@calian.com>
Subject: RE: [PATCH v3] i2c: cadence: Add standard bus recovery support
Thread-Topic: [PATCH v3] i2c: cadence: Add standard bus recovery support
Thread-Index: AQHYokYqYMl/OQE01EWXEdM8HY5AXa2VLw+AgAAAMHA=
Date:   Fri, 29 Jul 2022 11:05:05 +0000
Message-ID: <BY5PR12MB49024F4C35287AF1D66EF4A181999@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20220728055150.18368-1-shubhrajyoti.datta@xilinx.com>
 <920041df-0ac2-7298-4568-c8bba4a2838c@amd.com>
In-Reply-To: <920041df-0ac2-7298-4568-c8bba4a2838c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-07-29T11:05:01Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=eb21e43e-1413-47c0-ba7a-3c423caf3e61;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ee362d1-b70c-477d-e077-08da7152311f
x-ms-traffictypediagnostic: BY5PR12MB4034:EE_
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1fwQBC6WcTZsT/72oRVsmwqA8GCfmteh2TC7mB6hEzjZRYxk2o4fXpwj1vslaOVpJn1q7LtocYA/OZcY3zTAcht4jzt6oHUJIj6VZtx2n4Tu44KqHOUPWS9DKF6/O7lamYUi7Wqze8wd5H7DWfzdw6/1M+FXgIL9s165+WeEl2BtbikkVXACdm+nGOZJBm3z2PLzcqq6YC0tDdLQ2SfvJp7TsIy8mmB+TBe33NB2XnK0oOaocNZwpQoc0l2YADIItULVZM9dZpmFBrlWTMMRwJO8bmB+1P8qqdu6eCPPG3LoiY79vE6Y8IaNppbP3JS2HOEli0ziDnWB8nTa/7ZDkiD0QaM73pt9iCz9hl0DeOqwBd05qZCPj32pEt+veO18T5YnNAmxOuQx2KcH80DOaD/UzwY8Xi09hwK8cNlFurJKIDvRot4DBjyC3I/8RkqV9Z8MFv0wAaaoZMXLAjnKUifQT6HyC6FThnLnlDNbZXzBMaZpY+qZD6ZzokLTvIBeU+KjmWBlSdKeUtK+4pA6+0YfA+fCVo1/QYmprIeErwrdmSHbs7B7oqT63/+NLb9v6MkJRvBET0Mou63AXp5mEM+TqdrlTcE/ToCKrG+ZFM90fUFdUZnFfBElGrQmqwJpoXkz/Qyik7hN2XU72sAuwntKFDsZErPHHcxc5Y3+SEQVcLorskjL51fif9p25Uy/hQo7vjLpyi/mSM2Qxrout18rRNXBTRaNamKBRocfxWff1CgxTsBPXpxnPzSgacvoIALoP4D1dih6mAvT2hiMHc2BOK6y/ouS4WjzIM/wahAPmc8cpgZXYiZXlMgRH3UX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(186003)(83380400001)(110136005)(54906003)(26005)(9686003)(53546011)(6506007)(7696005)(33656002)(2906002)(41300700001)(38070700005)(38100700002)(86362001)(55016003)(71200400001)(8936002)(64756008)(4326008)(66446008)(66476007)(8676002)(478600001)(122000001)(316002)(76116006)(5660300002)(52536014)(66556008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDlnTFlRVStVSmZ3cmVHUzVCTURFMTc4MElWY0xwZWZ0WmpiQTIvbktERk1E?=
 =?utf-8?B?YktWdTdkbFBNK2Q0bmNPSjFheUsrUCt4T2l5YmtmYndXczBMU2M3ZTg2YUM3?=
 =?utf-8?B?TjdqMmFzSXFxVVRBSmRkYmlpMWFnY0hEeEFJZU1Ud3lqeEpsL1ErUlVCZVEv?=
 =?utf-8?B?a2o1emRlR0l1aWw1SnJKcFNXVWs1emhRSytXcy9lcEhUaUZnUzBLVkc4NWl6?=
 =?utf-8?B?UjFWU1FEakhVRU84OXA3bVhCOXF5d08zeTAxWVJSQW93ZklPOUR3VXg1eERS?=
 =?utf-8?B?bDEvQ0lBOXZ2SGJuNU83eVpWS0xoRHZDeEM4bFZOc20rUXhDVktxQW40c1l1?=
 =?utf-8?B?c0pEMHZ2VDFWU1pmRzRkMnFuVlRDRWdkWktZamFodG5vRVZrcVNpbGI5TWgx?=
 =?utf-8?B?dGI3UzRUWDR0Q2U4QXg5cWVTVjlkQ1NWUEFQV2FYWStnQzdXeVV3WWhibW41?=
 =?utf-8?B?ellEUGxkaHhHaXBTcUlLT0wrdzNxbW5OZWVreVRrLzJvTUhjTWlJN3NaTkV3?=
 =?utf-8?B?SWYzTnpTRENsWVFOQkt4Q3k1c1hHVm1pM1ZmdzI4S3NTUU9VYWNtb2VqYjJM?=
 =?utf-8?B?SEF4UkZsNk9ZbHZWK29iaUpycG5vb0JrVmRLVTRmazA1SkR2ZitJU2FFd1lr?=
 =?utf-8?B?Z1VxTGl6bmhsMWU2VjJOTnJwMmc3Y3NQS21HV1dQSjUzOTVLOUEzN1djNXJP?=
 =?utf-8?B?STdMd0lPM3JiVjUvYXFtODJrWFZLQVJKbm81WlpuaGEyRDNwOEFxdmoySDQ1?=
 =?utf-8?B?WGo1OTFTSFlmaFlPQ085UHhQLzVsVXNTV3Z3VGd3SkU0bXVFaEVwSnBjU3F1?=
 =?utf-8?B?ditvMDFpa0JKOFNXWjVUUGQrcWdISkNlYXRQK1BqZVZSZGJUUlJtVG5BbzVr?=
 =?utf-8?B?ZXZhOEltbTlBSXNaUVJBeVNwV0lDSlFjejRlQm40UW5pNCtZZ0pERjl6SUdR?=
 =?utf-8?B?Q1prRGQ0SUJqdUwwQTI4MUFFS1ZnSXZ4dUpJYUpQUEllamY4MVlrN2lHNWdV?=
 =?utf-8?B?L0c1TDAvcS9EWnlTZ2diZkIrOWZtZmtxVEErNUZtK2h1amhBajZyMWdRZnV1?=
 =?utf-8?B?MFE3Q0tQRjZza2lxd0RnMXgydUEvQnZ3b25PQy9ZdjJMZi9OQ25MOHhIa0lO?=
 =?utf-8?B?V0RkWWNzRWdWUzBwZXdlT01Xb0lvcmY2dllBcEMweVhyTGVLOFhpcHZBSkpX?=
 =?utf-8?B?aXdsYmw1eU1hU2tIUmdvSWJkMmhoVDhKY1k0elJ4bHFwSGR3azRJVk1QdjFv?=
 =?utf-8?B?ZjY3RDZCOWpVVWZDTnlNSGM3akxDeC9UUlRsaFllUFlaVkxuYjRpWGZYNVdS?=
 =?utf-8?B?UjVlRERmQlhvMzVaYUpoWU8xeG5YZ3VQNHNXQ295SzhMd0owQ1hjQllYczZK?=
 =?utf-8?B?bE9CbmdhMC9NUzcyOUdyRlJKa3pwK2swS1NFMkRYTWNQMWFLaGZwSDJnN1JY?=
 =?utf-8?B?SUZpOGxjR0lBZS80eVlSeitnUC91RmxHalNwTnhwbEVyQWwxTmN1V2JPY01B?=
 =?utf-8?B?NmxrSTJZQTRkOTFtcUdjbjlCS2FjRFRnRi9DUithWUhVNm1iMHJEa0M3QU44?=
 =?utf-8?B?aTBnbGpZK2hrYzhTeGxBUzB5cXFoYyt2WUo0WjlkRzVjUnZQZEJLT0oybjNW?=
 =?utf-8?B?eFFlYVpHSXJsVnFtaUxpUnNMb1l1NDJ2czkwUVdnUXh2cWVsTFFWRFVjbkJQ?=
 =?utf-8?B?V2ZNc20wQ3JseFoveUFJYzYyN3h5WGRjNzlnNnBzTEM4ZTNYNlRVVWJjZFpV?=
 =?utf-8?B?emthbGpQQ1JUaUJzdHFIelo5RGlReWV3b0tBdTlLaWxaNWZEaXB2QStTamtC?=
 =?utf-8?B?UU1TT0ZBSWhuMjA2eEJGY2FaNnVDNkNwaU00dkdyTkppdU1HUGdHeFdHVFVQ?=
 =?utf-8?B?YTd1UTVGSUlycXdzS29rb1hod0NmRTJuMVpWeG8vWk54MGN5K0Nscjhwdzd2?=
 =?utf-8?B?Z1FCYmNDK091VmxOZCtjdFArOU9BcFNrRmMwaHlrQWhFNHFoMHhMNy9oc1ps?=
 =?utf-8?B?QnF0SHFZNUNQWHlvd0t5cHg2SnFwOFg4Q1ZudmRvTk5ZQUw0aE1VMnBnT0U2?=
 =?utf-8?B?ZlZrRXVHZmN6RDFDZElnMGMxbGwxOVd0SHhwVGh3THh1a012ZXEzWkYvdTYy?=
 =?utf-8?Q?dkyY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee362d1-b70c-477d-e077-08da7152311f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2022 11:05:05.1151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xzrtqkxSq/T4d6l7DsBEiuCqftcvJTrUfUjd92sFgZWQXeczfo4lRrNP+mKZdUlIfKoLomE7AarGQIs6mFySHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4034
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IFNpbWVrLCBNaWNoYWwgPG1pY2hhbC5zaW1la0BhbWQuY29t
Pg0KPiBTZW50OiBGcmlkYXksIEp1bHkgMjksIDIwMjIgNDoyNiBQTQ0KPiBUbzogU2h1YmhyYWp5
b3RpIERhdHRhIDxzaHViaHJhanlvdGkuZGF0dGFAeGlsaW54LmNvbT47IGxpbnV4LQ0KPiBpMmNA
dmdlci5rZXJuZWwub3JnDQo+IENjOiBtaWNoYWwuc2ltZWtAeGlsaW54LmNvbTsgZ2l0LWRldiAo
QU1ELVhpbGlueCkgPGdpdC1kZXZAYW1kLmNvbT47DQo+IENoaXJhZyBQYXJla2ggPGNoaXJhZ3BA
eGlsaW54LmNvbT47IFJvYmVydCBIYW5jb2NrDQo+IDxyb2JlcnQuaGFuY29ja0BjYWxpYW4uY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBpMmM6IGNhZGVuY2U6IEFkZCBzdGFuZGFyZCBi
dXMgcmVjb3Zlcnkgc3VwcG9ydA0KPiANCj4gDQo+IA0KPiBPbiA3LzI4LzIyIDA3OjUxLCBTaHVi
aHJhanlvdGkgRGF0dGEgd3JvdGU6DQo+ID4gSG9vayB1cCB0aGUgc3RhbmRhcmQgR1BJTy9waW5j
dHJsLWJhc2VkIHJlY292ZXJ5IHN1cHBvcnQuDQo+ID4gV2UgYXJlIGRvaW5nIHRoZSByZWNvdmVy
eSBhdCB0aGUgYmVnaW5uaW5nIG9uIGEgdGltZW91dC4NCj4gPg0KPiA+IE11bHRpcGxlIHBlb3Bs
ZSBoYXZlIGNvbnRyaWJ1dGVkIHRvIHRoZSBzZXJpZXMuDQo+ID4gT3JpZ2luYWwgcGF0Y2ggZnJv
bSBDaXJhZyBhbmQgYW5vdGhlciBvbmUgZnJvbSBSb2JlcnQuDQo+ID4NCj4gPiBDYzogQ2hpcmFn
IFBhcmVraCA8Y2hpcmFncEB4aWxpbnguY29tPg0KPiA+IENjOiBSb2JlcnQgSGFuY29jayA8cm9i
ZXJ0LmhhbmNvY2tAY2FsaWFuLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaHViaHJhanlvdGkg
RGF0dGEgPHNodWJocmFqeW90aS5kYXR0YUB4aWxpbnguY29tPg0KPiA+IC0tLQ0KPiA+ICAgdjI6
DQo+ID4gVXBkYXRlZCB0aGUgYnVzYnVzeSBjaGVjayBvbiBhIHRpbWVvdXQNCj4gPiB2MzoNCj4g
PiBBZGRlZCBwaW5jdHJsX2dldA0KPiA+DQo+ID4gRGlkIHVuaXQgdGVzdGluZyBhbmQgcHJvYmVk
IHRoZSBzY2wgdG8gc2VlIHRoZSBjbG9jayBwdWxzZXMuDQo+IA0KPiBDYW4geW91IHBsZWFzZSBk
ZXNjcmliZSB0ZXN0aW5nIHByb2NlZHVyZT8gV2hhdCBib2FyZCBkaWQgeW91IHVzZT8NCj4gV2hh
dCB3YXMgdGhlIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24/DQoNCg0KVGVzdGVkIG9uIHpjdTEwMiAu
ICBhbmQgdGhlbiBJIGNhbGxlZCB0aGUgcmVjb3ZlcnkgaW4gc2VuZCAgc2V0dXAgLiANCkFsc28g
SSBoYWQgYWRkZWQgdGhlIHByaW50cyBpbiB0aGUgDQpUbyBjb25maXJtIHRoYXQgdGhlIGNvcmUg
d2FzIGNhbGxpbmcgdGhlIHp5bnFtcCBwaW5jdHJsIHRvIHNldCBwaW4gbXV4LiANCg0KVGhlIHNj
bCAgbGluZSB3YXMgUHJvYmVkLiBJIGNvdWxkIHNlZSB0aGUgY2xvY2sgY3ljbGVzIGluIHRoZSBz
Y2wgbGluZS4NCg0KWyAgIDg0LjI4NjM0MF0genlucW1wLXBpbmN0cmwgZmlybXdhcmU6enlucW1w
LWZpcm13YXJlOnBpbmN0cmw6IHNldCBtdXggIGZvciBwaW4gMTQNClsgICA4NC4yOTM3NzldIHp5
bnFtcC1waW5jdHJsIGZpcm13YXJlOnp5bnFtcC1maXJtd2FyZTpwaW5jdHJsOiBzZXQgbXV4ICBm
b3IgcGluIDE1DQpbICAgODQuMzAxMjY2XSBpMmMtY29yZTogc2V0X3NjbF9ncGlvX3ZhbHVlIDE2
NCAxDQpbICAgODQuMzA1ODA3XSBpMmMgaTJjLTA6IFNDTCBpcyBzZXRfc2NsIDEgaSBpYSAxDQpb
ICAgODQuMzEwMzMxXSBpMmMtY29yZTogZ2V0X3NjbF9ncGlvX3ZhbHVlIDE1OA0KWyAgIDg0LjMx
NDY4MV0gaTJjLWNvcmU6IHNldF9zY2xfZ3Bpb192YWx1ZSAxNjQgMA0KWyAgIDg0LjMyMjUxOV0g
aTJjIGkyYy0wOiBTQ0wgaXMgc2V0X3NjbCAwDQpbICAgODQuMzI2NDM5XSBpMmMgaTJjLTA6IFND
TCBpcyBzZXRfc2NsIDAgaSBpYSAyDQpbICAgODQuMzMwOTY1XSBpMmMtY29yZTogc2V0X3NjbF9n
cGlvX3ZhbHVlIDE2NCAxDQpbICAgODQuMzM1NDk2XSBpMmMgaTJjLTA6IFNDTCBpcyBzZXRfc2Ns
IDENClsgICA4NC4zMzk0MThdIGkyYyBpMmMtMDogU0NMIGlzIHNldF9zY2wgMSBpIGlhIDMNClsg
ICA4NC4zNDM5NDddIGkyYy1jb3JlOiBnZXRfc2NsX2dwaW9fdmFsdWUgMTU4DQpbICAgODQuMzQ4
MzAyXSBpMmMtY29yZTogc2V0X3NjbF9ncGlvX3ZhbHVlIDE2NCAwDQpbICAgODQuMzU2MTM1XSBp
MmMgaTJjLTA6IFNDTCBpcyBzZXRfc2NsIDANClsgICA4NC4zNjAwNTldIGkyYyBpMmMtMDogU0NM
IGlzIHNldF9zY2wgMCBpIGlhIDQNClsgICA4NC4zNjQ1ODZdIGkyYy1jb3JlOiBzZXRfc2NsX2dw
aW9fdmFsdWUgMTY0IDENClsgICA4NC4zNjkxMTddIGkyYyBpMmMtMDogU0NMIGlzIHNldF9zY2wg
MQ0KWyAgIDg0LjM3MzAzN10gaTJjIGkyYy0wOiBTQ0wgaXMgc2V0X3NjbCAxIGkgaWEgNQ0KWyAg
IDg0LjM3NzU2NF0gaTJjLWNvcmU6IGdldF9zY2xfZ3Bpb192YWx1ZSAxNTgNClsgICA4NC4zODE5
MTRdIGkyYy1jb3JlOiBzZXRfc2NsX2dwaW9fdmFsdWUgMTY0IDANCg0KDQo+IA0KPiBUaGFua3Ms
DQo+IE1pY2hhbA0K
