Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1366CAB80
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 19:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbjC0RHJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 13:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232752AbjC0RGq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 13:06:46 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00024619C;
        Mon, 27 Mar 2023 10:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7Qpq4dBkVpr4Incm5Xk33c0PbulAPpTnipz+e8uXxNtkwkwleDRoRSHAj2dlUln9mvHSd37smjNoCn7uBnSLf5dCGgDvgfNyrfnvZePBsvBxW6LO6N9DZcIqxIwAL3oGPYyXqPHq+nSVAXjAZ6msCVm6MbEixciMLpZD5HoMBuECyWPxBoGUj0ib4r3TqN0upx0TOvhkT58WcMfgdj7cZGQ/WAtPbRSjnb5kexaubzeK1opvNynsyhRk1QMYB+QL0ot0n1rSl37EsGgh5FO8MfvnKlgbaPeTKl/3Bg+8n+aUBjgLhCMuIKoiujY2GfvKTCk0WdqMnur41C3Lx4WIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjbyIeq+Ui0gjX6IYrw/Qzi1laJaYfesjGbKxE68wjc=;
 b=AB14OTm1pPbRpYWUl8QB6ySW6g8YtXph/rqVH3sG6Xkrtmbes9DYi5cN5B3xZ/hjmFRLcr8sPPANwy+P1z2psAvUZ/edK6aR028UeKNNrWDVy4wftUhcRdHK4eflJg2SEfuSVxVnNj4nWZ4pRQCorNC/qb5JD4KzOjwLP90p53ORge0jiZz4IT8JjpquOeDlNwZrTe4xVL6L5bb2647a3ZQWEVGkl8LWUcoJ4kWEZEmmiFtOFP+IkqI3FjKMyhh+G5MvmWkk38oB9upkfIa++ZvWh1UnYd3Hi20E4wX84G9mEyr1JdOa9Gui9pfSXI+yLeEjONnY7Vfn1cKvntpkpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjbyIeq+Ui0gjX6IYrw/Qzi1laJaYfesjGbKxE68wjc=;
 b=PA6c2Y8KyoY0orr7ACAREIAD1AuadTDKEPLV+jSxYiXlU6Q/e9vb0b1jpyZwAcW6WtENPRPGXk7XmOLtz6auo11MHXEFcxuJDo4tV7euQ1SBPsgqGbNmegFScy10TAu3lbREU90+bzD/vDocBPkIFOAb4aEj5e32Fu0YIlpBkco=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH0PR12MB5154.namprd12.prod.outlook.com (2603:10b6:610:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Mon, 27 Mar
 2023 17:05:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 17:05:02 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Mark Hasemeyer <markhas@chromium.org>
CC:     =?utf-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 4/4] i2c: designware: Add doorbell support for
 Mendocino
Thread-Topic: [PATCH v6 4/4] i2c: designware: Add doorbell support for
 Mendocino
Thread-Index: AQHZXQIIuegHdzU3/kyhZjCumBVofq8O2s6AgAAHhIA=
Date:   Mon, 27 Mar 2023 17:05:02 +0000
Message-ID: <MN0PR12MB6101BAC6CE48B0109F099708E28B9@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230322210227.464-1-mario.limonciello@amd.com>
 <20230322210227.464-5-mario.limonciello@amd.com>
 <CANg-bXBBP61c1kUSKz6fgg2NfjHBO0sgXmqvV=AzUWBket6UFQ@mail.gmail.com>
In-Reply-To: <CANg-bXBBP61c1kUSKz6fgg2NfjHBO0sgXmqvV=AzUWBket6UFQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-03-27T17:05:00Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=d3731061-5f61-432e-97b4-8f93916648ac;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-03-27T17:05:00Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 9ad3cc57-2875-4112-8b3e-276bcc5a12e7
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|CH0PR12MB5154:EE_
x-ms-office365-filtering-correlation-id: 38423abd-0d5a-4f77-bfeb-08db2ee56776
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EOTge9MJsYeskix6JY5zkt84Y5tUktHRWgmUHcBb0t/3SoVQsoXBY3cZ+J2InJ3idwnNZv+xpAOzIuu4TSVyiNC0MZwOcPaPcl6pfvEBXm+DtNMgPmHr4tbFbWX81vrw4W36SjUbda1DmTVZywDMbT9wbpq5YK/eWFqdAkWtaIB5hJZPCnbh9MvkMboHWK2cNDMHuvfbTKFCCn7Mym05kd9LJ5xZY0DkZa7CpR7dVxmqJ9XufPPFFOfywq7VGokq4cTswk5j9p3lbbEiV0NSL+R4skHZfiS7fIkQ/LNQ3CbxQfKOA+MGaA0K8AlLtv2vcy45Ft6PG14SRfm2E5oiSmV0ahFIuA1xIrssInhsOY8hiJ6b+vQd2BEbuF5bNNfvvgQEZwH/BpE4p243Jlg1KxF7CAmy0yj63QnfN9L/p2dnSMZvN+BgG2d3XQxEgU4gWT/dbSfP2ND9huJL10jvAgOvrN45tii1oroPag8t8saS7q4TJxaAWBXGlArPAnx+sOXAaHSvK4uXMul+tI5/0v8FWMwQvMuxJKi5WjoIMM7o5BmwFtYO8m/HWYP+O9lv8Q4mwbSlWU3iUc/QJX9zBnDxNPrVQW20IbVZvgQEfWmUIJw2u4N9rHlZP+QgjuWu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199021)(83380400001)(52536014)(41300700001)(33656002)(86362001)(5660300002)(38100700002)(8936002)(122000001)(66446008)(54906003)(7696005)(478600001)(71200400001)(76116006)(64756008)(8676002)(66946007)(66556008)(4326008)(6916009)(2906002)(66476007)(38070700005)(55016003)(6506007)(26005)(9686003)(316002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFpjN0I4SzZoMG43MGtIVzlVaDJhdnloak9zeUI1SUNrSGswcnluWEhkV01G?=
 =?utf-8?B?akp3djkyNmtiNTd2TzNSUlB3Q2NONzd6dHNYU0lxVGVWSzhGZTRqVnlQYlc1?=
 =?utf-8?B?bFdrU1B2RFNySEkrWU5adVl2cFkvakNMZmRnbHFSRm1WcnR5c2g1RndsanJZ?=
 =?utf-8?B?Q01FZGNJbS93NWxaY1pPWThVdlJvQjBRWlNKS2RuK29kZHpTS0Z2d1dzNzB3?=
 =?utf-8?B?aXZMK0RPc1ZyTFIwWmVBd0ZkdWRrNWpneGdYcTRqK0tqWEQ5YXVpYzNRTEtK?=
 =?utf-8?B?bXE4UlhBeHgvVFlWdUxuR3BWSXZVSFplYnBBMVR4SVZ4bUR6QnNPNTlKcW5u?=
 =?utf-8?B?S09YTEQxYmtTNVBtK1I5TjJqOVZxNlQ3QW1GbVJnSFZnMm1VN29VTXlkRTdk?=
 =?utf-8?B?TU92c2dXMW8vbFRWUkhkTGJuQUxKZUw0SS9WWkF4V1pKZjN4T3lpeUYrdkIz?=
 =?utf-8?B?R3lreWZiMURwc1BkMHhJb2g5azFSNEM1S3FySXBmMmdUbGNEa0YrR254Vm9Q?=
 =?utf-8?B?eU9Db09IOW8zMndZakxjZE5oQ3ZSSFFRZ3puY0IxL2c2RzFNWnNYZWkwRGtC?=
 =?utf-8?B?bEVocGMrOFc5UEF4UE9nc1h5SFd4RHZyN01nUDU2MW9Ubk16NVRCb3FLNkVF?=
 =?utf-8?B?YVZtbDYzN3RUSFY3U0kwWmRLbTJETHJwUUFDSDVXQnN0ekZUT3VNMjlmc0Vo?=
 =?utf-8?B?ckFBZUFmam5iSXM1VWFDWmlydFN2WG5uY245VTN4dU11Y0Y0V1RnQlNzWUlZ?=
 =?utf-8?B?ZzM4WlQzWm56UUp3L3N1K2toMGFvUnlZUWhyR1BURUwvcS9SNlNobHdJb3pE?=
 =?utf-8?B?U1JUVnFUMXdLc0JSYmptTGdNcHkxTVJHRXFlMDlIY0VSSkFyTlBYYzNKZkhp?=
 =?utf-8?B?ZWVwdE1UOTlRMWhvTWJEdnpsUVZ4YlV5dTlUdTI4SzlKWXhtdnl0SjNFbnFz?=
 =?utf-8?B?azNQRmxnNTNLQzAwVTZPQit6SGV0Wm9NNEdmWTRDbVc5dUVhdkkxay9KQXgw?=
 =?utf-8?B?NUhHUC91RklDczlPYkZFUURKSGZvOEJqWjNLNzl0blV4WHg1WUhTdm1KMWhj?=
 =?utf-8?B?ck8zK2k2MEVBSzY4cXp3dG9QSVNobnN2ejU1NCtLbUZYSXFEVzRNcGhlWjgv?=
 =?utf-8?B?bnRYTVErMXExcXM3bDNNRnZtT01NTVE2eVJRdENnTjNRU2x3b3FVVm5xcEZh?=
 =?utf-8?B?MHRITldxV2ZLZTNadVFhN1NmamdmS1hHTENjSU1HOTUrSUlWZGNaK2srU0xm?=
 =?utf-8?B?R3JqVTh4SFBadHdNeklxcmJOWjFHd1FGRTBQNDB0WC8xaUNCNGluY1BFUW8x?=
 =?utf-8?B?OVRjdFZ0Qy9QYTNGZDUweHdweFczZmRQdlhPZUU0azdsWXhjRWpKb1VpcEJ2?=
 =?utf-8?B?b2swUmQ2ZWVjVDB0WFNlUmhjMDB2RGdwSVpEZTdKYlpvaGZsVEZIdkhWV2ZN?=
 =?utf-8?B?V200elFSS21peDlRWHdrVVZvUm90dUZMNTBZTUpVa1ByMi84a3htSVRmT2dG?=
 =?utf-8?B?YUhINy9FbTdmay9qOU5zQW5GQkZYVU1MbmVGMlJ1T1hqNmRNbVE2MnpHRWNh?=
 =?utf-8?B?aHBZeWgxalFPbjdOZTZya0FqOUV1bTVBOWVqLzRJUEJhS2JNMFRYVGxtNkhL?=
 =?utf-8?B?NzYxdnlldWV5alpFMXYxZk1JSjNsa0JRZXBZdlhmZWhjeHZpeXZTc3ljbG1u?=
 =?utf-8?B?aVppSmh4dWFqckFmSnl1eTZWTGRxa25CNmxtdGtYR0tVdm1TbXdQd2hZczNk?=
 =?utf-8?B?V1NBdVJWRkRFMklwd2tKRjliblVWVXJlaDI0eDhocHUvaUVTa0FjVUNaTlBO?=
 =?utf-8?B?YWN4MkxLS2xWYnVjY3UxWnAvV2VlQTFpMTduUWVicTI1b2lYM2N0cmpEeElN?=
 =?utf-8?B?VmNWQnFmSDMwOTMvUU11aDdubndLMFYrVVNjaWU1bVh5dHo2NEtRRlFZa29G?=
 =?utf-8?B?dVR3L1NnYm9RR0s5WFRYdzRsNnpycjYzZld2OWt3REZrY3BJaUdBU3dLbm94?=
 =?utf-8?B?ODJXMUxwVEhCY0NwZkxzSk9VUHBsUkZqd3NOdkpUV2FXYWpwaC9JTVdsbnkx?=
 =?utf-8?B?OENlRWpyRzIrZTUvcVRoNFFVd2RvS2VzSk50SkF3UHlwc21nS0J0eDY1Z1pl?=
 =?utf-8?Q?F1cc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38423abd-0d5a-4f77-bfeb-08db2ee56776
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 17:05:02.0860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6JPkzJQc/5tMNos76tn/+6fKpzW3ZfnCY0/LpvQB5yofPD+OZHiy98NnDQ02XnDHCKWyscDj9dQaDK2oWYf56w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5154
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W1B1YmxpY10NCg0KPiA+ICBzdGF0aWMgaW50IHBzcF9zZW5kX2kyY19yZXEoZW51bSBwc3BfaTJj
X3JlcV90eXBlIGkyY19yZXFfdHlwZSkNCj4gPiAgew0KPiA+ICAgICAgICAgc3RydWN0IHBzcF9p
MmNfcmVxICpyZXE7DQo+ID4gQEAgLTg3LDcgKzEwMSw3IEBAIHN0YXRpYyBpbnQgcHNwX3NlbmRf
aTJjX3JlcShlbnVtIHBzcF9pMmNfcmVxX3R5cGUNCj4gaTJjX3JlcV90eXBlKQ0KPiA+ICAgICAg
ICAgcmVxLT50eXBlID0gaTJjX3JlcV90eXBlOw0KPiA+DQo+ID4gICAgICAgICBzdGFydCA9IGpp
ZmZpZXM7DQo+ID4gLSAgICAgICByZXQgPSByZWFkX3BvbGxfdGltZW91dChwc3Bfc2VuZF9pMmNf
cmVxX2NlemFubmUsIHN0YXR1cywNCj4gPiArICAgICAgIHJldCA9IHJlYWRfcG9sbF90aW1lb3V0
KF9wc3Bfc2VuZF9pMmNfcmVxLCBzdGF0dXMsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAoc3RhdHVzICE9IC1FQlVTWSksDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBQU1BfSTJDX1JFUV9SRVRSWV9ERUxBWV9VUywNCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFBTUF9JMkNfUkVRX1JFVFJZX0NOVCAqDQo+IFBTUF9JMkNfUkVRX1JF
VFJZX0RFTEFZX1VTLA0KPiBUaGUgdGltZW91dCBlcnJvciBoYW5kbGluZyBtZXNzYWdlIGFmdGVy
IHRoaXMgaGFzICJhY3F1aXJlIiBhbmQNCj4gInJlbGVhc2UiIGZsb3BwZWQuDQo+IA0KDQpUaHgs
IHdpbGwgZml4Lg0KDQo+ID4gQEAgLTI3NSw2ICsyOTEsMTMgQEAgaW50IGkyY19kd19hbWRwc3Bf
cHJvYmVfbG9ja19zdXBwb3J0KHN0cnVjdA0KPiBkd19pMmNfZGV2ICpkZXYpDQo+ID4gICAgICAg
ICBpZiAocHNwX2kyY19kZXYpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRUVYSVNUOw0K
PiA+DQo+ID4gKyAgICAgICAvKiBDZXphbm5lIHVzZXMgcGxhdGZvcm0gbWFpbGJveCwgTWVuZG9j
aW5vIGFuZCBsYXRlciB1c2UgZG9vcmJlbGwNCj4gKi8NCj4gPiArICAgICAgIHJkZXYgPSBwY2lf
Z2V0X2RvbWFpbl9idXNfYW5kX3Nsb3QoMCwgMCwgUENJX0RFVkZOKDAsIDApKTsNCj4gPiArICAg
ICAgIGlmIChyZGV2LT5kZXZpY2UgPT0gMHgxNjMwKQ0KPiA+ICsgICAgICAgICAgICAgICBfcHNw
X3NlbmRfaTJjX3JlcSA9IHBzcF9zZW5kX2kyY19yZXFfY2V6YW5uZTsNCj4gPiArICAgICAgIGVs
c2UNCj4gPiArICAgICAgICAgICAgICAgX3BzcF9zZW5kX2kyY19yZXEgPSBwc3Bfc2VuZF9pMmNf
cmVxX21lbmRvY2lubzsNCj4gVGhpbmtpbmcgYWJvdXQgbmFtaW5nIGFnYWluLCBwZXJoYXBzICJt
ZW5kb2Npbm8iIHNob3VsZCBiZSBkcm9wcGVkDQo+IGZyb20gdGhlIGZ1bmN0aW9uIG5hbWUgYXMg
dGhlIGxvZ2ljIGFwcGxpZXMgdG8gYWxsIHBsYXRmb3JtcyBleGNlcHQNCj4gY2V6YW5uZS4NCg0K
T0suDQo=
