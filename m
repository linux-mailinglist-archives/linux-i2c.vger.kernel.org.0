Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5334940C4
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 20:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239741AbiASTYz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 14:24:55 -0500
Received: from mail-mw2nam10on2081.outbound.protection.outlook.com ([40.107.94.81]:53088
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237071AbiASTYz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 14:24:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERh7YJMEqoX0nYBoHAJtQQN2sQrbOmY6SAFAmIJBRs3ZQDTdh5qqgIqx2AuAu3e/CupE+pW+7t+bjeDB+Wixv6jskWDd7tS65Y5eEpPOoJ16G+D6oxFMaCHzDzpZLOAeY3xtCzzFKpVxv52z+TsEOi7c0IVYtNTToBfYTUcphR5o8BaYnF/oYxPRO/uYZjncPsYTdvfCyYUWdcCHMCxsIy+z1LhoQrzOwe1svpPkal3Ifp11qd83glRcCY2xBUm8YConAo1OXeeiZG44SoQF++MWk1mF88AV7oItNXH0wAUD0lPiGOHQRxijGTp/4b7sfW8YTQ6PLG8e8drKcceqMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeoifctO4pNUdSpTkZUk38wCo5JqefLW31C8GtPjuEA=;
 b=oUDvo13nG6UMVd2YCnIUIhtja2dL2jZaDkLffCW42iNoGXPY0nwGIgQM898jnAIQt1cu417IsJiBp3lWgvWLSbx+66K4ZaHfZ5RcnRlGMM04LUJM2HNH6EhZn/XcKFK+ychuloiCFFED1t6pBiWFtTZ5zv4Vx1fztaFP05BNIxlLKtt+kif3L2eSN8egRYVeqj17DR1/qha1w4VpS5tj7PBXiCs6odvg+pUFwWAytArJP36/xXGeIyRirSd6Vgpzn1AtNxuQT0eMX/vdVRELRIac7prDOoh9p6gKPKEeIj7TyKknjYCCngWquY4zt66iMNnvlKMfmfLeffD5PlxiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeoifctO4pNUdSpTkZUk38wCo5JqefLW31C8GtPjuEA=;
 b=cXhlsnhamD4/nh55tG3nboOYk7Xvu9+eT1O8zKZxVNJs0dDBA3olRvQ/2vVmd9Ruy0617pp5+mbLjBaiQVwyNURNriwTJLPJzjXNcB+jkxIMMH2xwSZ1BqM6eWp84j0hjbOdQ+LGhnWE6WuFOZ1SDMi5A9O+LCvEAiknautwgNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:15b::19)
 by SA1P222MB0229.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:1f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 19:24:52 +0000
Received: from CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 ([fe80::acb2:d13e:3a3:c824]) by CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 ([fe80::acb2:d13e:3a3:c824%9]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 19:24:52 +0000
Date:   Wed, 19 Jan 2022 12:24:50 -0700
From:   Alex Henrie <alexh@vpitech.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Hector Martin <marcan@marcan.st>, Jean Delvare <jdelvare@suse.de>,
        linux-i2c@vger.kernel.org, alexhenrie24@gmail.com
Subject: Re: [External] Re: [PATCH] i2c: i801: Add module parameter to
 inhibit BIOS access
Message-Id: <20220119122450.b9d7ef9b7178f1f2b4d76497@vpitech.com>
In-Reply-To: <YehbtKp6QFoQ3NRt@kunai>
References: <20220111233151.8484-1-alexh@vpitech.com>
        <20220118134705.6ae5b0a4@endymion>
        <20220119094900.7792c05f94329f584dad934a@vpitech.com>
        <dc6c3b38-dbc1-3d86-fd87-607a2d6a6685@marcan.st>
        <20220119110156.574ae2d96af6b8a722c8c9ba@vpitech.com>
        <YehbtKp6QFoQ3NRt@kunai>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::29) To CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:15b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcff096a-d120-4b43-4885-08d9db815df8
X-MS-TrafficTypeDiagnostic: SA1P222MB0229:EE_
X-Microsoft-Antispam-PRVS: <SA1P222MB0229A08B2D2E4A0F5CA7254EB8599@SA1P222MB0229.NAMP222.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lqhzmztI2Argm6eBT0k0Pqy/XvIbN/ADSH+jzIe9bpQVIq0kN2rzv9XAB25v0zPsSuE1dzcU+J1N9/+NNBw00+Yc6tXHiNIG79aVOvlMU3cWuOCM8arIoe5g4dI1NjpvgA3Kz04AffnHqPyrkGp3Wkacc4Z8TSIX+hc0EEceaQ9O/8zOCbCERCmDRyh8yjaxgn6PfNFI/xaKP5ip0vM5FVqYx9aKEHMzfohoy3PD5TLZjcGfzfKXbtY0SSGfJTDaBs9+xBM39xINOTQqAFo7CQEJceB2OGIEh0EN1qOKWufzeM4YoZr8j6wWUYrWwNYobqe5ymMSvpH4ca4ZM0mwDsQ6H8VabwzrqAVX0nCcnaEzXrRQbAjvdjqLCIdrYH1YcKYyPwGlwywkIeYblsv2zCwH9HgWP3tJnAB7sOzbSnzcQ6YOh6wV6T3HBegK+MR5P3GeaAUOqdWSuetYVf9VOn29YdcQNIyk4xowTWccY+G8tk+/xKSTTgorq+P7HraQdE2B816N6T/Ogjjmu9sKr8tCJMone0gOm0Fp2IPNGTjkKcC/wpcHRykOTnt+e+cFZ2gYcMctoLRKZyPjOTcbD3mzsuN6fCaVrC/dPMp/NAC8BpRZ2hoB4/M8vy+J4EdfVcFFVwrXQiXemt2uVjKJEG9sXKX95T1SaHYlRjmFBUsDGyYFh6niQv0AazGfw6OyE8f/bcKezmbutxDl7QLovw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(376002)(136003)(39830400003)(346002)(396003)(316002)(54906003)(6506007)(186003)(52116002)(6916009)(5660300002)(508600001)(36756003)(8676002)(4326008)(2616005)(8936002)(4744005)(26005)(86362001)(66556008)(66946007)(66476007)(6512007)(2906002)(38100700002)(38350700002)(1076003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QbBgsMSbVHV84/o648hhQ4vQ6l9+pcGHOXn/Sht17pkYllxvt7xazgeHJcRq?=
 =?us-ascii?Q?wCQZljDUIGm23UGszjy8xrg6U+neKka+XHq8r1Cd5SzNTjWDWOl6yicDrsNJ?=
 =?us-ascii?Q?ai5MgkmoSH3v04wWZyPIhiJe8jnfJpdGNhItBgRMHpF9is81zedRWCxynYqd?=
 =?us-ascii?Q?I53vFyLZKZRHtVoE4ac9rw+L0QqGCiCCkts9TpUQHMxq6fvdBLOAL6aIP9Tc?=
 =?us-ascii?Q?Cq3oUB/qScHLAM3PuVCpAJTNxvzEYuIEvUbFenvJU0HEpRvjW1UdfxGhtr7y?=
 =?us-ascii?Q?6GNJI2/RFFzULKYS8ZFyXZ8/bPAc1tA/qg6OeJvnyBVq1rST3wHtZPqsznOk?=
 =?us-ascii?Q?7gcjoOMKXvV/bbsgSS2pGvCSUNu7mponpHjpqIkHOVNdskrNGZ5bVGH+cYoJ?=
 =?us-ascii?Q?JcvQkue4AnYI8mGpkJNXgLm0DMM8iNemi11L/FSYO8ESj2KRTGic+iSrbE/T?=
 =?us-ascii?Q?htQAzKffrLa9eqakXNmYM8QukeClgHlJsRdzEx/id4Dmoa1l0WtX2NXVMbIB?=
 =?us-ascii?Q?vQC5VjnoYCpi82TZ4Z8Isrw/k2YXsPuBB1f5SQjflC64NVE7MQ5f7JxqL/gx?=
 =?us-ascii?Q?jvo8YqTXfHOgZdxQnPPxkcQPBv9oB7MkrxEOXGiXIvAK7AmkhBAdDV/JvRGw?=
 =?us-ascii?Q?0SlSKNCWx5h5i77Cveez/koLR95gfxFK8QlRLhaCSp3IwyfiVbtV4xb+FYDZ?=
 =?us-ascii?Q?kJ/IvNXLk4dJk9UIWtncbI5YFqb6M0yRMr4tfQKY6VPETEWu4PYk4VwExK5/?=
 =?us-ascii?Q?uQpzxAw4lIoFPM+EwS52ZdjR/jHBxlTne9a6Ds1sG/9nTeLcuOBocFbJIsCM?=
 =?us-ascii?Q?5Be3Wy1/cq4AmUZe0Ua6OAUdhWWteeDc1HLb5naLnnNmi2qQRH1B4Z9Qpoi+?=
 =?us-ascii?Q?mHfVjyLlE+IDcFzJpt9CHaDZ4cuEjXlIfjkRATiM12Gb2ZIE30IXz+Ri2rWg?=
 =?us-ascii?Q?7NGNWhTWyf2nkP6A6Co0qStLD00F67KG2fPIbpnuIHzYx3b/dcex4Aj7bel+?=
 =?us-ascii?Q?IX6KYYIaexLJOtTGG/u/n1QvNrlRduodqemAgpU+3og1K9fm3r8VLOlKeXXe?=
 =?us-ascii?Q?vzqox2/PmvF/I3PLzvUB/FdByznsbVuK/y50u/aQprYDIJGO2gIpsfYg7YSy?=
 =?us-ascii?Q?YkETsMbJsyb8ByJI40kDQmPxjq6gUppyzJG7CHr9gsxNSlu/rdF9kn0V5VBS?=
 =?us-ascii?Q?AbfoY+AXQC5mu80nimPfCaMatGbWL8/AkeXehUURlMDlNrRiKXcAF8eu/xHL?=
 =?us-ascii?Q?bItV6fbiHvRFMyXQjTZ0r3Hro5o/MjDcKwJgsA7BwjZDaFhn17JFcxKOwP+f?=
 =?us-ascii?Q?0WYFtcmojJxjCTxv9SDniHjNipIwI94QeI+/rfMEzDik7vGZUbasSIImRCAz?=
 =?us-ascii?Q?VwyPvOzlF1aAVcbyjAQ/YxjuXJXBBReAnmMCDwrWoHb12sK04Z9flCDo3cZC?=
 =?us-ascii?Q?6Z4VuJAmpUo+OZEW+w+KXkJc8EXx9FN3kmqwbRDdgYcf1T9bAo41IoS835Ov?=
 =?us-ascii?Q?yJr9aMevsCDf2VrGYNxy3+ILE1eoeaPNMszhJv9TwV/2bJvLdU/PBVU/WBaA?=
 =?us-ascii?Q?xU8LujZrrNv/o/zPRH1pbZ9VoPSMqjWP3coX5FrVI0dEU38MNWCQlS6GiXvN?=
 =?us-ascii?Q?NOTJ18etSyTQ8me4nO0Z+3Y=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcff096a-d120-4b43-4885-08d9db815df8
X-MS-Exchange-CrossTenant-AuthSource: CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 19:24:52.5808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPtILlt8/7YK1aXmEUOK24N7bgs/2bPIJ8s0wBJa0QfitKxhlmySosJJOHyFCR/80Qh4FnCs/0nRoUCiu3MyWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P222MB0229
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 19 Jan 2022 19:43:00 +0100
Wolfram Sang <wsa@kernel.org> wrote:

> 
> > Jean, please feel free to disregard my patch and to commit Hector's
> > with "Tested-by: Alex Henrie <alexh@vpitech.com>".
> 
> Please respnd to the mail directly with the Tested-by tag. We have
> tooling which collects tags for us per patch. Makes a maintainers life a
> lot easier.

I wasn't subscribed to the mailing list when that patch was sent, and
without my own copy of the patch email I don't have an easy way to
reply with the correct In-Reply-To header. Is a reply with a correct
Subject header enough for the automated tools?

-Alex
