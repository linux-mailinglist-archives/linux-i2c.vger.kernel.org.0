Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C4747983E
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Dec 2021 03:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbhLRCve (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 21:51:34 -0500
Received: from mail-bn8nam11on2054.outbound.protection.outlook.com ([40.107.236.54]:60513
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229751AbhLRCve (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 Dec 2021 21:51:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9EL1ejCKN6XN2TyrjAobxAU5d9cIaSVT0kooQIs7tietBbHHEGGTLkTU0HY1/17eHS5Er9E7S8juCQRg/qMcCV1BpoBxV92sgR+hiCPhv+3SSvpDe/1QhBIFbAAKl/cNpEhfCxKWz2SvIFkwOrCrMe/rdXf7K//pIywmT0JattjyptE860Tg4xSTMevzwROxwD0tZBrJu6wWEqi06BR5uLE+5VuExrT5iLEeh/iqI4oYornR/22w+dK2ayWIB48x+TQb7Ls/MdOUJVlEUAGejGlxqtQkMK9/WzAXWu/Wuhl5zup8jUyV4bQ52TMpAD/BhEP2XzM7uQsjJ6cKwe4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfMPCaC+dMVZS0rijvykL4+q2VoY4pVhfQKIibew3QU=;
 b=hnHx9GLwZ/q4G5jYHQjLEIHY6MlT6u1pDLSzrF93VmKggLIDMm0XzxZxO22NjMiiD9cYDVFQSpPsE3RE3Z8Pftph6sUz6jqeJej7BmTSa56B+UcTqZdV87+Ew/w9cQHtdcp0e6u9X0xdUod39a5J60S7EwZmfx/GbOv/Gi4C0YOc2JbjMX66pafuMNhdHzWUf9hF+//XWzBQd25R5hR/rbOyYR2ivAPhrJHHz2QWmWPE2z/7ta8l7ofxiURqxtqXwo1p1gsZsI/GAW0cZlaDaNWsrp3rMkV6Bkcfq4RR4E41VvWwXwdXx/8XkC0oDxovfShWnVHMpSVVap3evbc4CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vpitech.com; dmarc=pass action=none header.from=vpitech.com;
 dkim=pass header.d=vpitech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfMPCaC+dMVZS0rijvykL4+q2VoY4pVhfQKIibew3QU=;
 b=jBuFaMOKyDt8XjMO4T0pZyK05VzfyZp744J+B+r6vjNdt552VNEvHSKrAQxvJnA4sr5RGgAKgibCfB+LsxERFyd5bP8QX7ud8lkNl6Na68jesj6c2wxJEqH44m+BExEn6bNZLoHvkjMyogJLJJNt4NRyW2AhOoQmubc3fRIVFfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from MW2PR07MB3980.namprd07.prod.outlook.com (2603:10b6:907:a::32)
 by MW2PR07MB4091.namprd07.prod.outlook.com (2603:10b6:907:e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Sat, 18 Dec
 2021 02:51:31 +0000
Received: from MW2PR07MB3980.namprd07.prod.outlook.com
 ([fe80::b999:3294:6433:4b13]) by MW2PR07MB3980.namprd07.prod.outlook.com
 ([fe80::b999:3294:6433:4b13%4]) with mapi id 15.20.4778.018; Sat, 18 Dec 2021
 02:51:30 +0000
Date:   Fri, 17 Dec 2021 19:51:28 -0700
From:   Alex Henrie <alexh@vpitech.com>
To:     Hector Martin <marcan@marcan.st>
Cc:     linux-i2c@vger.kernel.org, wsa@kernel.org, jdelvare@suse.de,
        alexhenrie24@gmail.com
Subject: Re: [External] Re: [PATCH v3] i2c: i801: Safely share SMBus with
 BIOS/ACPI
Message-Id: <20211217195128.49285f55facfe061655a6279@vpitech.com>
In-Reply-To: <a5da4d27-f2cc-9018-5266-9f40d74818ad@marcan.st>
References: <20211216173110.82ae177385322c0992d00126@vpitech.com>
        <a5da4d27-f2cc-9018-5266-9f40d74818ad@marcan.st>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR14CA0068.namprd14.prod.outlook.com
 (2603:10b6:300:81::30) To MW2PR07MB3980.namprd07.prod.outlook.com
 (2603:10b6:907:a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60d3bfd0-752e-4dc8-6f18-08d9c1d14b5e
X-MS-TrafficTypeDiagnostic: MW2PR07MB4091:EE_
X-Microsoft-Antispam-PRVS: <MW2PR07MB409109753193B1C4D7B8A0A6B8799@MW2PR07MB4091.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: neBB9mu0mU3IbH09713X6uIQMB27uxt7UkS/jfgJ+MqNvhAgd8/3xGkGDjr+8eaiSAMvVPWGorXBmlGp0SITcHE8SpV5qSHOzY+zflkRXETcd7XuLH7IOFwL6koy93hiIpHVIIVXD2T8WPpJfsisDpNuebDupTKU1aQfb8Lkzrek5mhMePsU3DmaEyas4GkxeWH8ZtE17a6hnpu4XB6X9n567jlofoQyZMqEprflajSfjxh1QNdJd/jnjYWplFFedl63tkl6vJyQYfV1D+vdkiiekcK5gQgr8TZhwIeXJMDTYL894tqHK4ElKqJbG8HWj55nbkymC2myK3JFju/fQJR7xQmguvmAH3VheDYGNdxWXnL/iSWt1QVAlyWEMqegnc8CoLlf7O60YCIjcXser5YY6eJYirbiDFo3SZarmJBvoD/kDomfVL9vKkmtbQV0K3+hpHHZ007K7PfTRSmYliA9ixNNbtBVFoRQBy1BisL/bFOaSaK9Oe7kjDQN62SW3J6R+CnS3zkbcLlASHv64ebsJrRBT9QdAlk4JXrh+dcgyHJAU1IH9hK272239C9gGhR8wxBOs0TQSwDDZLzX9aXKRFnufz4duCcu/Qps0utViNZOJqub8h3r4HyJEoDyWkRF8JOQPkLSStMhMHHQhXKFT+QTbciTRNevcsewYIH9rslEZERn5qNT9GqszqDf2lZPmgIaIrjQwOJKRR9tKniaBNz8GS0pj9aN9cJOqn0hphP7T5j8r0YpGO3ZeO25
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR07MB3980.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(366004)(396003)(346002)(376002)(136003)(38100700002)(5660300002)(2616005)(508600001)(66556008)(66946007)(6916009)(66476007)(8936002)(186003)(8676002)(6512007)(36756003)(6506007)(38350700002)(4326008)(6486002)(4744005)(316002)(26005)(52116002)(86362001)(2906002)(83380400001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5DTl2E1Lft5XNnz2GO/7sP4DPWAK8fjZILhJ8+JmARpm1P46V4fwprwjP6ke?=
 =?us-ascii?Q?KgU5wULEAsjqo+W9kRCVrCyKds8VMTzX0sFHwgaUpvmEY4T90wUL3tdyBPxx?=
 =?us-ascii?Q?Wd+sFUzAO3Ba0b1YBIczGoJFM6pg1LV3VDAzAEdrsxzUjdYLbsvacQXOrLoF?=
 =?us-ascii?Q?aFCc3CTXLroZvN6pGvUC+A58NkPtR72ti8LvJGIkbwkYQ6yebLSOXg+75Ede?=
 =?us-ascii?Q?G4VsKBIbDbutjcVuzDHSieRyLz5EUyDjoeDehk833gwB/KXfwNWqYjIttgew?=
 =?us-ascii?Q?o7bUW0WoTQd4EQ5/K2dbuyl3hzcUcnd+UkD7J78Dqzv4mXkRTGFgeQRtRzar?=
 =?us-ascii?Q?9e/NZZCDleX/fgZcP1dYjXu6k+u4IobcQFycoREkLT/Fu3vNwKsO1dPaRHzD?=
 =?us-ascii?Q?JcF5t8WZo++0hTRoqEkBFo7UKgSYDHBPC85Hc/3LGnqd4+UhK/Iq8t8WIAJd?=
 =?us-ascii?Q?zK0YHaAHvsyQbtP0SsctuV9mYFeuCTj79ySC5kQRfyb0NKxgNXcQN8kqd+sU?=
 =?us-ascii?Q?yxFk390DI/DO6kqBwFhafXpzboa5AC8w5hMo11Ws1fnoB6s/t/OsKC7i1uTw?=
 =?us-ascii?Q?D+pnNMq8BB5exU3el6gQCIfFAwtAMdGD16kr9Uj1Ass4A6M5m+NjlLEYantP?=
 =?us-ascii?Q?AbgVSlSEJxF1ZXisMdkH9jq/ppKyVIqjpdpXWasmN/UC96W7BzeUEn9wwCi7?=
 =?us-ascii?Q?0dwk8nAJp6IhNbabqSg/l7v9Rqilpa5+25Kl2oLITrdnmtjBr5kAAVoTq4gi?=
 =?us-ascii?Q?3bonqBlIGZwxTeLZy+PObQOx0a1EKEm8S2sn74d6aNNFhN/6LZAYomLZjbOb?=
 =?us-ascii?Q?6zwDfU/ZW0y+KUpmfVAuAmfB5QCfOaW29ebP3y/5jdWyd0JZSSYczIlRPM95?=
 =?us-ascii?Q?EZoB9JRzTEncjyMYET3X/p+sQ3U1m2oK2VE8KUTvJRmQ6QWJ7oBzhu9U44LN?=
 =?us-ascii?Q?hjkwoD3xV4oN4ODcmeG8CujXk4FlQvEILrFRe0r/QEHfdqEsJipHKAn61Muc?=
 =?us-ascii?Q?pOyCqebCjBPSQDuYFm7dDe8TlxC7VWdimDSU7vjwB+2cORPASMkfYTj5RcxB?=
 =?us-ascii?Q?6qd1GdSVs/OjTc5PMFNwjxWN298sQ441pymwDinZ+31z7Dd445mJGkG0fiFQ?=
 =?us-ascii?Q?yjRpm+hOtopxhIJAlYaqs2JvYF25fTcvwj54R7kt2Mldv28i4bzzhdM+0jGc?=
 =?us-ascii?Q?Ub+QMPLKfrli7EAq522LGRHzF4xEow7e6es3MnAI/26Olin9GlKeK5bGpOnO?=
 =?us-ascii?Q?yv4izo2qBhUvzrnd95U5q43fckEjaK9vvmlv9mLtovUQuEMqTju+ebUVYTvM?=
 =?us-ascii?Q?YgizgLQay0gaoegMoPetVCvi8A9Gi01L2CjsalxxNDTTtFlw81hbqTa7wRtF?=
 =?us-ascii?Q?EEbEF4ZwVcqVsHombX+gF8khS/QwDk1LT0YCRCzSh79oq981gpuzbQ/X2c64?=
 =?us-ascii?Q?diBCBmn8qxAJRwXS03xWJZpQSMtx3esooVujzVca+AKZN7Z1nAVaiVMC0OAQ?=
 =?us-ascii?Q?LMvipH8slNbdBigvWf9UTCS3JVit0E7wboNhHxxwy3wKJX/27olK9wkCbQQd?=
 =?us-ascii?Q?KPgXHCXW1lC3q92O9JuE/dEh5cNz0WbkaG2+t8ip2ldfNhtjLo6hcTICD3JS?=
 =?us-ascii?Q?NZarMcGJzMFiMWNBb4l6luI=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d3bfd0-752e-4dc8-6f18-08d9c1d14b5e
X-MS-Exchange-CrossTenant-AuthSource: MW2PR07MB3980.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2021 02:51:30.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NziKz5ip+e81feBpSv+RqWa0GYnvyjDnHmke29RtSCn6/aJeEa44RCInw7DIqLJELp/wGC4/rfU8oSv11RJ67Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR07MB4091
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 17 Dec 2021 16:41:05 +0900
Hector Martin <marcan@marcan.st> wrote:

> On 17/12/2021 09.31, Alex Henrie wrote:
> > I am having a similar problem, but unfortunately this patch doesn't
> > work for me (I get the error "BIOS uses SMBus unsafely"). Would it be
> > acceptable to add a module parameter to allow access to the SMBus, even
> > if the BIOS is using it? I realize that this is not a good idea in
> > general, but I believe it is safe in my particular case, and I don't
> > see any other way to solve my problem.
> 
> How is this safe in your case? If the BIOS is using SMBus without
> locking it, and may do so at any time, then there's no way to safely use
> it from Linux.

The BIOS appears to access the SMBus during the first few minutes after
boot, and then it stops using it. So "safe" may not be the right word,
but in my case, it seems to work OK to use the SMBus as long as the
uptime is greater than a few minutes.

-Alex
