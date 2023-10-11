Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67307C58F4
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 18:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232880AbjJKQQc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 12:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbjJKQQ3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 12:16:29 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49DBB91;
        Wed, 11 Oct 2023 09:16:28 -0700 (PDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BGCQGO030329;
        Wed, 11 Oct 2023 16:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : date :
 message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=JL4n2UaQD8xkiK5lsq6+c8mpk+UIB7Y44NHI5RMgRls=;
 b=Khzgp4AfsY9lQdq0LBXbxKpKCtqV2kAroSGvQLXJLwxQIoHTHc5iHzjd3ncq+3ox0oVU
 wdMA9D/8kTd3XTjo4PW5mPYamWNsPbaXneOhOi6SItozHYgQYT+T3f5MDUG6VQ7mEi1S
 7J6dMN2U4rfqR3qQLtC38Bf+Oxp5voPdXxXN31DFSHw1Jz4XsJwliHW1D6wouUL4e/O3
 /anjh90lEXuKtPiwoZzoF75VLUD27l8QKS3hzQI6fyDPw1huKJksBAtqvywcRIPypjiM
 akF2rUuH+a0MjoCbzSODI6lQ/Qj12Y4nr6uZbL4MMGXY0imHb3YqT0tci7ltHmi1XWn9 nA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tny16r6j6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Oct 2023 16:15:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiAYAuQLhD8tkgStWdmHFM0lq4Lpc/1sg6e+lc3gsu87/Yd5ngO/PtZZzAzbrOWPcBXUJv+gQ81x8hnk1cZiVi7nRnvkDnC/970l6j4JGRKMrwiLVXKDCMAxsHuPPhpVa6eF1fLDvNVf3KOYlM8Qe8R0wdD2VoP4a7yMyF3yjvbWauxvW6mIKb5Yl+G1YJDOVtR3ir94LZBqP+SRCVhUJz1mUK7cehxl7tEPc70wbVY1hWz6BSCluKpQd4kzd/JakdWTjQsnRPREujJLWS2FWKdrPtn2rTfMA2cqp/2t4i/i/+DYz7TyBCDG9nFprs9LLntEtEQc9hm/iRDNZHSajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69rEBcQz6r2T9UMdMqmUWCvRMx0pltj+Y7lG8XVJxtE=;
 b=GRcgV4Co25Q8YePzpX+bcTyANvM1VApzSqgLuGVVQ0mcaY+1df3zDIOAWzuEh1EHiUWTF6yGigSqDLB6VW8fFS6sn3pBmIfvtHduTuAGRL2vGoINBSzshvlbz3VOt67fr9MNtrWYF6f9Ljms1H22MYhrhFelaw4+7X8B87beyuTV7neCsTmPfmZ4m/kb5psFp4fwMvB5TQgbvkvlBYh9VNsVcF1GYn37/sze3o9NmJYSyD+1p+d1YZP3DiZ9TLFPWI/VUYPdIN9MBlVx03yOe+M3m7jU7VBqpeT7kmgQGNgmfuFDhirrm2lsY+cZ5NMF6p63VHjwSCssSZSMgiu3dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=us.ibm.com; dmarc=pass action=none header.from=us.ibm.com;
 dkim=pass header.d=us.ibm.com; arc=none
Received: from MW3PR15MB3898.namprd15.prod.outlook.com (2603:10b6:303:43::24)
 by IA1PR15MB5920.namprd15.prod.outlook.com (2603:10b6:208:3fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 16:14:55 +0000
Received: from MW3PR15MB3898.namprd15.prod.outlook.com
 ([fe80::75ba:9dad:e198:9e77]) by MW3PR15MB3898.namprd15.prod.outlook.com
 ([fe80::75ba:9dad:e198:9e77%5]) with mapi id 15.20.6863.043; Wed, 11 Oct 2023
 16:14:55 +0000
From:   Lakshmi Yadlapati <lakshmiy@us.ibm.com>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        Jean Delvare <jdelvare@suse.com>,
        Joel Stanley <joel@jms.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Ninad Palsule <ninad@linux.ibm.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Thread-Topic: [EXTERNAL] Re: [PATCH v1 0/2] [PATCH] hwmon: (pmbus/max31785)
 Add minimum delay between bus accesses
Thread-Index: AQHZ+vaWnZ96qVr1n06n6O+OvSfbNLBCw0sAgABGxoCAAFdpAIAAQ2+AgABSWACAAHsjAA==
Date:   Wed, 11 Oct 2023 16:14:55 +0000
Message-ID: <5CB64FF4-D9DE-4866-93DF-D99D62FA29E7@us.ibm.com>
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
 <ZSUaDIfWmEn5edrE@shikoro>
 <1284830f-025e-4e25-8ed0-50a6cc00d223@roeck-us.net>
 <ZSWevlHzu6kVcGWA@shikoro>
 <125cac30-b83d-4530-885b-5008fc3045af@roeck-us.net>
 <0db41eaa-34dc-40c9-a28f-cfde39c6b48a@app.fastmail.com>
In-Reply-To: <0db41eaa-34dc-40c9-a28f-cfde39c6b48a@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR15MB3898:EE_|IA1PR15MB5920:EE_
x-ms-office365-filtering-correlation-id: 43becb66-24bf-42c2-6838-08dbca75354f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XUhlzsEWBqSlQWf+G26m/HCXCbrKHTKue4Zncf4X8w0NWC+MIgQiagOrgwg0uvYTF0U1rJywNwlNhbB6Yfl+pwhHiPZQmCu8d3mz/b5BUwnFdV2ZNtZFdwcAX54ansLcylH29KUBG2V460u3ElSyI7JCywauwdm1V3pi87SoutY3Wc5nTHP+DceRezdy48qkhs0hF7/jePoMuw8A70V5g6A6Jj0FlvhxaHLb+X5XI9sJ4c0QFhsl7awGw8rFY/5FrQHEY2FAKgY58cHGXVa/KKH35sQsY8M/Ks8HqvwN/eeXV5EYugjjMAgh8fxtpWsXa8BsRTtuT81IagOFztNHnKOMpy3yLsm7HN0QtLlPJAjexg3fc/wbLLdjl26LagHo1mxl7eCB5tYmWVuz1deNyNjSn9JgyL+ZvIO18+CDUpIiVFhA5/uAS+xf/Ig+6Mnl/TxHDRADXObx9aqcl64np2B0Lu9YORYo22sehN5Xsvf2+Vmuc8yJzx32Ls1vASrqpjNKXeh5QygNe46eeshz9/K9UNSN4LbEor9qSY+0S4GIBccBPXr3uSUcI0VpTi7SCXrOKVVJntU6z/uEQVBOzEs2o42MG4m9nkuV9tOtfPLT+fAimk07w5SK4mQSxVkn+mpU1T/kpADwKk3J47v3nt7jiHueUiZvflD9mzvsb4pYbqDTestRBedBMPF9SAKT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR15MB3898.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(39860400002)(136003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(71200400001)(966005)(6506007)(6512007)(38100700002)(33656002)(86362001)(38070700005)(921005)(122000001)(83380400001)(2906002)(7416002)(6486002)(478600001)(2616005)(8676002)(8936002)(41300700001)(316002)(66946007)(66556008)(76116006)(91956017)(110136005)(5660300002)(66446008)(66476007)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHk2RHN0clJMVDBueVRnZG9oZTN0ZkZPK3M1VUgrSE04SE9WcHYrUHFER1dF?=
 =?utf-8?B?anBjTFFLRXE4eEZIL1R3SGtDQ1MySHRkZm8yNUwzQnVrZmhQdVZnNldmMEJZ?=
 =?utf-8?B?c2Q2MDhpQ3RaOWF0TTJmbEUxQW9TbmY1c1N2U0ZFcm9xd3h4ZW82K0VxejZT?=
 =?utf-8?B?OFBBdk9Tai9YYUgyRkZsclNZR0QxSlEzUnNxS0dLRTZGUTRjZnBqYUV0RHRL?=
 =?utf-8?B?aWw0Sk55NVhRR2pmYlZ2T250aW9Ed0Q1MFIxYXFyNjRieDF1TjdOa1l2MWto?=
 =?utf-8?B?SVMzOTlDdWZDKzF2dGdJM0NQV3JSRVNsc0FjMjFCQ1BVd04rYXlrMDBkQ3Bi?=
 =?utf-8?B?L2lmWHN1a2dWbVN4ZStpdEhsVUM3aXpGTFpGQTlsWWNVYTM3QXA1dXByWlRR?=
 =?utf-8?B?WnFjWjZiYVd0L2RHbXJ6UGc2eU1ReE5EM2NBTmsvMXBsNFZxcC9hMWUxUytX?=
 =?utf-8?B?dGI4c2VsMHBtYzEzYzkwYnMzOTFUNzQ2ZlBaVlh5OE9aTTVPZUE5cmt4ajIz?=
 =?utf-8?B?MTczVG94R3ZSTGlBNy9CNjlqZENKQnM2Znd1b2wyeTFrMWN0SFA4QzkycTVE?=
 =?utf-8?B?U3FWd0FDUVNvbEx2TWI4U01TaXZaSzdFdjgvYkdVOW9WR2VxWURyMG9sbXJH?=
 =?utf-8?B?Y1dibHFnY2ExT25QZk9CdEgxMmcrT1Z2S1pkU2c4ajJyazZXcStPbDFUbXU0?=
 =?utf-8?B?NldFOHJ4d1htRmtacDNPUW5vaGpHWEZ4M2tZZGpUQzBJVDFGZkJiM0N5Y1hN?=
 =?utf-8?B?RklmUjM1b2JxSm44RnprQkJ4TzgxNHd2dnBmb21JMHUyaVZPWVRXeW1LTXJ6?=
 =?utf-8?B?UVlPV3l1K2YxSll6WSsrN0IxcVQ4b2pEb2ZQdDlURXVmckF6VkpkUFBmOGRt?=
 =?utf-8?B?MU5iMy9pYjErdit3S3Q5c0FSVUdhKzhtd0Q1Qmx3WnV4eVhTbVduL0tUcUh1?=
 =?utf-8?B?QTdJTkVCV2szVkJYRW5DMHUrNWZYWkZLbS9oZDhXL0t5TXNRMm5ZWEF1eENW?=
 =?utf-8?B?ZFNmbzhoTXF1cTg5TG9pR3g0aHVGUy9kN3ViUHVlaFF2UFVYL0FCdk90Uyto?=
 =?utf-8?B?VE1Ja0pzY241ZldUUmhjUDFhY2pHSjVOeW5BWnRHZkxPQTFUYTRacVRnNkRC?=
 =?utf-8?B?Wjl5bnhUZnovR0xZQXZOTEtqNVRlVnZDbDVnTzh3Uk80cGlzSjM4YVowLzVV?=
 =?utf-8?B?bDcvbUhkbWRFSGVDcTlLZjlTU2FIeDY0aUpMa0FSTzJ4VmdnUkV6cURCODhr?=
 =?utf-8?B?QmhJUDU1ZkszdnZVSnYzWWhGUVpyY0RBc0E0cVRmNVZyQ0lpQ1Q2eVlxNHJL?=
 =?utf-8?B?MlZZV3VpNFZ3MDk1bjRBK0ZDK2QzNGlBU3V5YjM3MHNEZUhYWEFoTEV6Ky9T?=
 =?utf-8?B?YitBd3VvaHJJb1pmbFFjV1NUMG5xcWplYnBmRCsxNlpISkVsYjV2SjdRNUF6?=
 =?utf-8?B?WmNaZTYxOGFDR2N5Qldldm96RFBua3JLQ2JrQVNWS1IycFJBZ3EvVTN2dURp?=
 =?utf-8?B?MnRPUTBzNHI2SnYwMUFBc09oUG9Mb1FucmRxY09hZ2JPTXRlQWk2bzI3RDEx?=
 =?utf-8?B?eUx6TjhucDZabXBITndJZXNOcFRURHU4MXV4bWFOYWlsQ3N1OTFXZDF5NDEw?=
 =?utf-8?B?NTdBellpM0MxUzhYUGpUYlBOVWdnZ0d3YkJJbzE3Vm9uaDdrV01SM3VrSVdE?=
 =?utf-8?B?M2MvbTJvOWVTRlM4SDBoWkY1OG9FMUFidjNNNG1IVC9zSFNlVDA3SXc0VTdP?=
 =?utf-8?B?V0tURHovQmlUdGliR21IZWJIMFk2aUk2U0s5Znlpb2FKNWw4SlA0NzRWdmdS?=
 =?utf-8?B?bDBsbVhjblkyQlcvZ0lxaWoxeit4SElraUJTeGV3R1VDQTdFM3pzcU85NVVk?=
 =?utf-8?B?ZCtGMXFlR1poR0tuS1VqNFFSVUhGaWc4NEp2ckw0YllMeldiT0toUjVScDVl?=
 =?utf-8?B?d25XaGVyMXRVZjV3RFFPR3dzT1hveXRONzJORzBPR3dKQTdMSTlYYnVrRmVz?=
 =?utf-8?B?VW1OT1Bma0UwWm50bXcyMkgyYjJxYTRKbVI4WXNvbVc2aHN2bzdGZmdOM2JX?=
 =?utf-8?B?V1EweVpOTE5KMWRZRGc3bGV2N1E2bUdCbm9VUm15bzJiOGw5V2xobmRPQ0xL?=
 =?utf-8?B?L0lrQzlHNFJGcUk4OHpsRjR5ZnFmbFE3RVRQcDFsenRjdERFVE5QZFJSZk1H?=
 =?utf-8?B?aDl0dmUvQXd1ZmM5MUxLL2xYR0RPVmJESzdZM0pHSjdESHFyRkpQY1M0ZUFj?=
 =?utf-8?B?cU16akViNVMvck1iaysvVHpqTEt3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3D6F664BDC6924D8399831E81CE9CE8@namprd15.prod.outlook.com>
X-OriginatorOrg: us.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR15MB3898.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43becb66-24bf-42c2-6838-08dbca75354f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 16:14:55.7392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4YLlGd2UYQP28u7WLyNB5OBy/+zaSpl2MoolLUb7o4z5KHNPPX+zh2AIkqePnYgMnBHxygZ/t55iPWmbcpfcyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR15MB5920
X-Proofpoint-ORIG-GUID: kXcL7Xs8eTu19q1w0xuxy9MZeIUcpGCk
X-Proofpoint-GUID: kXcL7Xs8eTu19q1w0xuxy9MZeIUcpGCk
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 4 URL's were un-rewritten
MIME-Version: 1.0
Subject: RE: [PATCH v1 0/2] [PATCH] hwmon: (pmbus/max31785) Add minimum delay
 between bus accesses
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_11,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110143
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sm9lbCdzIHN1Z2dlc3Rpb24gdG8gZXhwbG9yZSB0aGUgcHJldmlvdXNseSBwcm9wb3NlZCBnZW5l
cmljIHNvbHV0aW9uIG1ha2VzIHNlbnNlLCBlc3BlY2lhbGx5IGNvbnNpZGVyaW5nIHRoZSByZWNl
bnQgY2hhbmdlcyBmb3IgUE1CdXMgZGV2aWNlcyB0aGF0IGhhdmUgYWRkZWQgZGVsYXlzLiBUaGFu
ayB5b3UgZm9yIHlvdXIgcmV2aWV3IGFuZCBpbnB1dC4gDQpJIHdpbGwgbW9kaWZ5IHRoZSBjb2Rl
IHRvIGluY29ycG9yYXRlIHRoZSBuZWNlc3NhcnkgZGVsYXkgZGlyZWN0bHkgaW4gdGhlIG1heDMx
Nzg1IGRyaXZlci4NCg0KVGhhbmtzLA0KTGFrc2htaQ0KDQrvu79PbiAxMC8xMC8yMywgMTA6NTQg
UE0sICJBbmRyZXcgSmVmZmVyeSIgPGFuZHJld0Bhai5pZC5hdSA8bWFpbHRvOmFuZHJld0Bhai5p
ZC5hdT4+IHdyb3RlOg0KDQoNCk9uIFdlZCwgMTEgT2N0IDIwMjMsIGF0IDA5OjI5LCBHdWVudGVy
IFJvZWNrIHdyb3RlOg0KPiBPbiBUdWUsIE9jdCAxMCwgMjAyMyBhdCAwODo1ODowNlBNICswMjAw
LCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+PiBIaSBHdWVudGVyLA0KPj4gDQo+PiA+ID4gPiBSZWZl
cmVuY2UgdG8gQW5kcmV3J3MgcHJldmlvdXMgcHJvcG9zYWw6DQo+PiA+ID4gPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyMDA5MTQxMjI4MTEuMzI5NTY3OC0xLWFuZHJld0Bhai5pZC5h
dS8gPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIwMDkxNDEyMjgxMS4zMjk1Njc4LTEt
YW5kcmV3QGFqLmlkLmF1Lz4gDQo+PiA+ID4gDQo+PiA+ID4gSSBkbyB0b3RhbGx5IGFncmVlIHdp
dGggR3VlbnRlcidzIGNvbW1lbnRbMV0sIHRob3VnaC4gVGhpcyBqdXN0IGFmZmVjdHMNCj4+ID4g
PiBhIGZldyBkcml2ZXJzIGFuZCB0aGlzIHBhdGNoIGlzIHdheSB0b28gaW50cnVzaXZlIGZvciB0
aGUgSTJDIGNvcmUuIFRoZQ0KPj4gPiA+IGxhdGVyIHN1Z2dlc3RlZCBwcmVwYXJlX2RldmljZSgp
IGNhbGxiYWNrWzJdIHNvdW5kcyBiZXR0ZXIgdG8gbWUuIEkNCj4+ID4gPiBzdGlsbCBoYXZlbid0
IGZ1bGx5IHVuZGVyc3Rvb2Qgd2h5IHRoaXMgYWxsIGNhbm5vdCBiZSBoYW5kbGVkIGluIHRoZQ0K
Pj4gPiA+IGRyaXZlcidzIHByb2JlLiBDb3VsZCBzb21lb25lIGdpdmUgbWUgYSBzbWFsbCBzdW1t
YXJ5IGFib3V0IHRoYXQ/DQo+PiA+ID4gDQo+PiA+IA0KPj4gPiBMb3RzIG9mIFBNQnVzIGRldmlj
ZXMgaGF2ZSB0aGUgc2FtZSBwcm9ibGVtLCB3ZSBoYXZlIGFsd2F5cyBoYW5kbGVkDQo+PiA+IGl0
IGluIFBNQnVzIGRyaXZlcnMgYnkgaW1wbGVtZW50aW5nIGxvY2FsIHdhaXQgY29kZSwgYW5kIHlv
dXIgcmVmZXJlbmNlcw0KPj4gPiBwb2ludCB0aGF0IG91dC4NCj4+IA0KPj4gSSBhbSBjb25mdXNl
ZCBub3cuIFJlYWRpbmcgeW91ciByZXBseToNCj4+IA0KPj4gIkkgYW0gbm90IHN1cmUgaWYgYW4g
aW1wbGVtZW50YXRpb24gaW4gdGhlIGkyYyBjb3JlIGlzIGRlc2lyYWJsZS4gSXQNCj4+IGxvb2tz
IHF1aXRlIGludmFzaXZlIHRvIG1lLCBhbmQgaXQgd29uJ3Qgc29sdmUgdGhlIHByb2JsZW0gZm9y
IGFsbA0KPj4gZGV2aWNlcyBzaW5jZSBpdCBpc24ndCBhbHdheXMgYSBzaW1wbGUgIndhaXQgPG4+
IG1pY3Jvc2Vjb25kcyBiZXR3ZWVuDQo+PiBhY2Nlc3NlcyIuIEZvciBleGFtcGxlLCBzb21lIGRl
dmljZXMgbWF5IHJlcXVpcmUgYSB3YWl0IGFmdGVyIGEgd3JpdGUNCj4+IGJ1dCBub3QgYWZ0ZXIg
YSByZWFkLCBvciBhIHdhaXQgb25seSBhZnRlciBjZXJ0YWluIGNvbW1hbmRzIChzdWNoIGFzDQo+
PiBjb21tYW5kcyB3cml0aW5nIHRvIGFuIEVFUFJPTSkuIg0KPj4gDQo+PiBJIGdldCB0aGUgaW1w
cmVzc2lvbiB5b3UgZG9uJ3QgcHJlZmVyIHRvIGhhdmUgYSBnZW5lcmljIG1lY2hhbmlzbSBpbiB0
aGUNCj4+IEkyQyBjb3JlLiBUaGlzIEkgc2hhcmUuIFlvdXIgcmVzcG9uc2Ugbm93IHNvdW5kcyBs
aWtlIHlvdSBkbyBzdXBwb3J0DQo+PiB0aGF0IGlkZWEgbm93Pw0KPj4gDQo+DQo+IEkgZGlkbid0
ICh3YW50IHRvKSBzYXkgdGhhdC4gSSBhbSBwZXJmZWN0bHkgaGFwcHkgd2l0aCBkcml2ZXIgc3Bl
Y2lmaWMNCj4gY29kZSwgYW5kIEkgd291bGQgcGVyc29uYWxseSBzdGlsbCB2ZXJ5IG11Y2ggcHJl
ZmVyIGl0LiBJIG9ubHkgd2FudGVkIHRvDQo+IHN1Z2dlc3QgdGhhdCBfaWZfIGEgZ2VuZXJpYyBz
b2x1dGlvbiBpcyBpbXBsZW1lbnRlZCwgaXQgc2hvdWxkIGNvdmVyIGFsbA0KPiBleGlzdGluZyB1
c2UgY2FzZXMgYW5kIG5vdCBqdXN0IHRoaXMgb25lLiBCdXQsIHJlYWxseSwgSSdkIHJhdGhlciBs
ZWF2ZQ0KPiB0aGF0IGFsb25lIGFuZCBub3QgcmlzayBpbnRyb2R1Y2luZyByZWdyZXNzaW9ucyB0
byBleGlzdGluZyBkcml2ZXJzLg0KDQoNCldlIGhhZCBhbiBvdXQtb2YtdHJlZSBwYXRjaCBmb3Ig
dGhlIG1heDMxNzg1WzFdIHRoYXQgSSB3cm90ZSBhIGxpdHRsZSANCmFmdGVyIHRoZSBpbml0aWFs
IGRpc2N1c3Npb24gb24gdGhpcyBnZW5lcmljIHRocm90dGxpbmcgYW5kIHBvc3NpYmx5IA0Kc29t
ZXdoYXQgYmVmb3JlIHRoZSBvdGhlciBkcml2ZXJzIGhhZCB0aGVpciBkZWxheXMgYWRkZWQuIFJl
Y2VudGx5IEpvZWwgDQpwb2ludGVkIG91dCB0aGUgYWRkaXRpb24gb2YgdGhlIGRlbGF5cyBpbiB0
aGUgb3RoZXIgZHJpdmVycyBhbmQgSSANCnJhaXNlZCB0aGUgaWRlYSB0aGF0IHdlIGNvdWxkIGdl
dCByaWQgb2YgdGhhdCBvdXQtb2YtdHJlZSBwYXRjaCBieSANCmRvaW5nIHRoZSBzYW1lLiBHdWVu
dGVyJ3MgcG9pbnQgYWJvdXQgdGhlIHdvcmstYXJvdW5kcyBiZWluZyB2ZXJ5IA0KcGFydGljdWxh
ciB0byB0aGUgZGV2aWNlIGlzIGdvb2QganVzdGlmaWNhdGlvbiBmb3Igbm90IHRyeWluZyB0byAN
CmZpeCBkcml2ZXJzIHRoYXQgd2UgY2FuJ3QgaW1tZWRpYXRlbHkgdGVzdCAtIG5vdCB0aGF0IHRo
ZSBzZXJpZXMgZGlkIA0KdGhhdCwgYnV0IGFyZ3VhYmx5IGlmIHdlJ3JlIHNob290aW5nIGZvciB0
aGUgZ2VuZXJpYyBzb2x1dGlvbiB0aGVuIGl0IA0Kc2hvdWxkLg0KDQoNClNvIEkgYWdyZWUgd2l0
aCBHdWVudGVyIHRoYXQgd2UgcHJvYmFibHkgd2FudCB0byBkbyBkb3duIHRoZSBwYXRoIG9mIA0K
YWRkaW5nIHRoZSBkZWxheXMgZGlyZWN0bHkgaW50byB0aGUgbWF4MzE3ODUgZHJpdmVyIGFuZCBu
b3QgdHJ5aW5nIHRvIA0Kb3Zlci1nZW5lcmFsaXNlLg0KDQoNCkxha3NobWk6IEFwb2xvZ2llcyBm
b3IgbWlzbGVhZGluZyB5b3UgaW4gc29tZSB3YXkgdGhlcmUgLSB1bmZvcnR1bmF0ZWx5IA0KSSBj
YW4ndCBnbyBiYWNrIHRvIHVuZGVyc3RhbmQgZXhhY3RseSB3aGF0IEkgc3VnZ2VzdGVkIGFzIEkn
dmUgY2hhbmdlZCANCmpvYnMgaW4gdGhlIG1lYW4gdGltZS4NCg0KDQpBbmRyZXcNCg0KDQpbMV06
IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2xpbnV4L2NvbW1pdC80NGUxMzk3MzY4YTcwZmZl
OWNkYWQxZjkyMTJmZmRlZjhjMTZiOWJlIDxodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9saW51
eC9jb21taXQvNDRlMTM5NzM2OGE3MGZmZTljZGFkMWY5MjEyZmZkZWY4YzE2YjliZT4gDQoNCg0K
DQo=
