Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7294D77BB87
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 16:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbjHNO1D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 10:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbjHNO0h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 10:26:37 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942BDB2;
        Mon, 14 Aug 2023 07:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZDHCi/1i+u6NcOjRhnHH/DnL2K3RyboyoQGo4smTqN3cEs5zp04POxeVgkzLorCBs0fbOC/oiMkXt15OsUqKpkUe5Vqyj2Uz1GZ8UoernaV8gkUWGbx88BGtuhZ7x2PHycolkurD+Svvwsj73ziVc/k+BGhphc3Devl1xGhwi4bqLvGX4FdH3u2iMdo0IUwLu7nLLBQSYB3g68b/qWaQryfOWHptQgBGmsQVbOJyVgickCo7ntvf/tYtRaQO7froszpBJpF9VcxYFNUe6hYm1QUbgMalXnjjFRW/Iignwyj+RCOQWcciMGHoZGH1LZcFrRuAiXIVq5WJJTz4v0+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgWXLozj+ulTMETf046N+2HD92vAZOQIpxXzWB1wXMk=;
 b=epVQae/RcDssygpCoznXDQjRH8AVnhq+P7oxtpN7sRl8JNoJJYnrK1kLqd4/m7XzI9R9kSnoBr8ENS3CMnzIL3qQxa3mo00U2AY72J2+Z7tO0B0bWWfgjvvW5M3+tTXo+0b241la8zg+GxpWTm3EVIb1B8ltTeWnks7pcTIwr3s84S36k6cWSsJ9FkwzqGcd+/R2OnHVR4coppJb90XCoEPpVyMaTC+mWzNM0PhjU9b0Vk/ZW3ZJIzA13TTHV2rJTxBts2hS9ynAniRGtJEj1ZiQmyLYT83KROlZmTIUi9TUI1L+MtGPkjfGKywmn9h7HaQ7FmJGfe7xEcAMTxyYKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgWXLozj+ulTMETf046N+2HD92vAZOQIpxXzWB1wXMk=;
 b=uhhaCif8VJDurGz6xbs+UrTibn/cILElgDnn/ipOmVMxe3hhLMhgnOVKnI8GzHZG3d37bT3y1JWhimAaAjTlqggye+yr8o5uW4ATJWHGFytlk/mzbdqSh5QRUWnx1eITufErIdW+osbw1QkM+88BXHlX5MQVa5gXF5NNG0wXHrnSZpn6UcZvirFddoPyzN4OaX6BhH0M4A/mrC2eGm7PEDxsdR+wzw3RI7B7Paz/rg9yiamYMNZQ2dhFSQKCVU+09NtQ6LsI7OTl2vFWwv83K3McO5ErJO9gIVIn8NSpGAYrLCVDnCpnlwkAmExu4P63M3R4YhvpR+z5Saagafzttg==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by CH2PR12MB4922.namprd12.prod.outlook.com (2603:10b6:610:65::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 14:26:34 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::f850:92c6:c312:4be8]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::f850:92c6:c312:4be8%4]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 14:26:33 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Andi Shyti <andi.shyti@kernel.org>,
        Parker Newman <pnewman@connecttech.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Thread-Topic: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Thread-Index: AQHZxx6LzpeyXcck3U+NjT3QFNG5jK/dQvCQgAyX54CAAA0tQA==
Date:   Mon, 14 Aug 2023 14:26:33 +0000
Message-ID: <SJ1PR12MB63392E74EFFC72D53D2DAE86C017A@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <fcfcf9b3-c8c4-9b34-2ff8-cd60a3d490bd@connecttech.com>
 <20230804215631.wc22pkyetsyyt5ye@intel.intel>
 <DS7PR12MB63358D8D877BBC81BF94C53AC00FA@DS7PR12MB6335.namprd12.prod.outlook.com>
 <ZNouN8t59ldse1ih@shikoro>
In-Reply-To: <ZNouN8t59ldse1ih@shikoro>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6339:EE_|CH2PR12MB4922:EE_
x-ms-office365-filtering-correlation-id: 838889f5-1f90-45f1-0410-08db9cd275cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A0T9coxcIxDPhTjIcSb68zATOItDq6NqMi+hDefyZCcSK1pwkEklGrxjOnI/TbnhQEPK4K3o22JqrRe61SlF+YgwnOhFN7+PMni3q0Xr+dcrt+tA9iPkVIy639VI2O3s/UwUyV/jypvceSY/HBsjeXk5sKCZEFGzuVfSIPrOfynsSW3Rwh9LUU/oD8th5lShvKHQWITJQORQWje1+ZKYVBwSgKdYam8Kf5KuoGGuA8STHOQYcmhb1WUvfY6bHz/RxUFWaO/XS0ByoZfhgAROG8nomYz2nRrG/93BkuCjWTtD0K1Que868t16agxavi0q1+9G93i+0o4ReEQOoOm3KRJMYogzA8e+Q5sQm6gtsTGN7RJC7aPglXzV1dwAgf7pX2gTht+LNsWUMqZ1BgfkvbY6bbPSp9JfmdK4LI5NBUqFaZJdH5ocdGYguYZJLwDVvkI3qjmc1TKFZs8TfaqxahPGJt2uYSwHUTfYfuo9fDoejBU/ZczlUpvnCqGrlt9AUVEDBxy1F1O9YnY7TogxF+hWfu+ty4dMIdN5ZXdpr1aA9/qnxxwNOLp7+uNyM7zRDp1n+3yq/dWkbg2IPudetHAPe9d4neEppOkChkz9h9B88RHi7DNdGX63IkXtiKUZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(39860400002)(396003)(376002)(1800799006)(451199021)(186006)(52536014)(5660300002)(71200400001)(41300700001)(8676002)(8936002)(86362001)(38070700005)(55016003)(122000001)(6506007)(9686003)(2906002)(7696005)(316002)(558084003)(54906003)(478600001)(33656002)(26005)(76116006)(64756008)(6916009)(66946007)(66446008)(66476007)(66556008)(4326008)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?isU3OSnsxXWgg1tI4CaluGSYprqB+iKeQPjDvC7imTcVvzn4tnavs+UF3iih?=
 =?us-ascii?Q?JhVLj+AetBSbm155M31scguCxp9cZ4uDLePt5wrEaNhnNRpGsYuybVMeKcAA?=
 =?us-ascii?Q?nSnXG2C/+SfrCbYO3PjM6CvHRAyygx9nAYRV+l5AFYbWg39vn6DnXaLOkGss?=
 =?us-ascii?Q?6Fm8YzJJ3ad+xFpsGFnT7hOwuiEfIMQzSAVc2lhLoHjDqZ8xwxstPKB6wCyD?=
 =?us-ascii?Q?PRCBfnmSXuRu6DL1sutQhZYuDhR/ZY23cgHDtDQM7cRAwyWAlRMAG5+wGD5G?=
 =?us-ascii?Q?OKvOj39lcgJUm3yOKZ1yW8Opor2i2tFX6e+tDB0QpBm1Qrac8MMZSPHu3CDJ?=
 =?us-ascii?Q?OlUcibzTtcaJQuA1pQlnHpGEk+mg/sDwo5W0+Vv7VCnYWELyEkCsmEhep7TU?=
 =?us-ascii?Q?YxyBLnDeNXqUx0KsM3pe2yiPB7W105oF95pxucoGXv/NZzLJwF38DC3VbP1/?=
 =?us-ascii?Q?LFPavLztu5gPY+FUX3xsIzFHbrmCzvTDWDgmNZ9P8DCpc8OX3qYSKnlz1k5V?=
 =?us-ascii?Q?rlzVG3Yqcr84WsZKW0uOCSOauIl6gUFenjy6gx4pBR2FExE/ZeZT6GJ8Abgi?=
 =?us-ascii?Q?13J226TXHArup/Ls56/H1+AjkXdkf25VMQotasbn9pMtf5FedbfCtJF7OTld?=
 =?us-ascii?Q?XzRkB92yCWgPrHGZDPTzeZiYPiVNQfKazUoTsSOIFJ6cwxR1v3JMOXVV6PmY?=
 =?us-ascii?Q?dbrT57ftGXVqycM45SG51Kujq8qQcrdy/Nl4TtaO2TBu2ZkuikoZqugP1If5?=
 =?us-ascii?Q?LDI7avACFNKucWi7X1x/fo5Kp1jZ1flYP6ixbn6jMG9sO9eakAOJhD4wvEgD?=
 =?us-ascii?Q?QHD2xSO606mikzDu4OsloVXPCJIZHSdDtjvj/60sUCsBNjORLjFseD1/hVqb?=
 =?us-ascii?Q?b6f/HkLbtym8CmUS0VriEpLumN6fnS8XoGJiRpIXRbjwVky1l+yLbINKVye3?=
 =?us-ascii?Q?Wrzc27dZyyXgTX0qnj7TMs2wrriVyzsofBZ6GhQAWEsnv9xV9KHimHJu5SY+?=
 =?us-ascii?Q?KyRuUMhwrT2hwcHYhzwxaqB51DSgG4JOgtcIVgoHlnRIPe/sAH93woetufng?=
 =?us-ascii?Q?5s27QUS1im/hGm1boB7sNTlGtazk9Kj4F4Bs7ugT0NjwnmYjuCtjH/iDPMZs?=
 =?us-ascii?Q?d/s/QXgbXYwMCyc271q6iitb5XqIjxoeW5WbV6f2EAcv811J/tmv7O189hU4?=
 =?us-ascii?Q?4lw9ktoR1m5PBoXAQWHJpcJCn7KdBArfpJr+2XYRg6SoPEtQxFujCdyEXZi9?=
 =?us-ascii?Q?3o5IYfqupMt9PU4MoespXAE+IoBiRGao3md9USL/rgVcZ2QXYFqgOwj/Zzf7?=
 =?us-ascii?Q?yfJjjHzvn9n7e2N+eJQz0t2eJ8oC3n9gvMZntP6qoAu/n3tPQs6unmL8YOiu?=
 =?us-ascii?Q?MVHc9N4Pi3Tr/T+GSeHlNTQhr545V1d8CRzSITsz/nfIlsBTJhlJKUxAy8DO?=
 =?us-ascii?Q?Zo03dSX4nljO5NHoCxq8yyxP+3iwQOvmy1Jp5Pj6Bkoznemw44kGaTfht72a?=
 =?us-ascii?Q?17JaGHkThVCuXpZuMPg3G32zX2dt1o82SdTZH53o8nX3F3OBvSbZjL9O8UoT?=
 =?us-ascii?Q?2giXPC2ZTAgTlckIbw0oECFm+0AJjnMPOCH2YoVt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838889f5-1f90-45f1-0410-08db9cd275cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 14:26:33.6604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VIDSd80VdGptO5u5Di36KsJpF87Pwu8Gstg8Nqea8unDD6bJISt65Zi/nnmZuDBKMNUH1PDnHsoMUpYxWaTTtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4922
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> > > Cc'eing Akhil as well for his opinion on this.
> > The fix looks valid to me. Must have been a typo there.
>=20
> I'll count this as an ack. Thanks!
Oh Sorry. I just realized I didn't put an ack.

Acked-by: Akhil R <akhilrajeev@nvidia.com>

