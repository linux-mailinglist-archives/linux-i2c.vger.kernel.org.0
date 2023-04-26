Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B98BA6EF632
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Apr 2023 16:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241311AbjDZOSn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Apr 2023 10:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241279AbjDZOSm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Apr 2023 10:18:42 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2135.outbound.protection.outlook.com [40.107.113.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F12BD6A70;
        Wed, 26 Apr 2023 07:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYX6A8bMKtLQ9Mlt+3KF9Oxj3wL5BwJlTQNiEG5+rNmRe4djg1OMLY1ROJ4kMJreudXCqDyHZdBI8lppb2xuqEiCq4nAXL5ID+0QOY4fK0xpQWVxqafv9oE2cyBvE+GPhKlMTY8qhxIhxGsTxrzgbL8INdJveDrZvulB4eLarEOJaKN2h6UmJ8khe6DxH3F4p/UlPBHPzCQjH8LuYWaC1p9T+1jCmoyuIbKmePttkr8UmxuBtkTpRs3B5+U0XzekNMB1J/zQnJb+cNvG9fiGOOOXYQ35tqm+47hHVnqH2XCcYsELydTU60lu9XE3v7T4/nz7H4s00eXIoFBO3THYsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PscPsFsC4yksqcDeNgQFHzSzUm0FfH+l1z9mIlLsf5s=;
 b=F7do0kTWdPDInODISgPlBl1j2S8AMC6fTnYC1FhWJzq6eLNjKSTFBlybCL3MV6GgTJummdmiCU6XD+UqxpjA8KkuJM6iUJrb5lOzxh/v8SpCnFY6PCM4r6KNtWODwSaAZ4aeDsQuvLr92iXHzPcUzfNGIbAHdNbndcfKqv2vJl2ygj4/FqTSM29Rxh6QnSKvB5aMlkAHl2zLZ0f6aYR9SBl6H686cPMJ4p3788izFvhAGIkNe+dMgdHHboKuQ2wtpgCOCnBnDiXdH+59V4J2PTWm7Hxr3KQojHeNQaI+qYQICTGpRXimHgeJkZ1/IW9xa+1wHX9voSLkAPK8AU3Ipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PscPsFsC4yksqcDeNgQFHzSzUm0FfH+l1z9mIlLsf5s=;
 b=lvqzv47PKzCd5cxvkoZhHzCjfnmWRoO+bPtFoVcvcovZl/NNV6zKBpRf70StRqzdnpqBNmSTLrdY2d9i3bpD/ZkUq876+DqQ5/OkFrhlwlpS9ED7Wq4zM6ONv8k7HxshNi6BK9zGqV1SAFodFsTpx/AfRiEA5q4nMZktdAPNq+g=
Received: from TYWPR01MB8775.jpnprd01.prod.outlook.com (2603:1096:400:169::11)
 by TYCPR01MB12041.jpnprd01.prod.outlook.com (2603:1096:400:387::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 14:18:37 +0000
Received: from TYWPR01MB8775.jpnprd01.prod.outlook.com
 ([fe80::f687:2c30:bf97:7ca2]) by TYWPR01MB8775.jpnprd01.prod.outlook.com
 ([fe80::f687:2c30:bf97:7ca2%7]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 14:18:37 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Chris Paterson <Chris.Paterson2@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH] dt-bindings: i2c: renesas,rzv2m: Change maintainer to
 Fabrizio Castro
Thread-Topic: [PATCH] dt-bindings: i2c: renesas,rzv2m: Change maintainer to
 Fabrizio Castro
Thread-Index: AQHZeCb1q7eMEQCPTEOcjv70uROk3689oyXw
Date:   Wed, 26 Apr 2023 14:18:37 +0000
Message-ID: <TYWPR01MB877504019FAECEF5BFE421A2C2659@TYWPR01MB8775.jpnprd01.prod.outlook.com>
References: <20230426100736.11808-1-chris.paterson2@renesas.com>
In-Reply-To: <20230426100736.11808-1-chris.paterson2@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB8775:EE_|TYCPR01MB12041:EE_
x-ms-office365-filtering-correlation-id: 67fe5774-8fa7-4b8e-7830-08db4661204f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FPuq0PCO3E43ZQIySAMd4PX6ooRYKVKERxD7yKfHqK01Lnw9akuAok1W6gUsjhcgk2AWZ36srWXZLtwHDOAtIkBEVjs90Q3KGXcKAgJLyhMSrgFZulP/z+yb9SkQNu+McW5GuXUxFs8c/Md27hsBg/eZKB929p2gFOJNP2iZXDmFfoGCHLxrpqIJtnAvKmCuIOVVxeCT5qxk/0aIQF4m29F90Vd7FCxAn/ssY0fomM22R5f4Xj0b2K8xGq+i+xFF4Nkh6fX0mTiIUAO4FBcxfckdgaj1SK8v90J8qp9iIs04mu0nt2WnKYclEOYNfl6JVJqKit6I4k1XDl2QPqH9xbsfEa0D5lz+4qQgRZdzigSh3Bm5StkeiPLNwcCFsTr8TPdXj0fGaZU/eW1GVyFZ3tqd1Fh4vp0fi79f4Eq+eV+jEOjZv0sbgNTi4GGnR8eWaHnsSSjS0ETpGq+dql/1ymErTe78iWIm/V5dWMp/SL5JQY2fLFvRvDwkGV+9TyP3CETaLNzuAhvepiyFerepaFtexsXDAGF4v5GAMXPvoB7AU3exrXjZevNdo0DMdVJdKWg3bZWl++B5gEKGEII2zoAlrIEur6gIh4yspryn6ayI/MrSxD/bj8JcDX1GU39p
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB8775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199021)(7696005)(33656002)(5660300002)(52536014)(122000001)(558084003)(2906002)(38100700002)(71200400001)(478600001)(55016003)(316002)(41300700001)(38070700005)(4326008)(66946007)(66556008)(66446008)(64756008)(66476007)(76116006)(86362001)(186003)(107886003)(6506007)(9686003)(54906003)(26005)(8936002)(8676002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+py6AtKJR/S6zcSUImdms+zgVEk5WBNuyZPn4nA75CkEB+XGcE95hb/xMf89?=
 =?us-ascii?Q?N3KViKjLiVeKDgW5RLH6B9NGKmImnMbBBgHZvjkqT3/P924APbUnYPxzfhfu?=
 =?us-ascii?Q?r7PSHskWy1K3bbL7/IJwYWk2okmJAacTG75NqQ1xEVzBCW66LVQoEeMtEwts?=
 =?us-ascii?Q?KS5R8gDdjaxu7ZK3XT9iL6bIvvpuTHc9m7c7VfH8sWmAP+u5Uu++gNcMN9Nx?=
 =?us-ascii?Q?n43p34h5slqg3J1byBmICKvlcpEEd03oHA+K9nQEpNan4r7UKhMfLCM9jtQS?=
 =?us-ascii?Q?gWgbHeH3z5DYhGqj2p02JIWVMqWD27iSJpdNqSFZFXiw/4tQ4qLESoE2phev?=
 =?us-ascii?Q?yaYUWNubLIZZ5QOxyKgNLn1BHyzRBI2u67Uj6xvBovvkf2dic7SfLAxiZfSQ?=
 =?us-ascii?Q?+CsKbgoXX0qYZrEuo/twMkgCXzGG4HwPtWozxW9jeyGNNiEcrocJ7RQlKnhQ?=
 =?us-ascii?Q?x48shvi98UFCtDJLRiG/iEMBpd0iX9cWj44KXvc2mcndkAFDL88ALiGmDLHt?=
 =?us-ascii?Q?eps4yDQ+eboEkth0gkNsvNSm4q0sJU2iHrLszAXdmm3ukRpcsEgfdOZe1Q2z?=
 =?us-ascii?Q?ldg1axQ8uFikPuIxQLyq+W15DzAVCCq4A5P/d1aMH7NEeudumyxCkfyKs8mX?=
 =?us-ascii?Q?zxU2lNTYzGN6gfwNRkbOGp9GtdQNqkaVSuG7zNX2Rygna3i5Jyd7TxQ5JyOJ?=
 =?us-ascii?Q?hRZtI5dhYowhfDrN4OUZx+/tAHX6EUfR0GaCRWWGwyDRi5473HzG1AIi753t?=
 =?us-ascii?Q?npolVox/OJV+pXE/GoMJkqSd/Zmfe+BOiqpsJ1BmKquYZSw62J49b/dDLoMd?=
 =?us-ascii?Q?qoicmIlAVzEX+FF4+ioGAFELg8IpioZJiehjQLdUw7vxprqb5XW5KMYWKwew?=
 =?us-ascii?Q?FTBS4HRHhycapNy7hPyPNAoOofgJQSq0l2+m/pmCbVPyWrv0EKuGovFdr/Ng?=
 =?us-ascii?Q?Lf6ZxEBxWYnQwwCoPutYg8VfP5vK0rrxsfCMhPV+Co0aMFZ84Pd+DbHKaDXr?=
 =?us-ascii?Q?3VY/esLdHwQ7pZ1xpQZ1RnP+YJXB6/II7aeoWVd1yS1+ho3nIF2FoW5e+79C?=
 =?us-ascii?Q?6FcrA//nWsn0OnnzWVpwjyIEVK1Rf6c6QGKCmVTwyijDRI0S0kjGTCMxoe4l?=
 =?us-ascii?Q?n0h3D1ypfxhma+ax6uSS0qoK1YrOnoZlesubwY7iD/s80Li+h8JPtNh5pFGz?=
 =?us-ascii?Q?LcD/BeltGS1H8xqJMzLwLvWxtYxd8hoxD48Cf+HNURvW3Ui4p9X6qHPXp8cO?=
 =?us-ascii?Q?sqq7p2cxf/NRba9pLz4q7kvtrEmdp5xq+C80EgHmMa6Q9jvHQkpA9sEiTj5F?=
 =?us-ascii?Q?5C6z6XNIN8rL5ukCjXPuJEecFApDW3i8lEEwfRZtmDkCoR9h50Q+mUZjyykf?=
 =?us-ascii?Q?3ppoJNz4OcFa6AIe1LCLEUAZ1E2cN+rvhRTtzIHeYKHG9b/Q8Wrm5bkFBze2?=
 =?us-ascii?Q?G2j9jJK0kBfBQr3BLXS4FffM79AV4sGXKobxwuk2bDZEalHDLfz0a7JAwA8d?=
 =?us-ascii?Q?QgxkW3G/rb9UlY5j7PddQNTTjLkgvIdcphLiQYZAWuPhWjxmmzy8yV59GNjb?=
 =?us-ascii?Q?/bFfShKprmya/id1uHd7stmjhmcDdsmvpC5IaZuKlrMW8M/Q4e9Z6f3hZRmT?=
 =?us-ascii?Q?WQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB8775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fe5774-8fa7-4b8e-7830-08db4661204f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 14:18:37.0724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x/16or4A40pziJuDuJ6g5RFf5MYlam8gjPHVs99dJVVdsJzD3gSNZu/UwAIiZk5P5d3WCs6+0niqRY/sPzzY/sP40eXAKn/9+UMUUeNXelw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12041
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

Thanks for your patch.

> From: Chris Paterson <chris.paterson2@renesas.com>
> Subject: [PATCH] dt-bindings: i2c: renesas,rzv2m: Change maintainer to
> Fabrizio Castro
>=20
> Phil no longer works for Renesas.
>=20
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Acked-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
