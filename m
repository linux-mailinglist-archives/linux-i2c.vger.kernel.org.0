Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E44514D04F8
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Mar 2022 18:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233022AbiCGRKw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Mar 2022 12:10:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235574AbiCGRKv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Mar 2022 12:10:51 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADE98301E
        for <linux-i2c@vger.kernel.org>; Mon,  7 Mar 2022 09:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646672996; x=1678208996;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=q+QnSY0iDdMaV4QjqiPBXFSxKrcq4sg8B3NBIPmzxvI=;
  b=gElQPap9MtSLXLuZsm7fYUJdUdHKXluaeYzJvVc+1qFX7cnFfozgu17W
   urjN3qXBUh7tM0WbweXWeOzcg1xuhfyCjQHgXjFFZHo2+lWOX9e+gY/uJ
   hAJwkPOA2HFAYPR9O2227BwQw2YzrmPFTkRJGX781tnEUcrODrITxAmVY
   TKFchb1tNHo6NSKSYtdzGmdxHD9A055gn+e9dmDDdoPoZLJF8gXNW+CO5
   XmsRna1G563nGIUR6441KkttiCqLxKk0b5lRlKTv60/Sct+YaxyyUTqtY
   bisvvv+vphnDQZWHzQmwTXC05vHt3eR0fG4Wj9LmBGtHNoLXO179D5RTx
   A==;
X-IronPort-AV: E=Sophos;i="5.90,162,1643698800"; 
   d="scan'208";a="148354833"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Mar 2022 10:09:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 10:09:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 7 Mar 2022 10:09:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICRn79rQTklLfZXDzYYxZviebNwCr1mYoS1PLgDntnOPu7WMhI/qcD64D24CspIv5kJZltzhkiE8TSXnaTxxzAOJf9M2y399Vpo0oV3vC7EUNrPne/UPjkuqiUyKneSHl0avZ8O6lFCQjorrfJNXGmR9LQzEQFC/PcodvAMjsVvvS4C+QSt0Kc+qG/qPMAd+PIzAz0vlr1TfICv0SyjQ3zTmtk5MqK8ulSx5P9P4hQELRriULfVIOxFEk4ni7SDzrE3d8mrvXlhUl6luAf8shuviymioaDYAC42NCrBmN9JeGTRRB/w17rgE6B9ZE2jXCdP2OX5R5bN615h4Ig/eHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+QnSY0iDdMaV4QjqiPBXFSxKrcq4sg8B3NBIPmzxvI=;
 b=b3bdnA2SmpF7yUOAcmIi1V9TWBDfhQ7PAmoL3C/8i2jCSD7vgJDJZGzsiYUxr+cDV41+N9eEW6+vKAWV33LCv+ofOXc0pixDAMlvpgfoFLr9kKNPpBMq6Bbi6E1iwhG5s0JCEQKwV4E7DwVFAFfVs+hcMNx3DvtTFJPdTBHhQn6vSNZv1vgFdJoi4YCazqnm9Ltw1TX/P0dczaoCgPlISUdFAz2w+gLsuMStaNDPOZRFMGtzp5+W0BPeFlqxMRKPxPpPuxXRe6J5By3jb3i1DHuJUrpTRkvRXnBJqj4gCUvLIfobjjr4EzW2jp2q/1lIc+a1MCod7SguvRhJrWaQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+QnSY0iDdMaV4QjqiPBXFSxKrcq4sg8B3NBIPmzxvI=;
 b=YIM/GexIqf8OQPtO3qDKiTVkHhUQTwZjo9UR+DXtrHUWwH6HgPix6KwETQhNpOq8Pes0Y6+B+URy0ox2xTZNBEUucOistD45aBfvCc7bGthYG6An/yhEgl6qqOVK5Ae1jW8AR8pvsrIb0yBCSHrFOPA6jvrvxb6DMBOqZyDlUmM=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 BYAPR11MB3560.namprd11.prod.outlook.com (2603:10b6:a03:f8::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.19; Mon, 7 Mar 2022 17:09:44 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f%4]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 17:09:43 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <michael@walle.cc>, <Tudor.Ambarus@microchip.com>
CC:     <linux-i2c@vger.kernel.org>
Subject: Re: wrong assumption in i2c-at91-master.c ?
Thread-Topic: wrong assumption in i2c-at91-master.c ?
Thread-Index: AQHYMjwVQY3PXEct7EStJkGw+PmV9Ky0J86A
Date:   Mon, 7 Mar 2022 17:09:43 +0000
Message-ID: <988d9fb8-eaab-13f1-db5e-189825a16097@microchip.com>
References: <591de05fde401e8899726e015b837cd1@walle.cc>
In-Reply-To: <591de05fde401e8899726e015b837cd1@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7f29d51-d68c-4ac2-322a-08da005d4667
x-ms-traffictypediagnostic: BYAPR11MB3560:EE_
x-microsoft-antispam-prvs: <BYAPR11MB3560BFDBD1674E6BB284953DE7089@BYAPR11MB3560.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ow4Hm91NOQzhkjCXayb7fevaqpW9FN91zy4/EDyzpLrC2+GLdCIC1yBXAyv/NXR2zhQcd+gfP1gEXgj0C7OcYGVps5hw2Dpeyl4Ss/OUu2YtVVl88opKlmOsIHJwHZ+H1Gfq/zhWrs/WU6yuDV8/gXdz4FAiZAbVDMBTt0LfEoiFHGvrtd+zT3vhxz1+ngkyExNHHRs3zHxyu+tQ/x/cmtXtcX8GnaeYvBhFjAuSRt+tvGozUmI1yzUkMrHnrwEj3qh+TRpDPWgPx2ITbSFhxbo5a19uxa9WcIrLWqQwkuS3FH294n75mgzg4IehwpN6LELe4ycyf81oYH5CbbozfORr6O7fezK563ErScU0W1SduFB+KbPDVkgASRS5h/A3gL8jJOxnlHGVbxI7PF9ukk2jsmC34xx8tXhb9nXVIlD94p8kkMjfVRjXjI37hhY2VTcd7mIs1BvqQwcACIl/OD0WQ1aynaemHyw7rHo5uRaUtRPk7G1hhO3YI35fBsWLOvHjYQuU12W+SlF3MY746838GjC4NUZXm4YatJQ93BYWvG+23Bo2LAyr6fNX6A4VTNaBGCe1eKN9tyHKWzII6YZ2AB22FbpoR7fzD/YU5lnTwMV3Y50cvtk6bQjGK2BPsUWEIemUQg7D24+vekWO23PlEKMce1fl2PekUNoa/UJMEQLiTTRG39rn82W/aFuzwuC4rURzN/376tN+lEDDayTHAG2J6UxwOUMs4i0Io6kOfykJ/uJhOir7tew9QOCQxETRBSm/v/zdNtT01aIIDttRF0IAwSQvmNmryamBHG/PJTPGeLINdF0d4taSswQtjRtQHKMCpAWJ0pTnuGkuSuitnNd48HvVgF1oKylKePvKqBympEgQxFTf9VDWY2CGNgEZIdlchuovPScY86Sgew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(122000001)(2616005)(186003)(26005)(38100700002)(8676002)(4326008)(76116006)(66946007)(64756008)(66556008)(66476007)(66446008)(36756003)(110136005)(8936002)(31686004)(91956017)(38070700005)(316002)(6636002)(6512007)(2906002)(86362001)(31696002)(53546011)(5660300002)(508600001)(83380400001)(6486002)(966005)(71200400001)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1NvVXVBNTA0R1JoSlNVOVlBbkNCdkI2UkdQbUNBRWxNUU1qWmF0ajNqRHJn?=
 =?utf-8?B?aFVldEExaEs0SS9jMEY4TkoxTzBpWXVrT0d3dGl0bzR6RFZWUUpPZDRtclY0?=
 =?utf-8?B?dHIvckNBbkh6TFNhbEhQRnJIbmpyNlA0UGpoZU1JMGlqU2E1aC8xTzhLS3BZ?=
 =?utf-8?B?Qk5iYTlDeWE2THVHNFBMTWYxcjR1QzhNY2Zpb0lTeGFCNlM2ZEVjVnVITFFh?=
 =?utf-8?B?dlVKNm5GU2R0anF0OG5GcmljVTZ5NWdBUmpkbmtYMG5ieGFxRjJWUkp4ZHpM?=
 =?utf-8?B?bHNxUWp2LzlHYUZSVkJWaFhBSHdBYTZuSXVGeFBCN1RzWU5wR2dXemd4ZWZw?=
 =?utf-8?B?cmE0czF0aGhsM0dkVTVSRmdPVXdNc0lWKzE1bERWQnBqMXltSXZJQ1V6Y0VF?=
 =?utf-8?B?Q2dHTlJFNVE0MzBsdllwYXR4NFdYQzBIVFlUY203ZUh3ZzAwTGpjQ0VlWThw?=
 =?utf-8?B?MjNZc2VyQXFtNk9ZWUtWaFkyVTVuY1VvWmZXNFRYeHVHZzMrWE9wMkdaRC9j?=
 =?utf-8?B?T1c4STZoTnFLNkJEQTNtcFpkNG93bkhlS243RXhMNzgydWNuZlJMaC95aEkx?=
 =?utf-8?B?d3R6U3VJdzIwbkxNU0NrRjcwUWJsalBSYzgxWWtvU3V5b2J5QzdsalpLay9r?=
 =?utf-8?B?WnI4Z21iTVBPVWt3ejJXMWxEcVM5T3ljZS9qUGx2cVJ1SFphdVV3UHV2d2Q2?=
 =?utf-8?B?cGRhaHRMTXh5SE00enVqSXpVazdVbjQ2TktSS0VJNlVxZWlvMnhWVW5LMGQy?=
 =?utf-8?B?VGJjNFZOb1FWRTFCK0xQOXZEdlFKdkZxa0tudTkzR0J0S2x5ZGtGd0ppZElo?=
 =?utf-8?B?YWN6MlVoTVQwKy9NRFpGMTBJYk04MXRsSlU3am95Y1hiMnBaWGdBQ3pLN0RF?=
 =?utf-8?B?N2dFWVBjcWl1QllhRHE5aVpOUDJmMUZ5bEszdVhsM0drRVljUDQxWW5BblEz?=
 =?utf-8?B?WWc5VWtjVy9EejN3SVVUdWNuQldaMVU5NzNvMTY1Z3ZVY2p3N1lhR0VZdXB4?=
 =?utf-8?B?bTdCOS94eFNSbmVYVmhOZG1HTityanlKSXVsd2RDYVF1K0NmMUt0a251T1FD?=
 =?utf-8?B?aE1VdWRLc1hZanBSbVZlbDdFdUozekNlVHIvUFU3TnpUWVFIdEEzTEtqdUZP?=
 =?utf-8?B?NHg4ZVl2Sjg1RnJtRjFjMGpwZktHakNuMkt1ZjNVMTNKU2tFSUxibzUxNENW?=
 =?utf-8?B?L0JhZ1NEOUVVeElVclUzVWdIVHB4WlgrRjErckdTaURBSU5IbU5tUlFtcCs1?=
 =?utf-8?B?MHdYMjlJd2k4c2VERGlkY29MT1Fpb2hsNGgyY29ScVp4SkNZQ1JRMzVLNWlt?=
 =?utf-8?B?RFI1K01KS2I4dVVoODFuYXRQZjdYQmpkNjFxNHRNdlN1R1hIa21hcGN0RHJE?=
 =?utf-8?B?ZzlIVzVBWXlURFZPOENpOTQyaTA2RGUydnUrTHdneUpYM1Y4eDBsNW8zNmZK?=
 =?utf-8?B?SytPOE1OSE5BT0lob3NoWWpwZmZpTmY2Wno1a1FWVVRvNldnc1FLWmphTkY0?=
 =?utf-8?B?QU4zVVFXeVZDK0Z2WEVWSFZUOWRYWklKYy9ya3l4R08rVytra1U4ZFVqby9S?=
 =?utf-8?B?YlpCcVNJUi83ZzBPbUVlY2puTk9BSFhuc2R2RXEreHNVME9WNUdabzVabXVH?=
 =?utf-8?B?N2o2dlh3OEVyQTlkTEhhZnFBMjdiRmMrVjRrQ1RZaHhRbkN0ZzRQdWtCSHpo?=
 =?utf-8?B?K0VHaW9adkk4NUtFZHhXUy9wYWpzdFZjdDdsYzFUamY0Q3hNM1VXMnB1eXZz?=
 =?utf-8?B?M3B5aWRweEZsUnpJMEVRaVcydEhxenZmdHUwcklvSXlValhkMTZMMk5yUi8z?=
 =?utf-8?B?d2M4VklJU1h0dDYzNnNIbXhPakNQcHBKYUNRZEZMQm9jRzVvTC81MUljaWlm?=
 =?utf-8?B?Qm0rdEpQZ3RuSm5MSFNSa0JQK2loaVpWSnZub0VGQnlNNmduUjZ3RS9LT3dZ?=
 =?utf-8?B?VHEwYzZRS0tHaVhJbDlKK3ltTERrandTeXRHdDZzdlNSOTVXNDlmbEs3bE9B?=
 =?utf-8?B?K2lvMUtlTkdZcVpqRE82dlpjNnlISFpQSEVYZkMzWlVjLzdDcHdSSjhVTTY5?=
 =?utf-8?B?Z1pOSjVtaTZ4LzlJMU02SkJlUDNrVDEwcXRLNGxLNTZSY3dsakR6TklzS0Vy?=
 =?utf-8?B?VWUwVGFjVE84WkR5QUJ2bnk5cmFKMFkxNVpKQXlrQ3RhQi81V1VDcDZQakhS?=
 =?utf-8?B?RHZncFd3RDRVYmJlTGxHdXhQZ2NvSDlieE5NeksrakZJZHNLNEpRcWVuTmxu?=
 =?utf-8?B?VmNrZFBBZkJkSTB2VVcvR2JTKzJnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71406BBC8C3C694BA3DAC24428404433@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f29d51-d68c-4ac2-322a-08da005d4667
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 17:09:43.8692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LpZo+azQf1EMvJdZS8FmWdr8DziLLBzq0en/EXP+VlY4aaqsFxYpX1JSCANrOKbaAdTPobIH2GavZy3WfshqvG65bd2kjsh3X3LPpda1Vv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3560
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDcuMDMuMjAyMiAxNzo1NywgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gSGksDQoNCk1pIE1p
Y2hhZWwsDQoNCj4gDQo+IEkgc2F3IHRoYXQgdGhlIGF0OTEgaTJjIGRyaXZlciBoYXMgc29tZSBr
aW5kIG9mIGhldXJpc3RpYyBpbg0KPiBhdDkxX3R3aV94ZmVyKCkuIEl0IGFzc3VtZXMgdGhhdCBp
ZiB0aGVyZSBhcmUgZXhhY3RseSB0d28NCj4gbWVzc2FnZXMgdG8gdHJhbnNmZXIsIHRoZSBmaXJz
dCBpcyB0aGUgYWRkcmVzcyB3cml0ZSBvZiBhDQo+IGNvbW1vbiBpMmMgd3JpdGUgYWRkcmVzcywg
cmVhZCBkYXRhIHRyYW5zYWN0aW9uLiBJIGRvbid0DQo+IHRoaW5rIHRoYXQgYXNzdW1wdGlvbiBp
cyBjb3JyZWN0Lg0KPiANCj4gQWxzbyB0aGVyZSBpcyBubyBjaGVjayBpZiBtc2ctPmxlbiBpcyBh
Y3R1YWxseSBzbWFsbGVyDQo+IHRoYW4gdGhlIHdpZHRoIG9mIHRoZSBhZGRyZXNzIHdoaWNoIGNh
biBiZSB3cml0dGVuIHRvDQo+IEFUOTFfVFdJX0lBRFIuDQo+IA0KPiBJIHRoaW5rLCB3aGF0IGlz
IGF0IGxlYXN0IG1pc3NpbmcgaXMgdGhhdCwgdGhlIGZpcnN0DQo+IG9uZSBpcyBhY3R1YWxseSBh
IHdyaXRlIGFuZCBoYXZlIGF0IG1heCAzIGJ5dGVzIChJSVJDDQo+IHRoYXRzIHRoZSBtYXggd2lk
dGggb2YgQVQ5MV9UV0lfSUFEUikuDQo+IA0KPiBBY3R1YWxseSwgSSBkb24ndCBmaW5kIGFueSBj
b2RlIGF0IGFsbCB3aGljaCB3b3VsZA0KPiBoYW5kbGUgbXVsdGlwbGUgbWVzc2FnZXMuIExvb2tz
IGxpa2UgaXQganVzdCBzdXBwb3J0cw0KPiBudW0gPT0gMiAoYW5kIGFzc3VtZXMgdGhlIGZpcnN0
IG1lc3NhZ2UgZml0cyBpbnRvIHRoZQ0KPiBBVDkxX1RXSV9JQURSKSBhbmQgbnVtID09IDEuDQoN
ClRoZSBjb25zdHJhaW50cyBhcmUgc2V0IHVzaW5nIHRoZSBxdWlya3MgZmVhdHVyZSBbMV0gb2Yg
dGhlIGkyYyBzdWJzeXN0ZW0uDQoNCkJlc3QgcmVnYXJkcywNCkNvZHJpbg0KDQoNClsxXSANCmh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1hdDkxLW1hc3Rlci5jI0w3MjANCg==
