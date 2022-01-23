Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADDB49734A
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jan 2022 17:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238957AbiAWQ4Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Jan 2022 11:56:25 -0500
Received: from mail-bn8nam08on2068.outbound.protection.outlook.com ([40.107.100.68]:32864
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232705AbiAWQ4Y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 23 Jan 2022 11:56:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYb8ZS1f6hf3oBVd5/afAKBv3N6CeSqp9TVwu2k7AT1XAZkPZGj5Sl6p6RytQ59DK8GDlzy7ToRR8KWFkW6hsAwXFAyZjyGxn0hyulwjlTAAPXoRvo2fio3srvq6zgw3MZiESCyCLT2dHOEILmcCeBRVWNSkOSey/r7UYxKEqmO8Xw9OxO9yNenqd2oDkcb2mwis2sSNkcmlWghJQhbcipgwZ6jHSAuWxBrSPDGt8gZKk8ifygJSD/5WojVGA2WLzt2GGrS7/SyNWcPfiKEDaUu9ScUnOUL5AuDgJPpy1uaF/7n3K1MpHX06td75lHcbvKXDcz23zJ6TnQ7LPurUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHYoj+ReethEoTeLc40yNn7EtwGg//2xqEkhgKx+JLg=;
 b=NJSkeT+8qY6RN1cUst9RB0EHhLWf0vFjdePX9cNdL8WWxvmJW/bACeSs5VNRZsHe/USk3dTlPJ/Ciqxs6lzsQyhG2qyQ1CTY3fChqj+SElagDJP6dUNDrMAXO/sjGOe+yZZeQ3J/2xoOlfRNWRP9Q+ya8NlU7nUYxItqYCNhgMU0EeAwFdF2WH+lcpf5px+m9SZS2SRj5b5YQEOgzC4ViuKkYOGJXPVCyYCpUw5ed8Jmlt/OHQP+cmru8MiVwVG4wXo1ZBmpwbKcevCIOUBuNtMIvU9lyJTdI0AAz4M3jd7GQy/WP/8DB9G9VCjER5pVFd+hMVoeEivBu+zKeZ26Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHYoj+ReethEoTeLc40yNn7EtwGg//2xqEkhgKx+JLg=;
 b=ETEYQDr1NOEISlpQHqVnWfiHtYea+JSMq2qJOaJREVnLUP0Jw72La/u0LlT23inSxEZSWOX4EC12g1hXdf89vEp+GT1YX77TovXAvJ2Uz87VWtiNe6OQx6pRci7HRM/KbMn33E3Pvh2evI2PfnyRlEu6qllT8K374hHoHiKaiM1Oulm471l7T7AQ6o/4NzSvXsyRI99ZNjo+jp+4R8BA8p/+ggkvoouSn9TaP/LGEZ3JvFoBF47U47+fkFscG7tmxQvYuy9B3F1Pq239QIS6eJZbJGWJPOukL58oMxgCZerrBEz1FbvmsIdv6xgQZ43Z/t6vpoMH1J9uvePu/I6hPw==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by CH2PR12MB4822.namprd12.prod.outlook.com (2603:10b6:610:6::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Sun, 23 Jan
 2022 16:56:22 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851%11]) with mapi id 15.20.4909.017; Sun, 23 Jan
 2022 16:56:22 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Subject: RE: [PATCH v2 1/4] dt-bindings: Add headers for Tegra234 I2C
Thread-Topic: [PATCH v2 1/4] dt-bindings: Add headers for Tegra234 I2C
Thread-Index: AQHYD4KdQ6UBs7iRtkCNyJkjnwt5l6xvXrMAgAFe3cA=
Date:   Sun, 23 Jan 2022 16:56:22 +0000
Message-ID: <DM5PR12MB18503A9968008AE5E25D328BC05D9@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <1642850607-20664-1-git-send-email-akhilrajeev@nvidia.com>
 <1642850607-20664-2-git-send-email-akhilrajeev@nvidia.com>
 <103960bf-ed5c-4a0c-9142-65ffc2e4bca0@gmail.com>
In-Reply-To: <103960bf-ed5c-4a0c-9142-65ffc2e4bca0@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25645ec7-32be-4ca0-7f11-08d9de91491f
x-ms-traffictypediagnostic: CH2PR12MB4822:EE_
x-microsoft-antispam-prvs: <CH2PR12MB482260AD424C8C747DF611F1C05D9@CH2PR12MB4822.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UMLpBQtAmD3dcTJR15ave72WGLzNziVmB3G7n91ec5XrBp0d7RzvWEmA8K04fmo3KupIhDiyZninL938Ix4uTeJvVoJp/sP9co9UsfB/lJvEnE2kx+6Qv6eS8ggfhKPlgBSyd7wBTEN9uBugILo+55fOAixCY/PPiYFMN/CPZxO1s0WEdzW+UDcK2lcLuCjN5w4m9RB3vZK1grBFYj7Z+azvQSbJM0rbEOL4bSr2eEH4NcZLdtPU9AyfadwWAQsBbzR+H1goiTKPPmCjLomlcuNSDZj8zilGzCumeYGi2+2Cdm+FHbfDcGeBiSa+db4/n1QtRPVWtX8N6Gc6nomAzgdCtS0YMwNDnGTtrupdrSgG4FEi8TzcLG3WETyJ33sIB/sjt9Tsog9ZEXgGCCwY2rvqraRCPmtsKITbClJDaWIb/990LSp/opN3p+ak8tq81afEo1q/FESbKwf6keyrnW0vfBL6FIjF28w2S9D516SFecd6PITpKoCYryBKjc2CPQ+nrLJlaeI8M8nzkKABJrgmo+nON8fO7bGVB7iDeh/iHN6DwvUqDxN6cMLjEJbgkzPJfQM40OVgU/sC8/3fKSfRSLkz4ib2KEEWWu3RRyDg9StBhY5g9X9HI94S2vht3T14jIeaxyoKs4r1CJd50cmkxREozrNonkm7j30AIFjRlZr2yNLrf+XfBcn5eVzC5lHqKpoaUhTRuVPHmPZ79nUR3oKQak66N7S6IqMUqr0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(76116006)(8676002)(5660300002)(8936002)(52536014)(921005)(64756008)(2906002)(9686003)(66946007)(316002)(110136005)(66556008)(508600001)(33656002)(66476007)(55016003)(71200400001)(7696005)(6506007)(83380400001)(86362001)(186003)(122000001)(26005)(38100700002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K09ISXNDQmwyLzFDR21GaUE2R2xNZS93ZmF6ZHVaNkh4Z1hRTC8wNXJoQXFP?=
 =?utf-8?B?eFVaVXlSWW5aNHZ3dzNZWXZEQzM3d05jenpjTkMyTFNCZ2JiSUNLcDUxZXR3?=
 =?utf-8?B?SXFSanF6QzBWcCtmTnpGeTIxdnhEcmZaT3B3UTRJSWhqSHUzYWNJNEZ6RzNF?=
 =?utf-8?B?eUM4dlJFbldsVTJ5cEdsc2FZdXpCVy9YQ3dxY0J2akUyZWl5ZGMvUVNaeGN5?=
 =?utf-8?B?bXM4OGUyaVduNXd2S3NLV2RpditjeVlxRnMxbExZeFUwYWRvWkRVLzhlNWNL?=
 =?utf-8?B?RFN6S3k5YXZ2U0FESElBdFkwTndpWWxmZHdYQ0EvN3Z2Z1dlOENJV280MXVH?=
 =?utf-8?B?NHhFZXEyK0t3OWo4RW15WDMxYWlVcDlNekU4anZiRnJ0ZHVDTENkY1Q4cnRs?=
 =?utf-8?B?emd5Y1pzRmN6czlpZkxFNGFKWnQranEvY0pUT3BRZDNsZklRTkgrZ3hMd3JL?=
 =?utf-8?B?L21uWlgwUksrQ3REMStaTGhhdTB6ZjR3L3JEeFJVZzZHR1E4SnhWdU9od201?=
 =?utf-8?B?RTFBbmV0RDhaaFAxSElsc0pCOUxxb2tHSmJGSENvaUNQKzU0QmhOOG5ZOUF3?=
 =?utf-8?B?Y0o5NlhOOHNhTkRHa2drbUxqR3RSeXMvcWt2aXFCeEpJSHlWcnVISUwrOTNu?=
 =?utf-8?B?aERRaGhnSkRjSGhKRCtueGRWcmVFWU93bzkwSE5jaFFpd1k2clZGdmhhUXdQ?=
 =?utf-8?B?cVF2RkYrbWFJV2c5eDA1MmhMMnp4ZC9NaDBuTXY1QTBCNXhyd2xjQWdBbWZO?=
 =?utf-8?B?RzN3bFh6S2czYTBEQU1XMU9QU0k1bHVNbUpVSzNSRGU2dkVJSkJFYUhFOHFi?=
 =?utf-8?B?cXpwengrQkRTcmQya0U4dEpQay9jV2F4RFAxVE1JVDk5WEdidm9vdENOMVJP?=
 =?utf-8?B?dktwbWhyTnAreEN3ZkpqWEREemhpcjNBTGQ1RncvbnhQbTBZTWRHa0NjOUdY?=
 =?utf-8?B?dDMxUERYeWZQek5MNUgyRHZ0SHg1YStGM2g5eGZmNjNZRWxVNVluc29SMnNv?=
 =?utf-8?B?RGQxUGhzVWdZdGxFOVhkdEpyOUg3UkpybkxTSUhwcjhJUHVvVnZqcE5wSTN5?=
 =?utf-8?B?enhqMFdDRVJXYUlXZGdOM0gwN0ZqZFF3TnA4dDdkTHNuUzRJUndZemJxRTRz?=
 =?utf-8?B?cktkRWZwM25RQzBmeTZTUHVRZDh0US9ZcVlBRndJRTN6dFEvLy9ZeUcwTjlo?=
 =?utf-8?B?ZGhqRXFHUlA1cFBteVdRVlVQL05tVGQ2eEJjWm1UWEhwWmRSTjlweVJDek1j?=
 =?utf-8?B?ck9kZU1RbytrbndXRW1SUWp3RXlGaGJXbThBakQ2cHFzNm1WS1BZdXM5V3Uz?=
 =?utf-8?B?Wk1aMjdwK1FIMkpOakpOUmR1SUxaWTBvV3BmL2U3UGZ6UWdhbzFSWS9tSmdI?=
 =?utf-8?B?SHN4ay9IbHpzdEduMjRQNUhPNFhEMGRRQytPckVLS2JLTm9mYXhYRW96MkxP?=
 =?utf-8?B?dUtCYXdxMFRxbEFEb1BhL1YvdG8yZ2YwMWhBZDlVbW9yT3NUUGJFWVUySEdE?=
 =?utf-8?B?cHNrdFlLL3Zic1Ezd1A5Tm1pZW9HZUhXOFlWR2NXOThQck05WFJNTThxUmZR?=
 =?utf-8?B?T3VSY01xRnhXeEZ4NnhkOTBBV1BqalhaYXBLTXJrZFBhZWsvMkY3TkpPR1pK?=
 =?utf-8?B?cjdGU1djL251WWVyV3JPcUhZQ1cvVTVObVBnbEluaGEwMUVlZXNMb2NOR1Zh?=
 =?utf-8?B?VmZMcGtIZ3ZsbTdyV0VHMU9OcndyVmdNamhGV3NPSkFxa1Z4N3dscnhTVHdM?=
 =?utf-8?B?VDl5cWhCM0JOVlRhaFRtUzhVUXlFVFZWOTEzNGVXbWxyR1JuNXhlNTJvVTJo?=
 =?utf-8?B?Ris4M1ZhNWpCY04zbzVpaFZQd2svcW43dnBKdm5TNXFpWEhQdmEySmQ4WkZu?=
 =?utf-8?B?Y0Q5VkR5dk5HQ2pOS3JBZVFJM3hVZ0pyaFNROG5zTEkxRktmaTBlSE5rVzhq?=
 =?utf-8?B?bDh1WGxVNGd4aVNwK0FROHhsSnRyZTlXVlltcFNFaHE2bHhDVXd2aU53ekNQ?=
 =?utf-8?B?SVQ3bGVIZlQ0anJkTldBODdPbjZUYmFpeDRzSzRyRDlUWXdibzhrNTJpNTJG?=
 =?utf-8?B?ZUsvN3lTRGxLNFZlcG9jdTNJMHVoemRMTEc1WGxQTmhrbEFpTDNZcUVWbGtK?=
 =?utf-8?B?UXhBN2tBTWFoZDRxT2s4WUE2Y3ZjMFF3TFo1bWFJemQ4RUxKaDRUcTZpWjFP?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25645ec7-32be-4ca0-7f11-08d9de91491f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2022 16:56:22.6811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xN2VVQkIwlumi5PPMTOJsgvzWVRaYM38cSDYWsyF052RayDkO4T7DVjHJrGTiq4tTl9EyiCn2I4vB5WTrzmyBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4822
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiA+IEFkZCBkdC1iaW5kaW5ncyBoZWFkZXIgZmlsZXMgZm9yIEkyQyBjb250cm9sbGVycyBmb3Ig
VGVncmEyMzQNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFraGlsIFIgPGFraGlscmFqZWV2QG52
aWRpYS5jb20+DQo+ID4gLS0tDQo+ID4gIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svdGVncmEy
MzQtY2xvY2suaCB8IDE5ICsrKysrKysrKysrKysrKysrKysNCj4gPiBpbmNsdWRlL2R0LWJpbmRp
bmdzL3Jlc2V0L3RlZ3JhMjM0LXJlc2V0LmggfCAgOCArKysrKysrKw0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDI3IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0
LWJpbmRpbmdzL2Nsb2NrL3RlZ3JhMjM0LWNsb2NrLmgNCj4gPiBiL2luY2x1ZGUvZHQtYmluZGlu
Z3MvY2xvY2svdGVncmEyMzQtY2xvY2suaA0KPiA+IGluZGV4IDhkN2U2NmUuLjVkMDVjMTkgMTAw
NjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay90ZWdyYTIzNC1jbG9jay5o
DQo+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay90ZWdyYTIzNC1jbG9jay5oDQo+
ID4gQEAgLTMwLDUgKzMwLDI0IEBADQo+ID4gICNkZWZpbmUgVEVHUkEyMzRfQ0xLX1BMTEM0ICAg
ICAgICAgICAgICAgICAgIDIzN1UNCj4gPiAgLyoqIEBicmllZiAzMksgaW5wdXQgY2xvY2sgcHJv
dmlkZWQgYnkgUE1JQyAqLw0KPiA+ICAjZGVmaW5lIFRFR1JBMjM0X0NMS19DTEtfMzJLICAgICAg
ICAgICAgICAgICAyODlVDQo+ID4gKy8qKiBAYnJpZWYgb3V0cHV0IG9mIG11eCBjb250cm9sbGVk
IGJ5DQo+IENMS19SU1RfQ09OVFJPTExFUl9DTEtfU09VUkNFX0kyQzEgKi8NCj4gPiArI2RlZmlu
ZSBURUdSQTIzNF9DTEtfSTJDMSAgICAgICAgICAgICAgICAgICAgNDhVDQo+ID4gKy8qKiBAYnJp
ZWYgb3V0cHV0IG9mIG11eCBjb250cm9sbGVkIGJ5DQo+IENMS19SU1RfQ09OVFJPTExFUl9DTEtf
U09VUkNFX0kyQzIgKi8NCj4gPiArI2RlZmluZSBURUdSQTIzNF9DTEtfSTJDMiAgICAgICAgICAg
ICAgICAgICAgNDlVDQo+ID4gKy8qKiBAYnJpZWYgb3V0cHV0IG9mIG11eCBjb250cm9sbGVkIGJ5
DQo+IENMS19SU1RfQ09OVFJPTExFUl9DTEtfU09VUkNFX0kyQzMgKi8NCj4gPiArI2RlZmluZSBU
RUdSQTIzNF9DTEtfSTJDMyAgICAgICAgICAgICAgICAgICAgNTBVDQo+ID4gKy8qKiBvdXRwdXQg
b2YgbXV4IGNvbnRyb2xsZWQgYnkgQ0xLX1JTVF9DT05UUk9MTEVSX0NMS19TT1VSQ0VfSTJDNA0K
PiAqLw0KPiA+ICsjZGVmaW5lIFRFR1JBMjM0X0NMS19JMkM0ICAgICAgICAgICAgICAgICAgICA1
MVUNCj4gPiArLyoqIEBicmllZiBvdXRwdXQgb2YgbXV4IGNvbnRyb2xsZWQgYnkNCj4gQ0xLX1JT
VF9DT05UUk9MTEVSX0NMS19TT1VSQ0VfSTJDNiAqLw0KPiA+ICsjZGVmaW5lIFRFR1JBMjM0X0NM
S19JMkM2ICAgICAgICAgICAgICAgICAgICA1MlUNCj4gPiArLyoqIEBicmllZiBvdXRwdXQgb2Yg
bXV4IGNvbnRyb2xsZWQgYnkNCj4gQ0xLX1JTVF9DT05UUk9MTEVSX0NMS19TT1VSQ0VfSTJDNyAq
Lw0KPiA+ICsjZGVmaW5lIFRFR1JBMjM0X0NMS19JMkM3ICAgICAgICAgICAgICAgICAgICA1M1UN
Cj4gPiArLyoqIEBicmllZiBvdXRwdXQgb2YgbXV4IGNvbnRyb2xsZWQgYnkNCj4gQ0xLX1JTVF9D
T05UUk9MTEVSX0NMS19TT1VSQ0VfSTJDOCAqLw0KPiA+ICsjZGVmaW5lIFRFR1JBMjM0X0NMS19J
MkM4ICAgICAgICAgICAgICAgICAgICA1NFUNCj4gPiArLyoqIEBicmllZiBvdXRwdXQgb2YgbXV4
IGNvbnRyb2xsZWQgYnkNCj4gQ0xLX1JTVF9DT05UUk9MTEVSX0NMS19TT1VSQ0VfSTJDOSAqLw0K
PiA+ICsjZGVmaW5lIFRFR1JBMjM0X0NMS19JMkM5ICAgICAgICAgICAgICAgICAgICA1NVUNCj4g
PiArDQo+ID4gKy8qKiBAYnJpZWYgUExMUCBjbGsgb3V0cHV0ICovDQo+ID4gKyNkZWZpbmUgVEVH
UkEyMzRfQ0xLX1BMTFBfT1VUMCAgICAgICAgICAgICAgICAgICAgICAgMTAyVQ0KPiA+DQo+ID4g
ICNlbmRpZg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L3RlZ3Jh
MjM0LXJlc2V0LmgNCj4gPiBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvdGVncmEyMzQtcmVz
ZXQuaA0KPiA+IGluZGV4IDUwZTEzYmMuLmUwN2U4OTggMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVk
ZS9kdC1iaW5kaW5ncy9yZXNldC90ZWdyYTIzNC1yZXNldC5oDQo+ID4gKysrIGIvaW5jbHVkZS9k
dC1iaW5kaW5ncy9yZXNldC90ZWdyYTIzNC1yZXNldC5oDQo+ID4gQEAgLTEyLDYgKzEyLDE0IEBA
DQo+ID4gICAqLw0KPiA+ICAjZGVmaW5lIFRFR1JBMjM0X1JFU0VUX1NETU1DNCAgICAgICAgICAg
ICAgICAgICAgICAgIDg1VQ0KPiA+ICAjZGVmaW5lIFRFR1JBMjM0X1JFU0VUX1VBUlRBICAgICAg
ICAgICAgICAgICAxMDBVDQo+ID4gKyNkZWZpbmUgVEVHUkEyMzRfUkVTRVRfSTJDMSAgICAgICAg
ICAgICAgICAgIDI0VQ0KPiA+ICsjZGVmaW5lIFRFR1JBMjM0X1JFU0VUX0kyQzIgICAgICAgICAg
ICAgICAgICAyOVUNCj4gPiArI2RlZmluZSBURUdSQTIzNF9SRVNFVF9JMkMzICAgICAgICAgICAg
ICAgICAgMzBVDQo+ID4gKyNkZWZpbmUgVEVHUkEyMzRfUkVTRVRfSTJDNCAgICAgICAgICAgICAg
ICAgIDMxVQ0KPiA+ICsjZGVmaW5lIFRFR1JBMjM0X1JFU0VUX0kyQzYgICAgICAgICAgICAgICAg
ICAzMlUNCj4gPiArI2RlZmluZSBURUdSQTIzNF9SRVNFVF9JMkM3ICAgICAgICAgICAgICAgICAg
MzNVDQo+ID4gKyNkZWZpbmUgVEVHUkEyMzRfUkVTRVRfSTJDOCAgICAgICAgICAgICAgICAgIDM0
VQ0KPiA+ICsjZGVmaW5lIFRFR1JBMjM0X1JFU0VUX0kyQzkgICAgICAgICAgICAgICAgICAzNVUN
Cj4gDQo+IFdoeSBJRCBvcmRlciBpc24ndCBtYWludGFpbmVkPw0KRG8geW91IG1lYW4gUkVTRVRf
VUFSVDQsIFNETU1DNCBldGMgc2hvdWxkIGJlDQpiZWxvdyBSRVNFVF9JMkMqPw0KDQpSZWdhcmRz
LA0KQWtoaWwNCg0KLS0NCm52cHVibGljDQo=
