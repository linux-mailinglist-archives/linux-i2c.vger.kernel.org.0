Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A494E495F02
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 13:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350331AbiAUM3s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 07:29:48 -0500
Received: from mail-bn8nam11on2083.outbound.protection.outlook.com ([40.107.236.83]:59488
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234491AbiAUM3s (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jan 2022 07:29:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQ/9gWN5/YG2HRicYjbgPmABeAR99qae+XaHyQCVpqx+yDRxsnhr110ImTOzhXZp4qtRsoO+aAP0oMJAry+WNGsaiQkpwkWMtEIfvNPUJNEJx1Af6uqgD69gvPg2IRxivdpZRkCbRlnjxpfq1cjJBdNi7UFrBJlk/UAl/xTfC6eMqFuw9SvILepTII9hP5pJqnEe+BdI730mlCIZX7M+dfSHfEIIiohHfiyR34zLNRtd4DPim2yYo7DX8kP3WMxkpV99XhrIBEE+Gr1zIzKTMvlI1Yfj5eXCAwPDy0kWOYYZcuS2keI5Mc4vUtMYG9DQEUlMUYzHZLpC070Oj5Tonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCKIgyxfndgjJV7I2RG31rwc6Gi+rr77Zg8PVKIqcyo=;
 b=iaDhwKZNsfemPmPwJe0tR0vQP/6y6XA+drLdvQg3N1b6AnACbKlBlUGarguVC8pQJc8Y35Y/RIHuRNhMSBbKIXYCEeqJRoL6lwWaKqbiNgsJyu+9vFUU5X/+KNSJgrAthNmjKtCJjr+qeTY24Fuh996NFhtP6GYeyVdm3zIv28cod0HSgNgxAo8+xzbrGLTIsz4L6bPKkPr0jpr9ATsVCfhQvt8dTmLD/tNKAJQ+/qrAC87/N78ODwV5xDj1XPQGsmatlYv2lE3XwYGVBVGXGwZNUHnsLU9Wg0wyoX18NFI8lwhoTLnxX0mxeNiXz75zEWnyUzZNtRfzEXDwnIHEbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCKIgyxfndgjJV7I2RG31rwc6Gi+rr77Zg8PVKIqcyo=;
 b=Dg7WtsCL5PhHZrdHTxjyAJ2qhi0DsfdQdV8IOGOietpRyxwzZ4OAZ4ASmWFmVdulox9CMMKn4BVzGlPwob7vEa00MMLN3ygLOzH43iDLVCeYr8yByyzA0slwT64bPOVKqUyMKiea1nhwOukfwdZjydIJI7P/RwIXc3+RcUXhUwnSr0VOYp1qBovxe/Kr+vKr+MEizu48Nt3u8SxCY5TQ8ieLIQP5NV3vg1JVUybSdQi/snAMcVrfwh4cyPILchI1mVwsIJfxP30mOzGC4VJ6wzk4Y9ivbMA/lwe7x9PYDwREwrpxQO4RDArlr0GCuxQmr7HG0lHsAie/2yRCOEaaqg==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by MW2PR12MB2571.namprd12.prod.outlook.com (2603:10b6:907:10::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 12:29:44 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851%11]) with mapi id 15.20.4888.014; Fri, 21 Jan
 2022 12:29:44 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH v3 1/3] device property: Add device_irq_get_byname
Thread-Topic: [PATCH v3 1/3] device property: Add device_irq_get_byname
Thread-Index: AQHYDgP0GKDzb95CsEKkwcPPL/OBh6xsACaAgAFnUBA=
Date:   Fri, 21 Jan 2022 12:29:44 +0000
Message-ID: <DM5PR12MB185082C3D5047815F18F42BCC05B9@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com>
 <1642686255-25951-2-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75VeOvXf6twskZp-Y-s8AQEpftA0SOUJfXqO5sJ1FKNKgCA@mail.gmail.com>
In-Reply-To: <CAHp75VeOvXf6twskZp-Y-s8AQEpftA0SOUJfXqO5sJ1FKNKgCA@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4465a1be-48b4-41fc-6139-08d9dcd9b4a0
x-ms-traffictypediagnostic: MW2PR12MB2571:EE_
x-microsoft-antispam-prvs: <MW2PR12MB257194E7D28662AC5FF0F5CFC05B9@MW2PR12MB2571.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9t9/y+u2kxwtM//PXqwvFVbH0rKuuSQYCEbLsDej22Q5JI9IMnd8D51GyXn5W5ObHzWfU65ZuGjqtMSvdPQ3GgGMOrs5t14J104M8iqszrTqnZGpHMxACYt28PqRJuAk6A7XmO4qSrla4zjAewSMU2s9Hqyzgvvz74YIKyn5R9nSNvzxP5b3t+u1yMHLG9vtePQf0/vG86klqGOQ50cereBG7nCJiLCNnnn5yJdRqf2YnWvl7pMkeHylbrfWQ2Om23mAO2mONdK0C973B7jPx7770cvHSLf5s9Co1iLIUcJjFkF64V3qXqrst5EKGGcfRExrhyK3jjim544/Emv1rUKM7do4ZF2vKwX4TZt4A5A+Fljh5v/YTN8oMufWaAM2BHXv1BDDivWMEzwoa6l6xITbujyCVIPqIbWQ5yTWKK0t3IvuJcLkxYQCDIvKCdTztHtPhq+kgZ+tQFC3IGgzlfEpezzY84IssYqNxifnyYEGruQoF56kFPrpbYHQJDqota6U8lbajfGv3sQnfX9BNrqSvk3UPcU5bGF8uxrT+ZUn5wwbIJ0AQH8+jPV99b/WVjCf4vrSwaIeub+mclKqFZFffbTvJcjdFzffiXhDbAJDjvgmpQ3SXdGLVeiDbRqAiI+/vg94bGqKn4JeKxCDEt06veFVsYWyvD5nBEdn+pDl1vCM3CD+Bq+MAyw302nDtVTe2wAMhwOCoYfWekXUdg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(71200400001)(52536014)(6916009)(38100700002)(33656002)(7416002)(7696005)(55236004)(186003)(2906002)(508600001)(316002)(4326008)(76116006)(9686003)(6506007)(66946007)(122000001)(54906003)(5660300002)(8676002)(64756008)(66476007)(66556008)(26005)(86362001)(55016003)(8936002)(4744005)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTBWdXVoREhiSDRCMDdCNGtJMEp2Z0RTMEZoQXJQSkxEeCtZQTk2NlorZ3dZ?=
 =?utf-8?B?NUtpQWk2YmJUZ09UdEYyKzFGYW1MNkxjYzF5Yjc0RjFJMG9yZ0IwUDFkYU83?=
 =?utf-8?B?WXg4SzRqeVErekgwa0RNTEhFYlFPWU5YeUZhWlc2MUpqYTJzUy9xZlVnNWVr?=
 =?utf-8?B?TVppWXFxTXRpS3FQQ2lWcStYSTNnaW5veXV5MEFMSVl6a1VqQTRwTDllYk1E?=
 =?utf-8?B?SlVmUDRKNUtmQnI2cFBTaVdtMGJTRnFNZVAxSlAzQUlrSjBvbEkydUVDUEl0?=
 =?utf-8?B?VTkxcFBoY1N1Y2xDUiszR2IxV1EyQWVlbEZiQVN6Qmo2WUlsR0tLTU42OWRH?=
 =?utf-8?B?WFVXTTF6SEZCMjlzbVJSV2RxQ1RhNjluMW8relRBM0V6TnJSdG5BUFg4eEJv?=
 =?utf-8?B?b0dzaWZkbk9uV09UNXlMYWhCN1h3SEpRa3Y1ZDlHNUtRVEJJcW5BL292c2xB?=
 =?utf-8?B?OXZhMnM3QW44eTA4TDlkbVgyMVp4SnMxaWxqT1d1cmJjZzZzdTVIcDJzS0t1?=
 =?utf-8?B?UU1pOFpGSndoQUNXUTRSMEk4ejVZOXQvNjBEdTFESWlYcml1eDhtcmsvK3VN?=
 =?utf-8?B?SWVHaGtIM3FNb29OQzd0Skw3eStLWU80ZEwwaEtIblNBSlBGRm9zL2FnS0JR?=
 =?utf-8?B?enR1b3ZvRkI5NmZac2RZU1RQa1ZwTW5ZcHkwb3dKVXJYcEZEVnZYbWJIbVFT?=
 =?utf-8?B?aWxkOFhxNE1LYnBhMnIwaVBPOFhvQTlKWGg2a1FoZEdaWHpXajIyMXc3R0E1?=
 =?utf-8?B?UW5jQmtJQVRWYW1taEV6bWtidEZncHJVeDJvNEZTVS9zaDRDSStaVEhSVGpi?=
 =?utf-8?B?R1Q4ZytHN3g0RUJ1NnBNbWpkSzdDeTExb3pvSDFOVDBRT0FWTmRLYWRZWTF1?=
 =?utf-8?B?d25TV2o5cENQZ0hIbHNFYXg0U2tKdndkLzFHVGEvYjJTUFRmNTVkUHZMbXIw?=
 =?utf-8?B?NkdhKzU0aEhFbFNwZVFBYVQ5dldPeDhEbk1VZEVrSlBXdkpCcVZXbnIxUmJ0?=
 =?utf-8?B?Z2pJVGJPM2xZUmJCQlZhak0wSjNaUWczY3NlbzgwWFNtdjVMZVBhakxMTmdQ?=
 =?utf-8?B?MUxkWXhxNGo3c1NjS0hQY3FTblh3azJ4UkFFR3g4bU5KZlVzM3UzRmNhSzlV?=
 =?utf-8?B?WEl5U2xNMTFLdjB4bjVxOHFhV0tobGxxbVRwTGNZNWErNjNJcUVvLzNvR1hU?=
 =?utf-8?B?KzExbm0rUWdCckhIZ1hyKzFSRU9hSnk5bEp1d0pwZXFiSW96TW9SS09NUTdt?=
 =?utf-8?B?bkpGYTcrSUtNa1hCQWhtdUQvcmZBL016dHFhY1NGK0kvUVZBUG4vcFowSDNt?=
 =?utf-8?B?anhBcTNOYjMwQWRzVXZhcWtja2ZqV0NKZ0NYcGhkSzFHaGxBUWVaRUk2MnEy?=
 =?utf-8?B?bm1EOVRLdVFKTkd6L29oZ1pCcHJ6cFdrbEs1ZEphWVgwL0hBRmQvbnpBUEJ0?=
 =?utf-8?B?eG1jV2lITWFUcUZXOUUzRHVsOHJPcjNKb1o0VjJQMUU4VWZIZlA5UXlkMmpr?=
 =?utf-8?B?ajV6OXlLK1VocDlsMEExcjVMV2tFR0oyakJrNjZHdUJEKzErajk1MlVzUDlU?=
 =?utf-8?B?MWxQdUxTOUJDTmc3ZmorRm5WTUg5Y0VadzBCZUpOamxKR0R6WEg1cmRuUC8v?=
 =?utf-8?B?NUFTNmI0OUpOZjNkK0RuNi9ENXdvR0xSUUhsL3VSRWp1VnBuYXB2cVd5MS9w?=
 =?utf-8?B?blMyTTd2NTdaSEN1cUE1VTFFRlRZa0c4L3NaWmoyTDE4MStXSFAvU205ZVow?=
 =?utf-8?B?ekFVbzFWTnMxKy9iWU5RTGUzSDZ3aENjNmhBMnMzWFYvOWVnZktMblNHVzFu?=
 =?utf-8?B?MHU1ZVFZWXBUNXd4TWgweE13NS9YcGpQZU1PWTE3bU95WGNGQ1Y4UEY0Vm1r?=
 =?utf-8?B?VUZZaWhPMGZYcktkNzFMcXFXYVBzWjFjNXJ1c2pzbWRQbTQwcG8xMko4UVNt?=
 =?utf-8?B?VHk1TWwraThPeFdsSVlKSzdwZXB0THJkY2FtN2syQnNoUkRSVU45N2F2U0xl?=
 =?utf-8?B?VHF3UElsUVRjblUrWnZseXNaK0NTV1BxdEpGR05kL1V2cmduejQwK0hPM3c4?=
 =?utf-8?B?MTFERGJZNTFldFM4SlVRREpLbjRZMzdJSDM4WjVTd052bmc1RG5yME1zNGV4?=
 =?utf-8?B?dkhTUC9BcVRiMFZFTFJoM09PS1Rqa3FSZTZMK29yRGpyV0ZsdllWeWRaN1o3?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4465a1be-48b4-41fc-6139-08d9dcd9b4a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 12:29:44.5121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zh/pO1WW9ImQyyWfWJFaVuLolmoVrFWG99/hJ/NXqMgNE2HVYfXDidmhIYEr0W1Rz/Wq4g+4WY2pBN9ysBrxDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2571
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBUaGFua3MsIG15IGNvbW1lbnRzIGJlbG93Lg0KPiANCj4gPiBBZGQgZGV2aWNlX2lycV9nZXRf
YnluYW1lKCkgdG8gZ2V0IGFuIGludGVycnVwdCBieSBuYW1lIGZyb20gYm90aCB0aGUNCj4gPiBB
Q1BJIHRhYmxlIGFuZCB0aGUgRGV2aWNlIFRyZWUuDQo+IA0KPiBUaGlzIG5lZWRzIHRvIGJlIGNs
YXJpZmllZCAoaXQncyBub3QgYW5kLCBidXQgb3IpLCB3aGF0IGFib3V0Og0KPiANCj4gICBBZGQg
ZGV2aWNlX2lycV9nZXRfYnluYW1lKCkgdG8gZ2V0IGFuIGludGVycnVwdCBieSBuYW1lIGZyb20g
ZWl0aGVyDQo+ICAgQUNQSSB0YWJsZSBvciBEZXZpY2UgVHJlZSB3aGljaGV2ZXIgaGFzIGl0Lg0K
RG9lcyAnd2hpY2hldmVyIGhhcyBpdCcgbWVhbiBhIGJpdCBkaWZmZXJlbnQgaGVyZT8gV291bGQg
aXQgYmUgZ29vZCBsaWtlIHRoaXMgLT8NCg0KICAgIEFkZCBmd25vZGVfaXJxX2dldF9ieW5hbWUo
KSB0byBnZXQgYW4gaW50ZXJydXB0IGJ5IG5hbWUgZnJvbSBlaXRoZXINCiAgICBBQ1BJIHRhYmxl
IG9yIERldmljZSBUcmVlLCB3aGljaGV2ZXIgaXMgdXNlZCBmb3IgZW51bWVyYXRpb24uDQoNCk9r
YXkgd2l0aCB0aGUgb3RoZXIgY29tbWVudHMuDQoNClRoYW5rcywNCkFraGlsDQo=
