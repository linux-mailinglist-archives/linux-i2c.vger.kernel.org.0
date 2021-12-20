Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8821247B243
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Dec 2021 18:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233376AbhLTRlO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Dec 2021 12:41:14 -0500
Received: from mail-mw2nam12on2062.outbound.protection.outlook.com ([40.107.244.62]:60192
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229633AbhLTRlK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Dec 2021 12:41:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/f2kGQjY1wzg6fLxe3X9oOLlWXmbXD1qf8Vi9Gg0urwuxTcvOKHfhTtWZOjI27rAl+YXez8/AaLpdHShYO7sD35xnZslotECEBq0JyKb9YuRfp9s9ElnDLpuCZhTPDRctU3oFF1qIB10XLy1y/gWHjl8LVxGjxY9kI88RFrPG9OKGnarR4g51oJqvf2k/C3BpqOYFkQC+ZgFfqN3uM/3jhoz52fHB37dRs8zZUfVylgyrhamFoDqa4RyTNJrS6yW5EbSssapmJYDbCVT6dYKT37RFheOqQI/akwsWYySBwiuOCm1cjTEMlKY1eE1TXcI0TYxNvqShKI1j7S0S45Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNzyOS/VubMVp9gDQn5Hq11VBSPZhVFtS7L6OGzttyE=;
 b=Zb8tjCHV1sLBELpZkhck9ZsM9bB2uiYUVaJLZTFf/uShd8ZIIybgbPUAsgeWm9MCj0yOjpOk+Rkeo/RQ20LkYEd1dj1DfNhO0q/JYgy5gaGAoEkYSGPWVlH/7KUlXgyIogbRF34UuDTCUPeF2CKgSfThn0Cj20ZYgyqCPbLisj/23agFYEfpOI6mSnpgjc7c/EUvubxSGnIvUB5qNmuurfaBcVXSgE9+baDp9Wx1AV/22PKqOWCtXI1M1YVcZTFdlBCH8YQO3cpWG/Yr19RqChzw12P+XyO0nL+Z3F+DtkUt4ClKBUcXO/I/f5hDfJwn3V6b1b8VmwjlM9EQfn1g+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vpitech.com; dmarc=pass action=none header.from=vpitech.com;
 dkim=pass header.d=vpitech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNzyOS/VubMVp9gDQn5Hq11VBSPZhVFtS7L6OGzttyE=;
 b=gf5QAUM4pQI4byse+hBR8ALcNeNG5TXBMO4aB01YGyO2lWnbqUh8azhwH4yOF/QeTcwNE2AT/+Z1fr9DspKeIONlMmCn9bKfHFncLxBBoO5ITdtAihcGYDYk/MdeaKAFxZsRRLy7qQMo7F5bviYttQ/7FxsaRN8VBtSz9PkX6rI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from MW2PR07MB3980.namprd07.prod.outlook.com (2603:10b6:907:a::32)
 by MW4PR07MB8668.namprd07.prod.outlook.com (2603:10b6:303:105::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Mon, 20 Dec
 2021 17:41:09 +0000
Received: from MW2PR07MB3980.namprd07.prod.outlook.com
 ([fe80::b999:3294:6433:4b13]) by MW2PR07MB3980.namprd07.prod.outlook.com
 ([fe80::b999:3294:6433:4b13%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 17:41:09 +0000
Date:   Mon, 20 Dec 2021 10:41:06 -0700
From:   Alex Henrie <alexh@vpitech.com>
To:     Hector Martin <marcan@marcan.st>
Cc:     linux-i2c@vger.kernel.org, wsa@kernel.org, jdelvare@suse.de,
        alexhenrie24@gmail.com
Subject: Re: [PATCH v3] i2c: i801: Safely share SMBus with BIOS/ACPI
Message-Id: <20211220104106.e4c0e3d95145cc2f2a91c3d3@vpitech.com>
In-Reply-To: <7fb63895-e8fb-c9c3-c5da-f922ae0c69fd@marcan.st>
References: <20211216173110.82ae177385322c0992d00126@vpitech.com>
        <a5da4d27-f2cc-9018-5266-9f40d74818ad@marcan.st>
        <20211217195128.49285f55facfe061655a6279@vpitech.com>
        <7fb63895-e8fb-c9c3-c5da-f922ae0c69fd@marcan.st>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:303:b6::34) To MW2PR07MB3980.namprd07.prod.outlook.com
 (2603:10b6:907:a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29f2b6b1-d141-4a3a-6b65-08d9c3dfe800
X-MS-TrafficTypeDiagnostic: MW4PR07MB8668:EE_
X-Microsoft-Antispam-PRVS: <MW4PR07MB86684A19271DB63ADF39AF1EB87B9@MW4PR07MB8668.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EPPflOuFwWbn3oRzIqqlACC2Np0zuxHEY93LNibI0pFliLAAO4VxEptxbcvnle1aZ0X+6Cuaad0iX+Np6Z+wF4ZIQgg93iY3exEmIfdHgAa+jTK497Kbnu9/3cNF9mVNHmhSWuiz1VjpTYjBQjgmljlEs6qSzwy7w32DKyF7d7xdW2t7MZZsdZSKX0qiyiAmPM0WaMua24yFRy0mYe96Hc1FVlJTa03f1btqDMIaI0S5AqL+NGhTC/MQh8LnIf2+tCBsNIbRakEnF4yS7oi5rPWMC+qfSJhbUStlKjznu9esVHPH/5Q/HI1t/rBWQrYbsaXT2x39YQ5KQAx4awwGNwvdzVIEwuLL2O2kQ7Y7sXgm6eW5hOwYNrbhz6yd+Eci4BUCaNTUAYlfyJp1vrPxoqzYqZ97wMqZ0TGoQIZwanPLFy3rC2/1YpdUkj2F3VcQ49PSqtaEc2jsWbO0YJ1e0YWIJ21a8juLSEdwb5KFznRwYaF4pcM/b/JkaY5MlgE3tw3rJO+TDhLxsSJw+tWhPoFv09FuPgOAhC4AK0GE1qybQM+4ttbSSHWniROAkF/nP/30c3PNGLw5GsX5vrj4oR5lwKWCNj57s4cLeJs8NErnA7hIDGMS4RZ4rNGg4fCGSWNOo7mopA6VQaa/RETGM6ilEdJqaw6QAibTnhfCcUBz5qN1RhN4Y7BnvfAwSRAivcKvpPp+AOCvEOuCQzBKdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR07MB3980.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(39830400003)(346002)(376002)(38350700002)(6666004)(6486002)(316002)(6512007)(83380400001)(38100700002)(2616005)(1076003)(8936002)(6506007)(6916009)(86362001)(36756003)(52116002)(8676002)(66556008)(66476007)(5660300002)(508600001)(4326008)(2906002)(26005)(186003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DsiAhTHXLrS4gKAAw5OMGD9HqvVhqm9ylwZcb7sxpvWmWs594XdXQY7HEQuU?=
 =?us-ascii?Q?5xlE4EifjE1vELrEuoQAfJa2+qtvgvF4dZCQoCJsG14hJsCWd4H5b+37u99M?=
 =?us-ascii?Q?+T9MuXcp8ctVK2TXJIbKxoAVMOTLAyShOL4Od+V9VwBlGDj1FYhX3RKBlOva?=
 =?us-ascii?Q?8iMwBa/dBax8T9S01KEXXRLZeQAboFZ6zg6x3crVN+6U5yXd5lvBIEBBj1WH?=
 =?us-ascii?Q?pOZ0nbDcJzv3ShCsBYPB43DbsrUODLvwT5qZA8Gfd0PgUpnY7Acyn60oy/1C?=
 =?us-ascii?Q?jCpdoYRHZMY4Q0f29M/MHwNa5Zu9xXAhqePtA3xeJDDMZtH4xagjAA0gU8c+?=
 =?us-ascii?Q?AGzPtM+okpeqUyg7R5kXvfNVk0+zP56FPLpJiDjoY7IS6h0CqJ9V1M5OP/J1?=
 =?us-ascii?Q?bGmC6dQ7HoZBWZsHudtVuI4UJbJuKpBvEhKypIvVTVmDHTlkygVCaE8MTAlM?=
 =?us-ascii?Q?NXMm1IaRNWBaP8zknnRuhvnRu3GBWliexJFIUeveZZ+qsFOPMiK8f5Amhjs6?=
 =?us-ascii?Q?h3+C/Wpkpv44PraB1A3EjePSovyAuRPNDDq/wjRcoAfuV91+U893jDlmRM5Q?=
 =?us-ascii?Q?X73xEbOddCp1UZd/TOfhNJLRsYl7H3PJAllcc596ussGWPFg1ueeir4F7z8n?=
 =?us-ascii?Q?Dfu5S8sKQw8Qi/MWoGoo/Jy1yHUwH5I/Ij9Bg/VhxYePuOJdRnIPgJob39Kq?=
 =?us-ascii?Q?acbRugp9PpGed+HHS1KnGuGgO8q4wB2CYpeie3LZ1xEjA3fbhcuy/i6R3wEr?=
 =?us-ascii?Q?1h8gGNXes7QnWha/ekguk9I0adw592FuEm+O7nzgTwFyOviYHph/OuAdSrQQ?=
 =?us-ascii?Q?ge5JdLEQyozX3e+juCJR/ucH+qnGNi4UmFIu3lkiwHVOlZ9r8jyaXioKEgXW?=
 =?us-ascii?Q?R29LsuAa6a4qcL24TUnZHGTaXELkeZaRJ0h65hhrWmt+sZBiC2Z/5n5Yi/6i?=
 =?us-ascii?Q?XPuAj4iNH2W7zsBBO5ABvhvSn4IOSZ+/QIygMYVA8kNBHyYW3xm6dcqbMceX?=
 =?us-ascii?Q?748QiYg1V56NFVmgyAiu6fpXTlgZnQOoS6vMvCVhAFKKljd2iZTwlBKLBhLh?=
 =?us-ascii?Q?qvRCFTZbOizHyp4oLzJKPwmXjLj7FWVMPSSvVyGpxFOB/D7+brfPO2RjJ7p7?=
 =?us-ascii?Q?pTYg1Lv4lGyR84OPIkxi/7QHy/JqiNFB8kVd3Qg6V93aMcOg8rSiORCQQYvQ?=
 =?us-ascii?Q?gMB91cwWKvd/mx3ObZ9f5zJsKVYm8R6idiNoqMztDVWU5FwMIzN8UKsTkF74?=
 =?us-ascii?Q?cvAxOD/pfnkhix2Z2TL5xh1VDB9MJgZuP7cIqgx2qwmv48wN3oIIs2NpD2zr?=
 =?us-ascii?Q?4cVgpb4vIBPjye3JUgEXK7yp7E9neetUr7dBMO0DSAvEaI8GvytvQEM9E3tm?=
 =?us-ascii?Q?F99FsfpPfSYCm0XiyAnbc2+qwM/8EFEZoQWERroGo/jBCTTaO9sqiaQOumaA?=
 =?us-ascii?Q?a0emuIuFOT3zavW7XPNEIgww0cMxsoQbH5BIHDU9TiuLYSh7nsniFVvCQvV3?=
 =?us-ascii?Q?Jl7EhQG87bE3a/x7Jiaud1trU7KfHYxFzex+gBljUkYl3eah4FVYSLV6nvVp?=
 =?us-ascii?Q?lhXyRTPJbIqXW8mFgkwInnS+gXo5XHXmoUMB6WtCtwFq2hFM+et4kpZJkBco?=
 =?us-ascii?Q?bShDkXC6ANNUbQ4BElUvmK4=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f2b6b1-d141-4a3a-6b65-08d9c3dfe800
X-MS-Exchange-CrossTenant-AuthSource: MW2PR07MB3980.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 17:41:09.0538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zx5kKAeeXdBLXZQ+l5Hpy06T/u/frdeWQ/CcoToRN4gO+hhJBdjewhk/e2pFddo9I9btSxawxoqdZsqfNdEaCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR07MB8668
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 18 Dec 2021 12:39:11 +0900
Hector Martin <marcan@marcan.st> wrote:

> On 18/12/2021 11.51, Alex Henrie wrote:
> > On Fri, 17 Dec 2021 16:41:05 +0900
> > Hector Martin <marcan@marcan.st> wrote:
> > 
> >> On 17/12/2021 09.31, Alex Henrie wrote:
> >>> I am having a similar problem, but unfortunately this patch doesn't
> >>> work for me (I get the error "BIOS uses SMBus unsafely"). Would it be
> >>> acceptable to add a module parameter to allow access to the SMBus, even
> >>> if the BIOS is using it? I realize that this is not a good idea in
> >>> general, but I believe it is safe in my particular case, and I don't
> >>> see any other way to solve my problem.
> >>
> >> How is this safe in your case? If the BIOS is using SMBus without
> >> locking it, and may do so at any time, then there's no way to safely use
> >> it from Linux.
> > 
> > The BIOS appears to access the SMBus during the first few minutes after
> > boot, and then it stops using it. So "safe" may not be the right word,
> > but in my case, it seems to work OK to use the SMBus as long as the
> > uptime is greater than a few minutes.
> 
> Linux will probe the SMBus on startup, so that still seems like a rather
> fragile situation. You'd have to blacklist the module and load it
> separately a few minutes after boot, or something like that...

It's awful, I agree. I was just hoping to find a slightly less awful
solution than patching the kernel to remove the BIOS access check,
which is what I currently have to do. It seems to me that if multiple
people are in this situation, it might make sense to add a module
parameter to disable the check.

-Alex
