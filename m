Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C61C493F7B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 19:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350864AbiASSCD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 13:02:03 -0500
Received: from mail-mw2nam08on2083.outbound.protection.outlook.com ([40.107.101.83]:6273
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234188AbiASSCC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 13:02:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LquWUpkBbL7VwrsD9spH4C7tA4oOATf5ZnHOJhWAnam/o1ft3TuvWpNBat3eH7fAnd1RYrp6mx0HfIDaEgcmmi4lXA9HEYxZuQz120Yt6sFPXTgFXCewGB5nF7Q1fjGaBlyXmONE15iYYF0RGZDwUYZ1dvZIzz6whvTesaXd6Yu5vDVj7w8V+cQW74nOQSiUUioAHPeBrTaPZSzoA9kt+jZkD7Z8n5Xwqe3ozq4D0osIaXuTu3oxzCV1Ec30XcA8kWOoX68w8pYwD/Ryjf7UFYl0Qe2SSNH7eZ0Qoat8K0h31DZi7n063+f4DbDLQb7sWITVAQvZqUCeyIyqK3xYOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8XMO/Z3DEfeAqt/VzcV4491WJFsQO7G4SREZfTT02E=;
 b=Dvm10VMer3rhVWx8R20DSBKjE03DMWsmn/zr60LuzNbl4umX2LsPQjZbBGvb4Mzd6NYfXIZcNkAkFFHv1gjnxPutKyOZimNPH/PZQOyy7vX+K7nYru32hTkiN7YnvQgtsiK3LX51ODhJFEE2koi351aUlYMWh3tLa9XGEYPsoaP5fmthOeKhrGlifprj8GVoqjSAYopn3p5kC3XAzZrueYd2v54rDImI43dUW/qdLWvX/nRWAqrTZnsTZVyr1vx1mWik0HUYWSd8lEuILKzJR/2Wz5+VzIwTzI/dt4qoqLGchMlQK1AEMGj+sM9US1fePrSx/kqNFoWWVCBs/1Fx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8XMO/Z3DEfeAqt/VzcV4491WJFsQO7G4SREZfTT02E=;
 b=xSz2SftHxNDZPGPQwKHmrvRDBsZG990rt23txdc0CE2Ya4v4xzoZOFTK9cfQY6/MQzrpZwgG1GK/JrtTAG5EBTuBMWvzitaMKE7IE+WxfSulNEHMP4phHMVjlOSKMuklo7mR8rxyajK9o/2aFQGnFSysqSxV0ZSI6pjtt14Uy90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:15b::19)
 by PH0P222MB0465.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 18:01:59 +0000
Received: from CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 ([fe80::acb2:d13e:3a3:c824]) by CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 ([fe80::acb2:d13e:3a3:c824%9]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 18:01:58 +0000
Date:   Wed, 19 Jan 2022 11:01:56 -0700
From:   Alex Henrie <alexh@vpitech.com>
To:     Hector Martin <marcan@marcan.st>, Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, wsa@kernel.org, alexhenrie24@gmail.com
Subject: Re: [PATCH] i2c: i801: Add module parameter to inhibit BIOS access
Message-Id: <20220119110156.574ae2d96af6b8a722c8c9ba@vpitech.com>
In-Reply-To: <dc6c3b38-dbc1-3d86-fd87-607a2d6a6685@marcan.st>
References: <20220111233151.8484-1-alexh@vpitech.com>
        <20220118134705.6ae5b0a4@endymion>
        <20220119094900.7792c05f94329f584dad934a@vpitech.com>
        <dc6c3b38-dbc1-3d86-fd87-607a2d6a6685@marcan.st>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::24) To CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:15b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33001fe2-ee0b-461c-266f-08d9db75c953
X-MS-TrafficTypeDiagnostic: PH0P222MB0465:EE_
X-Microsoft-Antispam-PRVS: <PH0P222MB04655CAE0F4D179A9EC40FD0B8599@PH0P222MB0465.NAMP222.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uht1gyGkpqOtnfd7vSHBhH5TihQJTULc5CNHDoycDeqXm9n4m5kUvpDITsdPdjXCMwCdd7lfMZphO0YAyzBIRVOyXqR0CjSYRwy3KFXYVleNDhKFUxeK6a76WB9IeJ/Unvs/y4Zh7D8ydbFPYWaCqa4vs0c08tvGNB8BFSISf/6uLusrB1FpsIcRSe3pFTmp38TphvC5OwGxLLz0SlwEmXBUnHf3K3lVyqOdVtBhnhqxg1/ci8XYyR6SogcNUibRiwoZqmS0G7t2zJwqg3xypFVqqdFvlsLJqzzqOzIhF2yp1oCKd4MMKg30P3vJx/89aOqcC/T4OUWfy/l77tzE9TfT8g0zwHiXasnQQJZpqPHnVBw5qDKYP6rhZhfKnjJ6ZGMrh/Q90mg3AzPpvFTjqt43dlUSeOOypvbEb4OV1+QqgAV8JfutKq86oP0ndA0+qXGCWmeOQ3zMI3qKWIA3ez9B2fEPRR9FPAtLujgTVIwsnqJxSSR83v4hY/c9X+yTFvRbNgsXoD8Rg9qaSKYESjrt9NbvDfHq+ip0wNbdJ1cv5jwxHahAgWJzmW+EZJsm/AzYzfOPPRJ9QGSlMoulhe+0UGSXspAePt9QurdH6+lSBps1242qvYjGVKt63xvl9/9A/wV+O4GDsTjO2I/NNRxVTQTaPyxDuBG+PbTmMYcjRhQ38Nr2vTXjVGigg+3qh++wm+xXMavuHVYrQfyHbAb0Ps5Xf/mjlF174udt32MDl24uoZnJ06NLYj7wDaP3YuZ9RNF6jveQsAsDiHRIxioq36aKTTu/ER/fFRya5dM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(346002)(39830400003)(136003)(366004)(376002)(6506007)(1076003)(8676002)(4326008)(38100700002)(36756003)(86362001)(110136005)(52116002)(508600001)(38350700002)(316002)(6486002)(2616005)(966005)(2906002)(6512007)(186003)(83380400001)(66476007)(5660300002)(66556008)(8936002)(26005)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dBMeC6ZOfDPdN1D9kWHIgnqQSicklpylBjRfpfJdC3DINgmjrc3gs3w9MKFC?=
 =?us-ascii?Q?NcGACCy00pYMQKpYcazSWaHNE5MKGntzUtm5tBB3kA1rjM66tva4ygNNLVo5?=
 =?us-ascii?Q?EswoalMn9090yDQESWjZorDYuw+usmCooVKYuow7ce2FIRYdcMzmBPMg0jVd?=
 =?us-ascii?Q?+h1BliwIuyBRKSTUQ1pgiIwg3CrsUVlkaVVF7qMiHI5GAztLQNjTz73so1ay?=
 =?us-ascii?Q?YrpsR2n9oDDwG5BppDB/QkXrZgxjQAm4Cu33Tj+khB1XNnlgus2vzQsDoQRX?=
 =?us-ascii?Q?juH9ni79xrdMR6b1qmAFFHjlQbjS+Z/UAYIVQeF47YzLDfVdyf53v4ubthvH?=
 =?us-ascii?Q?cUvkVwxShTRIMuA++BlcXZfpsNdTp+FN4mqBWLQtpGN+ZgF6RG6kRpXI+mWJ?=
 =?us-ascii?Q?wrBjRp3fjRsCqYX25d9AQUSlwV1oI+eTf6s/PYcd2uWBZJB1TaJsowW69+6x?=
 =?us-ascii?Q?xErB01c0uKc5qIBNAdHZuO9Utobuht/iZ7oCUV9C0zrMoiiVwWxyXANdTkms?=
 =?us-ascii?Q?rtYk1tsKluw3u3f9iWedXq4hTmtJrGqxflzurMZSHJeN+t71nYf6mSpV8BCR?=
 =?us-ascii?Q?mtFWv2kwliwx6iMC/V2Bdk5aUwDWGIhmOrEsrqTuY4IUevFiinbZY7tYJEJa?=
 =?us-ascii?Q?50ct+v+KaWLseP3V+u2z32jQ5EcTfFm2jyfmLE4PuF7FUWiMV/nlGAM0+gbY?=
 =?us-ascii?Q?fnktyrI/rZNT1s9Jox0pbtDO4pyfN4HTeTnJCfnIpQABlFITvC6KMmotD0TF?=
 =?us-ascii?Q?8tjmb6dKxrII3Bj3shD21WJ5M9LDXf8tbhj7PHIju7JhQnJ0VTOJBPpBQeob?=
 =?us-ascii?Q?y5/bkllHAIs5wHjMIW6a5e5Kohgn4CPkHdQeNJdcqnXVHUnf0T5CnVstxo9e?=
 =?us-ascii?Q?CUd2JjRVST4EHHbZX8CE/ZSNyc2u4wKGxYRobdZyR7A5Kx3HjwZswie7JSGU?=
 =?us-ascii?Q?tkQxtn1wTVZRtzC5Xm5FvNzNvYtFCOdz0AvNC0nb1tfKZ6aA6IIrzwxkdrcM?=
 =?us-ascii?Q?78ZXbKIxQrUlRuHEL1yE3bUL7dim/XgCDfvF3+Bp8gkCRKZgoIm6xKC0vEdj?=
 =?us-ascii?Q?61nq5gm1+GgzteGBOdcldZTtijOgV+BCXmCdRbFhfvWeoYdnUX707j6+QlFd?=
 =?us-ascii?Q?/eGXW/VSg6p+vbLS80Yzh5kkNGYUYeuk37Tqypgn6i5P3N3pFM05Q9eT/4G1?=
 =?us-ascii?Q?1QWEkpp61SRlRp7rt06o/esO7Or1sVSQf4dg9NmDs4U/iDzQeFhqVyGk6VsJ?=
 =?us-ascii?Q?KUijysg8Lw6PFgIvB8//WQ5Yg2JC605vf+QQkjHshTE+t40iWxqSmiwA/X9j?=
 =?us-ascii?Q?y7mnQX8zisy4ERJPpS0z0a3uXzHR08qfT8vf54FjcaISsq2oJYxZ5Krb8rHk?=
 =?us-ascii?Q?ACX+akGqfGkfvtVjel14tL23PanYwhieqiP2owYA1mjB6pnuZqAWeP+bgdxi?=
 =?us-ascii?Q?gkbTSnUMDezrQuIvcVEQK5y8TRqS4FgL/4lF1p4xnd8FK86gAlTjn/ACNdgt?=
 =?us-ascii?Q?SFAbJArxW+z0e8QA+ZPqv3QJiPcdGsBA3LvBfq7IcwGg05J/oZPYGdwjMp7M?=
 =?us-ascii?Q?B6bffp7F2d7AYkPPeAhNno9lkmibsbvQ2UBTD9g1bCiL3ZmIdudl/qRfuqTZ?=
 =?us-ascii?Q?pZcH4iCUr6hGwsR2TOmCckQ=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33001fe2-ee0b-461c-266f-08d9db75c953
X-MS-Exchange-CrossTenant-AuthSource: CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 18:01:58.7942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0skyJwDGkLPVDXPzpj3TTh0YvcObrzTs5xeOP7wAiOlfF4EARM8pQ07v+Aru1kQruArmYihfmxC8xDrQamE8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0P222MB0465
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 20 Jan 2022 02:32:02 +0900
Hector Martin <marcan@marcan.st> wrote:

> On 20/01/2022 01.49, Alex Henrie wrote:
> > I think Hector's patch to share the SMBus is a great idea; my patch was
> > meant to complement his, not replace it. The problem is that when I
> > tried Hector's patch, I got the message "BIOS left SMBus locked". So I
> > didn't want to let the BIOS touch the SMBus at all because once it had
> > the lock, it seemed to never let go. However, today I tried v2 of
> > Hector's patch [1] instead of v3 [2], and v2 worked perfectly! My guess
> > is that despite the text of the error message, it's Linux that's
> > leaving the SMBus locked, not the BIOS.
> > 
> > The only difference between v2 and v3 is that v2 called
> > outb_p(SMBHSTSTS_INUSE_STS, SMBHSTSTS(priv)) at the end of i801_access.
> > Hector, can you clarify why you removed that call in v3?
> 
> Well that solves the mystery.
> 
> That line was split off and submitted separately in another patch, as it
> fixes the immediate breakage that I was trying to address with my patch,
> namely that *linux* left the SMBus locked and that broke BIOS accesses.
>  The full patch implements proper sharing logic; that line alone is
> enough to unbork the backlight on iMacs (among other things) which was
> the immediate regression I had encountered. The rest of the patch breaks
> horribly without that line, as you'd expect, since it's trying to work
> around a broken BIOS when Linux itself is broken.
> 
> That patch was posted in June 2021 and CC'd stable [1], and was merged
> into the stable 5.10 and 5.12 trees as well as released in 5.13. So, you
> must be running an old kernel :-).
> 
> [1]
> https://lore.kernel.org/linux-i2c/cefbeb76-5f7f-036b-fa0e-1e339d261c35@gmail.com/

Excellent! Thank you so much Hector. Indeed, this system is currently
using a custom-built 5.4 kernel.

Jean, please feel free to disregard my patch and to commit Hector's
with "Tested-by: Alex Henrie <alexh@vpitech.com>".

-Alex
