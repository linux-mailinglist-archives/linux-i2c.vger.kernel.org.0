Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7340498838
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 19:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241753AbiAXSXB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 13:23:01 -0500
Received: from mail-dm6nam10on2084.outbound.protection.outlook.com ([40.107.93.84]:7688
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241782AbiAXSXA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jan 2022 13:23:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTx1kwXg5a54w4TInDiiygSAfaApX/OVvMzjqPakMBfvdjqh/jD/Z5boJYQK+z0RmnpW5g0LIPSveVA/9kghFLS0BwvGn7SuXbKawqiMnBL1FSPdPzHgtwBjA+yM3GtwsAK5QmkMX0hl2VaFPsJjmkAx3QZv6a9GxcdNLZnOV9nz+sGJg1D4RJJ8uhh7vyN6EmoQTIGHiYpLBNxraas2QW5zh1NJzM3oiTGU8Jlkj4SVAEQG98fRZKp7HDtZsAvzi0rT/7/zIDaQq96IrXPGv/+p12Ee0XDiUQVcPHBmaweQvovwaFwyYxRouAhq0tY7VCkEkv9cJUq1rq2H14TXzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlZO3HbM9JRv1HO2kWludz4W6xzUR4Z2VGUMITsBr10=;
 b=jYOs+c8Hy4+LEn5mjOLRT2v/8ff1KV8JowVWtEqlKLkKqZe2tbSDdqLKvVzBZBugM559LANfBaT9xx0pZZW27AzgXfcKr5JWSZ6g5qEIIy2RcwgV4W8a7doVFTSy/Envpk+XpcjOSeNDUzQSIO0IMr3E9jbhRQJsvaJaBWpqLD7X4URueDl90i7VUF9ofgXQP9Eeu3T5bQ0ToXm3N9iQoWcBZUCSiAGMu5yRw2M6l+pQQKdO9AVyXS7P1YBTdaJmuwVceUNiY8cC+S/x952nGrBqqCOAq1kfFWhB3//9FHn9/zHTxLWnP3kKHLsW/P9XY5MQF+DaSModDP9pFwXvsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlZO3HbM9JRv1HO2kWludz4W6xzUR4Z2VGUMITsBr10=;
 b=vc2m/pkKMGwMnUsbNIlLcupBrHqOHRd36MXohGPTUrOLs8tZhhW/FqCTgzVkuPytuHFRemSI5qt/XCd8/N9LgoXOGzuPidw+F0iKXkuhBksmfvg2v3L2fAS8ISTg9yV7T1+UmilEKRAPW7NAgi6Ll6mTdZ6dXtFBSzSc1EvNwjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:15b::19)
 by SA1P222MB0182.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:1f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Mon, 24 Jan
 2022 18:22:58 +0000
Received: from CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 ([fe80::acb2:d13e:3a3:c824]) by CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 ([fe80::acb2:d13e:3a3:c824%9]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 18:22:58 +0000
Date:   Mon, 24 Jan 2022 11:22:55 -0700
From:   Alex Henrie <alexh@vpitech.com>
To:     Hector Martin <marcan@marcan.st>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        alexhenrie24@gmail.com
Subject: Re: [PATCH v3] i2c: i801: Safely share SMBus with BIOS/ACPI
Message-Id: <20220124112255.8e47c04e9a36a0d65e949618@vpitech.com>
In-Reply-To: <20210626054113.246309-1-marcan@marcan.st>
References: <20210626054113.246309-1-marcan@marcan.st>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR22CA0003.namprd22.prod.outlook.com
 (2603:10b6:300:ef::13) To CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:15b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f220fa2-b584-4941-580d-08d9df668bf5
X-MS-TrafficTypeDiagnostic: SA1P222MB0182:EE_
X-Microsoft-Antispam-PRVS: <SA1P222MB01829B3FD52282F6DEE4E03BB85E9@SA1P222MB0182.NAMP222.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TVgpxkphp7NnNki0aDo9FLQlEV0R8SDKrn2tj6O4RDDyAySbhbTbt9Au9ejml2VWCR+Nu+R3hUJ/KTq0ZJSPqa+sUQxRaI4PZjkMErWFtAlERpI1FrwVALPWoc7nA/szXGZHHW5Xa0MVVKoaI7M+X6EOtMlJKmu1uII4GMZzK/sUd5HuVUTU/YT9nIOyMsGX7Tz8VcKpzRN9FVB5KX62AP+d1sQjv7L9snU67/Mmld7mCXfw9Dz5YygGVAQ9Suo6+m56JfayErGdqjcfwiVVvz5bWzXQPC5bx8GZglLAyZ2bUHeHnmtiKZXccYXfEEuW/xbkzippGKOr0fJldmpOIk+o2/4CxjLoI5JXqubwsjp4Eb2R7/olCOXUDwn0wxt9UXqZcaotvn2REDLVx8KQLj5PN7iiZl4l9hEiOKkwBWpC9E3No/pyWjzI0LuVQmbosl1AgBSTgV3gJE/DtKSyxo1ffxN/TGRe31m46nyEW8dX/24qo9uMnJcQE/EhAB1dXMhzhJiSAK+9uBeWnQtOwJjTRpMKwiz0Kdgw6vPPBX0a+2AxcMNfHeuV+VAlCqGmEXr0lZ6YBp9Dhxa/OJDW+plQ3xG+Y0Xp15Hf3+WdExw583CKCdc+tNFkEEFFFJQ8TUPu/JTdjjMHZyjbGV4Ycaui8xKRxHVAJdVsKq77HyglRg/DlrIbPj1xza0LeXzEUZJbByTAZppBzOOiLPfbEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39830400003)(376002)(136003)(346002)(366004)(396003)(38350700002)(38100700002)(2906002)(6916009)(2616005)(52116002)(5660300002)(6512007)(1076003)(66946007)(66556008)(4326008)(508600001)(86362001)(26005)(8676002)(8936002)(36756003)(6486002)(54906003)(83380400001)(6666004)(66476007)(186003)(316002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M6pzUhmlLjKocpOhGOlXk7NScew0L0cPf6jFCVmM4+SuH2zfOxEBzLE/5/Pj?=
 =?us-ascii?Q?aGO+TRvOLs4yiPX6D5oaNssjJvkvCUaao80Vgt9tZG0QCg/wCVRM6b/wl2eK?=
 =?us-ascii?Q?Gf7tDQ2RXgNd1EOHkWbYDBdZO755fsHu1fup/wy80n/6TyTlC2RHtIUEzCyo?=
 =?us-ascii?Q?1LnF6vFOLgEZVuHThxiOCxsJR/UR2qQQcyXC+vHG8uVVFqwo0aIXgEQeOgyU?=
 =?us-ascii?Q?wqa6CqjEykJ50vyVF2dOxhJTB8unoOpJZOCz1P8TPbc5xmCec6FfejSGJ+3Y?=
 =?us-ascii?Q?1I0HiwiW3UlS4jJKUqXG2cCZQCXaHKt1r0t/2N5EFObKJN9jY54zU5kbHF4l?=
 =?us-ascii?Q?ICQn1gyKLDB1y7+CVnCnEct87Cg9bS4UiF4MKJ0VCf5LaakdCkzCFEy+6n0G?=
 =?us-ascii?Q?U6prk39N8nLPM3iXtkx2XuDpaRp6U2oLTnVCbMirSA5UTykvPrBkMRkRw3HJ?=
 =?us-ascii?Q?dNB3vOyPN4kMjWvJHl4CzwG3zckTjvXvbNna082imMJRQWi2XRb+ExcMx5Kl?=
 =?us-ascii?Q?Nc3GOsdUl0lNnkAC5oy91HiyKb+bY9HabRZwwNCjWdJDBYkB3SYJkw4IZHAt?=
 =?us-ascii?Q?aGikKRtZFhMcZ+ByoUO96Ftr/2ji3C3//F39wBPRp5LTmfeBlr3+5pPe3Qxw?=
 =?us-ascii?Q?4Vc58P8dIIpsDOjjrjZzv04BHWQCvtjkGms6AcZSQENw2GhmcYnyKax9aMRh?=
 =?us-ascii?Q?VL9ijHlClYNFJjgI9I77O2IzcDs1FaHMjeKV+mU65Tzd01t2rvFIg3hbP2Kl?=
 =?us-ascii?Q?jb+4w3Tc0T1b7AL/NCwnMycUn7gbm/ldRrWtvAver+dLahYeOUQb0s1MjSKT?=
 =?us-ascii?Q?dyIOngGp5kyR1vs4x4M36mcCm8jQeBdJc4Unc/WXjUlfclnwKeuylMc8A30u?=
 =?us-ascii?Q?oK4ly2kQL85vbWSiskFycxWsBZm++UfGvDnAq+tm/EetAGA6lI8FkWTND/nS?=
 =?us-ascii?Q?t8/wq6M5nCur8bod/edmwWzhlpUz9fQ8WywUq3mKL6MlrFrZ7+g3XChGnUSZ?=
 =?us-ascii?Q?k+/fA+yE0TUA1rRmO7f1EnNxriuYN/MaLb5ahRfHUo8lo9jIsP7dIPCSZboL?=
 =?us-ascii?Q?ZWXGVyMPi/xy1kYjwwDnyjZjf2mCWKrsrifKuuQvzFeLv1e5U2xp4xTDKh/k?=
 =?us-ascii?Q?eVL3R6H2hlWTEmwCFa1T+Cq6f6GiOB7uSAjJVG1W1kGKUfPGC13KSFBfjmLU?=
 =?us-ascii?Q?NnVr18+59hTHUwxLMVqQW5sjMBOJJRqKT2qp2/fw8nO6HOMIOJv83kP4/A2j?=
 =?us-ascii?Q?cjMnTVeAcm1LFVQKhhsHFW+A+FfQ2wtyek08DV5mdgKohVGWKAYS+I/64ULf?=
 =?us-ascii?Q?3WRPp2t6NPTyTN6yLTx7nKeEycJir+p/FDg0sJdaIcU1Q4iVe6Oh83Ylnbb5?=
 =?us-ascii?Q?QtexAfYZe33ekzlErtz7DtSdZ+zxvAxOcIJcPc1PskXyNlfb1hbT5Rlq3hSZ?=
 =?us-ascii?Q?dZ8PBpAGG15L6dSROp1k9caHj5itr06JZE7zShmqltQ52hM7z0dk4n+rbxf5?=
 =?us-ascii?Q?Eq7G3je0RQ389n+StTErN/WtzK7LtVlV02H9gW/ULQh9L2aa2QRedxhPiaiY?=
 =?us-ascii?Q?sCmPM1q3fN19nvp7Qh1QoThdMzP48OZ4gAdlUBQNf6xXQs+/5emEFBXSDvDo?=
 =?us-ascii?Q?c/DvYN7Oy6NjwD4aGR8Dilg=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f220fa2-b584-4941-580d-08d9df668bf5
X-MS-Exchange-CrossTenant-AuthSource: CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 18:22:57.9904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgtiIY0NfTEdNQODeNOCfPdIN5jbgT5HD2BQJm9mq0LNweu7bH37rjiMIOM6OYTHQzgKd0p3LOdNb/8Mti4ceg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P222MB0182
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 26 Jun 2021 14:41:13 +0900
Hector Martin <marcan@marcan.st> wrote:

> +	/*
> +	 * The controller provides a bit that implements a mutex mechanism
> +	 * between users of the bus. First, try to lock the hardware mutex.
> +	 * If this doesn't work, we give up trying to do this, but then
> +	 * bail if ACPI uses SMBus at all.
> +	 */
> +	if (!priv->inuse_stuck) {
> +		while (inb_p(SMBHSTSTS(priv)) & SMBHSTSTS_INUSE_STS) {
> +			if (++timeout >= MAX_RETRIES) {
> +				dev_warn(&priv->pci_dev->dev,
> +					 "BIOS left SMBus locked\n");
> +				priv->inuse_stuck = true;
> +				break;
> +			}
> +			usleep_range(250, 500);
> +		}
> +	}
> +
>  	mutex_lock(&priv->acpi_lock);

Hi Hector,

I do have a question about the order of mutex locking here: Wouldn't it
be better to lock priv->acpi_lock before trying to lock the hardware
mutex? As it is, if a large number of threads are all trying to read
from the SMBus concurrently, couldn't the loop time out and print the
message "BIOS left SMBus locked" when it's really not the BIOS's fault?

-Alex
