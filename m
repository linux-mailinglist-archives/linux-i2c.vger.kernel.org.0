Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E244B773B
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 21:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbiBORl1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 12:41:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242704AbiBORlX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 12:41:23 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A498111AA1C;
        Tue, 15 Feb 2022 09:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAuWU4DoXx46xq33urUvrsfENEaeGluu42NvS7oF3+7h67V2NO4dNqlB/cYJkP5COSwlYeBQ4Izn/asyKfxPui8weoC5x/fZILfsYcB4I34k4GqMCYlM+LwtZs8baZuE0lNAak1dqoHPO0pdbhz/0Tbt2UEJWOm7FINx+H9ODMT42J0yT4DfNrobmZ36vLVvtJGFwteY81wG2J8QBcgqI0vsyacZcbRxZfv2Q0CtGn9lH74MJ2bjvi87hW3YN/N8cTH2SX1NeI+bIOZep7vCEffM7ZQ9jWRUcnWSatdfLhLKqGUsgTkYEwwuPO0hUrjrB/yLG08CMxU32hEcimNOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Nwe/MFR3ag+T8mThFgJ0ME7n7k3EsKwyapXdAqy6rg=;
 b=YEpqsYZwSEIfq6RVdSBlpOjDXmk4NmYFdHBYUkbfGxVZRLuvZx2BuLOusWBnjBH4tXGvjpgkM37v3rcOAnIylkc96yEUhmRdqYyw8jxUKTbwdU1AFi5uY6X+H70p08eObZk8Fwu85SNwUusS2NlQVv4GrloZySMMPCLyjdO7YyY6S9sA34V2TxSWoME1seJV8ejh0OMcREApcfDpoWE9lIPI+qsqpb18mM75Bh4KhHO55T5AXV+yzwREBDVC03VaszflmNXnBfhtNjGeT4mB15BudFaMg0aJ83ZuyiR8hZlRo5RXfNGXgDqugofdwcN+fEc8YuYotNziNz4ewaODQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Nwe/MFR3ag+T8mThFgJ0ME7n7k3EsKwyapXdAqy6rg=;
 b=mggHfN75TfPPtDqT8B4H/OKy0nB8P6xY1DElxUW0wNRfIbnZbKU4Uk3bYH8OHdrrI+SupSDnAkhCSiqxbVr9DAyagazgSD5e2DQTDzBlU/QIX5VEQAyTYR6Jv9pU70pGaJ1OPMHjartS+Hy1APwVJ+vGjimdQT9RVWzj3iMx3AHkMtA52tMn4MmTIasUtp1EEj5tCRXFq9vtO9qufNl42Wd1+RV9qqQ6Ht/MAqndUbOsxAoq4Uzq4aFdrY8htlyA1G04DHw+fphMGMdwUM0oUVdq61RgniR/d6Sh9I7gceAmzOofPJ+9+OwrOQ3K00DqY30NPmOLiAIhTivijsSH0Q==
Received: from MWHPR12MB1390.namprd12.prod.outlook.com (2603:10b6:300:12::13)
 by CY4PR12MB1207.namprd12.prod.outlook.com (2603:10b6:903:39::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 17:41:01 +0000
Received: from MWHPR12MB1390.namprd12.prod.outlook.com
 ([fe80::7161:aac8:35b6:1447]) by MWHPR12MB1390.namprd12.prod.outlook.com
 ([fe80::7161:aac8:35b6:1447%9]) with mapi id 15.20.4995.015; Tue, 15 Feb 2022
 17:41:01 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Thierry Reding <treding@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>,
        Amit Cohen <amcohen@nvidia.com>,
        Nikolay Aleksandrov <nikolay@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>
Subject: RE: [PATCH v3 1/5] i2c: Introduce common module to instantiate CCGx
 UCSI
Thread-Topic: [PATCH v3 1/5] i2c: Introduce common module to instantiate CCGx
 UCSI
Thread-Index: AQHYETQrH65y7Kmubk+ARHDJuviNGqyIJpuAgAARJgCAAAbJgIAMNraAgAAJ04CAADKPAIAAUlkg
Date:   Tue, 15 Feb 2022 17:41:01 +0000
Message-ID: <MWHPR12MB139064CD774561207321D309DC349@MWHPR12MB1390.namprd12.prod.outlook.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
 <Ye7AhqMsOkfvHOAg@smile.fi.intel.com> <YgEa/blO2UMzztCq@smile.fi.intel.com>
 <YgEpYE2VNc05XhpG@shikoro> <YgEvEQ7BRc4KhOcF@smile.fi.intel.com>
 <Ygtt8c+s7LiAuI6C@kunai> <Ygt2L/WkJ9rCe3XF@smile.fi.intel.com>
 <YgugmDb7h1mhEqm0@shikoro>
In-Reply-To: <YgugmDb7h1mhEqm0@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8604e5d-39a1-4f8c-bf17-08d9f0aa555a
x-ms-traffictypediagnostic: CY4PR12MB1207:EE_
x-microsoft-antispam-prvs: <CY4PR12MB12076E6B4C9C0A7810BCCF25DC349@CY4PR12MB1207.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6970BPCLXX7vmxZADgkqAiIsSbjoPFc8cgqxWRLKuqU5XXjkWo51iH7SvOaU0YRkqjvgk5MXGuN2SkZxJwLqNizkdGKK1nq/Gulsn1JDSnZMlN5EdQz7uUfx1wwasrxWgYvdlJtkS1fhwUvzBAiDO/E8nFMcKZ8rixXDXTPU7n818PZH8wpoeWc8WdoihAwUkLbCgj1LKS3KpyHnPzlD+BwPZMYJIW6i7IaXw7K9Dpr56u32DbaSgw4KgWA5AxnnnuENdkDWl0VuZaANdazSCdb1lQs+fEPtuIOvXby4KvayHV25bNGSfyVLxzJYJImY9a7hDkP3WhZB9up1YQh8AT25A+SRWrOtPIlVOkeDZxI6LbZP8T2GOraHdc1Y1P1htc5FcrkntFCjhBV40SxfDglWg9k9e/2V+f7YYLYMc4sWqqkLDihFiQQs0c91LAHoGyAv/E722BZA8ZuhJ6SdoMUDu0Jt5Xi4/9Pms+HF8BvVqbgdMhtMJBRwBjusB9T0D+B7XB3wVaLsD4dPflqcztaGtFbN4Q9rXs9meOtonqyGY8mrB6eQkylOv+UsWtdmTlqmxSijkCLiutCefO4kbsjkMTHcDSMnPqGvLghId0AQ7xF+q69YLup9khdRcnSM2aG0ru5iAv1Yf9sDNjtgUM+mvjVI9sKAp9Uk8yeA1wWbSp1UaaK7+TnIccbeGWbPNIkikspfno1H+DHbJloabA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR12MB1390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(2906002)(38100700002)(52536014)(33656002)(8936002)(5660300002)(4744005)(508600001)(186003)(53546011)(6506007)(86362001)(71200400001)(66476007)(7696005)(4326008)(66946007)(64756008)(55016003)(8676002)(66556008)(38070700005)(66446008)(26005)(110136005)(54906003)(316002)(83380400001)(9686003)(76116006)(107886003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?55i59aaxZplfuI3y5DLx1XNkij0X88yBC73EtiLZ3Hm8nwIQSjoH68dpVyXP?=
 =?us-ascii?Q?O7CMkoWiHDOgCQqcoW5qYQiTXhg0C7D95EwqatPTMECkzYqkNHfsMAuFvS2O?=
 =?us-ascii?Q?aGqWcAn9+yMhPHyLhTiDfJFjY/32MgfjRJlTgr/8q7A1iPf29QJd94lu2XvD?=
 =?us-ascii?Q?OOm4CKDP3kPnAgH7k/s5vO/mlGUByFjgDUB8hD+EnLyuxC+NVd2fngC7tJeX?=
 =?us-ascii?Q?UqV3/Tc/3V1z6IThc//hEyVOe5m+THOzTgPFoTvLUpV+06h6+bqCy0yq1RnV?=
 =?us-ascii?Q?x0GP6Z7lgKke74/gMlgKR+wmy41WOyIDfoIz7iY2OeftL3WsNKnLaeqUo0Po?=
 =?us-ascii?Q?ZkNfyz6kLmQ5kfbXxxQbHLHEybwYzpOue5GCP+3na+5jXbVkFlfRFxJ33nSS?=
 =?us-ascii?Q?T9FMJjfXSSbEGpX4S/31LYfytqO51qsyTVPXbRFo3arDz+TYu7OOpWVMjEFx?=
 =?us-ascii?Q?HRMJcb5AbXOkV2nJBV/l9ikoiwO9CdkFSrgvhpiEEFI0JJ8utH4zQImNoqcc?=
 =?us-ascii?Q?ZN9eqcziMWobb2Vi20wJj0s21O5ihYLCjHW8xdsYMSfZG5G49gflrcm0lJSh?=
 =?us-ascii?Q?KTYExWrdEX8AV98PGZJPZfljWGF0FUzJRLL9FnreRo3o2aCl/Vae34ma9blL?=
 =?us-ascii?Q?oQL3icI/umnrw7TYAv0wFNzRtUpYTHqCJiY9T7ryEHUhpm7rmaYuHEIFf1U5?=
 =?us-ascii?Q?OYogv1qRmHJpFlcSuBvjF1ScdP7FEFQ6gmepAeebTDU+nHAQ1VlD9OCYYs5G?=
 =?us-ascii?Q?B2RESXxx8eiXC5cYMm95Ju6ye4Yxx9M3uXxYaN65/gh2FU4MgDCLKIPvNaPw?=
 =?us-ascii?Q?Hb1NdCjJNO5drIX2ysVY/gmwu7ZLNbd9G2fQgouvP+6+HTXiq0tUkSQsmNig?=
 =?us-ascii?Q?hLIkDQ+ro213YPx+vCAkm4simJs2Vv4vx9D2jinH5muNm5QaNboYlu2+dx1O?=
 =?us-ascii?Q?6pP5EoWIdvo4mc0GMlPU6H8G1EyU08T1zX5HhIktdzj97nJs4hr+ZEQjKZdb?=
 =?us-ascii?Q?UR/beyNyFlGj4cHtWU87fNwKp+ah0Ma3TCuMTFxffrJRgevHO0gPNuAARCNi?=
 =?us-ascii?Q?J8IUnpWxNEJrQbHTDTeYwwwCAWljpH40yO1Y15pv7s0mMlRqJ7GMOxeGbrB8?=
 =?us-ascii?Q?lZSm4ijs1+A87HwqYoQEXuA1Fp22QkPyHI2I0VdWrqSBhBAXTJzwfOZ7Ljrn?=
 =?us-ascii?Q?IiJlqXUCATjKLVoai9CKRGIE15zvV+QjRbbqxRIXvjMN7+dx20ql7KIJajKJ?=
 =?us-ascii?Q?J83a8qwjxuEzSX4W1AsaoNqGERqd5bKzWsgkK5cWTf9NChHoV4fdWrq1pf0l?=
 =?us-ascii?Q?KZxZp9pcMK72mazNas0Lj+6IXta1IIRj483ngR/KyKVv/5rEYupbldnN+UqW?=
 =?us-ascii?Q?YGpR3M65W8ffoX+Ib7pfGgtYtpLPHSrOUWGsD8s/u2wZSZsDE4EVvqWSSFxz?=
 =?us-ascii?Q?R9YREOkKidmyABmtEOmH0rMty4Ynmxsbk+bY4/KbGuPAcVbWwGxY99FaUUJQ?=
 =?us-ascii?Q?46y8gLdL0Jc3x+OQ33iLngr0R0y59a2W3Z5naCY07509pyXs9MSO1bWal2uv?=
 =?us-ascii?Q?PYFlF0qACJTD/HfB8pTiVkTYvlry9NJay4pKItzrOigjH7Uwn+CervAQl4Pg?=
 =?us-ascii?Q?4erEnLmsUgfsefgeqFe8gWg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8604e5d-39a1-4f8c-bf17-08d9f0aa555a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 17:41:01.4409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WbkXEWgpEgcaUnKHEhHiGwUoUihJGi5c/T5qmIVq1WcSJ7U401ihG/tqv/tWucai1mv1NKUae/9b4bdLpG1d0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1207
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram and Andy,

> -----Original Message-----
> From: Wolfram Sang <wsa@kernel.org>
> Sent: Tuesday, February 15, 2022 4:46 AM
> To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Thierry Reding <treding@nvidia.com>; linux-kernel@vger.kernel.org;
> linux-i2c@vger.kernel.org; Jarkko Nikula <jarkko.nikula@linux.intel.com>;
> Mika Westerberg <mika.westerberg@linux.intel.com>; Ajay Gupta
> <ajayg@nvidia.com>; Shah, Nehal-bakulchandra <nehal-
> bakulchandra.shah@amd.com>; Amit Cohen <amcohen@nvidia.com>;
> Nikolay Aleksandrov <nikolay@nvidia.com>; Sameer Pujar
> <spujar@nvidia.com>
> Subject: Re: [PATCH v3 1/5] i2c: Introduce common module to instantiate
> CCGx UCSI
>=20
>=20
> > Maybe we should orphan the driver if no-one response in meaningful
> > time (let's say till the next merge window)?
Sorry for the late response. The series looks good to me. I don't have setu=
p ready
to test the changes but will be able to test next week and let you know if =
there is
any issues.

Thanks
Ajay
> nvpublic
>=20
> Yes, I had a similar idea.

