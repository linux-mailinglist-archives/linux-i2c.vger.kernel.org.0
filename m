Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9E75ECD56
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 21:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbiI0T53 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 15:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232234AbiI0T5Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 15:57:24 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B2A7285C;
        Tue, 27 Sep 2022 12:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtpxdMPHt7RAq8gEKeKWwtUHhG2jFtIWgZKBwmRc1q3/zcD0047BFfQoM42yYDRfKnFHSzirRIxXX3I25/0TVEDvGx+EK6puR3iSmBr38bT/KJ4cqHXBTFLBhYxvFC21qC8/+4Pv70uzFhcfY04TChXzyxAtTUxw3VdH4MwLUe87Y8F7VrjPgcxYwpFV3rJH8oTBnyP/xbA5NBbihVGjijPkKEUR4Rvsz18ht6uEPpWOuZTuPBAIhCM9pt83/MOBxlyhOjHYQxqHWl/ZSZzJ6QUSeXFPhaJzkUJo85Z6CYTNRUH0dTalX5iN1FRwHOm0luTiqQJRywk7GhQY6Hgnpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuyUlG2qa5XL6a7CPJoZEoRJuJSfE8Yw0EtVxkvHpQE=;
 b=ilTojE2XtuJJ5Ou6zBI64jz/w6DdVYMCFNqCuIHBF+P9Uieu/4xOyGjd+pb9VUlVPTCArGBFMcFjHqzBwwxpwNnGRxhY9m8SQM1xIbiMQJct0/9Df5A0Dwhm5+QwmmEPHvE+FTtEwaUR61t0ty8qcJTFE94qHS9Km/VWFKLeitwzCkUF5CnDupzpr3BN9J2xAyNhP7Xv5wTHW/mNUnRF0KNPYrh45oc81C7ZE6Jmq65pEgW6THUrrH8zLbHsrrSDUYvWVFILhrOEE5ULShXWFMT5BlQ7FPDS19YNCVwXNtoZgmnB+uU8d7pKWvUmx5q+rbrSP5vmrZVYx/4c5BqBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuyUlG2qa5XL6a7CPJoZEoRJuJSfE8Yw0EtVxkvHpQE=;
 b=tPDAYtAQenGA4DHZHLeSQe1A4qipW3Y1de6T5Bz4nQBVZWYGTn3MnRWsun6gImY4TBVfsxE6boS3PmrWaMe7iJ10QL7/KmUZuBNbQa00YYP0NLmRfjNcltaBsYUI2Lg5xOJSV3ZT/wQi0lVv02e+kxJuME05dG8/FVWtFNmIfOxDmCXTW4yUBw5L5OKY3so2LcT4UWd2ZOE1DPiY7PiQwqMco5+fsG6ZX76RON4WsoOm2zcL5Y9QTJQl7YwrLQ7q/pZZG4/D4xAmT3cdCn5CIGVNgoKoZS+u5pIDq72ECequRVZyPK1VsmMWOsUlN4EDiX733ZyAM1PRBIVYDu6DGQ==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 19:57:19 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109%5]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 19:57:19 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 5/5] i2c: i2c-mlxbf.c: remove device tree support
Thread-Topic: [PATCH v6 5/5] i2c: i2c-mlxbf.c: remove device tree support
Thread-Index: AQHY0eCNwayZ0lmw/kiDVDWY55ZHdq3zshwAgAAAvyA=
Date:   Tue, 27 Sep 2022 19:57:19 +0000
Message-ID: <CH2PR12MB389563774D95C5B0B9518CD0D7559@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220926194507.24786-1-asmaa@nvidia.com>
 <20220926194507.24786-6-asmaa@nvidia.com> <YzNU7L9CWI+mTxRZ@shikoro>
In-Reply-To: <YzNU7L9CWI+mTxRZ@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|IA1PR12MB7662:EE_
x-ms-office365-filtering-correlation-id: 34c6f4b4-a6c5-4e72-ce6c-08daa0c27c6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +T8RguT8X+EWGl5D7Twwik5MC9JxTA34/UHy2HcJ+JE/Mh9YqNQpJ4InYz9ipQdnkNnUNdeG4j0u9HLjiX5ucou5CUyeS6IQ4Kg+5Qc6f27Ulepm+I5/5Xtj7H3q3kjnR3D7ATug+tewjMXL73xdHsOOPwTNMN3NL2sAuxgDgSUANrTmC5hGNCkvBo1lKPF5dezzq/kOMp4a5bdQMTUftUmQW7jNd3uf56rJcTmXuqFA8EQoRnnPmyD1h77Vpcb4k/vsXgOBxeFn9YqIbQ0ygSUAhDyv0WzT6TfET+Blh/P/WkXrM7pMYhfFnupjBsuqm+O97aVETfVflIHqGbFCZrO6WhDihuGq0oQM03jyqpmaY7qNSIpbTajY9j+5yssJZ5dxSCx9emkopM9Z/tF6Cev2sKZN5zorYYpvXGr4yZ1UQ9T5RBvApWbyDH+g3RlRId9DtoOBjghe0umfgDMjpjaRR8v8TCLPre/n3hs5FPqDDQ0BoReY48LecmbPGfBwK/5GmlzlxE0ApF891K9642kcn/AD7XjDqgKe36jxoRTHbyN4fZS1SOvIIh7vRSPHZiOBNxb3JBeuS/GvOELIi2lszxnpfwXm0nNBG2jPbo0moI4Khjy7CsKOqc0Zm3++B+kmrK8G6nPOhUEf4ua4hk/ALku6ZqC7v/ZqIufDigDxg25YAVntloUcQDboChsOSZAXXX++bTYdJCQsZBh6COrMnFxrlOFUyGr4p2//QN9jPt1Tk7qUpmI6KRwCk32eXvkGh8KCaaxGYI//wfrbsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(33656002)(54906003)(86362001)(66946007)(5660300002)(83380400001)(122000001)(186003)(38100700002)(76116006)(9686003)(26005)(41300700001)(478600001)(316002)(6506007)(66476007)(7696005)(64756008)(71200400001)(66446008)(4326008)(8676002)(55016003)(38070700005)(8936002)(52536014)(2906002)(66556008)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a603pBjQkANbDPvq4PNm6k2rPovlx32vk27gaGAfL+zJyRQbl7CBYR3Cmnsv?=
 =?us-ascii?Q?tGUwJk90k43f5gXXZx7m6bHJ6m4E/4tkxzZOH6rmID+lzJim3FnWbhhD8mwF?=
 =?us-ascii?Q?armt+BZ4akx/7igJ7h25znhV0D9F4aBxDf8QdM1wJYSyZvHQ0tD4L1eQNijF?=
 =?us-ascii?Q?IIKVxo5HRC8n3VOLKiABGYCffxMqR3r/lUMd/iZlhwd2S2Ttxwcz4YQ72zxk?=
 =?us-ascii?Q?9iOhckXoY5EipCI/9HybtC8VEq9XXdZpDc3Wm3MxNz2A+lGUeM7Ogv23QYoR?=
 =?us-ascii?Q?VsXh9fNZE4gL45zVr0Z1mlxP3x5KjWuRcMU7Jvstipx6EXiSJEzk5b3hCAL8?=
 =?us-ascii?Q?UpTxRw3a9eZxsUErU7ayoGiFKA5C7di3Ol1eshNM6kERIgOLJaFOIisUd3jl?=
 =?us-ascii?Q?IiDVCShGV9597bO7x8kFcUO3n+hK6uljenXQlIhsScFU/lqlT404/+0cOsUV?=
 =?us-ascii?Q?o6CjvEMG4ArtxlfN9hpyuSuMJnFTkbCuzCM8t5qUK9C3SWNDpo7+txN0vCfm?=
 =?us-ascii?Q?FcdJegB6UXBk5WX8VnkAsMBikmxiiXT2SPpDwHgdTYhAvColSZG7EAw+BHBT?=
 =?us-ascii?Q?6jE5PTyUBtMi9ywZD+g37NC5MGSd000Zia098weWh9sJn+WJ495MDl6IH+Qb?=
 =?us-ascii?Q?Rfa0qFPk/O/NWLYgGOJdgESPVzRDEE91VgVPPcl6auHuSlHh8u0xcgSYU6ea?=
 =?us-ascii?Q?1PNjCasWDFBl5bSWGXymesExegUN3GlEWvsEpubzDEZAnFBradiWTt8Cxkq1?=
 =?us-ascii?Q?NeVhpSatNCfdA+iDJbEqARD1CiY1vb9fdWKYbNVe2yOWZJLeWG31iQ1InUBp?=
 =?us-ascii?Q?kDknlvupVwtPsTniZuDkgB0hmonTJaNaoamV1z8VBcNw+8LxGDYUtJITGZI2?=
 =?us-ascii?Q?ds+ONrgCtQ9PIlqAZRuEFPNIUAvXkbYhacMG2LmwUupZfFfFo+IVzUhGY6al?=
 =?us-ascii?Q?wOkxX03/0jzqM9iZzRgoOoSgB4AFJF+dOhg9Ffhieiqysw5ifsYcPuNkGiEv?=
 =?us-ascii?Q?+h6xZxWP/C6a8QYiKmHEz/wAjvEsmOe054LXGGKxeZ4sHsw4Hfw6iWwLO5f0?=
 =?us-ascii?Q?sTeVBTU+2VvS8K+pJH86yYFOlUxxMVmKvl41P4gFHowBd/1jzVuTzw5eYTzt?=
 =?us-ascii?Q?cR4WE28ZyNWgRiaA+Bt6EgZBuFH/at8mWmgx1YEC+bz8wx7S8S+hjubvR6o+?=
 =?us-ascii?Q?PkQDLt+piN0Eif9THLvND6JBxFU1iuk41DZnGGRBrB99HzgPSfAE7kQFNMji?=
 =?us-ascii?Q?mXhyvT+pksgDRPi/6Lc4oYYHdiAWeGYdWaWvCGFAivtobQwkL4FjGgtivk8O?=
 =?us-ascii?Q?taJsHqxyEDbLuT84qzD0/zQDOo5bJh/fdhTA+TcD00kMbSxz14i7YHvlm59Y?=
 =?us-ascii?Q?w9+opwFpuwaVbrnDmE9c+zY512o4YumrDc/4bha64Y/pGBdIDBOjm8agx0o4?=
 =?us-ascii?Q?qqf4tM0V6ktU26hPUY6HAztEOE5a/Jv4gJNb0wdI+fCPm3AypmY7ENG3YhPe?=
 =?us-ascii?Q?Tr6rlO6QeR038AcxfNobF8pC0HYh0ya/F6gu532rZMBSDSidqI6nW0n5gnQ7?=
 =?us-ascii?Q?DA7OeodjmOW7iu4twYs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c6f4b4-a6c5-4e72-ce6c-08daa0c27c6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 19:57:19.7613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ttBqP1MLBSz4hqxniAo6XZrmDSIM1QWvfR/OMRfxbNmcbLs+TRLYpQbV/ru0b+hUf8fn1ceekkKbM2xG0DfSZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> BlueField customers have to use the the BlueField firmware with UEFI=20
> ACPI tables so there is no need to have device tree support in the=20
> i2c-mlxbf.c driver. Remove the device tree binding documentation as=20
> well.
>=20
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

As buildbot reported, you need to update the MAINTAINERS entry. Also, I thi=
nk you can add an Ack from Khalil because he approved the change, or?

Yes will do!
