Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB2667569F1
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jul 2023 19:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjGQRQB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jul 2023 13:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjGQRQA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jul 2023 13:16:00 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657AE18C;
        Mon, 17 Jul 2023 10:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABpAjmu5r9rvhCbFGRSJrmcUr6vCfz6cZmTZRnxOkaPu22w6uzTgqj64yMubdQOYPpMG3IOLWbWgLMP4MWyTdQTQkOQjz79YQ5xyUNfVvDKr6Tt+04Zcq78t/9DxRymcntBTQKc2Ru6rHES4XqXVrHPH+gK4N5VR+tSYxcBkqmWEyKUcirKtT+X38MALqOLVVQPvUeKvoUtScgTxVud4+26E1WCXn2CTxcuyLQILdB76Q7ge0QMtNeT3JFsOkz0XLX7ho/9JiboUWWcYTnFMQxYv+fLtctBsIutwQ9Mfg1Hew7Bvzb2uN0qzwXm9WCchs3tpGiOd4pEyjBl9jgYV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DKXyd2nVn/Al6+bWYa0XjUp5+q4hVUCOGxECApXioM=;
 b=UrvyqynctCramcR/1m6NONpWifYot78ySXSjAjNwshE8H9h85KLMqjS46dgvFMp/caDTup0MhowRao7D3fKD5uXu3SEGz2rjXoLNCgyib/7qH8JtuX9KA2wpETFTXJZx5m89dkMLNubh4MnJI2jHCn8SmiVTLe/WVpNEj3OomFpUVz6+NbKw0E4rCtsys/jrEBeJH99lxEBxeHhVe/QvjBrj9J7A+gOqvcUaLcwAozYvRqKVy5Y8KLOoGDxVsMUseUmaLFkDCVDozJtadgO4lbl5tw9ygmJffVxxtodVYp5dKGxK3EJ1K5wKGSoCiB5MOvgpcK9J5FHP3u7jnjMAEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DKXyd2nVn/Al6+bWYa0XjUp5+q4hVUCOGxECApXioM=;
 b=GIiOwgRyzwSSN0kGMyWVL6s8gN2pMvRb+i1PL/UeY3Z7JW4zx3qCLGjovE56UslpVjqOVISKsns+wT7hMjDHwXSb9nGc4CqyTcrLalwpZt23JQsxNJx6auAqiNH+EKnQniDu/bEkn86NJjXJFkEV3OrYBCke7Hm8aqTDusy2qMkqFJS2FtPJIQ/W2tLMi5qtHH4Xv1vMP8d8vVlWcUb7lpkhlz2E/iYg95PnzzStVJeVbKEnh3aw07mfnEwDHaN5oB3xaFn2Nh40ysFPW4Dtoofd0oSl3bWFl20K75ucKj3Kag31FFMiVA1QZVQzDZLChAIAP4Ef2sal0QfUfYhjMw==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by SA3PR12MB8812.namprd12.prod.outlook.com (2603:10b6:806:312::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 17:15:57 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::f7e8:a8fa:e46f:e68c]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::f7e8:a8fa:e46f:e68c%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 17:15:57 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>
CC:     "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>
Subject: Re: [PATCH v2] i2c: tegra: Fix failure during probe deferral cleanup
Thread-Topic: Re: [PATCH v2] i2c: tegra: Fix failure during probe deferral
 cleanup
Thread-Index: Adm40O4J1IhnmPnySpiT43OL09jZWA==
Date:   Mon, 17 Jul 2023 17:15:57 +0000
Message-ID: <SJ1PR12MB6339382ED219ED363041659FC03BA@SJ1PR12MB6339.namprd12.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6339:EE_|SA3PR12MB8812:EE_
x-ms-office365-filtering-correlation-id: f1cc34be-3af5-44c0-bc0f-08db86e97c29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0r8ygOXPiSuRDd7ySvMGsEy75m0PoS2pFrbuXO7WSGdWKj9uFHPieHyQygR3U3hZm370FYM9zNGaGRBjsFgy/bPKzKGQumQNHro+WCjrSfQ6fl5YGSuBg48j3EtdgxMRZ/Qxnu76r7frZkriV1X/5r3JLd8lZLovf9K98iLXB98CXjRSw41QUteaDxG/Bgj1CGkeJr5YRwoc5ewGYBWMFk4FH9oPwEvx21cDHWlhvdC+boL+HBQ9efn602hTjDcuVKAa7JxBgSSSySnUCSGlVbQdoi8uUnICiFe1WoYx4hzVRcOg6dj8/ebJFCly5zXA6URd6iyPP/CYthhPntynv3J0PsgtDf4r2mgV00oaNYQdZYegIzmLMqv2vpiy5Iat8eXTqUP3pPkcP30Xx7xQddpRCbcB9wKoTSCz9Lkx5SKstjKh8Docd9HlTNkiaUneGCdRZ70LYlukqjY1xv7QL4XQPRGtY5XYkoZBPIs7tM6Lmk+O9Q2OVSQj0l8CyYrpFbXejeMnDXB5Ock8eUgeGcDftfy6TQ0BIYKmhCYIeB1JVqPZD2FrBagfisGeQp4O3MvpXl4EnARDTz0n2OpTC4zonWK2bqgBzuMxL687PKGBwg6GFrv5C3VVoB7tyBqP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199021)(7696005)(54906003)(71200400001)(478600001)(33656002)(86362001)(38070700005)(55016003)(4744005)(76116006)(2906002)(26005)(186003)(6506007)(9686003)(107886003)(122000001)(38100700002)(6916009)(66476007)(64756008)(66446008)(66946007)(66556008)(41300700001)(4326008)(316002)(8676002)(5660300002)(52536014)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0T0GqgT+e4OWQSsBsHVN97AHZvt+2Ebri75W6jNJUEACMKs3na/hEIWSmZA5?=
 =?us-ascii?Q?aGMxiTuW6MPOHjQZq8pr4mchGz6GHrMJ+E5AO/p9QChg4TZn2bl/f0HOf9+G?=
 =?us-ascii?Q?kys0MwUTvrnM5G32vpDp+KrJ/alnm/Qcb+u0QSTDICx/Q+WC+ZTftUevURgF?=
 =?us-ascii?Q?qvxncdSC03q9RLScrZxvHa2mL8ad7EgX+3PTosDYbfQk6DXb0jhNmhMNC9iw?=
 =?us-ascii?Q?LiTWyinIovxUswOtTFGzr3p+zLuUqIqzBjURsqPZTLECDlxgYXZbJ51PBnP/?=
 =?us-ascii?Q?6cGqMOsNRJV7b6dBRPi6lTnBL6kP5jS33trJDBTjiajUYRygLgsybMx6ZU/8?=
 =?us-ascii?Q?boYtLuZ1xG93mVj9GQ4GAJwAV7umYIQHmZmZQEGlW93YIpHrjxQ4dhBwOp03?=
 =?us-ascii?Q?vpMcay+jGEZx0b9zxI71lSp4xGo9C4IPO7njQ/B1YIeRetVY6WHDaoQ5kule?=
 =?us-ascii?Q?lYCl9s87DyUlytfrGFHeISy5f5V8Dw1j33fMUkoXSf/VrfMP9LW+COrF1nG9?=
 =?us-ascii?Q?eS+kUUaj5M2rnHfqS1Tk+3fxPyFjs9gyisWmQJX/xZ9imIeBdhDeJ8IRoikc?=
 =?us-ascii?Q?fip3aYJETruNd4SWLhVucFZaERzJvxUhQFcrRwUnZvh/4CKxohWP0FgKUsJk?=
 =?us-ascii?Q?iP3gpG9PC8SaXh2G7KG7T9WzG1IjxBV00ketdJgUA1C6OP5Balfcs5YWwfeH?=
 =?us-ascii?Q?eLDZMLj8kQ/L19BcXg/Zd4hOoFJ/jGiLpGhAb7fwAyn1/k1Ca1TJZ45qpxFn?=
 =?us-ascii?Q?sFGXnKU2gQ4i8xqJqdZHUdrfkFemeZuNmJbV0cw1jdXvdJzi1FkP0xdZ6J5d?=
 =?us-ascii?Q?/07uncwm+5Gchsyt42aS9WYwG3U1QFXkMgw3CHYDF7vZIjXKWvGDVOI6Tsz6?=
 =?us-ascii?Q?QWHcNbUCk6NAEQDQBLw6d8ZZ6GEoIRxP7luEEi/v0Mmzj3VOqphp+jY8jTRb?=
 =?us-ascii?Q?+WcjmS3OANEZqPEPWveR8NJsr7ovF6Xey4Dl25JFpbh/OpOzeamj/uL0Ipb+?=
 =?us-ascii?Q?D/nOi1jaDGWbwgJ+wljL109nu/R5eBw/V/zmiONGSBkyCnEquB8hnfNUM78J?=
 =?us-ascii?Q?3hcpSkjqLKVxQGnSBSF7+bEldRmYealmhjLFAyKz/sn94NN9XAAxl4446UIx?=
 =?us-ascii?Q?SAMurrSTIpMfUCkYF5WgtNHsFFwti28+elpXo5yM/8m5TheWsul8r3nTSAjZ?=
 =?us-ascii?Q?6Cyq2ErDP445ZmfkYBWQEyz+8eQE2QHjggVpsMKFJLKe2TaCR5WQuB5mMAsG?=
 =?us-ascii?Q?hKf1l8SC9PF7xXbRFpf4mVyFyODU6uFIxExPQ2k1xpmUp///dA+eG7f3bptt?=
 =?us-ascii?Q?UVClJNkYY5wMQPmE8Uz/1FoYD8cDCkWDR0TrMED9EW4fpS/lFfGPh+yHG5B/?=
 =?us-ascii?Q?n+uw9ZgrJL1egjAVn6Mod8gJHFnqywonuNV7+qLfL1unLwtavp+BNWhHV+F6?=
 =?us-ascii?Q?ZudnOM92nHzTXRa7IlY5DJXuR9RlxkXOlDUxRq0DHus8dYHGIPJwBd/Ca2pW?=
 =?us-ascii?Q?6/NgO/fdz7j+UEgkMf3P+EQfm9cu3g+WjllrCkLo2zCDDtLogVd9sjlLisOb?=
 =?us-ascii?Q?r/BE+/EDcBtgx/N2EUSMmHKSOKuOSyVV4m6pidqC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1cc34be-3af5-44c0-bc0f-08db86e97c29
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 17:15:57.1066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sfCZd2zhMhJ1tlYj1xafYAiwspceHqDXu7xH/MCOGuUvOiskwjXjcsA4hPjUPeeaePw5VOhBArkPFzMvIRT2Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8812
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>If the driver fails to obtain a DMA channel, it will initiate cleanup
>and try to release the DMA channel that couldn't be retrieved. This will
>cause a crash because the cleanup will try to dereference an ERR_PTR()-
>encoded error code.
>
>However, there's nothing to clean up at this point yet, so we can avoid
>this by simply resetting the DMA channel to NULL instead of storing the
>error code.
>
>Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and TX")
>Signed-off-by: Thierry Reding mailto:treding@nvidia.com

This fixed the crash issue seen when there is no dmas property in the devic=
e tree.

Tested-by: Akhil R <akhilrajeev@nvidia.com>
