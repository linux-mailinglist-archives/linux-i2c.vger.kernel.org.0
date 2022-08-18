Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE25159891C
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 18:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344896AbiHRQmg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Aug 2022 12:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343955AbiHRQme (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Aug 2022 12:42:34 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F729C00D5;
        Thu, 18 Aug 2022 09:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktt8Cq8sQE9749hm6+QvWYxOl3Tm62Ka/08jQWZ1owV2+TP97S6GbPyNzZpor03dcY/TpcR9p2CF62ggxCvgFqP3C5rWfUoyumGcqS6rRKoJbDieaBXAM6bHY4SjVnHqZN0lX+5BFPNE6Wz/AlXL3+dc5w88QF75ITj4zuZpB8+Y6aGWs9vC0j/+/H8NGq8KInRDCuOvdMtCLNQoME8W+/iR1H3bybPTxcjysfP0ejZX2cw7kGCE1TSI6065SJv0lEBz39AahalXcqBE2d99ArGsnRamoq0SEr7ihllOfVueq4bxcqjqMxoguRiLS/9PaELWvVJSaN2vSwNypzrQAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5yNas/SnYJRbwJ0QY9iwNtO0oaMw7T64GAq2kN594Q=;
 b=O8npJ5weJ3ryMEFXmWOoCs2t8tArHjCzyLoeiC4FS5c6PdcHKtlXlBZ9GZV2PIq7cyvx5MVlNU6iddNZERLkbRf1NLI0ywQobVKYc9bBii9QLOEQ33olBluEvZd/CyOWHdkeC4xaIBjZ86HL3Lc+lyTGDQ/teYAnQoCJkW4J5hjL+R0AI22epNbzc7OGuAGRju6u8qqtBkydlr0zI4YlI39cjnF0eUMRRuKCtYNDK0sxpDrH+nJq0rMSiV5HNp2k4jShRpPBLYn1tRJ//Ixzm0hXXoSwZxn/J3n85+nWAfIX2gu9E5f4ZjyyW3+jw0nhOI38J/OjOSdZUYbevz2mnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5yNas/SnYJRbwJ0QY9iwNtO0oaMw7T64GAq2kN594Q=;
 b=omamOuRibOmqpB4+rhWf8ceFltOHYndO+2Nlesil3nz7u/I640fNqwTeAP+fMDU9ZHRiBhPJa5OpfmAaOXosPe84lxV8VC79kbMXsC4V0erubK4Rn0qAzD9vY+kjwHXXa9+2N4NaRP4IrqZdgEAQKq4OpFF5pTHUnCR8k8mF5ptBRsThgNxcScyKF5khNxbIqLgMgr1kI5MmKy04QNxmlpAglC8qJCi1LmlXFkDdxbIcNNK3fRptdjZEnKvITG4gdlVyCMod3gHfFTIMQyap4IO5C6PmdhpzL6HBsZCnDUpjbU/B24kYm1XMll5Bk7Q8cVyCwBA0aDQ57Iod/bqSAA==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by MN2PR12MB3981.namprd12.prod.outlook.com (2603:10b6:208:165::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Thu, 18 Aug
 2022 16:42:30 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11%7]) with mapi id 15.20.5525.017; Thu, 18 Aug 2022
 16:42:30 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 0/7] i2c-mlxbf.c: bug fixes and new feature support
Thread-Topic: [PATCH v1 0/7] i2c-mlxbf.c: bug fixes and new feature support
Thread-Index: AQHYscMntOkGb+qbTkGB1rnCwaClhK202muAgAAEt2A=
Date:   Thu, 18 Aug 2022 16:42:30 +0000
Message-ID: <CH2PR12MB38958F0DC9CF4E82EDD793C8D76D9@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220816225412.9095-1-asmaa@nvidia.com>
 <20220818162421.sh6db7mozl4qf25b@the-dreams.de>
In-Reply-To: <20220818162421.sh6db7mozl4qf25b@the-dreams.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8472d5e4-260c-44f2-fd40-08da8138a469
x-ms-traffictypediagnostic: MN2PR12MB3981:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TMcmeIjYJDBoFoG42aZFqN1ngvTMsIyZnu1VEW2k5ldJRoEduM7ofttVwlJxzyOURrCcSv8PKd6vWmfCUFg4orJP1Uc6FonPM6PPU8k2TSZf9Jb1hS+0+O9GMkkio4m0yEuce7y+UDqNlxYPGhvUAfXuZnTySqJX8jCQ7oUp4GzfSXIPDA2MhT9I2mQBQOi2QvgDpJNKST3xSFJx0+Kg/wQNpacIFccDS1P0m02nubeok3OlB5H0YUaVlAjdJvWCeCg8Pp7iTGE6mxPaIZp+zem3afbcqZS1NXaFB0YMlqdog12tdGt+CN7uEvnISQka4d3L/RVKK8kecly0DnUe5OZUh5/pMwB7h4lKDt/LDWetnV5vtNO98iWPRLdnqx/XF0EVf9nTOy+44Vq86CCzm6O8uXsq/qWmh0J+kx0VmginUQkZT8quUlC9uS0xs3kCoWsivtl+4Z/MxKhTL7ZxQxnZ7RdDI61yUWbM9KvtoUQd1KmSQvIGqZnMJfUYTKdq4HduIOJgSXwqD35KqOInImzqHw7U/rZKLR3UJv6ukdbXHVJofU5hy3brfgrbjpqk0VjUpIwiHaDr24RSQkUpUFTQ1bWxySN4wz6vXOXMuvODMk2vpA5KHlSbTPhBKKRAXxeVkSvYkdHsdhnYYBNqcvYqGUhNoi3tPVXjHuYXLDDoHHfC32K7lky5/QivZPzGY/lrCWWIZuxltDcti9/BEq8CE4ACZz8wZn+Mqz3P/S8+JXQzlg7cpbvvkmdTm6pkkHmPMJR1Edtq8VPPmNXpSA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(186003)(9686003)(53546011)(86362001)(6506007)(7696005)(33656002)(26005)(38070700005)(38100700002)(122000001)(83380400001)(55016003)(71200400001)(41300700001)(5660300002)(4744005)(64756008)(52536014)(66946007)(66556008)(66476007)(2906002)(8936002)(4326008)(8676002)(66446008)(76116006)(6916009)(316002)(54906003)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JJ6OlPxGeSGm+6TwtQQllebf166vcDlIh3viAugZoiPKjsBtlgTyiEtoj9SD?=
 =?us-ascii?Q?ZWvRgfAIxytTWHuSCB/MtIahEkgIHBcvulaP8AjH7wFiZLbugJ5rCDVbQzia?=
 =?us-ascii?Q?9VYeUNjieIHCUagDwkyomojKViCt54ZkZEs/hHflOwiBGIIBp+AcI9d0slgG?=
 =?us-ascii?Q?1DihmLmEWVWzsUiK13N1FpEklZYS41+uTG1Dsv5eLZ9Y4mr4YQypBkChGfXT?=
 =?us-ascii?Q?ZnnnJmn+O9M+DoIzFJY6puIMxyjfI6O8pPQsayseEtnSeJ+bBSr4iyUX6IJg?=
 =?us-ascii?Q?qUkQBVUtlTQJtiN0aidT4+XdvSCGzAm2IdLTASQLksQYd4dHNr9Jqn73YilS?=
 =?us-ascii?Q?LnPUaMGm729FV2LS0zjQxxelFdsZvhYI1wTHBGGEFpgauAMBXLJcdEYUIPr4?=
 =?us-ascii?Q?tdsF/WkPA2bHHTg9BHR+OVkjZY9QJQpaI32jv4Bu0kz2F72gu60mw8/Aohre?=
 =?us-ascii?Q?zpTgYsY8t9/qlFBb3nvLheV/o9qRdmVkOoVotvkYQTiMb4VeGDeiBrJWNDh2?=
 =?us-ascii?Q?7dFLT0+JwDQC1qUUbby1vxtVtTVb6Y8i9O6/oyu7Q21mfIHW2Kbe7tzuiP/V?=
 =?us-ascii?Q?VzGssMiPFgpirrVmREVZmabknYJindnmIJWgfjYFi/vUM75SGNAreEsl2Qk4?=
 =?us-ascii?Q?Nhk0dTOMKqPA8Pyy9OAhEMVG2Syu689mWrCNUehF+Zi8TTq59n5WRd5clhR6?=
 =?us-ascii?Q?hJubnn6+3w9q1te1vZrfX+OiR6tYzX4SeQJaS4pldvU/8A7hpBjNIKlSTX4f?=
 =?us-ascii?Q?hUMoWne1hTsKlwd2pz/lArb3+2zfKYlIRZ9KOTyACNiOIiYEZUdN87reclFo?=
 =?us-ascii?Q?KtMhbJoEs5stLlEvsYOx9E6xey5+vHnpJ+fKFHW1tCIcOTjjoeK/3ZQGeu0F?=
 =?us-ascii?Q?ESf6uk3+omcyJMeb0qNoYCUUwKjLVg41Zah8EP3QbNzZppGcf5eVIIeG5q0Q?=
 =?us-ascii?Q?0eIcATYmRJ/40JdKL2Lzg/0cofPSwjXESFfC4RAfXWvM5a50r5rWaL7m7OQu?=
 =?us-ascii?Q?c2bS86vkkjn9aZJBlYls9Vj0sy1ZvJh1TOgrhkaJI9ychZdp1PwK5luv76uM?=
 =?us-ascii?Q?Rx2dp0wUimIp8k5oeTRgshbUx2e2nzLhrzCZzpYsoPik8pIJ37EvF4q7OE7a?=
 =?us-ascii?Q?dGaS2qEV0/uhOgLVkPu+wsI3i8l3KL951TJmzgw2xLc8u5avKgZXj+QrsKkB?=
 =?us-ascii?Q?HUFw42VRuNtw31LlpfC0THwEMZYBCXGc2REEFA/rfsO3LhhfzQokPvcd8tSl?=
 =?us-ascii?Q?LKiYHtskdF+5r9E0VMmdQ6LbroY+HPbA6NXPPNM8O73J5gB5r5j/Qk2XtBq4?=
 =?us-ascii?Q?40cgZW7R6iQfSxf+cX2LeD65IHRTUfErpUWT4bVSc8pzvMubCBTs2Y9UmkSt?=
 =?us-ascii?Q?jXuW6bU+JPAMV4FXkMHANSGBoOg3k3MLchWdLGMUNQeg5P1NwE3rS+Hp1fsT?=
 =?us-ascii?Q?IqgXeMo2u0zLq2386TCcfoKXaJn33XYGX67h63ReUABIkBqUHKdXugiKoP50?=
 =?us-ascii?Q?9VFlCn94kG6uN7b74lnbDS+JLW5OFIulzvIqXcDtRk7FDH6gqWVNo+I+z8K1?=
 =?us-ascii?Q?Ow2AsCeCBPPj8tn+Zog=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8472d5e4-260c-44f2-fd40-08da8138a469
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 16:42:30.2751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6XfgIvcAr6tCH+CltxvSzYKhD1GWK2SnJb4NOYoeUc6dBawA3LoUaIc+QOXTJwMj4Tt72oo38GX0glwB89Oayw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3981
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sure!

-----Original Message-----
From: Wolfram Sang <wsa@kernel.org>=20
Sent: Thursday, August 18, 2022 12:24 PM
To: Asmaa Mnebhi <asmaa@nvidia.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>; linux-i2c@vger.kernel.=
org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/7] i2c-mlxbf.c: bug fixes and new feature support

Hi,

> Bug fixes:
> 1) Fix the frequency calculation
> 2) Fix incorrect base address passed during io write
> 3) prevent stack overflow in mlxbf_i2c_smbus_start_transaction()
> 4) Support lock mechanism

If possible, the bugfixes should all come first so they can easily be backp=
orted. Also, they should have a Fixes: tag where possible.

If the above is possible, can you reorder, add Fixes tags and resend?

Happy hacking,

   Wolfram
