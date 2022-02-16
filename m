Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 767064B7EE6
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Feb 2022 04:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244312AbiBPDyX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 22:54:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiBPDyW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 22:54:22 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D537AD64CB;
        Tue, 15 Feb 2022 19:54:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFW9QHwcNrm42Bh4s8+OopreCtsn7/i/4qdGwlrfZrmI2J2enXoKs7x8kqQ4RTP0jp4MU8neEdSEeKPSLBYsf/1zJqwZeHBch2xICwkNf4rbGz8F4ORzOLObpy7Fw9w2jHfjplH3fss9NOiWX/20WoyBt+WcgosBJkvG9m1qP4/GEruoqKXPDbghx8QQ+xsiDuEWNgPFSArhg0XuU0rxOGcOesrfENrRqFVpwBwJpfOrZxPrQcRQKQ2arDIOC6/CQLIBTFyNpk3QaytUTwy4ZWf6QrA/lmJlIie8YIRROB27Aq8jTsdQBRTeBZhyXgAzpDTff9nFJR99WWDJKYOa6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esPAJn/fevd6MF90rUCViRqDHVvY/oTGnvs80LtBkD4=;
 b=TTb2cLE1o5rspnZW/elkimQsemJdEapiP4Q35irbAM/TqtQv9HLzsB+DC9pK+8qZMFCAziJxRLZ7o88Rh86gUNSt8CiugajsnY9BKpKcdqiipL8DIchI3qr/LAt0oMY0bc7pj8oS+pyBO4zYHx63T8pecGuhFX2Wa0FFPaLUDd93hXE5l5RvkzLAgkKwwtcpv5M/GegP4nIy396khtm1eb10rrK/9Nu/1FJexqQ1tHzz2vgqWAr4AK87nOE1BEYJ+rN9gnp/qXlm5rIVNj+B0+obH1rnIxE4NsWji8BSzFpSE+QMK3WegiI1ZYr0WstRnatrD18PtVkbATRlS4GGXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esPAJn/fevd6MF90rUCViRqDHVvY/oTGnvs80LtBkD4=;
 b=g0FDc0BTb2Mo0V8bZ7nRVNVrYN1qpK8QRKpCjrTOtvz6FPHr6Mtz82+X7vQfTRWzPepstS3nTPSh3aRDxXQBfKYv/8eGV6Bn7+758k3ApxWKEE5YxfXgE8e7lMSsHVq+ZSPPYV1TX4n+sB8DGMKS15M9R/iUD3pBX7u/JjJQXWov9TtYKDiWMIndeZDRnhpkIEYaBEsrNR8z7gloZIqJC1zM9W1cjFo1cA5YXdIodRRUcVf2s7s1FZtSRuspx9IPydR5CY9AoKjn6HlBVRA85ax5jUEmDbeVR+XJkmELqeZojYoHFG6QPNjFdDl7Jz3OoW3snZQsHuHRos44jedfVw==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by MW3PR12MB4411.namprd12.prod.outlook.com (2603:10b6:303:5e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Wed, 16 Feb
 2022 03:54:09 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::94d8:5850:e33d:b133]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::94d8:5850:e33d:b133%4]) with mapi id 15.20.4975.017; Wed, 16 Feb 2022
 03:54:07 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: RE: [PATCH RESEND] i2c: tegra: Add SMBus block read function
Thread-Topic: [PATCH RESEND] i2c: tegra: Add SMBus block read function
Thread-Index: AQHYHpP+iBNzHq+ctEuAu+zpK3JSjayNO4IAgADToJCAAgsrAIAAAYMAgAA/wYCAAg7GQIACv+CAgABpCKA=
Date:   Wed, 16 Feb 2022 03:54:07 +0000
Message-ID: <DM5PR12MB1850AF583634853FB796581CC0359@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <20220210153603.61894-1-akhilrajeev@nvidia.com>
 <ae6d300f-962d-9731-bb78-3594b4c31aea@gmail.com>
 <DM5PR12MB18502CF86E602F7071A1EA58C0309@DM5PR12MB1850.namprd12.prod.outlook.com>
 <94fc8b11-6149-56ca-a028-cf7f39930992@gmail.com>
 <ff83adba-7919-fa48-4637-a4cb9b94a8e1@gmail.com>
 <f3db5152-0e1f-4258-4cfd-521828a243c2@gmail.com>
 <DM5PR12MB18509DCA809CCE62A4A74133C0339@DM5PR12MB1850.namprd12.prod.outlook.com>
 <bfed059f-046c-63e9-800f-b8c9b1544471@gmail.com>
In-Reply-To: <bfed059f-046c-63e9-800f-b8c9b1544471@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d70cc55-f642-4b6a-e6d6-08d9f0fffb71
x-ms-traffictypediagnostic: MW3PR12MB4411:EE_
x-microsoft-antispam-prvs: <MW3PR12MB4411467822E8265568EEC461C0359@MW3PR12MB4411.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tnL+qmbUvYH6ZvPWMEuKeblurKtQKMTUjaw3v8bSVPHjCsxf427oEK/OcIvsswzM0dQ5ryFvw4D8W+7yGZFJI7cH7FBuJ3bZmoePTUDqZTkvfE3IsY01wZTZUZCfe3NX9uWQ6xUT/beiotz4f0yBOLOHyV+I1oTm+0CTjnQdFbupuUWVFqTXe83wwVkW/5QEukCfk+VI4JaOaEY1b07QfFfK2eV9JmyuZgQGWggY7KqcsAH1F4Lr4iJWG3Vv58nWgLIAU8vvW7/hW7zd0ycbJZ/G+iZpq7ypNpKDrjefOd/6AitFyh5XkMLIH611Ikg/1YfPY/N2t9huLGe2qvaPjX12Ya3KgMsoWslwy/sH1nFCqVvyHPL2deslBYEmwNblgV6hIhPjKT8etMJtubOwkoFR2SFbwS6PQvUvsNLJVwfxD++cd7XEIwJatseqKmqjdIv6Zz8WjN71mR33Hg2H7DTAmu96Y44LhnnWyJa2oK1yaUKE1VJGjypSvdVE4TRZ+vI5jEvBX+OKQKC+Ka7SfBgdQpp2WwHBuRSUGY34aMiqRw3G6Uv/HWAN56dxId81IOF4lsNHxqgXJkcHvWV/r+TqztyXOwGBhmHEhQpDQwT8lBIGYfRZCvX96S5R9FsJLL6XfpkIa7oQJEIuTKsV2/3Ja6BGbsjkZHJh7rsX/Nf6Cz1AnP2oOIoMTHSWOXwk7gSZXqgf99UUDRtUbIx58Hn7I4iwaY8MS+5BdCX9iCo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(8676002)(7416002)(508600001)(5660300002)(6506007)(52536014)(186003)(110136005)(26005)(71200400001)(83380400001)(76116006)(66446008)(4744005)(9686003)(7696005)(921005)(66946007)(38070700005)(66556008)(55016003)(66476007)(33656002)(2906002)(86362001)(122000001)(6636002)(64756008)(316002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHQ5bmV1ZDNaa0FhaGZKV0pUSW01eHdOMHRTa01nZ0JCY2xKTFh0R3JUdHRl?=
 =?utf-8?B?VGdQRzJuK1RKM2NudENuSTVEQUhzVlVUcTQ4Z3NsUnNUaGdPWi9zUTV2eXJB?=
 =?utf-8?B?SjczSVdoNTNwcDZ0c0M3UWlaRWFlQUdJK2FqcTNOblNacXRyQXZUbDFKMEwy?=
 =?utf-8?B?VG9mUkxOTFcxVTE1SXZMb2hjbENpOUZLcVcrdDlzR2xHOXlUQ0d5Z21tNm1J?=
 =?utf-8?B?NElmZzFIcFArc1NyajgzTXIybnRzemdla0Rhd01QOE5zM01OcHRZQkFxMUxY?=
 =?utf-8?B?WXFpYi9oYkgrU2F3em1UWERTNzJIMG9zWVRKK3FLL0g2Zzl5U1NLTE56TFV6?=
 =?utf-8?B?RzJLMkZKVWt0T2tPcHFuWWVuTGU5cTdiOFAzZUhYNUdlcnB4NDZ6S2toRVhi?=
 =?utf-8?B?OEtsWWlwS3JYYjBVTEdGVVA5Zmp3WmVKeWdQb0JLa0I3MG95Z1ZDRTlCR0h0?=
 =?utf-8?B?L1lDL1hiUzBYZEZnc01xa1BOYUhsd2JzdWE1OERPQkNXTFFBVVBheFR1S3NY?=
 =?utf-8?B?Njd1aDhPRDg2UjVuV1FVRzZLbno2bDUwQWozQU5lRklYbG9HK0lzVHNEVXli?=
 =?utf-8?B?VW5JbXM5a0dCVjZJU2VXbCs1WWg2eDVxeXJjRThkNmJzaGZRZVh2aDc4bzFz?=
 =?utf-8?B?SHVRZ1BBWmFkcEg3MTFYOEgwMU1HYjhtMWNQRmtIblphQ092S2ZsaUlVMkFJ?=
 =?utf-8?B?L0dzekIyTVBaa2h2SHc1ZjE4MFZQLzV2S0JGM3hvZ1FnWDF5ZFRLWEFQRmk5?=
 =?utf-8?B?dnppTkRIaU51dWtRTUlucWVVOU1KUE81S1ZlaDNwejRaMlpRRm1iVEZNdDky?=
 =?utf-8?B?S08zVHlsSUgwVXBXU2dSTnUrbHZtMVlUcmdoWTdiU2o1U0xxL09BOS9NakZV?=
 =?utf-8?B?U0RQWEJscDZ0dUVYMVUzTGJPZGoyL3NiYWtkVDdCaS9YVHE4VWZYUXJyamdI?=
 =?utf-8?B?OC9KZWU5RnRLU3hvMHRkQkQ4a2lsY0pON3pkamFXcW9OUCt5VUtFUkJaSHVJ?=
 =?utf-8?B?ZEMzeVRnNFZhZUZTWStpY3BkTEs0QW5UZUVxWXpPL1FXbmNSVXdOTjNOSFNs?=
 =?utf-8?B?N1pzUFNIMThabTRjclF0YkhUNnl6RXdiWmw0bDJudHdObXZzUml5SncrR2hZ?=
 =?utf-8?B?MHZDOTF1WEgyRTJvbDJ3TTEydmhtaTZrOFdHVE16cGliUVlNSi9BUWVPMWht?=
 =?utf-8?B?S3g5a0FUNEFERXVBYUtNdHErTXVQdWJ5bE5rS0VUUHVSR1IxKzJQM1NPazFI?=
 =?utf-8?B?aTZreUdtNHU3eS9tV3VGNGU3aGVGOEJBWFZnZ3FLOGhBWHBtcGM5REtrSFBG?=
 =?utf-8?B?Vis3bzFvQ25KaXZPUFRUeHV1OGpzSDVML0EveFRVbXcvUXVncC9ra3JWYThV?=
 =?utf-8?B?czVGM2RTRTViQ1JlS2FYajk5aytncmRSTkxYcjBoTmhoN0ZYaWVOWElPUlFs?=
 =?utf-8?B?bXk5VFNsTXd2djhDeTROZG1WSXRvVUtaS3NOT2hhR2toaytnSGFyWHgxVEo0?=
 =?utf-8?B?OGVCNlZ6N0VWdjY4RU1hM25oY1hqM1dHTGxIZlBaVjlzbVJFU0xDMXNqY2lq?=
 =?utf-8?B?dGRxOU1sMVQ5dVZBdFh2aldtT0JsRFFRcVJrRnF2ZHBzOWNxOG9PZCtqNnlx?=
 =?utf-8?B?ODFtN3JmckNOdmtwR3RLNU5iUFlyc0ZjMDM4TTBnQU9wQm0zcXJIR0xtL0pC?=
 =?utf-8?B?VzFXMXNMTmRIdS8xYStHekl0aTRleFlzYkYxMDVodE85YnBTcjZ4UGJKb2JY?=
 =?utf-8?B?clppSjhWZmVGOUNmb3JVZ25NUS8wZkJ3NHZyUk1pdmM5QXdmbmFybS91b2Mz?=
 =?utf-8?B?NmlZZ2I0bkx2M0R3Qm83UUpHOEZTWWZQYkhYeXIvK1FRYS9PenFUTGRuZ1Br?=
 =?utf-8?B?Q1V3Yiswb2FsTUUwbGIxV0ZnazR1MzU2L09DWVJsdnZwd1pEZE1INVRHYzFR?=
 =?utf-8?B?ZTg4TFIwbkdGcFJnZUFrZU9JK3QzTTI3NEJ1Qi9sK3pmMEhORzlGT1hDZTR2?=
 =?utf-8?B?YlEwSk5qMjRiZWhnbEFLSnJOWmFjYzZtejZwenMya1hZWHRPT0ZEQlh1c1Nn?=
 =?utf-8?B?T2F1Q0IvRDNoemNSMmpIZFVpZzdORDN4SVFmUERRRmJlM1dsZHh5VEZpUFpw?=
 =?utf-8?B?VmI2ODJZc1NtV3Ric2RiTFNsbndJMU01bHo4UWlqNXNaTTRRMkRKbnNlK29C?=
 =?utf-8?Q?0WnWyeqJNZ01GgIMmkTEGCg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d70cc55-f642-4b6a-e6d6-08d9f0fffb71
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 03:54:07.3946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MgkQZd0R7VD4+q04pjmiwwrmJWWrvwz8ul86CvexHgWye6jp6ZUYtt27PdnMq6ZxUCug0FeHyY/l4uqW8BuMvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4411
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAxNC4wMi4yMDIyIDA3OjQ5LCBBa2hpbCBSINC/0LjRiNC10YI6DQo+ID4+IEl0J3MgdW5jbGVh
ciB0byBtZSB3aGF0J3MgdGhlIHBvaW50IG9mIGVtdWxhdGluZw0KPiA+PiBJMkNfRlVOQ19TTUJV
U19SRUFEX0JMT0NLX0RBVEEgd2l0aGluIHRoZSBkcml2ZXIgaWYgeW91IGNvdWxkIHVzZQ0KPiA+
PiBpMmNfc21idXNfcmVhZF9pMmNfYmxvY2tfZGF0YSgpLg0KPiA+IFdlIGFyZSBsb29raW5nIHRv
IHN1cHBvcnQgSTJDX01fUkVDVl9MRU4gd2hlcmUgdGhlIGxlbmd0aCBpcyByZWFkIGZyb20NCj4g
PiB0aGUgZmlyc3QgYnl0ZSBvZiBkYXRhLiBJIHNlZSB0aGF0IGkyY19zbWJ1c19yZWFkX2kyY19i
bG9ja19kYXRhKCkNCj4gPiByZXF1aXJlcyB0aGUgbGVuZ3RoIHRvIGJlIHBhc3NlZCBmcm9tIHRo
ZSBjbGllbnQgZHJpdmVyLg0KPiA+DQo+ID4gQlRXLCBJMkNfRlVOQ19TTUJVU19XUklURV9CTE9D
S19EQVRBIGlzIGFsc28gZXhwZWN0ZWQgdG8gYmUNCj4gc3VwcG9ydGVkLg0KPiA+IEl0IGlzIGlu
Y2x1ZGVkIGluIEkyQ19GVU5DX1NNQlVTX0VNVUwuIEkgc3VwcG9zZSwgaXQgZG9lc24ndCByZXF1
aXJlDQo+ID4gYW55IGFkZGl0aW9uYWwgY2hhbmdlIGluIHRoZSBkcml2ZXIuIFRoZSBjbGllbnQg
ZHJpdmVyIHNob3VsZCBwb3B1bGF0ZQ0KPiA+IHRoZSBmaXJzdCBieXRlIGFzIHRoZSBsZW5ndGgg
b2YgZGF0YSB0byBiZSB0cmFuc2ZlcnJlZC4NCj4gDQo+IFBsZWFzZSBzdXBwb3J0IGJvdGggcmVh
ZCBhbmQgd3JpdGUuDQpCb3RoIHJlYWQgYW5kIHdyaXRlIGFyZSBzdXBwb3J0ZWQuIFdyaXRlIGRv
ZXNuJ3QgcmVxdWlyZSBhbnkgYWRkaXRpb25hbA0KY2hhbmdlIGluIHRoZSBkcml2ZXIgYXMgZmFy
IGFzIEkgdW5kZXJzdGFuZC4NCg0KSXQgaXMgYWN0dWFsbHkgdGhlIHNhbWUgdGhhdCBJIG1lbnRp
b25lZCBiZWZvcmUuIE9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmcgaGVyZT8NCg0KVGhhbmtzLA0K
QWtoaWwNCg==
