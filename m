Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D55495CAE
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 10:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233335AbiAUJSp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 04:18:45 -0500
Received: from mail-bn7nam10on2046.outbound.protection.outlook.com ([40.107.92.46]:42913
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235232AbiAUJSp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jan 2022 04:18:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2JCozzSa2z/W09zJ9heS1Qp34z4Mz0HtVEj2B3HnPB/jKIsSxcNZeI1M63qby1o47cIKJk5y0Zr9Xc8/WbxLT90PimzMcIp3p53e4cv2Dii8R6wcTCTKDxjl8/96Lnmgk1DiT+JyQCgAVvtCzL//Oc3HbWwgJ3ifmxLgHmcnlpCNL4fSlSMbpbW+smUCBd+yuANXPadk1OXvGzNEQoVgNjNGWzDEvPK1kctoN3NnVTrzVp8m+UE3JGO64KRgCdmGEazTSDP5qugO1WCFdvRUnkG3xbCo+JbYoCvYYS40MD7kTbuYA2P5yAEIlVQluo2evmE87VUEtsxSiCmsrG85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56+ujtCnJmxp55pgAe9NKelPtjqa2zqm2yAyTSFk40c=;
 b=DdenMRciNSN37F2I5l29wY+27HjgEYzofQ3tnL8pzEq0x6fR3aPN23AH3vj0QPkQAnsMhhEVj9besjqyTKQNEuCbrcVMTGMEHVAzFR98XFOXNBBB199EL7/Iy7bF3J9KlBBfx33db5XXGcuok0QZ34e6UA6i+VPqvz6JqEWNeL4dcUxiN1OntoWdlFBd5Lyx/qur5gDun5umIR32HxErvxiPUIhCO/+hYJno5D4GuGyHq8pSKXHf5T8IRmB73chIqFXrXnbnIS7+Aycl965dFxjkN25McbwrTSrfShNNsdl/D+FWnpjL59lp84wJPlqyOyytvPVUOgEQ9Gw0Lc5Nbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56+ujtCnJmxp55pgAe9NKelPtjqa2zqm2yAyTSFk40c=;
 b=Or/mMCsGojmXfw6j/z8x+C3EO6jkY+2h1BfZF25bRre1HvdriAG7tM56TANHW+bb/jpJFQHAAQTUCCgslt3Quy8hH49ZgYadGuJLLu4xKb01ASUBTxkF6hDWi8cq+7fAeUFtsG6HcGyuCocYsL2pyurs2fpk3dzmPRv9kKEHs8K5WM+8uBhWn1axWlKN8wmsg0/Xtdag9psM8RL0WVES6v5cgTUP+RkL6J4R5xYLUA1PvyRp4BfzCcgp6Kfaoj4I7PmKuJBkQKlr7CvAzxl9kia8CNF77uINizzqiDvq/60LK9jpurIeQLz9NxWKYsjohZ02DTss/p1KftSP50yrHw==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by DM6PR12MB2731.namprd12.prod.outlook.com (2603:10b6:5:45::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 21 Jan
 2022 09:18:42 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851%11]) with mapi id 15.20.4888.014; Fri, 21 Jan
 2022 09:18:42 +0000
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
Thread-Index: AQHYDgP0GKDzb95CsEKkwcPPL/OBh6xsACaAgAEwamA=
Date:   Fri, 21 Jan 2022 09:18:42 +0000
Message-ID: <DM5PR12MB18504794AD0FB11536F893BEC05B9@DM5PR12MB1850.namprd12.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 1a47f219-f83c-465f-1a0a-08d9dcbf0496
x-ms-traffictypediagnostic: DM6PR12MB2731:EE_
x-microsoft-antispam-prvs: <DM6PR12MB2731074FDCC89AF3F953D60AC05B9@DM6PR12MB2731.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: djGWOnYtMTvMhJiKjLz4mngoFiubEPGpXvIbTndr0RmFySzaHe9DR03a4tWcuevwHErLbDi8jXQ4ffHTpwkE085X+H3w6dPuGrLWv6Yl34Ev1fDEXt6Dh58qBmV6KzDR2Bgma5Ux76FQ18r/WkOmQmN30z2w0n5p+oVI/tdoRsL/ioC8GJGWYtlVjQvGltJHppqbStdTVs/ER4IzurlmcbqJeE+g59kzTpoXWrgzhjORjsZP8M9L3nO3CzW70eav0+hWZ/BOjSexQkiy6Ru8T/i3DJDoEJjGK2J9H4QsP9nujCAfQK/U5EWAeoJ71CXJKyNGaJcEDhCh+44B+48muvIgXGzJCcRualWzROuJ7g8EYA/+nsONAX68H5onqZzzPU3jELgZ+LbHmt65tpVnuGza8XRj5BZ+VinTgAjXBCTZM0HSf1GBV2EY5sTWfV2rSI7q6KBgXOZmLZlbJW7QOfUSFEFPgw5woEn1j38r8byy0ETJSFK/MteYttDIYS6W1znQV5csWJ/dYEwqmiJQcDoKgVyenNGLKYk7dL+mPb0j48xlnUd1rZjxA5vV9417RDFLunN/hV27pTPmwopaNTUElFHeShFVTPnZP8LjZtcGMtarzYB8t8uSLrgHrsIWjGminwODnyo9AZAWq1GExZL6MaYnUizbkbSs63y4dL0CK5Npz9Sm522zVjexUuV3P9busEjGpMIS7XT0rnuErw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(38100700002)(8936002)(64756008)(33656002)(38070700005)(316002)(86362001)(26005)(66446008)(2906002)(4326008)(7416002)(66476007)(55016003)(5660300002)(66556008)(186003)(9686003)(83380400001)(7696005)(6916009)(54906003)(122000001)(66946007)(55236004)(76116006)(8676002)(71200400001)(52536014)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEQwU3NWcTAwa2hqTDFrZSt3Vmo4bTVvZTFobjJCbWNwTUlnRnZyZzdjMlhJ?=
 =?utf-8?B?eE9tak9OY1NzWWwvT2ZTaU96ME9IYitQVkE3Yk1LM2JQancrYnVTd1ByUlZz?=
 =?utf-8?B?MURvRldVMmtsRnpQVU4rZGhiRkJveHRrY0syQjN3T04yb053QUZmaUtIVXFk?=
 =?utf-8?B?SUIwMzhwekNGUWRVdW5jWG53Z21OeXRNbDRUaTZkNHpIajNVdDJxcXZGNHZ3?=
 =?utf-8?B?OWZPRDNoVGRHcXMyQW1lbGVVVVJtVXB2YzFDbVk4ZUxuOGlhZGVmNm9lSVcz?=
 =?utf-8?B?UkVaeUQ3Z283bkFHdUluczFOejJrQUVDNDJ3ZXJML1JDK1pMUVJiMnB1bERw?=
 =?utf-8?B?L2MxY1dVU2dvbUU3WWZEcEQ0bEJxSWJHcFM2MHFORW9WVHk5TENsYnlseGtQ?=
 =?utf-8?B?S3Q3ZW9DT0ZuU1BDcHlHQUt4R1RiU00wWXhWNTZFcWJSYmRKakw0OWtsSktn?=
 =?utf-8?B?NmdiS0ZZT01xVFo3aUFYU3dXa0VuSHBZK0dERm1ScHpDVU5lQ3RLRU8zSlIw?=
 =?utf-8?B?NVdKS1ZYWmxWSk9KMk5UYVF4RFl4emlqWFpXdlBtZUxEdU9tWExGME9UZVpt?=
 =?utf-8?B?dW9HRENMeFZReS9MazVXR1NySnlSUlo0R3BXWXU1UVV0SVhWb0JZMXlCS2Jl?=
 =?utf-8?B?TVpzWHpCby9tQjg2dk92R3drOXQ1NExHNXJKNjJTQkRYWm8zaFFINzEzbUZa?=
 =?utf-8?B?UmIyYkRnS0RiQzNRR1I4Y3loK1lqZkxMS3dsR2RQZEQyNXZybHBQWlBQSDBn?=
 =?utf-8?B?bTRVMkFvemF4LzhaTm1sTVcrOXlHM0NXK2xFdUVQanBIZVdpUWtOZlN3b053?=
 =?utf-8?B?VHBuS1hXaThEci9hem1zRWZDcm16N2Fuc2VvNTNGSFpZcFdTaDZiVWNaTzVD?=
 =?utf-8?B?Ny95bktwYlQ2NWlTOEYrM1dsYXhSSzhTOHM2VUdaMHc5TGVCdUViTWpkNzkr?=
 =?utf-8?B?bkxGZWxwV0s0MXEzbTNGQTNneW5ITnZkdUljRFAyKzNZcmhFL0l0b1JudTlT?=
 =?utf-8?B?VFNkbGwya3M0Q2dJa2ZWOEZLQWRURStpVUROTHRwWms4Qm5SRXFUSjFXVEkv?=
 =?utf-8?B?OUdkQXQxM0xVbUsxQ3RuR1BqTWxJU3FqTUlpRm5oRkl0Nkw0LzBWellMZy9j?=
 =?utf-8?B?a1ROTTN6Z1cvbWtPUzBHaTAwZ1JiWk1kOUo5NUdNSmUvMHJGMmN1WmxEd20w?=
 =?utf-8?B?endKeGRyclVMNHBpRE9jUWliUWxiUlFqeXBmRzYxNjd2Z1ZZYkxuOWpRbkx4?=
 =?utf-8?B?ajA1RG1hems0Y04rQnk3bXY2blNQd01iT3VsY1ZxTndpcXEvYkNKRzIwOTZi?=
 =?utf-8?B?aHNtUStLZE96V0RXS01PSW5WdUJ1RkgzTGd6WFpVZnhwNFRocEN3K3VMRTA4?=
 =?utf-8?B?anlHQTBTblhaOENLQnhNdmFBVnRGcGh4VW5RTzlPZlArSzlabnJ2RUNqRFAv?=
 =?utf-8?B?ZzlRaVBuc2ttZldvbHJxU3VYSHVMYU83aU5yMTZoOFhIbHhxMmUrdTJQVGFL?=
 =?utf-8?B?ZnduUGZlNzlSOGhWNlFKeFdVTUp3QStBanozQU1wQXFHZS9ZeHdLV0FtMkFD?=
 =?utf-8?B?T1ZKeEs3ZjErNkVLMXQveUJRbjZqNTg2U2w2dnVSTU9NRHUrdGZYbnprOW5X?=
 =?utf-8?B?OXNzbi8rU3Y3WU5uU2NuTWZ3TDZwdW12U0o2QWM2MmFSM3grRGpBZkZ1TGxu?=
 =?utf-8?B?SU9ab1Z2SjA4ZXJFS3Mra1NabEhCRFhWZTdvdTB5U21JaDU5aW1JcWo1Y3N6?=
 =?utf-8?B?VFVWUmFIdDZIQzA1OEN5Skx3Y1V3bVZxUjdvaERVRG0zNnIwdGlFb3VINVJz?=
 =?utf-8?B?TUpFSWVyTTl2b280VHZsOFdTcWhpVjBYRXdoaEJsd2NVNG9MK05Ga21raGhL?=
 =?utf-8?B?eVFJOWNORXVDL3RQbVlBTEN5Yy8yTTVOU1NMcFhSZTdsQ3h4OVlRcnRibDBF?=
 =?utf-8?B?MWI1N1JNYXphaW5zN3dPOXJEYmZueGkycDNtZ0Vtb1BnSFppeGlBWis5NmdX?=
 =?utf-8?B?SlM3d1Zyb1VTNTVzaElueURobGUycUR2Qmd3Q00vSkR6N1dST3dYNXRVM29y?=
 =?utf-8?B?ZnE0RG9LRXQ3YUE2ZTQyWkp2Ykw2Y2srZGJGS1RvSWdRdVZBUDl2RnFOcjB4?=
 =?utf-8?B?djRFTzZIUVFGbFpVcnE4ZStIU01GaUNqUkp4QUxEK2ZnOE1Cb1VLenFJWXd4?=
 =?utf-8?B?MHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a47f219-f83c-465f-1a0a-08d9dcbf0496
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 09:18:42.2664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bAGBkqkej0BMrWM9DioGDNl0cL3EWVpa7qDK9vJrVdql4C6DO5zudKnhj/pu+j3YX1F/vkP+CeAG6CWynxenUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2731
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBUaGFua3MsIG15IGNvbW1lbnRzIGJlbG93Lg0KVGhhbmtzIGZvciB0aGUgaW5wdXRzLiANCj4g
DQo+ID4gQWRkIGRldmljZV9pcnFfZ2V0X2J5bmFtZSgpIHRvIGdldCBhbiBpbnRlcnJ1cHQgYnkg
bmFtZSBmcm9tIGJvdGggdGhlDQo+ID4gQUNQSSB0YWJsZSBhbmQgdGhlIERldmljZSBUcmVlLg0K
PiANCj4gVGhpcyBuZWVkcyB0byBiZSBjbGFyaWZpZWQgKGl0J3Mgbm90IGFuZCwgYnV0IG9yKSwg
d2hhdCBhYm91dDoNCj4gDQo+ICAgQWRkIGRldmljZV9pcnFfZ2V0X2J5bmFtZSgpIHRvIGdldCBh
biBpbnRlcnJ1cHQgYnkgbmFtZSBmcm9tIGVpdGhlcg0KPiAgIEFDUEkgdGFibGUgb3IgRGV2aWNl
IFRyZWUgd2hpY2hldmVyIGhhcyBpdC4NCj4gDQo+ID4gVGhpcyB3aWxsIGFsbG93IHRvIHVzZSAn
aW50ZXJydXB0LW5hbWVzJyBpbiBfRFNEIHdoaWNoIGNhbiBiZSBtYXBwZWQNCj4gPiB0bw0KPiAN
Cj4gSW4gdGhlIEFDUEkgY2FzZSB0aGlzDQo+IGFsbG93IHVzIHRvDQo+IA0KPiA+IEludGVycnVw
dCgpIHJlc291cmNlIGJ5IGluZGV4LiBUaGUgaW1wbGVtZW50YXRpb24gaXMgc2ltaWxhciB0bw0K
PiA+ICdpbnRlcnJ1cHQtbmFtZXMnIGluIHRoZSBEZXZpY2UgVHJlZS4NCj4gDQo+IC4uLg0KPiAN
Cj4gPiAgLyoqDQo+ID4gKyAqIGZ3bm9kZV9pcnFfZ2V0X2J5bmFtZSAtIEdldCBJUlEgZnJvbSBh
IGZ3bm9kZSB1c2luZyBpdHMgbmFtZQ0KPiA+ICsgKiBAZndub2RlOiAgICBQb2ludGVyIHRvIHRo
ZSBmaXJtd2FyZSBub2RlDQo+ID4gKyAqIEBuYW1lOiAgICAgIElSUSBuYW1lDQo+ID4gKyAqDQo+
ID4gKyAqIERlc2NyaXB0aW9uOg0KPiA+ICsgKiBGaW5kIGEgbWF0Y2ggdG8gdGhlIHN0cmluZyAn
bmFtZScgaW4gdGhlICdpbnRlcnJ1cHQtbmFtZXMnIHN0cmluZw0KPiA+ICsgYXJyYXkNCj4gDQo+
ICduYW1lJyAtLT4gQG5hbWUNCj4gDQo+ID4gKyAqIGluIF9EU0QgZm9yIEFDUEksIG9yIG9mX25v
ZGUgZm9yIGRldmljZSB0cmVlLiBUaGVuIGdldCB0aGUgTGludXgNCj4gPiArIElSUQ0KPiANCj4g
RGV2aWNlIFRyZWUNCj4gDQo+ID4gKyAqIG51bWJlciBvZiB0aGUgSVJRIHJlc291cmNlIGNvcnJl
c3BvbmRpbmcgdG8gdGhlIGluZGV4IG9mIHRoZQ0KPiA+ICsgbWF0Y2hlZA0KPiA+ICsgKiBzdHJp
bmcuDQo+ID4gKyAqDQo+ID4gKyAqIFJldHVybjoNCj4gDQo+ID4gKyAqIExpbnV4IElSUSBudW1i
ZXIgb24gc3VjY2Vzcw0KPiA+ICsgKiBOZWdhdGl2ZSBlcnJubyBvdGhlcndpc2UuDQo+IA0KPiAg
KiBMaW51eCBJUlEgbnVtYmVyIG9uIHN1Y2Nlc3MsIG9yIG5lZ2F0aXZlIGVycm5vIG90aGVyd2lz
ZS4NCj4gDQo+ID4gKyAqLw0KPiA+ICtpbnQgZndub2RlX2lycV9nZXRfYnluYW1lKGNvbnN0IHN0
cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsIGNvbnN0DQo+ID4gK2NoYXIgKm5hbWUpIHsNCj4g
PiArICAgICAgIGludCBpbmRleDsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAoIW5hbWUpDQo+ID4g
KyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiArICAgICAgIGluZGV4
ID0gZndub2RlX3Byb3BlcnR5X21hdGNoX3N0cmluZyhmd25vZGUsICJpbnRlcnJ1cHQtbmFtZXMi
LA0KPiBuYW1lKTsNCj4gPiArICAgICAgIGlmIChpbmRleCA8IDApDQo+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybiBpbmRleDsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gZndub2RlX2lycV9n
ZXQoZndub2RlLCBpbmRleCk7IH0NCj4gDQo+IC4uLg0KPiANCj4gPiArLyoqDQo+ID4gKyAqIGRl
dmljZV9pcnFfZ2V0X2J5bmFtZSAtIEdldCBJUlEgb2YgYSBkZXZpY2UgdXNpbmcgaW50ZXJydXB0
IG5hbWUNCj4gPiArICogQGRldjogRGV2aWNlIHRvIGdldCB0aGUgaW50ZXJydXB0DQo+ID4gKyAq
IEBuYW1lOiBJUlEgbmFtZQ0KPiA+ICsgKg0KPiA+ICsgKiBEZXNjcmlwdGlvbjoNCj4gPiArICog
RmluZCBhIG1hdGNoIHRvIHRoZSBzdHJpbmcgJ25hbWUnIGluIHRoZSAnaW50ZXJydXB0LW5hbWVz
JyBzdHJpbmcNCj4gPiArYXJyYXkNCj4gPiArICogaW4gX0RTRCBmb3IgQUNQSSwgb3Igb2Zfbm9k
ZSBmb3IgZGV2aWNlIHRyZWUuIFRoZW4gZ2V0IHRoZSBMaW51eA0KPiA+ICtJUlENCj4gPiArICog
bnVtYmVyIG9mIHRoZSBJUlEgcmVzb3VyY2UgY29ycmVzcG9uZGluZyB0byB0aGUgaW5kZXggb2Yg
dGhlDQo+ID4gK21hdGNoZWQNCj4gPiArICogc3RyaW5nLg0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1
cm46DQo+ID4gKyAqIExpbnV4IElSUSBudW1iZXIgb24gc3VjY2Vzcw0KPiA+ICsgKiBOZWdhdGl2
ZSBlcnJubyBvdGhlcndpc2UuDQo+ID4gKyAqLw0KPiANCj4gQXMgcGVyIGFib3ZlLg0KPiANCj4g
Li4uDQo+IA0KPiA+ICtpbnQgZGV2aWNlX2lycV9nZXRfYnluYW1lKHN0cnVjdCBkZXZpY2UgKmRl
diwgY29uc3QgY2hhciAqbmFtZSk7DQo+IA0KPiBTaW5jZSB3ZSBkb24ndCBoYXZlIGRldmljZV9p
cnFfZ2V0KCkgcGVyaGFwcyB3ZSBkb24ndCBuZWVkIHRoaXMgb25lIHJpZ2h0IG5vdw0KPiAoanVz
dCBvcGVuIGNvZGUgaXQgaW4gdGhlIGNhbGxlcikuIFRoaXMgd2lsbCBzYXRpc2Z5IFJhZmFlbCdz
IHJlcXVlc3QuDQoNCklmIHRvIGNvZGUgdGhlIHNhbWUgaW4gY2FsbGVyLCBJIGd1ZXNzLCBpdCB3
b3VsZCBsb29rIGxpa2UgdGhpcyAtDQoJIGlycSA9IGZ3bm9kZV9pcnFfZ2V0X2J5bmFtZShkZXZf
Zndub2RlKGFkYXB0ZXItPmRldi5wYXJlbnQpLA0KCQkJCQkgInNtYnVzX2FsZXJ0Iik7DQoNCkxv
b2tzIG9rYXkgdG8gbWUsIGJ1dCBpZiBnaXZlbiBhbiBvcHRpb24gSSB3b3VsZCBnbyB3aXRoIGRl
dmljZV9pcnFfZ2V0X2J5bmFtZSgpLg0KDQpUaGFua3MsDQpBa2hpbA0K
