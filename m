Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA15761544D
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 22:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbiKAVeM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 17:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiKAVeL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 17:34:11 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2088.outbound.protection.outlook.com [40.92.42.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181141DDF1;
        Tue,  1 Nov 2022 14:34:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNliFBMqKURDirtNCWK0c4i9bZTVeNY6Db3uFGTfl95TwiivZGZ0DdZaG8AKzRLpXTADOO7G8PLaG4FdPAoAwnJN36ZDDldsFpAvBWRw3gCkoaKXZpV+OcsD49EVfSsT+WaiwC8kIPuOpli3vwenPWQvvhBk4tHciAKuAdsI3KthSLFP6w+Oy/a/Wd9/v1nOeOPkLzP7NXzzspmuJHPzRBgFnARRaNBYaW5a0mBWH6h4+cX0hrrQjdumr/PsEyZfKMk1qSIgsKjmM+sdl9H1ZiW7C7Dwtemv/P5XIN2s+YnO30k499pAMFLdPB/1w0ksJr3nWnvkZFopG44XOVWqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGva5ueQXHXsB2llHO8Tg2WYrlOj7MYMb/QcC+k6XLI=;
 b=XX68pPU4dJXVFSLgSrfS7SZNJ2/Ka3iTrC540YoMlCPVKreyl89KJadOXJIYM5wDPHO4RcXTDPvxD6HUlhGZHBND7LxyCexjohKg6f/Rlk86tsF+OyItQrDdiQ0IDpOcBK6ftUNRsTf7TSwygvXFIxg4nVzVxoDWeTVKt8XMsp+Wgvx2fN6iaY5zLSWDwJLzvJROJdm11fN9xnljt0zFb+f4HJWUY+aBgcMYks3qQqiR/KlbUOsnc2siStMPDwtXtOt7uDVOCxB0Tx0jIHbNn6+3pAanyjVfAOI2+WkMUHQL7a17EJckgXTKUoH4xF5v4gkUzA+G/4HHGPDXf0prqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGva5ueQXHXsB2llHO8Tg2WYrlOj7MYMb/QcC+k6XLI=;
 b=hl4dNW0JIj5d1XL5sryNUO9EnaQWC0AA5N9KhffHyclK4ifYpmoRO29C7NIj960oJcYjmL78UdFHAVZXHB+C3mtOy450LZuIjCUT5+lURu34ygp+Rhf5SSkpp+benGwgLijT9c1lji7y/wMyk4dHeQ3+WIwWGN5GyJnQUOlCjq9cXnWp7KVaMnQ2pXA9UAswxvXpvXfkjevioSCMhotFRcr4ZLhjhpmjULB/nVcoblmZOTZaDESZBaleI6dpRmbbGtlBbb9LBgCTi3opZ+4q8H+e4g6DShbH+zicAw8LxWlbeuV392ltfAa9dP9NnNLyC7udf1IR/o7A0mETAjXvAw==
Received: from MN2PR01MB5358.prod.exchangelabs.com (2603:10b6:208:117::26) by
 BYAPR01MB5144.prod.exchangelabs.com (2603:10b6:a03:7e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.19; Tue, 1 Nov 2022 21:34:06 +0000
Received: from MN2PR01MB5358.prod.exchangelabs.com
 ([fe80::bc9a:11a8:3923:da92]) by MN2PR01MB5358.prod.exchangelabs.com
 ([fe80::bc9a:11a8:3923:da92%4]) with mapi id 15.20.5746.028; Tue, 1 Nov 2022
 21:34:06 +0000
From:   Arminder Singh <arminders208@outlook.com>
To:     marcan@marcan.st
Cc:     alyssa@rosenzweig.io, arminders208@outlook.com,
        asahi@lists.linux.dev, christophe.leroy@csgroup.eu,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, npiggin@gmail.com, sven@svenpeter.dev
Subject: Re: [PATCH v3] i2c/pasemi: PASemi I2C controller IRQ enablement
Date:   Tue,  1 Nov 2022 16:06:41 -0400
Message-ID: <MN2PR01MB5358DC40F0643617AF6BF7A19F369@MN2PR01MB5358.prod.exchangelabs.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <a40dbff1-6aa1-dedf-7eb2-c75d75d808b2@marcan.st>
References: <a40dbff1-6aa1-dedf-7eb2-c75d75d808b2@marcan.st>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [CVbj5uOjxFV6kAv8RKsYqPoA+xVXHXLY]
X-ClientProxiedBy: MN2PR14CA0024.namprd14.prod.outlook.com
 (2603:10b6:208:23e::29) To MN2PR01MB5358.prod.exchangelabs.com
 (2603:10b6:208:117::26)
X-Microsoft-Original-Message-ID: <20221101200641.9300-1-arminders208@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR01MB5358:EE_|BYAPR01MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: 44dc1837-6c2a-4e20-30a0-08dabc50cde2
X-MS-Exchange-SLBlob-MailProps: BDG1u3cCCl0Dyim5CXX8MiEo25DcAHUeGml6N6JMP7HrJ02izmdMOxS9xconZwMTCbv8NEduY58sEq8iN8nyKHXXrCHvqSR7f9jDapjrnxB2DH2bltRYuxIoDvH+jq2Z4f0IHBuqHPe4x3WSdXcvtnrVtIpdvV6IbWYW+K2Onxz9WlfUK6KU1/BAqFIXr53UpD1bt4Q6K06DgOAAyPpJXQpCwb3OZ5LMS9bh6tbg8ESYSUPaz7djHxNBp0YtrFF2XuGyFUDPtJ758AAfE4q0NRiqnBpV87awhKQ9AQQmwawICQdoY7jwKw4gb5P3L8CQI2HzlgndWQaazno38cbGS+HelavrKSh3tsdrmabKZJtcjKvtAD5VxPOaDjT+tyjPslkINkAd4yk592Qa7PmnXNEbKOax0fdP8hUGtmp4JbryhCWkR+/HrMQKFmVENeFWarSHUqhCzI5PI8/GFo6CjwnYvIZSOs2MqCJjKk/Fe0+qg2QjusScUHb5ULkVB658EgVKLn42YZ1CigWoesLmi+wvmJZHBow2SrhZ1nnc+dtv4wjUEbs43WpfQ/BcZYaC8eYt/87pknZ20ishss7fNTxTZgHc2d0QRb6vU+Ql+0FrQOcgSUUV6UPHd/e6/AJdOIwjB/uHrAJFsN0I87k9LmHR3GkCdYYCk3gtvxqKlujgomcSm6YUmrF4Shtv9nn4cBjtkyp4BLw=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rxIUQ15VEFBCjYyAMg3Ux6UqpYvfjxmcHdOTsvJEPFLdR49PK6HTrlgmBm55CX4cqV7IQu0JeFHoOfBM3GrTITgFSjcbM2OZSkNVIzklKxHNl/iE1iI/s5eG/UMosyLeiCkuvIlVFNUKhv4oU4EPWt7+NVYHvoFAQ3EuxjsBINwo5d1Oo7Ck0p4AP2f59kitNS/JW0g33qrzsLRKSKibcZnUGJ2c7jwld9X0iBZcZOvymlooDz3nrnkX5iOIgHNYI3E/kVQ+5IPOSMVJfUJccpDdV0RFFZdOrU8FfyukS7l8R1W8D4UDoTzOVCZOQJd3ByuqQtMKWDKmRmP1FF7TuDOkx3LVttkEzYYkxJWD5IyYYi9pt4P9QctnJa2I+BzLZJykWchpq7hSjkMinrfwzoap7Pt4cq1OJ2Dhws8KqUD8x0vZm+MduV3NledPFSnXiHKlnG+JDtrhYsZtJP9NHhd/uCnhZ0CfA9GOMk0c8z7fF5x/wCS04Zl8AymvM0Ow/6Li9RRxIDNo7kdt1K4HeQMwq/5Y4JWxzPVtbu3NqyUpvAP1Wh0TLIkbOU74siAeCN/SMAj7k29ZRS3MMPkw45pZSwlRMHtbQgIZ1yxJ3vm1XQKnGQupp0gUVdyovU3Bk4dCBSWnNwEyqdlNbDWIWqVKvRIOYVh2xrBfa0fWJ2PLJDgKS7yu0PJKT1EHTnBdbpv5viCaRuGlHjIs4OaNsA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uNHUlyLxDEfs7w1nVZwxHT1anF/OaUWLBV6taeotUmrz5Q2v18JY2PHJ83KV?=
 =?us-ascii?Q?O39WwQCCdOKzndcLHTkLp49vFp0YsST2nOUMRkispXb0J5p6EQaDCkw49HTs?=
 =?us-ascii?Q?MPDrAzAtgq++Z2p6ndlcou6ZHtwhOfgNPvzZT3zLV8AUOYBRcGtizYolXs5y?=
 =?us-ascii?Q?QouoMYSxHpygT3j/B2qYriwU3D6b5ZX6TqEjLbIQcRAsg6qwugX8ESSVgkJv?=
 =?us-ascii?Q?lxZhL/HVBYkgPYdpNwiKf5edKv3XZ0Q8jCjtG1j3q2ZQ+Tzae0On9l+Nr3vC?=
 =?us-ascii?Q?x5tqLqTdluaNzW+ebQs9Ubvzf9BZVrjOvEI7vEWVzuXrqkaux2nnc/lTWRD0?=
 =?us-ascii?Q?9iZKY0sxzIn9UtBVdQo+f86F7qGHLdXzzzNKBk4L4R52bXRsciL0JGBRi4WL?=
 =?us-ascii?Q?XJeyxryvwNgTlgxztUgXg/NwMWnRcEkLeSlQC/eGCUklNEpdZxyzq3FouygD?=
 =?us-ascii?Q?GKmVLj3rH9j4tKOPDui6GwcZX5JEviiKwcULzTLXKi3kdI5y1vNLkjPC0WL5?=
 =?us-ascii?Q?8sIc8JPn2o94nCZRz9xRTTTYs2vnIe31dwnZdxWNaFoNa3bTCQwgoxE1lexh?=
 =?us-ascii?Q?uPiqKRzSKw2Py3aNQM168zUbywj+DlRTIp//h0e3/u2S/poHwL0oTf0TR2fq?=
 =?us-ascii?Q?hTql6pBb8gZ880kLA1igVofui/UQCf/7qLTaWmaO6mYqirQcdxczTroAIS/c?=
 =?us-ascii?Q?tR/bAVDq+AbQ3SSe5nvOWY9iHqAZrS++cathQe34eSQzY8oyh4rHeljH38yv?=
 =?us-ascii?Q?QGc3smYCw/1r7pwvXVP/aFtU7JaSovotZEfHCEbOOg0cK9CBivD7QmaTOMir?=
 =?us-ascii?Q?UPQuMclkfc4Tuls3qxpRjIQNpfC9j4q6io9ZfYwV5dIU4BPaNVg2uY7x2Pa5?=
 =?us-ascii?Q?eQX/S8VWL6MhTehZE3IvExH5Ttdg+rOE8aEmhgGaLBLOzRv/N+x2mm1jZPSF?=
 =?us-ascii?Q?NeXMWg9ZhxAB5U7qshfGLas42fesZlXhJ4W7wTBWr2+WG/DHn7p6wfNNcoQs?=
 =?us-ascii?Q?M6BGUMQ2zeneGNx/lKxGdm+WJpdAbTVAY3Mdq8SaHZMP5rj8MoP6voy8NAc3?=
 =?us-ascii?Q?IoY36PuOpmhRESDVLo7Sk8Csl9v/DpBEXy/gjVthSlx0zvO7lr5/bY7bp0UM?=
 =?us-ascii?Q?CEW3hORlCGmkC+s3YphR4CNYrf+9PxgnrAxtkfi3VnMVO6jk/TZFF+vdD5PT?=
 =?us-ascii?Q?7d1O8F5viknDGFwRWuxW/4ra/qmIL/kDu/a/8X7bNrJoGIAJd8peOWjzPxd0?=
 =?us-ascii?Q?TW/IfCH/hgZDpkNzorW1AMHXiShn8Kzd+UTA6zvWyA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44dc1837-6c2a-4e20-30a0-08dabc50cde2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR01MB5358.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 21:34:06.6717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5144
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks Hector! Acknowledged the need to change to a 100ms delay, will be
addressed/changed in v4 of the patch.

Thanks,
Arminder


