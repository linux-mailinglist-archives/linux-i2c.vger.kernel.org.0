Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E49159BBEB
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 10:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233393AbiHVIqj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 04:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiHVIqg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 04:46:36 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50074.outbound.protection.outlook.com [40.107.5.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1156A2D1C6;
        Mon, 22 Aug 2022 01:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meHW75pgDDp5Ed0NgqvagnHuyObdcsR43PX+8dYl6E823n7vWgw8PVI/q1mGDjaA+Z5hTfz874EG6QN73eyEFXDBB156lkMqATf37K73oozmPgVqAFJJSnZxFDnDc/ODnN6R4vIEStd1gF0FKC/G9IQhY5vI0SupQDLpI7SFX3s7Py8RnYGUcbeFyoWrQw9UnD53detEO1KqcxKhItRON6cY2ZJx/AX3Kz+3oK8k3YwZchag8gRxDz4oPPSsA6pYtI88uyVxKzK32cCphV/lgZhH/fxWe/EPnpEdRdeesQQlsaLuAgF+NFli3tM8a1Vw8gzZlTGNCbxPGs9Xns7j5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptK3mEjOqJ00oM8iZrBShJOi7SVjZAlRqIvlnaa2AOY=;
 b=gsc9Yfy3XNWPoCbadrhnABEYXUEb8b3ij4/nUnK5Tr3FNKFXSG46vdu2OXtybXPgadUl52IWYU760k1cJpcSg+moeVYcuMeDRe4TuvJCcb3VCx2zyIoJGszfu9BeB7QIIxBfPJUWV7HNbY6TbTEU8zYXp4jaODmROFVg6XTzx+3EIRkgXnJj7gO16PXN57gqYj6xo/7VmgohfzYszhRRAf7kROhqMOw861jt9KOOt4khaQvR43m8lvySUUm5YyFXk7Jkyrj50V0QXbHQiGdw+OyawIsrrW2HwSf9pQv24GShEx2F5MeyCRmYe/Tpx0HIQFanrhyaHe66hTdkiu4YVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptK3mEjOqJ00oM8iZrBShJOi7SVjZAlRqIvlnaa2AOY=;
 b=VWksD7X5gfA53Ift+ehcnj0PeU5/snDsFMzyqlOgoTHT/kKmv1Yh/I7gpopwF5nY0Upp/mcIl/NJ124VZQwaDzUaNTU5N3sEQrE+vBut7YKbdMSNiVLlU+rDLFFh151/bMV6FL7maFgcxpWWtDvmPjFrvVOnNSRx6vdjbFSdQ+8=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB7PR04MB4171.eurprd04.prod.outlook.com (2603:10a6:5:26::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 08:46:32 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%6]) with mapi id 15.20.5546.021; Mon, 22 Aug 2022
 08:46:31 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "wsa@kernel.org" <wsa@kernel.org>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Clark Wang <xiaoning.wang@nxp.com>
Subject: RE: [PATCH V2 0/7] i2c-imx-lpi2c: add IPG clock
Thread-Topic: [PATCH V2 0/7] i2c-imx-lpi2c: add IPG clock
Thread-Index: AQHYsW876SxYc4rxXUGbKvyYc8nHU626pHbA
Date:   Mon, 22 Aug 2022 08:46:31 +0000
Message-ID: <DU0PR04MB9417E7BD5F1FB7A8E00BAA3F88719@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
In-Reply-To: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df147d29-8199-4150-122d-08da841acfd7
x-ms-traffictypediagnostic: DB7PR04MB4171:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UTyWrX+oGzkJp8sETypcdGQ2ECRJW4YUWXZc7VONg9EX6mQmlKd2arfVyMpnf7TKWkT+aTi3nJtIOaS7BeqFC1QEVWmqi0q1zM+mS7KQJm7fcq6AywEwpobhir6gPE/+NhtOhc5S/GENONnw2a5ItXJpzDYCIkIwFFbvPdz4YxJP4/Zmnxfj3fuN7mvcRxPn4J9UiKRjm3WMr/EjRTpUzfkuOMq3gKVIiaWObhd+6ulj6+hdgGo4jQco6xnjr30vQ5iynRbeaOrha8gMg1zyXjXuGrT7cPlOVB3Q7W1u1Zj1BU4+m5nDtVuIkCGDf8Rntw9pwplfbkMyQR2t96nD2QbH9eyYI6mHIQEgFWeoqKPnu52Jt5mWWLz/do0j3Ok/FHnCPfKT+Fy3ufGsVKlRtBRct+pLYcU3/IZZNuTeANrdR/hJsxfQco97bEUgfkiDMWXv0NTYg6ukEBemYHjUznpLQWxdIDo5v0tJlJcBTKGz6NwDYWCiS1oMGpRJpVnWyvqF3ucIvqobi291eHaDNeNA576pSjIpW8kSkOD82UP34abmhm7R7INeWiv4ywGZGGNWyFPNChsm+ilhksusnuFbcVOaOecbuv1ZVqF/oQne3Wri44n4sZJNWt3GXwqYWSy2k9tVH5RfDAFEk+dyIbV3Jb/VXrh4bOLZw0Nrx/NkGz+PmqwXxDjo3C6ZKIJc3IyoGZH9FgnVZD04l0w3aKDMzpn6ej7zL/iJXBO2aJkQxWuEgQ6bRrUqu+8UcZ7MOPGVpJEmvp7YOuX2S8gItA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(66476007)(76116006)(8676002)(64756008)(4326008)(66556008)(66446008)(66946007)(86362001)(110136005)(54906003)(33656002)(122000001)(38100700002)(38070700005)(83380400001)(186003)(8936002)(26005)(9686003)(7696005)(6506007)(71200400001)(41300700001)(478600001)(7416002)(316002)(55016003)(2906002)(52536014)(44832011)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eSzAauO7FAqf5pJk8O9yTh4lerqZcR1O5vYL77GEy1cVwOK8Qy1BAv4k2W+l?=
 =?us-ascii?Q?Q6zMh+lQ6HpvmYT4MQpBu8u4JgjTomAod5cqEgqd2biy21t+jdcLPSKG0EoK?=
 =?us-ascii?Q?un6WNoXn7GCVkIU4ju2esiBXs4grzUBddjlKPYAOWOuuN1k/6osrkv16SasR?=
 =?us-ascii?Q?wU1pxA7cNxnoG99R0KjS6gztfGqSJzOusFHR0Sd13EuYHC/amWJ4tHM0HJuH?=
 =?us-ascii?Q?ItEfzS3tzNmdTRi4EaytP3C1T++JYMHk/KyceCswdJYA9b7bzKQ8de97C+vt?=
 =?us-ascii?Q?DZd6L1XNkoDesZNjNUz5NMaWZ9MujyMsdkWa4/P3Z7xN0tkgBx/0emZB7JzG?=
 =?us-ascii?Q?8PoKN52SvesgYfKRt/B5xiH8lfOP7xxC3iL6CBmcohnsuHfa99yELHSDIoZC?=
 =?us-ascii?Q?4le7Z3YV9avCDDMxiQ9Cj2cf8B+ccCLOu8k8JwN+0E8G1wCL2i/BWlE0XT8F?=
 =?us-ascii?Q?O7xnYuf93Lxq+9nwbEiaSbJEKnYBnKk21V32kyKJLdMMzmEEAe8D45Tw+vCc?=
 =?us-ascii?Q?re1KnN5EfRnHUey1cwYYd62zOhxU6DwHcagloEicTvWtCmwt2wfkDtLMTrGK?=
 =?us-ascii?Q?3sm0nKq6Cuh/FlFjSjrHWoAMlglOJ3r1gHvIfkTwmWHuKZ5TZQ1wohsVjgaz?=
 =?us-ascii?Q?Y09RxgxVCcZxL5c31My9OkswTj1kAiTU7U4qaHObwDwwelK0c4W5Mvp42dpC?=
 =?us-ascii?Q?HLNDzZNlQ0WxjZ0rBZvnF6hTrz41JSiRma3wp9Tox8l+i3Xe0AqZnWMRCWQy?=
 =?us-ascii?Q?1B1YcSwP/GOWz3rMqORXshOdgTGw/CFLZMrTAfiTJ8qeRHjmnxsWEoEkaOIV?=
 =?us-ascii?Q?80h3oZ7OiyIV+TfYuS7Ta1UjSVfZ6JAu+LUqiHxFGkvrG3orKCbb6JfOzc1O?=
 =?us-ascii?Q?HwjwnJTsk2JD/IPLwSmkUYBsGzrsNcaZRpQ1oMXxI29jArr8/onymZdYTWoa?=
 =?us-ascii?Q?Vj4aK2mvl3zJ0EsZdftKz+FXMiUgc1AeMFUyY4FhDQ6fH2zOTPi5VubSuasZ?=
 =?us-ascii?Q?k260aipntdXZC63G+IAahE5U4FkW2DPGI1fUWtLxhXxHb26+t2U113P5lv5O?=
 =?us-ascii?Q?+zPb1zhSq90HF6HwDlGi/PRq/aTb7llx2QDhI/PVwmXJzhOGAaLVoBCVsWf+?=
 =?us-ascii?Q?BJxiIuHpTn+P4NqBiugLJCLyPWrL/vypjexjaOUgFU7y2AVVRUwQI83LNyIm?=
 =?us-ascii?Q?F6xDmL3J9yMzqTqixlEmLJZ6LdKlD407KOlS1ICTaLdgYhpSba0jkmcQWznh?=
 =?us-ascii?Q?U7JAGM748nGcSSW40d6WMxNv/Ad7xz5T1ggKEAiJcUKgYjnnNy8MviDEYhKX?=
 =?us-ascii?Q?0fO1M6doXZbuc5YA1nt84x0cLKxHtgvkHWpISJhqXH0UKniv3hX5apqG8kmE?=
 =?us-ascii?Q?ViQiKG9HM+TG2wtBjIpG15d7x0mzDsCSzEdXrhHn6jF+K3e2NNrs3qLRO2mQ?=
 =?us-ascii?Q?MFwi7M4qE2a4DfwwVgll9EsYnZaXSX+ehykaTP9H3RZVX+S/IUS69SWnSuiY?=
 =?us-ascii?Q?tyuGXsSfQXlVa6IfckiLzxWdoYQ5NLeI1eO3b8Xkg7OX8tOqdEr7VQYjPKH0?=
 =?us-ascii?Q?bdRv0I35HMpL07nTOI++AQcK3B9CrFD8QcfGbrG6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df147d29-8199-4150-122d-08da841acfd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 08:46:31.6560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8YA09tBAlprHfHBvaamhFO4Cf570/pf2UD3plEESWscJERPjVOOmlerm0ut1IqTY1qOF4/B20CRHALeE+xHquw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4171
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Subject: [PATCH V2 0/7] i2c-imx-lpi2c: add IPG clock

+ Wolfram Sang I2C maintainer.

Krzysztof,

Do you have time to give a look whether this patchset is ok for you?
Please forgive if this is too early ping. Some i.MX93 dts update pending

Thanks,
Peng.

>=20
> From: Peng Fan <peng.fan@nxp.com>
>=20
> V2:
>  use clk bulk API in driver to support backward compatibility.
>  Include a new patch, patch 1.
>=20
> The i.MX LPI2C needs PER and IPG clock, not just PER or IPG clock.
> The current driver/dts/bindings use one CLK. Although it works with with
> upstream kernel, but it not match the hardware design. If IPG clock is
> disabled, the LPI2C will not work.
>=20
> There are changes made to ARM32 i.MX7ULP dts, ARM64 i.MX8 dts, dt-
> bindings, and the lpi2c driver.
>=20
> The driver is updated to use bulk clk API to avoid break backward
> compatibility. But it is hard to avoid dtbs_check pass, because the dts a=
nd
> binding update are in separate patches.
>=20
> Peng Fan (7):
>   ARM: dts: imx7ulp: update the LPI2C clock-names
>   dt-bindings: i2c: i2c-imx-lpi2c: add ipg clk
>   dt-bindings: i2c: i2c-imx-lpi2c: add dmas property
>   dt-bindings: i2c: i2c-imx-lpi2c: add i.MX93
>   arm64: dts: imx8-ss-dma: add IPG clock for i2c
>   ARM: dts: imx7ulp: Add IPG clock for lpi2c
>   i2c: imx-lpi2c: use bulk clk API
>=20
>  .../bindings/i2c/i2c-imx-lpi2c.yaml           | 20 +++++++++++++---
>  arch/arm/boot/dts/imx7ulp.dtsi                | 10 ++++----
>  .../arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 20 +++++++++-------
>  drivers/i2c/busses/i2c-imx-lpi2c.c            | 24 +++++++++----------
>  4 files changed, 47 insertions(+), 27 deletions(-)
>=20
> --
> 2.37.1

