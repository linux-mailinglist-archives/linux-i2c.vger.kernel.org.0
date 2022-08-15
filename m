Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 205A0592722
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Aug 2022 02:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiHOAxG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Aug 2022 20:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiHOAxF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Aug 2022 20:53:05 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB1AD7658;
        Sun, 14 Aug 2022 17:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3/IfWOnb2IuSen1huy6y9LQhFrI9L/wGdVnbHuITSNBUfgL+h/9TuyD4kyVR2GnfWZTHL9E3EERydSrxB6yePpctF8VMKGXBCln0AprkUIOQ0+5j9wnEQBUdMXJFEqbwn9kozX6KWi+svfBuntyjYOIhZ2Hh51xZYj4nv3sWmDgOGCb1BASySSv+kLobrDO7blS+igZtEOsHjb7ta2mQSdAhz63GamSmIdcyhxlR5FzKfXP0BLPOIAzNa021Y5Ljvkczr9S6xxpRV0oVLYVj+6nks1CM+pG8wzpOftaritwcYra0oEqu+UFo2EIJkg012gi/dRAy4gQO2DHvDu2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lhOkmiDSNNqmDpqXPnq3vW2l0RSLX+ukVDjXQd8Mlo=;
 b=J9AGBJBShE5Fezd0QaIIBrZ0bnwH13VHJVtqAFbeUABfDW+a5MpyRQmANOoiW1LQCmHz6H5dCugUgr/pE4b0c/1qskcmJLlWYZVzK6eTLK8U2hmEIb33ErpzygDHFxCJaoqk5ufn4wzs8DrUNcGcL40zp0mFGE1ooMSSGji1Qhsqc2pNXjWDw88Yzm+7vNXQ+qUK04e7iljP21G37Cl3CvHH0TzwRtNoUDK71sUe8JfxUgYcNC8lZ4OEP9GtVQNIzn8gGEURwFdL69EJADevHyMiJuaFOeQ/0SK87Hg0d1AVhLHjfMxYVTVPKcYAo5k/b+dIGODdLek55eMajPODmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lhOkmiDSNNqmDpqXPnq3vW2l0RSLX+ukVDjXQd8Mlo=;
 b=Vx/NNh94UBppgP1kaukldiSL6FM5VDyE6mPPAq07zJEKiWg0Dr1NjGe88p8LyAWFaw2jzjoYj/tw1fTpI39+jjy96yCjK6kWX2C4+5YUEU8ggLAQL+KO9+mH59uZZ2w4tlNBc+KBSpE5q7r3Kg6dcdLptSw0VMq+TsvR+du2+k0=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by VE1PR04MB6365.eurprd04.prod.outlook.com (2603:10a6:803:120::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 00:52:58 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 00:52:58 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Clark Wang <xiaoning.wang@nxp.com>
Subject: RE: [PATCH 0/6] i2c-imx-lpi2c: add IPG clock
Thread-Topic: [PATCH 0/6] i2c-imx-lpi2c: add IPG clock
Thread-Index: AQHYrgSSA2Yxdic4lUaQqa4Ze2PTqa2rDHsAgAQXC0A=
Date:   Mon, 15 Aug 2022 00:52:58 +0000
Message-ID: <DU0PR04MB9417D62230578AC8CA4234F288689@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
 <f1add9c7-fc2e-a600-49a6-a6579f17db1b@linaro.org>
In-Reply-To: <f1add9c7-fc2e-a600-49a6-a6579f17db1b@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb8c1e92-6ead-427b-a044-08da7e587f3a
x-ms-traffictypediagnostic: VE1PR04MB6365:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gjAqj8z9tHs9XLoE+JKmPZVojeXGxhFe4utFfx2OB1q52E61SYK9Lt2+FhpePSErJTuNzaQhKqgo8lK53hWDb6aMyI62gEnBOwVCQ/dVkUlPKA7tThpIwx7QVpXgBiiT0u/LyuLZ/us661tqs0ITSOYdEB6BXEVXV1YnesoMAUzeSIkPk/LyKwPq4IYExMRmKFIO44D+5nS0DUQS4JzeVeXO/tOMo8Bwn8FwTxp98ccNjQ1iOObn1SDZfEnp9t0zlalS67OzJxVqNy7/FubP6aPIbQneuDn4eWYss1y7ojwIlLm+ZtjFdot64vFkx7917aRkNqz9RT64EqRE2bd4hIWt7NPhPwJB7zmzKVFSMp7nBr7W1O2PGd+zVmRGL8CdSJ/ZQ8mJtbirFmePS1/l5utyDexk+kpMpDfBqn5zI+SA6i73xlCmi+w6O9iHMRBucliyRSeJHHg0KDTS0OfMrC5OIX4hicS+/ZDWfwHRgXfsnjgfdUDWbETiTX/TGRnsJrsIBiaJpdCD4v8/QUun86mvQX3t1wF45Jux/zk2XOmIYM3GXHyymmg3HKIwCJ6WbMDOI72+NmeZIiNghv+ST9NNO6H1teCywQD+FclDuu9582bOP6uVPNWN4weQdAkwiumJ3dNY8ODaXKLvGpDrsNIJL8ueptZ/qtTuQdK1VGnZJv1l5F3DDbJsb0gobumfVo8UxiyB8bhIoRU9l2qHaEQd00+TbCRxNiqzkVMjQZAt9F3zMxJ4EAvJPZOViNDB9zDH45jxMKuQwg5WaeYz/EMgm04YVepdVgAdFirnCt4boZDRi/8Kq/4PcgqFT+YO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(366004)(376002)(39850400004)(136003)(4326008)(5660300002)(64756008)(55016003)(54906003)(76116006)(110136005)(66446008)(316002)(66476007)(8676002)(66556008)(52536014)(8936002)(7416002)(44832011)(4744005)(2906002)(38100700002)(66946007)(122000001)(7696005)(33656002)(38070700005)(86362001)(186003)(478600001)(41300700001)(26005)(71200400001)(9686003)(83380400001)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVAwcDZOazN4dE5wcjd2MG5hN3ZjM3NIY3lvN1NNcm5LZmlqTjgzTDYzTmFq?=
 =?utf-8?B?TFl0TTdNTDIxUWhwZUFJNmZ3RitxRjl2T0QxbDREd0hvcWlFSy9hZVcrc1ds?=
 =?utf-8?B?dTBoN3RzNTBycUFUNTVzeERWeGJoSWRFZERUSTUvZnhueW9HZEdSYnFNaGcz?=
 =?utf-8?B?eGdORmsyclE3TG1KZksvR1FVcVFxL2tNSzIvRnVRYWhSZDhoK0prNUliU2hi?=
 =?utf-8?B?ZURCNXRkQXNyVkdwNGpoN3NtK1lQeElxNTRZYmNFaS9ST3liSEtpcVhSSTRH?=
 =?utf-8?B?TkM4VHJrbmtBcm5KeFd3U2dxcDYwV0RWVFYyWXVoUGg5emJXcmoyQ0xoUFpz?=
 =?utf-8?B?WWJlNngxbzBvUVBHRUNkWS9QNzNXcGFiWGM3VXhKeHRwR3JwU0ZuMFNmM0VY?=
 =?utf-8?B?OWdqVURtb0crRG9nM1IzUkJWYlJZcHVyQjRjdzE2L2lKb0xQU0haU0FrQktx?=
 =?utf-8?B?T1NwanZFK21UWjFtd3Z2RnYwRTU0TUk1MS9VOHdGdEpuVmJ6eWc1M1lZaVBx?=
 =?utf-8?B?aTRXUTBoRnlzTUVJalYrOStQdkFqZkYxZU4rcDlKa1JJQmpzeVYzVmhoWlhp?=
 =?utf-8?B?NEhKY2RXSDNnaHNMSXF4bWoyS2haNjI0cDFmWW1aN2N0cDluUnRlOUhKcTJ4?=
 =?utf-8?B?eE9rZ016NjBlRTl4aTY0TVBNVlc0dlhnd0ZrK2JTSzBTdnNMWVZPOS9KNnVo?=
 =?utf-8?B?N0hUY05MZi9GZ2tSMk5KU1Y1S1YrZ2pCSTdWQldlN2hzSTVVVzNKMzN6UFRG?=
 =?utf-8?B?TmhXK3ZpSnR0TzZiMjF5SjM2VSs0N3U3VXRhbFpHV2VpUlpWN1hFeW9HeVdn?=
 =?utf-8?B?Rm1LSjBZenlqL1FCNU8wckl5am9ERUNubTlvTS8zN0c2dnpHT01MU0U4cW9x?=
 =?utf-8?B?Q0xOU3VVRjF1cDhvTWtHUDBEWkZINlpvTlE1U3J3endWb2lKRVdnZEZkVHZq?=
 =?utf-8?B?b3JmWTUrbjRBdXRxNmdHb0VYVDBNd01MLzBtbGErWGs2bzJOYXpYMHJPMmly?=
 =?utf-8?B?VU9aVkNiN1lBVnN6MVArOFZzLzVwVmowclFVcTFzYUlzcm84NTYyR3ZQZGZ2?=
 =?utf-8?B?MnRqa3hLWUN0ZEdQWVAyWnpSaW56MjR1MkVpQTU4c1FQaG9qL2pMVnRZMXZS?=
 =?utf-8?B?QkQ1YlJhODVXVjVnc2p0dzlLS0lOdG1PZ0hTVUFyUTZMT05ORHU0VW85dnU4?=
 =?utf-8?B?d2JBdlRtRGI3MjhkTXd3eUM3V0NLQnN5ZjBTak0reWxUZ0c3QnpiYUlwM2hZ?=
 =?utf-8?B?a1czclppczVLeGFrNkd5aTE0MWxJUkJISE1OUVpjM2c1dFlidGJETXI2aHk1?=
 =?utf-8?B?ZHRXeENadGpvMlJhYnBma3cveFkzZHNXZnNuYUpVY3ZSWGVTOHpXUUJ6dTVl?=
 =?utf-8?B?S1hJWXh2a1pEUkowQ3lQeWxGbkFBbXhjaGV4bFpkR255elZnSFhuTG5uQ3JJ?=
 =?utf-8?B?NTNVRnYwYVhaTTMzc2V4YzRyZlNJNUgxcFZuWGkxWk9qdlBxRDRtMjFJb1RU?=
 =?utf-8?B?L0lYalRYZld3djRZZ0U5WDBZRHlVRVN3eGFjc3dRSXd2TFpldmU0UVhra2dk?=
 =?utf-8?B?YURxYXVLSWx3dzlRUEJnU0lVek1yZERVNWxPNC9KdWR0T3N3dERibWFaN2ZD?=
 =?utf-8?B?TzZxdCtqNG9CNGp0V21mTi9OdnRNQnQ3Vys5a3BwMHZZYnZGNHF3NmUxaHRY?=
 =?utf-8?B?TXVORFNmd0VhTEMxQ3k5QWF0dnd0UWtvU0VYUFdUMUIyT2lsNjUranhXZlBx?=
 =?utf-8?B?ZHExT3dFWHBjNUlhdlR4Q3NOSXhtSVo5bmVRS1o4bkdjYmtWU3NSOFN4Unho?=
 =?utf-8?B?RDJBRXBiOHN0YlJLOVdIK29JeVVvRlAwK1F4MzByYWxkZ1MyU0NaLzV1UzJn?=
 =?utf-8?B?UVlhOW11cjRtdC9zV1NxNHBVTjRxbmNRRit6Nnlmakppbm5Oa05DeFpzcHhR?=
 =?utf-8?B?VnEyTUJubVZFbmhmaEU3dzJ1RlpBcm9rMEIrUVgzUmRFeUY0R2ZteWw3MVU1?=
 =?utf-8?B?c0NlZ3huQ000Ky80UWlrRFQ4YkpyOVVtTDR1YmN6ZGlnL1Q1SFJ1bGVlN0Fr?=
 =?utf-8?B?ODhwanBWcGdlUTB6cHVrN1c2ekhVdEozeFlPN01lRk9DcWtjMWdTTGg4bk5n?=
 =?utf-8?Q?jZ5w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8c1e92-6ead-427b-a044-08da7e587f3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 00:52:58.2648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +1MzpTsUdsaYfhjse2Yuup4FYvDg7wBA48TfhhqyIGAPl4aCPG5DAYqJTzxJ6AKW0FIY5dhKBRLq8kYjg7NStg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6365
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC82XSBpMmMtaW14LWxwaTJj
OiBhZGQgSVBHIGNsb2NrDQo+IA0KPiBPbiAxMi8wOC8yMDIyIDA3OjM0LCBQZW5nIEZhbiAoT1NT
KSB3cm90ZToNCj4gPiBGcm9tOiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gPg0KPiA+
IFRoZSBpLk1YIExQSTJDIG5lZWRzIFBFUiBhbmQgSVBHIGNsb2NrLCBub3QganVzdCBQRVIgb3Ig
SVBHIGNsb2NrLg0KPiA+IFRoaXMgcGF0Y2ggaXMgdG8gZW5hYmxlIGJvdGggUEVSIGFuZCBJUEcg
Y2xvY2sgZm9yIGlteC1pMmMtbHBpMmMuDQo+IA0KPiBUaGlzIHBhdGNoc2V0IGJyZWFrcyB0aGUg
QUJJIGFuZCBpcyBub3QgYmlzZWN0YWJsZS4gVGhlIGp1c3RpZmljYXRpb24gaXMgdmVyeQ0KPiBs
aW1pdGVkIChvbmUgc2VudGVuY2UpLCBzbyBub3QgcmVhbGx5IGVub3VnaC4NCg0KQVJNMzIgaS5N
WDdVTFAgYW5kIEFSTTY0IGkuTVg4UVhQL2kuTVg4VUxQIGFsbCBuZWVkIHRvIHVzZSB0d28NCmNs
b2NrcywgUEVSIGFuZCBJUEcuIEJ1dCBjdXJyZW50IGR0LWJpbmRpbmdzIGFuZCBkdHMsIHVzZSBv
bmUgY2xvY2suDQoNClRoaXMgcGF0Y2hzZXQgaW5jbHVkZXMgZHRzIGNoYW5nZXMgcGF0Y2ggNCBh
bmQgcGF0Y2ggNS4NClBhdGNoIDYgaXMgdG8gdXBkYXRlIGRyaXZlciB1c2UgdHdvIGNsb2Nrcy4N
Cg0KSSB0aGluayB0aGUgcGF0Y2ggb3JkZXIgaW4gdGhpcyBwYXRjaHNldCB3b3VsZCBub3QgYnJl
YWsgZ2l0IGJpc2VjdCwgaXQNCmp1c3QgYnJlYWsgQUJJLiBCdXQgSSBub3QgZmluZCBnb29kIHdh
eSBob3cgY291bGQgbm90IGJyZWFrIEFCSSwNCmJlY2F1c2Ugb25seSB1c2Ugb25lIGNsb2NrIGlz
IHdyb25nIHdoZXRoZXIgaW4gZHQtYmluZGluZ3Mgb3IgZHRicy4NCg0KU2hvdWxkIEkgdXNlIGEg
Zml4ZXMgdGFnIHRvIGR0LWJpbmRpbmdzLCB0aGVuIGJyZWFrIEFCSSBpcyBhbGxvd2VkPw0KDQpU
aGFua3MsDQpQZW5nLg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
