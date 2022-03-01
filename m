Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 657B74C8591
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 08:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbiCAHxf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 02:53:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233150AbiCAHxd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 02:53:33 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967E84832B;
        Mon, 28 Feb 2022 23:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646121172; x=1677657172;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lJReXqsZxPuh37YS9Vxq6+RObeOVTEf8effLyHgLFSU=;
  b=IsJTaouV5f3iIP2TH5z2MqO3yReGF3GCuU1NoQsJ9SGGyQ5LzP0K+Tgf
   GuVTdIJYUrz0HsDwfyY/PWULesxfgMgHh8vSlrJ/TOVQarWu+PtnJFo5l
   yWFQrLvywIjUGpCRiYmpVTRCeL0ddbS+tugEEnfqabr0FZ3Bd78kchebK
   H2v4cFg6pvtjIOq1bylLhVzX8PMg0meOQhRPacBf9MGQq47ZGR9chzDa5
   Rj80ylwIKbG1fyZh7nggXdI4qx7GZerv6EUOg57eG6QHNBm75NXpJoqyZ
   LzxHVh9bk20qTCxrGEPuGdTcpVU1qMDCelqP+lxmOxP2FEfbNPgW+C1nB
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,145,1643698800"; 
   d="scan'208";a="150354944"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Mar 2022 00:52:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 1 Mar 2022 00:52:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 1 Mar 2022 00:52:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3JbZBwDKgM8ftcgm+6kEBF/4vC8TBgdLqLtpl5WgWEoJJxc164LmJ9XC5P40yDISu5jm9kZ3I1bm/r6kxD+yWQKynBlr/UhXWQIMrbNNphCfRbyIDs6J3xtvFuBJPNWcHoH1iEReQPlPoMlIztfzHLgIithnFxFGL84d6tB3iXXXqT176m2Q9P6uT+SKhQ+V6Kx04aJFWOFtG/Cqzi0/4AAqTX/Xpjscp0B4xrAQiYbUe3Y0p/Wt+ZH914tjNhoEmg0Fz639VyzxTXwAFFuHMODmAchqhF0T2JGU5f02jvxUQyKSCDzDyNNZx4NxO/NIiHC0Tvn5LdsRnPjNfRAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJReXqsZxPuh37YS9Vxq6+RObeOVTEf8effLyHgLFSU=;
 b=QDaLSw+9LZ+5H9kk/jeaLzOwdxO7OLGF2PQpAAFW8IYhqb5JJzaDU1DpV7WCMHZ4QXh2kQHApGSc7oUzDEGIFMr9Vt9clTTW3QVlsLTRHL6r6HRa2YbDMHc9rAHDbTo2eLTK86m1UQt69+mifzWQhnyCP3eckcAhY7ijr0DF13nU4DfP8/OBP1vC5p9mJOaCtWMY9JCdsiPwGix3Cr1OZ4le7wL5ca79S/07OmAT+1zCsBJd7jbhEhG1s41I9C1Y+OMSj+7Y28pnaoEGWUR/u+FCk1JWcrfAJ5AJDA0yQscrue/VqSd4MXOOeYzlJOC2a1YBZiMvjUp0kvtVdIaWWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJReXqsZxPuh37YS9Vxq6+RObeOVTEf8effLyHgLFSU=;
 b=pneBlDLkjsoDkJsoSdqEz3BijjOJ4mAAWdF7eEToRHyjUt92mU9tZWC2dfa7FcD/hINRxxptPxMgCUmLZnqs5fWIlVVin8C+RewhgnZEyAh3n7GdniVvD9EBB9kQlhU+DgZ5deODLU+7h1Bv0P7d56QsoHnXHcCJovpjuXESMh0=
Received: from MW3SPR01MB0001.namprd11.prod.outlook.com (2603:10b6:303:40::7)
 by BY5PR11MB4434.namprd11.prod.outlook.com (2603:10b6:a03:1c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 07:52:40 +0000
Received: from MW3SPR01MB0001.namprd11.prod.outlook.com
 ([fe80::8d51:7fd5:9f66:581a]) by MW3SPR01MB0001.namprd11.prod.outlook.com
 ([fe80::8d51:7fd5:9f66:581a%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 07:52:40 +0000
From:   <Conor.Dooley@microchip.com>
To:     <geert@linux-m68k.org>, <wsa@kernel.org>,
        <Daire.McNamara@microchip.com>
CC:     <robh+dt@kernel.org>, <krzysztof.kozlowski@canonical.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: microchip,corei2c: Fix indentation of
 compatible items
Thread-Topic: [PATCH] dt-bindings: i2c: microchip,corei2c: Fix indentation of
 compatible items
Thread-Index: AQHYKXp8xeT2UpZeUkiR/IYLPphk2ayqMLAA
Date:   Tue, 1 Mar 2022 07:52:40 +0000
Message-ID: <edb78580-f4aa-7861-79aa-2c28a6fd5f11@microchip.com>
References: <365d32c63c2fe080866be60c32dddd0f3634d19d.1645705789.git.geert@linux-m68k.org>
In-Reply-To: <365d32c63c2fe080866be60c32dddd0f3634d19d.1645705789.git.geert@linux-m68k.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c04b43fe-0b11-4587-8d6d-08d9fb5875e6
x-ms-traffictypediagnostic: BY5PR11MB4434:EE_
x-microsoft-antispam-prvs: <BY5PR11MB443472C6A6BE06F55E5ED47898029@BY5PR11MB4434.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r0kvKUtnIX5XMhXDzkJ/i4r23JcA9cgFZ0b7aUF8i9myMpckqgpLYHt2Qe2d71ecT/x5/rPB0U2+z9+zeYV2ZntNyfNoeeTrWq7wPbnbjfFF2jVjLvGCXffMDmijtcvbBvTbskXMgXQ7rsHuSp34LX56MBOGDyNFSOHH/xlANs2uC4frj9ncqSJm5a1tx6NhGAt1N5uX5KpYWUOLTIL34GJgcJy2NvDopQjAxThaOGb91oQHNaMcsFl+bBXvqN/M0O5K1h+BjzqTofLxzZvf2/YQvo7fNOZi0SnfU2MjIgtMBTzp2bpjWahn0aCN8SxF/Ys9kgwgEH+s01P0poyndlqroPf0IE2N9MiTTIKkSBy+dCF92uswweG8fiErWPGGW4VUYzwjmyYPhPIMIdHMSZ5k0I+JhZuftFinLP96EEZPXGJ9iOumCkJ13VyiPGW7AfVaBQrrj1s59baL4peLMJtOQq/jeHmHbzZ92dyhFw9eIs0pswnvjh3Os32j59av0WveCvUEc9Q7ZlXSL0SbC6KEdKlo0aS/EtttjF2SQ/9kMrBdmlpMn2IC61ADhJk/G9FGimHnT7MtqwTDZLFj4iutONwL5zqWybF3ep9b0e1JemNusIW6ETOPFT3mUzQrVdPCzTWUoIZlx6foAM060ClW8tz/dYREEVBzVdOxpql5LVaalu+mEAF78KBsyFzYyu9EeOm9lUsrJJQaE4Lco5Qvusl9UvbSX8K0xjnk6kovOwEpSsyr9ByotQT3I6wOf2qxZdl+HqV1UxkvenEHIg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3SPR01MB0001.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(91956017)(66556008)(64756008)(66476007)(83380400001)(8676002)(4326008)(86362001)(508600001)(66446008)(76116006)(186003)(110136005)(6506007)(6636002)(71200400001)(2616005)(26005)(31686004)(36756003)(316002)(53546011)(54906003)(6512007)(6486002)(8936002)(122000001)(38100700002)(5660300002)(38070700005)(31696002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkVBWXdCODArSWhxay9OaDJkZjc1Mkt3SXdtQ1ljRVllVjR5QU9tMFJLcDA1?=
 =?utf-8?B?R0NoVHBnZXZQTkpQLzZFRzJKSVliNkRRMkgrMHozdkdVMmd6NEo3QnB4ODFC?=
 =?utf-8?B?elFZcGZHdjNIS1RFdmpNWWpqQ3RwZUtHM3QzZWhER2NyWE1YWjV2UDYwWFBm?=
 =?utf-8?B?WEFVK0FrVFhUWHJsRHR5dEZ2dGxqa0RuMDNDbHJQaXdEdG1mdG1NbEQrS3pY?=
 =?utf-8?B?a3dYcUs4LzRrVEovckpqME51eHUrLzlZRzRwU0tyVGYwdkVKQ3FSNmhFUnNT?=
 =?utf-8?B?V0FGYUxZNnM0SFRwdTVZSHNUR2IzMDBqY3lrcHpUWnlpUFdadGV3Z1NTVFB2?=
 =?utf-8?B?VTBPYjkzUEdGZ3N0VjdVb3dPR01LMGRVTElJc2IzWmR6NTI1UzdlQjluNG5a?=
 =?utf-8?B?bWMzSThhUmF4anEvTGpmZmJhczB3bmkzZ05yMTFWMnpUOG1RMlFPdVVNV3V2?=
 =?utf-8?B?YTVnSCtNcFJDbVRzSlE1VGJKZnNrSlBiNHhWeVU3UU5xZVJLUi8yU2d4Snd3?=
 =?utf-8?B?R29CL2U4UnRXK09DeEJQY2lGakYwZnhQSmJIdGNYcjlwN1JuZEJNU2NIb2JD?=
 =?utf-8?B?MCs2NVdvZnVycnZva0lvZnBwdU5LWjFRYktaaW9MVGo0b2JaWmh5WVc4dmI5?=
 =?utf-8?B?K25aVGp5V2NaMmc1VGtVVkNDWnV2YTFzNWd1V1l3aVd5NTM0N0Nlc3NjNUUv?=
 =?utf-8?B?RVFUTWRHcHlCdWVjVjRLbzlsazRUWTh3VUJ4dlN0K3hFaGdDSGx6OWp0WGpG?=
 =?utf-8?B?ZW9rU2tqeGQ0Ny9QcTJBSUxRTW5zQ2kzVnNaSndCK3hBQUF2RkZEaHdRS3Vo?=
 =?utf-8?B?L2xUQlJQdWJtdkZXQ2EvQSszMHVCemJJdkJCUHNPOEhFNkszR2JaUDRPM3Z1?=
 =?utf-8?B?Z3h2K1JpakpaeXNIZlRFK0dpZmJVR0RidEtkUlJHZlRHZDRjd1FSbmJTWHhD?=
 =?utf-8?B?QWVnU3JOazZNdjlVdjVBVkhGckVXR3k4TkhadVoySDBWRW9BdWJlWEkyTEtu?=
 =?utf-8?B?K05LbGlkOXJmbUlxaXkzR1RYTEpjSnZ0Zm9nTzNsTGRFOFllUmFhUmpTc1pP?=
 =?utf-8?B?a241N3pHZkdxanF3UDFUVDkyUHJPRHRtblBOeWpjTzZKQjIrNkZtV21vZzd2?=
 =?utf-8?B?LzFTWHh5RUgxUFZRUWdaNmlZVE1sLy9DMDhGT3cwdXZQbVNuTmZyRnFnRnRB?=
 =?utf-8?B?dGtTT3pkSHNYbXdmZEJmSEtTYi9oVTdncGlaRG55blhuWXNPaWZWQnora1lS?=
 =?utf-8?B?TTBFblFDZ3QvOElYNHJTYUI3OWp3bUVWVEZHSXlMMmMxOUdoMURpUFMreVox?=
 =?utf-8?B?bDZxSWxZekhMbXViQndsT0lnMnlKMS9wdXlJOWtTSDhBWWdnK2ZORXJxcmJa?=
 =?utf-8?B?Y2tNRCtCUXg2WENFRGYyZjI3UDZDdGRVbjQ0ZTdKVVk2cjIrUUpCRnNVVkhH?=
 =?utf-8?B?NzNKVEpyTXdYbEJkRnBVU05PaHZhRlN2UlZaZ2NGSXd4THhCUUhDS2s2WFAx?=
 =?utf-8?B?SUNEbGNpcjhWM3cxUFA2aWNNUGxPdVo3ZzZRTVNwY3owM3dNa1c3Vm9OeWFN?=
 =?utf-8?B?WUE1cVVhTFA2NnRxNkFpb2h3M0E0eG93eWxucFl1bEZaMnMrRDgveUNNdHpG?=
 =?utf-8?B?THVDNCsyVU5BdDc3cU9ReXlIYlNqTGdXeE5GcFl6dWxta2xCV0kxN0pxTklw?=
 =?utf-8?B?a21ydFlJc2pBUTd6OCtndDJEOFdIYjlaSGIwQng5SDY1ZmdiaExhMGRJSjMy?=
 =?utf-8?B?amlMSUhyUlI1VkpEWGNrZ3ZVR0xyYy9LOFRLNWtnVENmYzlZNDNCaEowVTlJ?=
 =?utf-8?B?NndGMnRBZjBXdDY0WXN4NXdPRjZ6MmlnaUVBcWFRVmc5LzIyQWFQcnRuTnNV?=
 =?utf-8?B?dk5lZDhlQ3pweDIzalQ4VitVS2hCeTJxelQ0UGRnc2QvWHFNcTNsZ0lVQ1VG?=
 =?utf-8?B?N0xkeitwYVVVVVdqL2hGa2FldjY5TzBTZ0hLY0FGeW5XUDNZUEI4UEk4R0Fm?=
 =?utf-8?B?VmVORGtFbElVOU53Qzk4UkVtSU40U0FzYzlJNnFuRFZmdXRhaHAvVUl2NjAy?=
 =?utf-8?B?OUd4clB0ZEVQTEsreSsrS1p3Y1llQVkwaDVnb3VleWFQQUJ6K1FBVVIxTktB?=
 =?utf-8?B?dmNpOGFxckZlN0dxRnU4VThiUTJ0LzZ6dTkycU9IYWVzb0hQb0l2Rmo5aUg3?=
 =?utf-8?B?MmorRVVMK1c4RWo5Rk9GNUFDNWd6SnJ5ME03UEl6Znl0cnFTZTFYTDVvQnBD?=
 =?utf-8?B?SkNKQWNoRVRadnNCZjlSWUFlcjBRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <101F1AA9663F874DA9D9D58A39B6AFDD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3SPR01MB0001.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04b43fe-0b11-4587-8d6d-08d9fb5875e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 07:52:40.1967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Z9/wYoQOXU6Xddl/QNVuywO0z5pjZHymS8+Safw68YlVSdNHgkulBX5ha6llzHIBj/09P/XvR8hu9ULzPPI5gQlQ+9Vvmtw5cM7GfpszGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4434
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjQvMDIvMjAyMiAxMjozMSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IG1ha2UgZHRfYmluZGluZ19jaGVjazoN
Cj4gDQo+ICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9taWNyb2No
aXAsY29yZWkyYy55YW1sOjE5Ojk6IFt3YXJuaW5nXSB3cm9uZyBpbmRlbnRhdGlvbjogZXhwZWN0
ZWQgMTAgYnV0IGZvdW5kIDggKGluZGVudGF0aW9uKQ0KPiANCj4gRml4ZXM6IGYxYmQ2NjYxOTQ2
YjIwZDEgKCJkdC1iaW5kaW5nczogaTJjOiBhZGQgYmluZGluZ3MgZm9yIG1pY3JvY2hpcCBtcGZz
IGkyYyIpDQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgt
bTY4ay5vcmc+DQpJIGFzc3VtZSBpdHMgbm90IHJlcXVpcmVkIGdpdmVuIFJvYidzLCBidXQgRldJ
VzoNCkFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0K
PiAtLS0NCj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL21pY3JvY2hp
cCxjb3JlaTJjLnlhbWwgfCA0ICsrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pMmMvbWljcm9jaGlwLGNvcmVpMmMueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvbWljcm9jaGlwLGNvcmVpMmMueWFtbA0KPiBpbmRl
eCBjOGU2MDVmYmI4YTZiM2QwLi43YmFkNGI5NDZhMzQ5YzhiIDEwMDY0NA0KPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL21pY3JvY2hpcCxjb3JlaTJjLnlhbWwN
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9taWNyb2NoaXAs
Y29yZWkyYy55YW1sDQo+IEBAIC0xNiw4ICsxNiw4IEBAIHByb3BlcnRpZXM6DQo+ICAgICBjb21w
YXRpYmxlOg0KPiAgICAgICBvbmVPZjoNCj4gICAgICAgICAtIGl0ZW1zOg0KPiAtICAgICAgICAt
IGNvbnN0OiBtaWNyb2NoaXAsbXBmcy1pMmMgIyBNaWNyb2NoaXAgUG9sYXJGaXJlIFNvQyBjb21w
YXRpYmxlIFNvQ3MNCj4gLSAgICAgICAgLSBjb25zdDogbWljcm9jaGlwLGNvcmVpMmMtcnRsLXY3
ICMgTWljcm9jaGlwIEZhYnJpYyBiYXNlZCBpMmMgSVAgY29yZQ0KPiArICAgICAgICAgIC0gY29u
c3Q6IG1pY3JvY2hpcCxtcGZzLWkyYyAjIE1pY3JvY2hpcCBQb2xhckZpcmUgU29DIGNvbXBhdGli
bGUgU29Dcw0KPiArICAgICAgICAgIC0gY29uc3Q6IG1pY3JvY2hpcCxjb3JlaTJjLXJ0bC12NyAj
IE1pY3JvY2hpcCBGYWJyaWMgYmFzZWQgaTJjIElQIGNvcmUNCj4gICAgICAgICAtIGNvbnN0OiBt
aWNyb2NoaXAsY29yZWkyYy1ydGwtdjcgIyBNaWNyb2NoaXAgRmFicmljIGJhc2VkIGkyYyBJUCBj
b3JlDQo+IA0KPiAgICAgcmVnOg0KPiAtLQ0KPiAyLjI1LjENCj4gDQoNCg==
