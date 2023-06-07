Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC4D725B15
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 11:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235774AbjFGJxW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 05:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234384AbjFGJxV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 05:53:21 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2121.outbound.protection.outlook.com [40.107.114.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910651715;
        Wed,  7 Jun 2023 02:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsBcg8aPI8e5ZSKubLvzijv7vMOBy+t84Rn+8fCFJqJeIF/TbsPxl1iyuVdqeXHs8ydG2fauZ817PVhACfjg3eMvFY/wy2B+PARkgkETkd2fBWEpOfrgy5BaK6KcyAHU18qqAlD/IBTyAoRfX7n3GcOHJ2Lsey5+U4a3ZVjfhuBJshakuVUEkJ32hs12aSrF4WmtfXQuoYkFtw0Qd1UJcxyEvnkLBbIj+mvygM5BzpbALBzMC+Uj7eeNZcDiX7yoLofFi4FE/38qFgyTwMqgLVAXsCZqCbSQtNMkd1PpAaruzgekiodVZoL6H5pNmWbeOevRY0aeZCMyzblU/QxupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8eKqEUNlHo8U7zJmGEInHrP4fJ0jKYNfJ+0LCpQ/Zo=;
 b=jqifWm/sKakUYDvFqowvo4lPevdNYAcvv/N+KWIfu3ww0Kn476+PGvVNB90dCTizgZkiSD1z124i/2jdO7+8E3UpiyZFllakObPCLk43cPQ29O/wWFU9KqQkofPHE5hEN7voURxblwOboYw4JSEcQ2u1yvz7El4uzQweYYyGsJbtATMC1YLHl/VRt++KIxPmufzgqliaBWp73+pmeSIsBXqqP2xr6FoXeXXtZdi5p/UH4XmFvlk31XdmicVvC2QjxsadXOMFxGUVdGh1SXRfZSP0Cr3uu1y0XpRKuFe55llqzB3BirQIHVPD7smeMHgs46o7x81DNKhJp/Jho4T2lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8eKqEUNlHo8U7zJmGEInHrP4fJ0jKYNfJ+0LCpQ/Zo=;
 b=L8UjQCgJub+frDEkoQmen/H0lUio4VzB8649+dIpmi5qv/ZVYGB3rQhFtupcxPdxkKoHEhNrwLY/gfKBHGScv492I1H8ZDDEnmBdR1ZyLhbyv56oHYBvMrYDi01XjML9/fxAcZusN93yK4MEKG/fBgS18oENwNSN8a94sfSbuTk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10142.jpnprd01.prod.outlook.com (2603:1096:400:1d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:53:15 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 09:53:15 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH] MAINTAINERS: Add entries for Renesas RZ/V2M I2C driver
Thread-Topic: [PATCH] MAINTAINERS: Add entries for Renesas RZ/V2M I2C driver
Thread-Index: AQHZmH/RCCFDsGucuEajb+eQcwGmWK9/DgwAgAAMRGA=
Date:   Wed, 7 Jun 2023 09:53:15 +0000
Message-ID: <OS0PR01MB592240E629099E71E29E92F48653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230606140426.383462-1-biju.das.jz@bp.renesas.com>
 <ZIBI4tY9iLZpMkb5@shikoro>
In-Reply-To: <ZIBI4tY9iLZpMkb5@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB10142:EE_
x-ms-office365-filtering-correlation-id: edd06b65-fd6a-4af3-fdaa-08db673d03b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7z1ipr2rjdKA3owAGSYPVK1/ODcMEeVDqUmprrvcRE6wRJBapOAR65gVdlQ95+wIw9yOZdhl74yay3hlW0COl+FZHYQoj7nPlVWxhQlJo5IFVTBUB1FMjfCl9hPNOgGpO7IS348rUPulKDyfpsfqh160SomiDW4/aqQHLEQmdvGisXXrDr8eISirxCwj9zEkC9EXcoLGg4Qg+qCWURoliGguox3tHu5AvymJDkFjehGYB6U63t9tY36yVuyWNFaegTK3vt7VDL9XVC1oGj/29wMSFHbMClviOFdM93XUZRg4K35+U/QNtp3J3CUcY4zuVhGZXqmTdmszcsRJ7VF6GQXlvmbiFCYHvWOxLL38ZUPhZ+i2elQeCS2/Q1IYPrcYMl8sEBwpw0dRKBKbKDu+f9hFEKdE08d73tF+M7sWHkvk1f+YPhYarKRIJHGhVYLkNyEYmAHYm8TfY8AxZeSyBYNg+PHfJYZ3hgDS/R8IbZlXgREH9Y/aNPKmXvIwUX8HAGEJ48C12G0gEWY1rEf0tnKuMre1iTlTpJex+F4esQCuFYa9O2EkQZAb0YtuU7Yctk47kYeIx2+Hzrj7m6Io2gXt0xRDa3hcuROYu7wW2THg+D3uKuY9Z5DsWqvEDdIo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199021)(478600001)(66446008)(71200400001)(38100700002)(76116006)(66946007)(122000001)(4326008)(6916009)(66476007)(54906003)(86362001)(8676002)(8936002)(5660300002)(33656002)(55016003)(64756008)(2906002)(38070700005)(316002)(41300700001)(4744005)(52536014)(66556008)(6506007)(26005)(9686003)(107886003)(186003)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NQIpc4MeGzl8HJG3Payos0U9PUwiqszDgkzpzWc/aw1VTDsEXhgej99QPb6/?=
 =?us-ascii?Q?5V+NhIyITidnI0dkrcBw7HFwWOO5CctUWIJE04Br/PpOCMM9ygGI0r5K/dnc?=
 =?us-ascii?Q?kw7auD2eie5rirRo0TLOqC71ZcznwTzz8orS2QMrz/8AfsdjzSTHnevEYgHq?=
 =?us-ascii?Q?Lrf0n69oyie9/rGIKnWTUW3Kqbf259zcqPU10Z4YPILsIyOQivrkTmHBYNo3?=
 =?us-ascii?Q?p83HJk7zbg5gMIwTdHPuXZO7/di/UZBTS7rSOSKMqswMIy6VeGdks0FuY15P?=
 =?us-ascii?Q?ibm+gIHyGKZpMlUjWdW1SMttTIAOhddwpEnoFx8mYfPLZQG8vTyLj9Ke1Brm?=
 =?us-ascii?Q?5A2froEsaQEO0ewlRe0o7idtWn/egrpFl1PsCo0n519gJMcy1VxWFBg+E7Vb?=
 =?us-ascii?Q?CUe379I6SyQT0O+n2imUlPH4v5hssjgnrCQ0ccrikum9eiVKjFM0LZCZQUc7?=
 =?us-ascii?Q?6nhuIAp+PcXGJCQvVDkUydgmk54VrbsrvKvwgWlcCGiIu2CDm2G+WGgYg20E?=
 =?us-ascii?Q?WBTC96PWUSPCfLCxQMW2/0rb2CVJiIOyowiGvYbKi3bgbZS7yF5KfiPLP1qQ?=
 =?us-ascii?Q?dKzVlh9WOvTpwnvU3CkIf5DJyZh/y4v9EfoSmnMX909XqHc/jnEraxAqcdF/?=
 =?us-ascii?Q?UF7Lmn7wzhvqWugcAtk/6icu3D9QM95cD0wa2TcvZ9dXL3Xf495sPlVKLdW5?=
 =?us-ascii?Q?BtZxAx81zsP9TfTn6DvawE0uFo5JdOZ6tuOIEBUMOl3zZI+GAo+iiyJsb2d8?=
 =?us-ascii?Q?mQkotjX5mznHOLKqdKpNA5NPn7Ta5EuPtNa0j1XHk2w2sGYYZ7klt7G3a+is?=
 =?us-ascii?Q?a30vK4to3q5cSi6jzJHG6y8T9WQsx9NYYa5Wuqd6wYaLWEEuD3NN24H0NpLF?=
 =?us-ascii?Q?fey5svHfo8hMeYLUVzTAcHn5uE0BnpxLV/vCJNENlCO0a/QC+L8bbOsUQftJ?=
 =?us-ascii?Q?qg9C1lkzqUm42h5e9J6CdawMcUNIOdBxSxozdDHx4xpdR9R1bPbZAZZk3EHr?=
 =?us-ascii?Q?qT1k6dmdWTDYyBLcSZ+7ZBOCQDq+n/beK+IT65GjR9rziz33aUxLiMy7s5Gm?=
 =?us-ascii?Q?QQrYGLh4h6dIpAzMzsmtu7C2g6OS67w/2FrzFEpgs0JgXa3BXz1Gquuk90o2?=
 =?us-ascii?Q?ODUu4px3nMeA4Azbe9XFGnE8Kkyu/uPWy1wVrHKrDde8DyK1RguJkbroY5S9?=
 =?us-ascii?Q?iGYHN4atLEu1qNttnMKnSyB4hX3mvbQhi3LaGnfahsUfEab5z+Bw0WxSDUI3?=
 =?us-ascii?Q?/lZjtXX7OLkjs+YV3eQg2w0shOj2kej+u/OcG4JO2nJKIMEF+ae14sSxRDBu?=
 =?us-ascii?Q?dQPWB6bavrBQbRhlUWwpao7gReOiDqGNyURxYRv3FThuqRBeSIl8VzJZEn63?=
 =?us-ascii?Q?yO1i5Ii8yHFp0bZwK0vLY6SFxPML/pmA5x+J0fzR/UfgwlLoDPgqbnHWWP0t?=
 =?us-ascii?Q?Qj5uNBwgOlMsQmXMOqRHWGkT84xnsTFC1MVpgkC37GnDHxUbIr8Rdz96UPo0?=
 =?us-ascii?Q?vYuY3JvlTzv3S5J/nyNDCFzDI2qcFinkDuobBz/hqo7aVYThVQGCwk7SzjQk?=
 =?us-ascii?Q?WsCPaFUzgTJ4Q1J4DSoKLbqLLWhEO5hsz1XL3bff?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd06b65-fd6a-4af3-fdaa-08db673d03b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 09:53:15.5600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0m8Kq8w0V94CdFx6iXt282Oal5tflBmbgVKpCg9KaBx4zM7nNUI32keDZKUWe9/og47zgwV0GvMNTAPgbM1F/T5TL4bQ68iCHSUgk494EyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10142
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thanks for the feedback.

> Subject: Re: [PATCH] MAINTAINERS: Add entries for Renesas RZ/V2M I2C
> driver
>=20
> On Tue, Jun 06, 2023 at 03:04:26PM +0100, Biju Das wrote:
> > Add the MAINTAINERS entries for the Renesas RZ/V2M I2C driver.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Cool, thanks! I think the I2C list should be added as well. Also, we need
> either Fabrizio's ack or SoB.

OK, Will add I2C list along with Fabrizio's ack just received for v2.

Cheers,
Biju

