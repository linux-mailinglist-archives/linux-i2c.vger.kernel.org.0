Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F10114B40F9
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 05:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237252AbiBNEuL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Feb 2022 23:50:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbiBNEuK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Feb 2022 23:50:10 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::60b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB03150463;
        Sun, 13 Feb 2022 20:50:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LW77YkKWBM9oqLeaAm1DRRCfwaONejA62sDnWhqjIsMqgXLJf3ZkNCjAe80VPxnFGo993INaSUjU/v0lHWDG0rv/AAUMx77bVu4B18NFroToJi7Qv5Q3xXwu4kdOPDbfgfwMigcElgTPz/4w10FL63+bx8fDTfHdQm1PEyp9+0AvZEeGK8YqdYOUsjjc9RBmpLdQAhh/HyIbJ/KN+NcEuROcvMo4aUlvFOhsCbKhmzL35mBwje8ejT6FXb9xC6yJdRSPY7M3jWs+qs6GdhqEkMnINBoDRwNLfHB7mjaiKcidI1+AG/OcjxkgRG/etoimOuyJUOwGONfFIGQFPfxS2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nZGeRTXsbaBE19tzJyoneDWqhsmiRbdPZXtqDWL5Jc=;
 b=msRsDeHzShJE6m8n9dXVdGExVgINZUO6fOjN4F7llG7wALtYYASSDf7m3VnEDuJjGPOKvp31XsshBHosTcl8iRx1ZcpJSydBUaFdESpa7TNdn36JkiISnBM1GyjgkDWww/ZsoFp5V9WUIEXoKsaoPeaYdbBmDwq0Ht/q1PjsapLa/1dgJkJ/UnlwVH+7zoO2/0+ZVuQ9VLykdftPOty41haeNikNXbe+g6S2xvvu6qct6NPhA7RLRBuw3SrCyefXVzUSxspgx+v/GaWTi2Y5Pq6ZCd+cX8bQn1TJY6FKIopJLcRUgB9uvhT5ijdGwhgd3YBLD3bo4VOc/V1YCGqm7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nZGeRTXsbaBE19tzJyoneDWqhsmiRbdPZXtqDWL5Jc=;
 b=pXzBZnE6XvqkwierBAHsNFSeYZ1sxi0e/i+AFqdYq4DTrSvcbvR3fPuMPEbwxSiOmCfUgfjHPHfrSFAgWxgG9/R/3uIpPw7lksooaDJgTD0l0+1bUCv1yHGNSa83s45oq2wEDRVXZsFOgSZMaW1EGVZaS5Nejk64Sm5h2/iJRQlqIVe/n6FR1trdYZnDinHLOp2sSJsqdP1FIyTOs/eE5S1WXBfNlcf+vCAJdHSsfKeqPaUXQDFVUd9jZ80GdB7W6A3p9wfrkkfkRKREnvC7rtLIBYUaZFIyFbSjV2ERQ5jBxYjd8B3PdxNjTjrwy2ul4zrCSYTVot4xUNcqUb9oMA==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by BYAPR12MB2838.namprd12.prod.outlook.com (2603:10b6:a03:6f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Mon, 14 Feb
 2022 04:49:59 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::94d8:5850:e33d:b133]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::94d8:5850:e33d:b133%4]) with mapi id 15.20.4975.017; Mon, 14 Feb 2022
 04:49:59 +0000
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
        =?ks_c_5601-1987?B?TWljaGGpqSBNaXJvc6mpYXc=?= 
        <mirq-linux@rere.qmqm.pl>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: RE: [PATCH RESEND] i2c: tegra: Add SMBus block read function
Thread-Topic: [PATCH RESEND] i2c: tegra: Add SMBus block read function
Thread-Index: AQHYHpP+iBNzHq+ctEuAu+zpK3JSjayNO4IAgADToJCAAgsrAIAAAYMAgAA/wYCAAg7GQA==
Date:   Mon, 14 Feb 2022 04:49:59 +0000
Message-ID: <DM5PR12MB18509DCA809CCE62A4A74133C0339@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <20220210153603.61894-1-akhilrajeev@nvidia.com>
 <ae6d300f-962d-9731-bb78-3594b4c31aea@gmail.com>
 <DM5PR12MB18502CF86E602F7071A1EA58C0309@DM5PR12MB1850.namprd12.prod.outlook.com>
 <94fc8b11-6149-56ca-a028-cf7f39930992@gmail.com>
 <ff83adba-7919-fa48-4637-a4cb9b94a8e1@gmail.com>
 <f3db5152-0e1f-4258-4cfd-521828a243c2@gmail.com>
In-Reply-To: <f3db5152-0e1f-4258-4cfd-521828a243c2@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6794a46b-a2a0-40ff-5731-08d9ef7574b3
x-ms-traffictypediagnostic: BYAPR12MB2838:EE_
x-microsoft-antispam-prvs: <BYAPR12MB2838567BAA39337C85C0A3ABC0339@BYAPR12MB2838.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FmWm4ydCi7uf3gjPmVyDE6McnJwsIKtYYT+DIy5IgcdPrC1VBvnx/3kwinyI80wca75RD6kAttyDw1WDmpoXUVMsPw0EyzGRGN340/N0PLlPb9+hub65XO/ODmiMSldy8IfSIiVjVNrOjInmB5sJ+ZuCfZ32iaif1Er5UvoNcSTT6oB6Xhl2MIkUF9deFSN8EMN9naVIqh6m3hb+aVEVijdNvJO15YHgKNMuezCToMiMjqJmOubK9cgHCbPtaZiYPKoXQZaIZGGWMvEL4RlaVrh0W8h2CyE/V+gwR6b5TJGDD5DyRXFtAFIA8aVCuSd6n+rSCYdLktG76sq6tl3LS6Kzk3bs4R7O++wFiL7C+TkuKjPMRwAfB8Wt0n7yTuVLri3Dx4mPH+RlTWH5u0Is5FuzOL5DLCk62N9LMamKQFYKxkYYpdM98TcscNTmwDoDoa4OhciOHdNDR/U02uiPkM7toPy/QT+tXGie52LhgelcoDOrErsIVsCvMmXAFq/IEzy9kTPqVy3g93042LfU8wKoxaErIOGM1lP9yl4/E+TdBGhV3SaMKpjKlQ4E3gFxq76cTEeLcCNdV/5zWzot8oRcuKJUY8mpwxRRyWrFSn8DUCmWDBs/9uESXR4B84cwbivLZ9FVJ2Qp6pXY4YMOkqo72pjUZCQLtV5ogEyDJEv5tZC6MpNDoWxKDYzUz2k4nTnYNPG7KnMZLnVuFJfm+HDtjhOEF4LVIWzD6YJ/caBd6LNfI0WB3VCDU9sV4k5ZUYh4DWH+oe+RsgERcsL3qKJ1tLAaLUcAVn2RZqWfJqQSm00ElNTFrT2k9dXYJ6nb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(52536014)(55016003)(86362001)(9686003)(2906002)(83380400001)(38070700005)(7416002)(5660300002)(8936002)(7696005)(8676002)(6506007)(110136005)(508600001)(64756008)(966005)(122000001)(66476007)(66556008)(66446008)(921005)(316002)(66946007)(38100700002)(6636002)(76116006)(186003)(26005)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?ks_c_5601-1987?B?UFFraTVXT21CS0x6aVlyZFVHeVZFRW1nZkN0K0NWdk9DL3ZRNk9V?=
 =?ks_c_5601-1987?B?dndIc1M4VDBLWVF2Nk1QWWU5TWJKM3Q4NEI2aURuOHFVWVJMMDN0?=
 =?ks_c_5601-1987?B?QTB0NDFnUUxFZjdhRUpqckRleFFZYWUzZFFRRXYrNEFVRk5BVUg3?=
 =?ks_c_5601-1987?B?U1ZZOTdUVjdMbTAzZXg5Z3lVSTZINzVTOWxreituNWtuWVoxbnAv?=
 =?ks_c_5601-1987?B?SkVmbU55L0JpUXRaWnhpaTAxZ1h5TTZCUXJKa2ZlSHFncHB0L21s?=
 =?ks_c_5601-1987?B?K2FOb1NxL1NtaEVhQ0ZmK09sT21OeTZhRWpQSTRXWldzaUkrazFJ?=
 =?ks_c_5601-1987?B?OFd3WGxSVXE0NjJhNnRjUDBUR3I5MUthLy9DZDlMSDluaWlZSUlV?=
 =?ks_c_5601-1987?B?b1NhYzJNWmxReDJzUFk5dlFIbjhNc2d2VEp5czdQOHhmTDBGQlll?=
 =?ks_c_5601-1987?B?bHl1UUFNVkZYUzdiY2Fma1QwMDBnaHZNN29VVjVKUzIvbWltQnJy?=
 =?ks_c_5601-1987?B?KzNvTWFmYU9yMnJZMEFsNzNsV2Y0bTJJQ25Fc2diVEkvY0lmcjE4?=
 =?ks_c_5601-1987?B?dnhibWNJOHZJdnZJZ3RZRWEwV3prSHZrYW1WWHZGMGZpRTNGcXJs?=
 =?ks_c_5601-1987?B?aTEyYjdRREZUWHUzOTVBTkVLWVdSVkIwQmUrWXlUOEtRSGdvYUxo?=
 =?ks_c_5601-1987?B?blorM0ZVVVI4Y05LdlFObDZUL2tLaXVsaENUeEVpRVJZV3lUa0Zw?=
 =?ks_c_5601-1987?B?bEdndjFTTCs4UU0vRElEZDBTdTN5ZU1HaWJwdEdHNWEyQUF0L2tR?=
 =?ks_c_5601-1987?B?aTc1VStvU0w2cTBjeU5CK3EzZWkrRkxjNUtwZ1I5ZGNHc1NJYmpE?=
 =?ks_c_5601-1987?B?VStmemd0MHI5dlFmelhFWlJmelE4dEl6dzNkbnpmMXFVVXRlM2Vn?=
 =?ks_c_5601-1987?B?czhSVnRSYllsYXcvNjJFa2d4YVdsNlhrNm5FSDZWRDNhMERMWlFF?=
 =?ks_c_5601-1987?B?SGNvamc4dDhma3pWWmN4QnlLVXVhV1B1Uys5Ymw1VUxOMkJ5NGRp?=
 =?ks_c_5601-1987?B?RnZZano4NDR6N1dvRWtsZ05peC8yekF0SitGakd5QnY2cEFiT1VT?=
 =?ks_c_5601-1987?B?TWRVWVpwa2pCWnhueDBLYWRLZUlxWURjeWg0OTVubFNqaFhDQmdF?=
 =?ks_c_5601-1987?B?YlVaVGQ4VTBkb0txZ2grUDJhendmNVZ5UEkxUUNPanBrbGxoUGpi?=
 =?ks_c_5601-1987?B?dnh6bExhSnhQMzl1MVVOZDFzUWc1a0ZOd1h2UEZCbENWay95VGpl?=
 =?ks_c_5601-1987?B?M0tRWkF4d3prcU1JNGR1Z2sxQkF6Y3cyL0pLY0kvZTVia09NRTRl?=
 =?ks_c_5601-1987?B?ZXpObnlQV01sTm96MHBQVjVGc2dNMVhhTEJDdTFpRUFKY2o4MWhY?=
 =?ks_c_5601-1987?B?WjhNT2hwbElQN3oyUlE5U2dJNzlwYTJBU3JxU2VxZjdjOEEzVUll?=
 =?ks_c_5601-1987?B?NHdzZmVUeC9DZ05pTEF5bk13TE1nUXFHN0doNFJuZE1iZlFuQ3RF?=
 =?ks_c_5601-1987?B?MExYc2hSVW4rblBDNVZMK0hwdVc3S0JXTGxCQ1hHTG5icERkSHJS?=
 =?ks_c_5601-1987?B?eHQ3REhYV2hTb1Jqbk5oMFdINzEvS0RTVmdqeDdYOFV5eU40dFMz?=
 =?ks_c_5601-1987?B?c3MzRFh2S2ZUWFRmQ25pRi9zaUt4cEtNVXZlZC9ESFhqd3hCak5a?=
 =?ks_c_5601-1987?B?eEIyNmpJK1UwUkhhNUlnWTNyd1R2aTJHVFF6MG1tSUl5NEw1Tm12?=
 =?ks_c_5601-1987?B?dDNzR0o0TlpsSzdvcU00NEVEd0JYeDRtalBXbDR1V3FXWDliRGlN?=
 =?ks_c_5601-1987?B?bDZyRWcrck13M3NwUXFNbFc0QmFEYnM1WlpTcC95R2hGL0NBaWR3?=
 =?ks_c_5601-1987?B?RWhBWjZHc0RwZlh3NEtQQWphMjBsTEFkVEhCR3UyQkJMaW4rTitx?=
 =?ks_c_5601-1987?B?dVRueEszeVdVWWx2NXRNL3RpQVdoM0pUVXdaOWp1Zktvc0tSd25x?=
 =?ks_c_5601-1987?B?Um40dXFvREJqUmJtcDB6ajlLK1ZMbWQvTENoTGpqT1lXZ1A4R2xZ?=
 =?ks_c_5601-1987?B?cGRwWDdhNHpGdU9lTUFWMS9GTy9MK0pDTndJMWVpQnBoMVhQWjR1?=
 =?ks_c_5601-1987?B?WTdqUnlKQi81emlBS2dYZDhnM01XWXZnbTFMeFlqcGhsSzJOR0du?=
 =?ks_c_5601-1987?B?MFRyOGY0dTlESytyQytuR1R2bmh6RVgvY2poZlI5cGRISGxrR0Z2?=
 =?ks_c_5601-1987?B?dmFYY1VOdThkam5NRDB6NTRDcVhkODg0NTRuSFNFdGcrZlNjOHYw?=
 =?ks_c_5601-1987?B?K2FYbjEyMWl3RmV3bzErSUtGdDJWdFBIUWFXYXRpY3ZDUy9RMWU0?=
 =?ks_c_5601-1987?B?YUpCeXc1SmZqWmZ0TE9TZmUreDlpanBTbnpTUzZiVURCZWZmOWJ1?=
 =?ks_c_5601-1987?B?cXpJOHk3MUI0WHF5RzhVM2RIUkprMXc9PQ==?=
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6794a46b-a2a0-40ff-5731-08d9ef7574b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 04:49:59.6820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+sy22qzY6x/7opQphxi/kk5pFVj94QkZDDsKUk/tXx4xYd19YXn6Umvbc2f74cbr/7FYMPBRhXEM+dy5KhIPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2838
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAxMi4wMi4yMDIyIDE5OjIwLCBEbWl0cnkgT3NpcGVua28grOGs2qzqrNas5DoNCj4gPiAxMi4w
Mi4yMDIyIDE5OjE1LCBEbWl0cnkgT3NpcGVua28grOGs2qzqrNas5DoNCj4gPj4gMTEuMDIuMjAy
MiAxMjoxMSwgQWtoaWwgUiCs4azarOqs1qzkOg0KPiA+Pj4+IDEwLjAyLjIwMjIgMTg6MzYsIEFr
aGlsIFIgrOGs2qzqrNas5DoNCj4gPj4+Pj4gRW11bGF0ZSBTTUJ1cyBibG9jayByZWFkIHVzaW5n
IENvbnRpbnVlWGZlciB0byByZWFkIHRoZSBsZW5ndGggYnl0ZQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBBa2hpbCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPg0KPiA+Pj4+PiAt
LS0NCj4gPj4+Pj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYyB8IDE4ICsrKysrKysr
KysrKysrKystLQ0KPiA+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+ID4+Pj4+DQo+ID4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLXRlZ3JhLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXRlZ3JhLmMNCj4gPj4+
Pj4gaW5kZXggMDNjZWExMDJhYjc2Li4yOTQxZTQyYWE2YTAgMTAwNjQ0DQo+ID4+Pj4+IC0tLSBh
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYw0KPiA+Pj4+PiArKysgYi9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLXRlZ3JhLmMNCj4gPj4+Pj4gQEAgLTEyMzMsNiArMTIzMywxMSBAQCBzdGF0
aWMgaW50IHRlZ3JhX2kyY194ZmVyX21zZyhzdHJ1Y3QNCj4gdGVncmFfaTJjX2Rldg0KPiA+Pj4+
ICppMmNfZGV2LA0KPiA+Pj4+PiAgICAgICAgICAgICAgIHJldHVybiBlcnI7DQo+ID4+Pj4+DQo+
ID4+Pj4+ICAgICAgIGkyY19kZXYtPm1zZ19idWYgPSBtc2ctPmJ1ZjsNCj4gPj4+Pj4gKw0KPiA+
Pj4+PiArICAgICAvKiBUaGUgY29uZGl0aW9uIHRydWUgaW1wbGllcyBzbWJ1cyBibG9jayByZWFk
IGFuZCBsZW4gaXMgYWxyZWFkeSByZWFkDQo+ICovDQo+ID4+Pj4+ICsgICAgIGlmIChtc2ctPmZs
YWdzICYgSTJDX01fUkVDVl9MRU4gJiYgZW5kX3N0YXRlICE9DQo+ID4+Pj4gTVNHX0VORF9DT05U
SU5VRSkNCj4gPj4+Pj4gKyAgICAgICAgICAgICBpMmNfZGV2LT5tc2dfYnVmID0gbXNnLT5idWYg
KyAxOw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICAgICAgIGkyY19kZXYtPm1zZ19idWZfcmVtYWluaW5n
ID0gbXNnLT5sZW47DQo+ID4+Pj4+ICAgICAgIGkyY19kZXYtPm1zZ19lcnIgPSBJMkNfRVJSX05P
TkU7DQo+ID4+Pj4+ICAgICAgIGkyY19kZXYtPm1zZ19yZWFkID0gISEobXNnLT5mbGFncyAmIEky
Q19NX1JEKTsNCj4gPj4+Pj4gQEAgLTEzODksNiArMTM5NCwxNSBAQCBzdGF0aWMgaW50IHRlZ3Jh
X2kyY194ZmVyKHN0cnVjdCBpMmNfYWRhcHRlcg0KPiAqYWRhcCwNCj4gPj4+PiBzdHJ1Y3QgaTJj
X21zZyBtc2dzW10sDQo+ID4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICBlbHNlDQo+ID4+Pj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVuZF90eXBlID0gTVNHX0VORF9SRVBFQVRf
U1RBUlQ7DQo+ID4+Pj4+ICAgICAgICAgICAgICAgfQ0KPiA+Pj4+PiArICAgICAgICAgICAgIC8q
IElmIE1fUkVDVl9MRU4gdXNlIENvbnRpbnVlWGZlciB0byByZWFkIHRoZSBmaXJzdCBieXRlICov
DQo+ID4+Pj4+ICsgICAgICAgICAgICAgaWYgKG1zZ3NbaV0uZmxhZ3MgJiBJMkNfTV9SRUNWX0xF
Tikgew0KPiA+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgcmV0ID0gdGVncmFfaTJjX3hmZXJf
bXNnKGkyY19kZXYsICZtc2dzW2ldLA0KPiA+Pj4+IE1TR19FTkRfQ09OVElOVUUpOw0KPiA+Pj4+
PiArICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCkNCj4gPj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAvKiBT
ZXQgdGhlIHJlYWQgYnl0ZSBhcyBtc2cgbGVuICovDQo+ID4+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICBtc2dzW2ldLmxlbiA9IG1zZ3NbaV0uYnVmWzBdOw0KPiA+Pj4+PiArICAgICAgICAgICAg
ICAgICAgICAgZGV2X2RiZyhpMmNfZGV2LT5kZXYsICJyZWFkaW5nICVkIGJ5dGVzXG4iLCBtc2dz
W2ldLmxlbik7DQo+ID4+Pj4+ICsgICAgICAgICAgICAgfQ0KPiA+Pj4+PiAgICAgICAgICAgICAg
IHJldCA9IHRlZ3JhX2kyY194ZmVyX21zZyhpMmNfZGV2LCAmbXNnc1tpXSwgZW5kX3R5cGUpOw0K
PiA+Pj4+PiAgICAgICAgICAgICAgIGlmIChyZXQpDQo+ID4+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICBicmVhazsNCj4gPj4+Pj4gQEAgLTE0MTYsMTAgKzE0MzAsMTAgQEAgc3RhdGljIHUzMiB0
ZWdyYV9pMmNfZnVuYyhzdHJ1Y3QgaTJjX2FkYXB0ZXINCj4gPj4+PiAqYWRhcCkNCj4gPj4+Pj4g
IHsNCj4gPj4+Pj4gICAgICAgc3RydWN0IHRlZ3JhX2kyY19kZXYgKmkyY19kZXYgPSBpMmNfZ2V0
X2FkYXBkYXRhKGFkYXApOw0KPiA+Pj4+PiAgICAgICB1MzIgcmV0ID0gSTJDX0ZVTkNfSTJDIHwg
KEkyQ19GVU5DX1NNQlVTX0VNVUwgJg0KPiA+Pj4+IH5JMkNfRlVOQ19TTUJVU19RVUlDSykgfA0K
PiA+Pj4+PiAtICAgICAgICAgICAgICAgSTJDX0ZVTkNfMTBCSVRfQUREUiB8IEkyQ19GVU5DX1BS
T1RPQ09MX01BTkdMSU5HOw0KPiA+Pj4+PiArICAgICAgICAgICAgICAgSTJDX0ZVTkNfMTBCSVRf
QUREUiB8IEkyQ19GVU5DX1BST1RPQ09MX01BTkdMSU5HOw0KPiA+Pj4+Pg0KPiA+Pj4+PiAgICAg
ICBpZiAoaTJjX2Rldi0+aHctPmhhc19jb250aW51ZV94ZmVyX3N1cHBvcnQpDQo+ID4+Pj4+IC0g
ICAgICAgICAgICAgcmV0IHw9IEkyQ19GVU5DX05PU1RBUlQ7DQo+ID4+Pj4+ICsgICAgICAgICAg
ICAgcmV0IHw9IEkyQ19GVU5DX05PU1RBUlQgfA0KPiBJMkNfRlVOQ19TTUJVU19SRUFEX0JMT0NL
X0RBVEE7DQo+ID4+Pj4+DQo+ID4+Pj4+ICAgICAgIHJldHVybiByZXQ7DQo+ID4+Pj4+ICB9DQo+
ID4+Pj4NCj4gPj4+PiBQbGVhc2UgZGVzY3JpYmUgaG93IHRoaXMgd2FzIHRlc3RlZC4NCj4gPj4+
IFRoaXMgaXMgdGVzdGVkIHVzaW5nIGFuIEkyQyBFRVBST00gdG8gZW11bGF0ZSBTTUJ1cyBibG9j
ayByZWFkIGluIHdoaWNoDQo+ID4+PiB3ZSByZWFkIHRoZSBmaXJzdCBieXRlIGFzIHRoZSBsZW5n
dGggb2YgYnl0ZXMgdG8gcmVhZC4gVGhpcyBpcyBhbiBleHBlY3RlZA0KPiA+Pj4gZmVhdHVyZSBm
b3IgTlZJRElBIEdyYWNlIGNoaXBzZXQgd2hlcmUgdGhlcmUgd2lsbCBiZSBhbiBhY3R1YWwgU01C
dXMNCj4gZGV2aWNlLg0KPiA+Pg0KPiA+PiBXZSBoYXZlIHNldmVyYWwgVGVncmEzMCsgdGFibGV0
cyB0aGF0IGhhdmUgRUMgb24gU01CdXMuIFN2eWF0b3NsYXYgdHJpZWQNCj4gPj4geW91ciBJMkMg
cGF0Y2ggKyBbMV0gb24gQXN1cyBURjIwMSBhbmQgcmVwb3J0ZWQgdGhhdCBpdCBicmVha3MgRUMu
IEFueQ0KPiA+PiBpZGVhIHdoeSBpdCBkb2Vzbid0IHdvcms/DQo+ID4+DQo+ID4+IFsxXQ0KPiA+
PiBodHRwczovL2dpdGh1Yi5jb20vZ3JhdGUtDQo+IGRyaXZlci9saW51eC9jb21taXQvYWE4ZDcx
ZjVhOTYwZWY0MDUwM2U1NDQ4YzYyMmQ2MmQxYzUzYTJjMA0KPiA+DQo+ID4gQWgsIEkgc2VlIG5v
dyB0aGF0IEkyQ19GVU5DX1NNQlVTX1dSSVRFX0JMT0NLX0RBVEEgbm90IHN1cHBvcnRlZCwNCj4g
d2UNCj4gPiBzaG91bGQgY2hlY2sgYWdhaW4gd2l0aG91dCB0aGUgd3JpdGUgdGhlbi4NCj4gDQo+
IFdlIGFsc28gbWlzc2VkIHRoYXQgaTJjX3NtYnVzX3JlYWRfaTJjX2Jsb2NrX2RhdGEoKSBwb3B1
bGF0ZXMgdGhlIGZpcnN0DQo+IGJ5dGUgb2YgdGhlIHJlYWQgZGF0YSB3aXRoIHRoZSB0cmFuc2Zl
ciBzaXplLiBTbw0KPiBpMmNfc21idXNfcmVhZF9ibG9ja19kYXRhKCkgYWN0dWFsbHkgd29ya3Mg
cHJvcGVybHkuDQo+IA0KPiBJdCdzIHVuY2xlYXIgdG8gbWUgd2hhdCdzIHRoZSBwb2ludCBvZiBl
bXVsYXRpbmcNCj4gSTJDX0ZVTkNfU01CVVNfUkVBRF9CTE9DS19EQVRBIHdpdGhpbiB0aGUgZHJp
dmVyIGlmIHlvdSBjb3VsZCB1c2UNCj4gaTJjX3NtYnVzX3JlYWRfaTJjX2Jsb2NrX2RhdGEoKS4N
Cg0KV2UgYXJlIGxvb2tpbmcgdG8gc3VwcG9ydCBJMkNfTV9SRUNWX0xFTiB3aGVyZSB0aGUgbGVu
Z3RoIGlzIHJlYWQgZnJvbSB0aGUNCmZpcnN0IGJ5dGUgb2YgZGF0YS4gSSBzZWUgdGhhdCBpMmNf
c21idXNfcmVhZF9pMmNfYmxvY2tfZGF0YSgpIHJlcXVpcmVzIHRoZSBsZW5ndGgNCnRvIGJlIHBh
c3NlZCBmcm9tIHRoZSBjbGllbnQgZHJpdmVyLg0KDQpCVFcsIEkyQ19GVU5DX1NNQlVTX1dSSVRF
X0JMT0NLX0RBVEEgaXMgYWxzbyBleHBlY3RlZCB0byBiZSBzdXBwb3J0ZWQuDQpJdCBpcyBpbmNs
dWRlZCBpbiBJMkNfRlVOQ19TTUJVU19FTVVMLiBJIHN1cHBvc2UsIGl0IGRvZXNuJ3QgcmVxdWly
ZSBhbnkgYWRkaXRpb25hbA0KY2hhbmdlIGluIHRoZSBkcml2ZXIuIFRoZSBjbGllbnQgZHJpdmVy
IHNob3VsZCBwb3B1bGF0ZSB0aGUgZmlyc3QgYnl0ZSBhcyB0aGUgbGVuZ3RoDQpvZiBkYXRhIHRv
IGJlIHRyYW5zZmVycmVkLg0KDQpUaGFua3MsDQpBa2hpbA0K
