Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57CB6493E92
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 17:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356167AbiASQtG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 11:49:06 -0500
Received: from mail-dm6nam10on2080.outbound.protection.outlook.com ([40.107.93.80]:5184
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235737AbiASQtF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 11:49:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaFVS69ow81hftONb9+XRMtYiu0BJwmTTP/1D/BYq38g7MnLP0W/dWNk8562ycfXsXO2yFLsm9U2a2qf43ra62nQBR0IjfFTrHeSMlhyUmPaWbpIl4i6BzHxnXc1nzbn6VqHKlFSI5wX/LJ/RrsS5GR99jtM3UdG5aVBeQdV8N7OYu893Ww3W4ROa0JynTpnaCsIXCV+Oq7Pc2mJUHQAnB9MM/f4HU+qSOBf6cFGSxm/hpCFbtMD8ttEnP5iLPsS6IDv/QXm0GhsdRu6J2+iUaexsRM84IzkPrYhHAM0lZMStX2p9iFNBeiJ+P8mSmjl1I6Bn6HWPbmBaGtqfrQWyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDw/OVC5QlRifzRd5S7lcMk0kPhZURF6VmmzgqB2NmE=;
 b=NvYi/tSu7Zl2sNfBUAwKBWLZHfO79nhdmAJDE36rotXoUuPCH2o0rgbDFoiGG9hvo1dgMYjXn0mM5ySaKPa4yRN+kQojGusTHJZ8jXeXqscqv1n+z2SSVUrBzS/Zs6YyNVbELJHBooI99ZC0WbcMvddpl2B9NUBddsNlEl424+4sfj0wb8g+GabPvo0CW/abDWKHIxdDxIEb/J9htkNQ/vqfnttIcKVHsxuQKPl5GIbWkGWAvMCjW4ClbGMIi7xThFKAvrpgUV5mRWXuoLFGoBdZhjqIxOp+dRwln7kYPFArOUAaIhwJFC2FwbO9g89KLQXSjLsNl7B6GazrofRIPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDw/OVC5QlRifzRd5S7lcMk0kPhZURF6VmmzgqB2NmE=;
 b=dEQiygHyVwXqmn95TsGM49/gW/l7IHh0SomBFpPav/CLp/LauGZf2GB8B9KUmNbKnSRMojHAzU2LoyHyu0Z+r2siy17WOyGP8atSJfC6P4+lpUW91g4DT9w4Zkk3rn2BBWYv54hglrD5F1Wyh+FUPvLSWhRLIWLZI6LdePoiRfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:15b::19)
 by CO1P222MB0225.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:158::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 16:49:03 +0000
Received: from CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 ([fe80::acb2:d13e:3a3:c824]) by CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 ([fe80::acb2:d13e:3a3:c824%9]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 16:49:02 +0000
Date:   Wed, 19 Jan 2022 09:49:00 -0700
From:   Alex Henrie <alexh@vpitech.com>
To:     Jean Delvare <jdelvare@suse.de>, marcan@marcan.st
Cc:     linux-i2c@vger.kernel.org, wsa@kernel.org, alexhenrie24@gmail.com
Subject: Re: [PATCH] i2c: i801: Add module parameter to inhibit BIOS access
Message-Id: <20220119094900.7792c05f94329f584dad934a@vpitech.com>
In-Reply-To: <20220118134705.6ae5b0a4@endymion>
References: <20220111233151.8484-1-alexh@vpitech.com>
        <20220118134705.6ae5b0a4@endymion>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR15CA0037.namprd15.prod.outlook.com
 (2603:10b6:300:ad::23) To CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:15b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80bc79fe-d4d4-4dae-9e3f-08d9db6b98c2
X-MS-TrafficTypeDiagnostic: CO1P222MB0225:EE_
X-Microsoft-Antispam-PRVS: <CO1P222MB02253062A838CD63940DF663B8599@CO1P222MB0225.NAMP222.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DR9kepcm0fJxLoc2nFE2vIodyuFhs5rLivIM1FCZJ/frFfGjellceLm3pJC0MA439nI43x0vRgKErVCoTdQ6h0RHA044ApktsBSpDmmr51Ot5HJNFIidLr68ENFgLTiCh7r77TvkStR+iyK9WUJ56Og5NL8B7xuqdXns7Ki2oTF11zh61bgLRZwvqrHuO6bUOrIvWfM/PEnrFqy1yKfpx5f486Z342E0tQ85pnYKfcDahW63KSjk2ofrkjqGCnozfXgrj8/yBBaiUc2VzuBXmDVyE+GVY+0NAN5/8hGTIMhp7W+qxiZ9FLAnSlCXue7ubEmVnFt4rWdE/8OWNPrtsPbzJHCUfUM2kUGU2s4c3KslrZp4ZGYyLy7RRtEDsyShre1PHNQLfIlARN/voUmRL/MCO8wxgX1v3DdiT1YGATm633FI7ItEiqYYANDKk3LCRU6O9ZDqzIBnoc/SSkVssKv2urCheF9+dlk95TJRfmyfm5A9gUnHA+KHT+wHgO/D2Bela81gs2O0h17VHoYXJ8zOcDEZnx+3OQhoMc/EESViBjQUOm/8nKZGJTZpeMesSy2iOxJLHau+eP2MskNd6J8EdfI8o3Tx6VEzc9iEVGCTBXrt3kkk/hbHoWkoS0mPZE31aXXyNuLxto1jvW9zD48sfx+TD5r3LItYSIyn9C6CX8Hffbr1R18ncJxC3Gt94Sn1moIeSmTCodsitzlZh6sl8GvpFEF8ffAo43FiLgIhl9tX7j380lBjNauMiUhi+E6lQPJr7Qy8ygnaiOrxqLfiZFtwH1MPMI6BIJ4t4D4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(376002)(39830400003)(346002)(136003)(366004)(86362001)(52116002)(5660300002)(1076003)(316002)(508600001)(186003)(6506007)(36756003)(66556008)(2616005)(2906002)(8936002)(66476007)(6512007)(8676002)(4326008)(38350700002)(38100700002)(6486002)(966005)(26005)(66946007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E2L7QK3jQQUI51f3X32HpDP3W6kbEMzRMQel4ulrtCpCXchrXS9032gYYet+?=
 =?us-ascii?Q?UmfF0Q1ocuiB9RMZCngE+lnynXZupd/dcFsax/UuOIGyJl2eXcDdEqlwMOMe?=
 =?us-ascii?Q?ZgLs6ehYjT0yvxEsLPb5ZMtuKFWbwDiiBbvg9kl+KTwsWnhRsdnxr5cY+q3D?=
 =?us-ascii?Q?yTJRJxNWuwGUviKh44O4AyPINYyu1SwIurtoukypVxPqOERmjYUSvPnTn8m5?=
 =?us-ascii?Q?31bGKQ9wGlGKl1byFWqtJtX/EsqPbjfPoTZVKotzKAha4fwPGdDenBlpWvfa?=
 =?us-ascii?Q?+hsr9eHG6HLMZO7TEG07PiQF/UKBLWZWbHJgmpvW0XusJsI761KRaL26k/1S?=
 =?us-ascii?Q?T7HZ/oPMeBdba+lLFEdDVwSqsouTHBbvlNFgbSNFZcYAOGwVC7VEBo7OT+BD?=
 =?us-ascii?Q?2pIdAIwb+XiN16o0dYgCQWm86YQGDAEVHiINFCxnmfk4vdpa4ZC+lupJL9Bf?=
 =?us-ascii?Q?t3NH27l0M/XJeS6YpE7yLc9zsxabN7yS4RT+mDLj+1dW94niKDTNe5l3KQV2?=
 =?us-ascii?Q?qZ8+unH/mkaUAnJ17XNtmWRBOuS24jhZdFPXcmF6Xs9zSl5fkTWGaWQGEA5G?=
 =?us-ascii?Q?Ww1nSrcHcQi4gO9N1U93Xv9OmIpYagLRz9C8msNHuzg6IX8W+wyGvpyU6rNg?=
 =?us-ascii?Q?xa3O3Sg4a8YjjTZq1n0o8+mD4MaOs2uAwdTTqCwkDa2BEvOPwyQQwKGyl4q1?=
 =?us-ascii?Q?4FBAVWiaZu1M6gov9E2Iwzjg1gzIjqdqa0/zE9oFd3qketSzZnWjYaqBFZDM?=
 =?us-ascii?Q?gZNL3Y+o+rBDB73eASXErO707lawC5xAg1Gb9pFBf/CmBoIASlbFQwjbvYc0?=
 =?us-ascii?Q?2Ke49J9JjxpVf+KR/hXzGgBprUD8RAJGtGSMrH9LQ+CR/R0viGtuciOcVLha?=
 =?us-ascii?Q?MBYP50aHmKYokQ3dXpy8fS9KH8FSXnadM/V73YqEoMb57qBuS7FBmHGx+A/G?=
 =?us-ascii?Q?RTPriB9lm51iK+kjM782LILEIQ/56Jiv45pQUyB42KBQQuijeAooLVWj/7/u?=
 =?us-ascii?Q?fZISWvr2CbQLA/Z3zFd1y9FI0iKdP8fDKahfWRqu6WpnEq4YGONZbqE7/QqF?=
 =?us-ascii?Q?r2UB1LqGL39eefSwDfVO7RRGwkQ3gFSG0O/GLipFbIGO9rs7GoRGrUrV5uQJ?=
 =?us-ascii?Q?koJe/S01kePmcUi2zTH1joyFe+bc8GH3WwLu1ImusAL4L/apAOHxEo++zPY2?=
 =?us-ascii?Q?hc1TRHT3jRudYmJebihMVIjXDo5IvMt3hKiS9BVqjlJn09/7op4w2TwDupfd?=
 =?us-ascii?Q?sJEhFvi0hnMXANkKJqA6mySjRDub+zjOdeQ+Hpwk20DYdUX/SP3Cc6JtgITU?=
 =?us-ascii?Q?A/nz1oIJZwSqLg/wyMXE6NXejo7bE1id5PH7i/DFw2JlB9rzn6C+k/aiAR8l?=
 =?us-ascii?Q?F75Np6LK8g6ToYysYTw37upsAk4qNQAoFBX59IR0JI9FFbEbquJ8QhBJ84f+?=
 =?us-ascii?Q?yjgiKNkyguv1Pr8ANEn/gBnOsOE2oDT6T7avKJ2qNSKWJ4BuxmbI6uYqo12S?=
 =?us-ascii?Q?z4xjoCwcYrsJfH9X9pNzdE4WUIqUaUDd8w8+Sdcz903YJPv0XCMiNbiPyeyB?=
 =?us-ascii?Q?q+5ebXVyiyszgjIWUUMpMw+zivSltQWM1kKxYke/uCc+IUocjtAX5rCGDPNP?=
 =?us-ascii?Q?MGExzrnMCiA6fARNqmcK3k4=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bc79fe-d4d4-4dae-9e3f-08d9db6b98c2
X-MS-Exchange-CrossTenant-AuthSource: CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 16:49:02.7084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQnzViJ1QeIPIjBb6+LtcU8eHfUNFtLmUimCKLy4Q0OSJ217vzD8i5lnPDx5DU1TenKAyA1duqHr8OGqe5x+ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1P222MB0225
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 18 Jan 2022 13:47:05 +0100
Jean Delvare <jdelvare@suse.de> wrote:

> On Tue, 11 Jan 2022 16:31:51 -0700, Alex Henrie wrote:
> > This parameter can only be set before the module is loaded (e.g. by
> > passing i2c_i801.block_acpi=1 on the kernel command line).
> 
> Before I consider applying this, you'll have to provide a rationale of
> why this is needed. Preventing the BIOS from accessing the SMBus is
> pretty dangerous, and I can't really think of a situation where you
> would want to do that.

I need to access a GPIO chip that is connected via SMBus and this was
the best way I could find to make it work. However, today I stumbled
across another solution (see bottom of email).

> Plus, if there's really a reason for doing that, I'd rather have it
> implemented as an option in the BIOS itself, than in the kernel driver.

I looked for a BIOS option to make it behave better, but found none.

> Furthermore, please run ./scripts/checkpatch.pl on your patches and fix
> every reported issue before you post them.

Thanks for the tip. I'm a bit new to kernel development.

> > +MODULE_PARM_DESC(block_acpi, "Prevent ACPI AML from accessing SMBus. "
> > +	"[0] = allow ACPI access, 1 = deny ACPI access");
> 
> I've not seen the square brackets convention for marking the default
> value used anywhere else in the kernel. For consistency, please instead
> add "(default)" after the default setting.

This is the convention that is used in drivers/hid/hid-apple.c, which
was the last driver I worked on. I didn't realize that it's not
standardized across the kernel.

> > +	 * If BIOS AML code tries to touches the OpRegion we have two options:
> 
> Spelling: touches -> touch

Good catch.

> > +			/*
> > +			 * Refuse to allow the BIOS to use SMBus. SMBus does
> > +			 * have a lock bit in the status register that in theory
> > +			 * can be used to safely share the SMBus between the
> > +			 * BIOS and the kernel, but some badly behaved BIOS
> > +			 * implementations don't use it. In that case, the only
> 
> It's not really fair to blame the BIOS, considering that the driver
> doesn't use it (yet) either. A patch was proposed months ago actually,
> reviewing it is still on my to-do list. Could that be an alternative to
> your patch?

I think Hector's patch to share the SMBus is a great idea; my patch was
meant to complement his, not replace it. The problem is that when I
tried Hector's patch, I got the message "BIOS left SMBus locked". So I
didn't want to let the BIOS touch the SMBus at all because once it had
the lock, it seemed to never let go. However, today I tried v2 of
Hector's patch [1] instead of v3 [2], and v2 worked perfectly! My guess
is that despite the text of the error message, it's Linux that's
leaving the SMBus locked, not the BIOS.

The only difference between v2 and v3 is that v2 called
outb_p(SMBHSTSTS_INUSE_STS, SMBHSTSTS(priv)) at the end of i801_access.
Hector, can you clarify why you removed that call in v3?

-Alex

[1] https://lore.kernel.org/linux-i2c/20210519091707.7248-1-marcan@marcan.st/
[2] https://lore.kernel.org/linux-i2c/20210626054113.246309-1-marcan@marcan.st/
