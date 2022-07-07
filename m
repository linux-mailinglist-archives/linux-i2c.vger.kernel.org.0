Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A110156AE26
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 00:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236408AbiGGWOv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 18:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbiGGWOu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 18:14:50 -0400
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com [67.231.159.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02065A44C
        for <linux-i2c@vger.kernel.org>; Thu,  7 Jul 2022 15:14:48 -0700 (PDT)
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267IedhM006399;
        Thu, 7 Jul 2022 18:14:37 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2052.outbound.protection.outlook.com [104.47.60.52])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3h4uc1t0mb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Jul 2022 18:14:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRUnrh5r8bULqt5OMBtF6YjHpN0x//gESV7dpyLo/Ibb3j4teHh8Em94kBl3uwkzArfPUgCZuizppNFwA22HRYJqx9R/DaGV9IwpXklGmrlK/BrNB/MWybpjl29+jX3Uel04Cse3cssNZUDKbWR4PXkys2VLJszI8cCJW2suCxqkLnEEo7L5H8wx7KrK7/2JyUUXtgW99Byf1qE3lI+G5XcB3YlZlssw20ZZTdABiB+tWlBWpc9ap2FKPVzsEj656gDkfKdb1w2tKtaoTKSkCEkkkDGth5eugbGjBGX7VLiB7U3Dzp/4ZYTzWEpSQ83syJR3txakifjWa+0Nk4fGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEJhJvCR5YzJea4qynNC3Z4L5zzL9QMgs1W8f0LELJo=;
 b=arhzVcthdrryPrAUAN7buGmoQpMxqBQw+OBMO8M0rqTmwkjSfETJYM81XPIByZjC5xJCvBKrMC/1hAiM6ELgBgZm6ff470KkGRsRFZ2mqjS9syAblk2IoP6iIf6FL1KaDBY85cJs4gSBSGj5I0mP3eNA8Q3ieUdu1uKf0Fd+MT/KX3eAdSKiGGsP1mfC0Xqr5yS3PwAJc5oxX0w8Fpx3bGPx09P0SwFhl18pgEPb2wFchGc4nW10fVe40AbARYkagC5DY0Fphv1HSRlar2Ujaqyy+wab8BoFBNuFvd/lGZQToXJXsSXcNAxgF4yEYyBQyiSocAZ64CFQCPUP75lTmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEJhJvCR5YzJea4qynNC3Z4L5zzL9QMgs1W8f0LELJo=;
 b=c57nIxLHwCgH5eZqa64sblq3BKdBJ7R8o5XVgepRv+GYndzi1WqCTnXadGMNqMRnyO6p/Y24y7ovNsXYODRNDAD4WFEt5WpBQtmDdYZZncMVrRrDsccBSDNW6UeH0T4vOO9zEClaiGHKblPTk6lUosIfQXAf6NHkRsjm5edVCns=
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YTBPR01MB2429.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:24::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 22:14:35 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2490:1742:8b6c:26ec]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2490:1742:8b6c:26ec%9]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 22:14:35 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "shubhrajyoti.datta@xilinx.com" <shubhrajyoti.datta@xilinx.com>,
        "wsa@kernel.org" <wsa@kernel.org>
CC:     "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "shubhrajyoti.datta@amd.com" <shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH v2] i2c: cadence: Add standard bus recovery support
Thread-Topic: [PATCH v2] i2c: cadence: Add standard bus recovery support
Thread-Index: AQHYj2qu23b4bScHBEO3/dwm5xKGHq1zaxGAgAAT9wA=
Date:   Thu, 7 Jul 2022 22:14:35 +0000
Message-ID: <6140bac860fea41348a7922b4772ab6af4ec41ff.camel@calian.com>
References: <1656914060-24445-1-git-send-email-shubhrajyoti.datta@xilinx.com>
         <YsdKCeEbEW7ZodZe@shikoro>
In-Reply-To: <YsdKCeEbEW7ZodZe@shikoro>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23d6b3bb-2549-4be1-21f6-08da60661379
x-ms-traffictypediagnostic: YTBPR01MB2429:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n+JYPsEBLzIiyGzZuQJLfUgSoNVhhNijXpxsKjJXdH6fMxHqgCzc3Ff+iv1zsPAOjoOZfrc36OIgrINhzKAdwXExAdAZSkgCvNZTj9wyu4C2aSiKnvePKcLvKmvkdNB36aARUd5JE+DePu5Xf2m59ASgfhzF/ER//Es14FxPqFGHStppI2i0HdoTzZqBovLkPtJCeC6yi7Tpy+f5mkIKmuqBk1OJtlzE9X2dmaUMdb3UpbJwgzVHJL82A+IkaY0XQzkpK5D1WJtnAPkRVXp6wLpCfz9b6jf/uqfoBaXV2gJRoHOmA7sJ/NCPMglL/sjcv3kG2gbyq4D87OmN4c+jK6MpH0bDvOE8KIOaLGB4JZgIvvRAjRkfQ6uEtw3V5haLweQo5WKZ/SLpc55LM/7k4QA/XaNw1/dN2V7HWjvBDb5mVVPVkWUn976Nol0+o2oGoCiGxQloTuljdeCb0hAm0uapWucwSX8G+EelzVK/rv1xx3djSgURFxNUm9Fa+AQicWSy4tH0FtzGLO1o8JCdaBWAuP9dr0cHseo6T7LBJxlHKce77znHgV0XB+LQMG0+BybcCtY4YaptF/5SYNTwRxGb2LbIBgKhrzgVCq5U1Z6XKPslTG1KW1+fYAjWkwtC6hWhxfeZ2KKUbpZU9OZ2DWXIr+03X5eCTyUYYg5Bve6327b3nqnuS+JpmXtek1wGfGF5gewT+iAX4S+Hf9U34AE/AS3AgGl9UZHAwMo0simVhtBaUlWe/lk6esnYivF6j0CzIcFyLcIkV1XvyjFlHXv/367gpPgLlTkNJOlZe9+2rLBtM4RSWrQTY8JG9i3HsNNxuE+43ZsClYuA8FaebvmDMk5/YZieBtXyxuPapYY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(86362001)(44832011)(38100700002)(478600001)(316002)(6486002)(41300700001)(966005)(2906002)(2616005)(66946007)(66476007)(66556008)(66446008)(64756008)(8676002)(4326008)(186003)(36756003)(76116006)(38070700005)(6512007)(122000001)(8936002)(26005)(54906003)(110136005)(5660300002)(71200400001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUxHaVFlRkQvRDRoRlJMS1ZnVU5oUTNaWmRNcmEvYTVaeVlvSnhINENGeFhn?=
 =?utf-8?B?ZkFSdmx3UTNaVkwxV0tPTmsyLzY1eTh5WDNzakthSko4V29XRFBlMnhWT2tm?=
 =?utf-8?B?Ymg0VTN4NGx2Mi9hOFNlek91RDRjVEFaZ216U3ZUZmdLby9Rb1Q3ZjF3SWpK?=
 =?utf-8?B?U0hlTzNTSW4yU2h3NEZJNjhOQ0RLcDZGUytJREZzL21DN1FvNEtTeEJwV1FI?=
 =?utf-8?B?cVVsTG05aUc0WFE3M0dZY1MwcFUzQ0tHUjY2ckZPNkYwMUh4RUg4K2w5RmF4?=
 =?utf-8?B?SVdXaDY2L0xBN0lrS3JkSTZSaFRTbTNqYTVDbnpUdGtKTGFqRmFvVmZjZk41?=
 =?utf-8?B?M1g5cVRjdU40S0w2a2xuQ1d5YmdwZCs4QXZCbzJpYWovR3ZDYTdRYmdWaU1K?=
 =?utf-8?B?d1ZKcnA3SFFaenNBaXRWQkVkRWhZNitTNWRJaU1wRUg3UEl0QlY4aCtYcmtT?=
 =?utf-8?B?RlRld2tWb0VLY1MzSHo4SkRHaFY3aFVmb2xlbCtrTDRUZ0RPeElBeG1YNW1C?=
 =?utf-8?B?OGVCVmN5LzM5Q2N5KzNpL2tpRXAxaTI5Nk9TTzJaUUUzSjlhSHlhY3FLY3FQ?=
 =?utf-8?B?Wm9UeCtIMDliM3RUUUx1NkxSblNwaklLbndlS1dDYWNHazA5NW9vZmY1RXBC?=
 =?utf-8?B?TkhQL1F5UnZBZFhqOFozbERMOTdndUtscm5DQ2ZLSXRiL1B4cFB0WWk4NUhN?=
 =?utf-8?B?S0ZKK284RHpQd2NSaUVjdVY0SUgzcnI2WDBaWDM3Qk5xMGsyQzNwVHEzWnJL?=
 =?utf-8?B?RSs1ZHZVOUw4WkVuU3M0akpSUTR0UTBJeVR2UTR1Y29rblFINXVEWGZlR2dX?=
 =?utf-8?B?SVI3ckNkUm50VUhCTkhoU0hSSU80YkUyOHpGMk5NVXAzM0ZHR0I5ZzFNZHNI?=
 =?utf-8?B?eVNvcnlaY0JIRWtCejBvUlpENlhIOHJaWXFSQ0JoT05ZU1JtWVl1akRMMHVO?=
 =?utf-8?B?VGlDbFk3MFhkRkN5QUNwVzh0NW9hYlRKejN1dlRXK0psUDNtdk5sbTcvKzk4?=
 =?utf-8?B?RXlDWmZpeEMrMExTQ3FaWnIySHI4VUlJbTcrOVU5akE0UHBrbXU2Wm0rOFAr?=
 =?utf-8?B?cGJPRGd0ckkzVEh5d2VQcHgwcXdETk85M1BEcjBJVTUwQ3ZzcUI5aG10ZUVC?=
 =?utf-8?B?VGRubmFRZUcvWEFZVTZjY0ErU3BrTWJTRWl5UXdZWUN3ZDVudTlaYTNEM0lM?=
 =?utf-8?B?T25qUVhXWEk4Y0Y0SnU0K0hvOTk2Wnk2K2VQZXVpNXprWS81S3lPZm95RktB?=
 =?utf-8?B?QlhYM0hFR1c3ZldUY0N2YU5wb25Xbm8wL3ZRaVd1OFNkeEdweFk1QVZlZmdm?=
 =?utf-8?B?akhQOWpyUGpKYjVYQlhnQmp2WGV4eHRsSWdOYlcvY2pRVGlyU1ZoaGpjckYr?=
 =?utf-8?B?KzFXSVZiT25BOGJlRkFMVzRxOFA1MzYzc1BTL0RzVlQ4V1ExWnZVcE1IMnh2?=
 =?utf-8?B?UHV3bm5rTnVRb0Fhd1NiU0NKZXFBQTV3UEVPR3FoNFRxc1lMa3NlcEsvbXF1?=
 =?utf-8?B?d0x0dkIvc1RRT1R5YkJsVlJOK2Z4TUppL1k0ZjlzRWJWSWJBN0pNc3dJcmZV?=
 =?utf-8?B?YVFsajhQV28vTDQ0QmpwZVFpTExFZS81YStVeG14VUoyL2FqRSs5dUFVN3ZI?=
 =?utf-8?B?VHlQelo3dGJobTc5Q2VkNmpHRjRUNW40enlQVDhTbE9UT2JJMXF4ZTQzYW5S?=
 =?utf-8?B?cnFIY01kejVvRXVLeWhqcG1vbFZwRWtCWkQ2aVVkNmRMN1BSRDJLMGpUeGkz?=
 =?utf-8?B?Nkk0aTVkMGo5SmpQSVFoNndGbGVGS3pBbGdmNEJRd3NybTVaaTZIZHJXeWp2?=
 =?utf-8?B?ZE1uTEtRZmF2cWNQL091T3RvWUNjZS9QNTgvaDl0SmZkTXkrNXRWMVBPaTB6?=
 =?utf-8?B?VEpUWGVHbm5sMHJuV0Q2ZGFYU1Q1QW93UGN3cDhERTFuVS9PNEtqQzdLaEFD?=
 =?utf-8?B?Q2l3OW51ZmVGU202MnhrUVhKQmhoWU9OQlR4QW9wRStjejZ6dDR5Tk13SEYw?=
 =?utf-8?B?eXpsMFo3bXhLQnNlN3lvcU9idG4ycmd2NUdaRE5ENisraDcrMTJTbmg5Vi9Z?=
 =?utf-8?B?ZGJHbTc2aU5KeFRVY1M5b09admg2NHNIRmVJdzc5b09tQ3BVV05rc00vSHBE?=
 =?utf-8?B?R1F6ZUdwMU1uNVYxbWVMVC95cy93MUQ0ZTQ1b0grTysrMUxBUk93ZGN1dnp2?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3434F523209C14990E4712B2FD4B9D2@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d6b3bb-2549-4be1-21f6-08da60661379
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 22:14:35.5357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVkwntpuq/9oYzgfTwyPenMWjadtGTH/HkVCmtzWKRajHzSb/f1Ft2mzKh854iuuYYWH6Fois7JjeqWWS0JVJe88XJxCLApHIVeFqSNyr0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTBPR01MB2429
X-Proofpoint-GUID: p7UnUDfuF5r5PGLFrIxH8nGZvqsTSUS3
X-Proofpoint-ORIG-GUID: p7UnUDfuF5r5PGLFrIxH8nGZvqsTSUS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_17,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207070087
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVGh1LCAyMDIyLTA3LTA3IGF0IDIzOjAzICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6Cj4g
SGksCj4gCj4gT24gTW9uLCBKdWwgMDQsIDIwMjIgYXQgMTE6MjQ6MjBBTSArMDUzMCwgU2h1Ymhy
YWp5b3RpIERhdHRhIHdyb3RlOgo+ID4gRnJvbTogUm9iZXJ0IEhhbmNvY2sgPHJvYmVydC5oYW5j
b2NrQGNhbGlhbi5jb20+Cj4gPiAKPiA+IEhvb2sgdXAgdGhlIHN0YW5kYXJkIEdQSU8vcGluY3Ry
bC1iYXNlZCByZWNvdmVyeSBzdXBwb3J0Li4KPiA+IEluIHRoZSBkaXNjdXJzc2lvbgo+ID4gaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LWkyYy9wYXRjaC8yMDIxMTEy
OTA5MDExNi4xNjYyOC0xLXNodWJocmFqeW90aS5kYXR0YUB4aWxpbnguY29tLwo+ID4gCj4gPiBy
ZWNvdmVyeSBzaG91bGQgYmUgZG9uZSBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSB0cmFuc2FjdGlv
bi4KPiA+IEhlcmUgd2UgYXJlIGRvaW5nIHRoZSByZWNvdmVyeSBhdCB0aGUgYmVnaW5uaW5nIG9u
IGEgdGltZW91dC4KPiAKPiBXaGljaCBpcyBzdGlsbCB3cm9uZy4KPiAKPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogUm9iZXJ0IEhhbmNvY2sgPHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBTaHViaHJhanlvdGkgRGF0dGEgPHNodWJocmFqeW90aS5kYXR0YUBhbWQu
Y29tPgo+IAo+IFRoaXMgaXMgYW4gQU1EIGFkZHJlc3MsIGJ1dCB0aGUgb25lIHlvdSBzZW50IGZy
b20gaXMgZnJvbSBYaWxpbng/Cj4gCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHRpbWVfbGVmdCA9
PSAwKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaTJjX3JlY292ZXJfYnVz
KGFkYXApOwo+IAo+IFRoaXMgaXMgdGhlIHdyb25nIHBhcnQuCj4gCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGNkbnNfaTJjX21hc3Rlcl9yZXNldChhZGFwKTsKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2VycihpZC0+YWRhcC5kZXYucGFyZW50LAo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCJ0aW1lb3V0IHdhaXRpbmcgb24gY29tcGxldGlvblxuIik7Cj4gPiBAQCAtODUy
LDggKzg1OCwxMiBAQCBzdGF0aWMgaW50IGNkbnNfaTJjX21hc3Rlcl94ZmVyKHN0cnVjdAo+ID4g
aTJjX2FkYXB0ZXIgKmFkYXAsIHN0cnVjdCBpMmNfbXNnICptc2dzLAo+ID4gwqAjZW5kaWYKPiA+
IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgLyogQ2hlY2sgaWYgdGhlIGJ1cyBpcyBmcmVlICovCj4g
PiAtwqDCoMKgwqDCoMKgwqBpZiAoY2Ruc19pMmNfcmVhZHJlZyhDRE5TX0kyQ19TUl9PRkZTRVQp
ICYgQ0ROU19JMkNfU1JfQkEpCj4gPiB7Cj4gPiArwqDCoMKgwqDCoMKgwqByZXQgPSByZWFkbF9w
b2xsX3RpbWVvdXQoaWQtPm1lbWJhc2UgKyBDRE5TX0kyQ19TUl9PRkZTRVQsCj4gPiByZWcsCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgIShyZWcgJiBDRE5TX0kyQ19TUl9CQSksCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQ0ROU19JMkNfUE9M
TF9VUywKPiA+IENETlNfSTJDX1RJTUVPVVRfVVMpOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJl
dCkgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSAtRUFHQUlOOwo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGkyY19yZWNvdmVyX2J1cyhhZGFwKTsK
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBvdXQ7Cj4gCj4gVGhpcyBp
cyBwcm9wZXIuCj4gCj4gPiDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gwqAKPiA+IEBAIC0xMjc4LDYg
KzEyODgsNyBAQCBzdGF0aWMgaW50IGNkbnNfaTJjX3Byb2JlKHN0cnVjdAo+ID4gcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlkLT5hZGFwLnJldHJpZXMgPSAzO8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBEZWZhdWx0IHJldHJ5IHZhbHVlLiAqLwo+ID4gwqDCoMKg
wqDCoMKgwqDCoGlkLT5hZGFwLmFsZ29fZGF0YSA9IGlkOwo+ID4gwqDCoMKgwqDCoMKgwqDCoGlk
LT5hZGFwLmRldi5wYXJlbnQgPSAmcGRldi0+ZGV2Owo+ID4gK8KgwqDCoMKgwqDCoMKgaWQtPmFk
YXAuYnVzX3JlY292ZXJ5X2luZm8gPSAmaWQtPnJpbmZvOwo+IAo+IFNpbmNlICdyaW5mbycgaXMg
bmV2ZXIgcG9wdWxhdGVkIHdpdGggYWN0dWFsIGRhdGEsIEkgYW0gcXVpdGUgc3VyZQo+IHRoaXMK
PiBwYXRjaCBoYXMgbmV2ZXIgYmVlbiB0ZXN0ZWQuCgpJIHRoaW5rIHRoaXMgKHNldHRpbmcgYnVz
X3JlY292ZXJ5X2luZm8gdG8gcG9pbnQgdG8gYSB6ZXJvZWQgc3RydWN0dXJlKQppcyBzdWZmaWNp
ZW50IHRvIGFsbG93IHRoZSBnZW5lcmljIHJlY292ZXJ5IGluaXRpYWxpemF0aW9uIGluIGkyYy1j
b3JlLQpiYXNlLmMgdG8gd29yay4gaTJjX2dwaW9faW5pdF9yZWNvdmVyeSBzaG91bGQgZmlsbCBp
biB0aGUgcmVxdWlyZWQgaW5mbwpiYXNlZCBvbiB0aGUgYXZhaWxhYmxlIHBpbmN0cmwgYW5kIGdw
aW8gY29uZmlndXJhdGlvbiBpbiB0aGlzIGNhc2UuCgo+IAo+IFJlZ2FyZHMsCj4gCj4gwqDCoCBX
b2xmcmFtCj4gCgo=
