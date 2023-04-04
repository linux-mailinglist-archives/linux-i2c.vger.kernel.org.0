Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 514036D6028
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Apr 2023 14:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234347AbjDDMVb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Apr 2023 08:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234813AbjDDMUp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Apr 2023 08:20:45 -0400
Received: from smtpout140.security-mail.net (smtpout140.security-mail.net [85.31.212.148])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E161D3C12
        for <linux-i2c@vger.kernel.org>; Tue,  4 Apr 2023 05:20:18 -0700 (PDT)
Received: from localhost (fx408.security-mail.net [127.0.0.1])
        by fx408.security-mail.net (Postfix) with ESMTP id 7EF4F322D90
        for <linux-i2c@vger.kernel.org>; Tue,  4 Apr 2023 14:15:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1680610509;
        bh=cRJuUuFpTiE+c+UdUo2BBI265v5oVI7Jg9MVvLEwhlU=;
        h=Date:From:To:Cc:Subject;
        b=ldPzJvKbwCMGtfk7+V1XbxF6t4YEe2U02r+5dhumRkC1hqXVDzz9NGqH5KF9RUGyR
         6zFcQMtsoFltaWSy6d49jWwja0NBO6akYB6lQReuNwmaa+4P10Wfjqd9Wo3zfT/gx5
         Z8LAGylkZH2X4/3RFh8Olls2nD9dwyN0Ki7Cl8SY=
Received: from fx408 (fx408.security-mail.net [127.0.0.1]) by
 fx408.security-mail.net (Postfix) with ESMTP id C6684322D71; Tue,  4 Apr
 2023 14:15:08 +0200 (CEST)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01lp0109.outbound.protection.outlook.com [104.47.25.109]) by
 fx408.security-mail.net (Postfix) with ESMTPS id 0965C322B04; Tue,  4 Apr
 2023 14:15:07 +0200 (CEST)
Received: from MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::18)
 by MR1P264MB1732.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.34; Tue, 4 Apr
 2023 12:15:06 +0000
Received: from MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ce25:a152:1cab:d832]) by MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ce25:a152:1cab:d832%3]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 12:15:06 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <12cce.642c14cb.8a53.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcyvIm9RcPH2f2ZZHSlFieIwi/rN5Nxjuo0I7t9WW9F7ca0dzeKaU76EQ2jH8Cq0Wh0XzdN0xh1Jctbv07sh/DWUAES9EkSbecn1vX0kw6ZSaVEiVpiBHc5LOGA3AbgCk/0DnoCY6KsQ4XRZWIogiAD8lPTpeU6Vmg2RGA1LAHtWIJ4YbiFlTEq8I/WFl46CDCHHIn9EAooK/+PHRYrVPVwin7WcFJAdNxHqcHAacvVFv5vTxm6htOcMxoN0KtQUAnB1u/g2I1gOLmJ5qQZyRRqQu2vndT7THHqg6jNsxTjkohBEKG4V7wSkunZ+k79wHloNy8SbeoJu8x+eeXat6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bq8gwvovBCf8yhaVCTXCkqdSilgTGYX9AwNtcF27ml0=;
 b=JrvHlmXmxvTkVU9rbiYfl+GOuz4zYTBEse/4/3i9aHJ48FLGxcXWACPUrXnX9Mnm/l90oloiyukuCUYSPhnNJY6CQKLANg6xRkuKRWqYxetaGhaM98LKn5/o7GuWr4rOmDEuh+3dKh0pPnuJZpGgV9fT1GNE9/lPfJEeIGvHELjht8xuwwqNmDl5JbSrzXWUPf5KCuElaBoZn1c2N/mYXW/2yN+IeyoM7J54JqY5DwEy0Zi18tM4UUFN0gs3oCotvd2M7Pjrt6Ydv7Ar62yqh33c24jcEJPfj0cwoE12yWlw9CaNY5r5LQmAp1WrmPWAiSgGLxNB2TA4GEjvCb5FsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bq8gwvovBCf8yhaVCTXCkqdSilgTGYX9AwNtcF27ml0=;
 b=aF8dTzUihu2Bkr4473b8CcOkDicZPU1mgdfAmEgXgkLDJzdIi4B/E01oP7Keo+aPI1vy17yxDtK4HhbMctfZqI6EOYz0uajLC8Oh+jq9Xv3FYymOcO4WS0q7BPGgVI/LA5/MmTlnNQVfzBl6SyiYpghUM5HZiYnnqFLwk3ktTADlOccjWEjdCa4LY/7qb0UnbA9Rdz/9eq4A3qVHhUW4ninE/HoKgtYBSEjEyQYf/yu3i0NYiROjJr9S8V4kwQ8JnCOTeAUd6a80YVFrA3M44kKLd5BGZ2C0n7Ubbw5V0HlyqW7jf9+68eq6RazRa1eU6sGoSion6R8+XmeQ1pZSYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Date:   Tue, 4 Apr 2023 14:14:58 +0200
From:   Louis Morhet <lmorhet@kalrayinc.com>
To:     gupt21@gmail.com, jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Fixes for the mcp2221 gpiochip get_* calls
Message-ID: <cover.1680602387.git.lmorhet@kalrayinc.com>
Content-Disposition: inline
X-ClientProxiedBy: LO4P123CA0250.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::21) To MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:15::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1555:EE_|MR1P264MB1732:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad6ec26-5671-4e89-0f6f-08db350639ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0R3i7Msy3O1CYEsy+e/daNzYNgs1Yuwf/FieB27F6E41BdoQXXJIPmQVI11yzbIGjTX846XOMIrg02XF8XrBSDYn1kkLIqBSHn+iTHDDuBZmXpLQT/m0at1N5yfc++5tNQ4ZyfgmLY4xWeUyUPVOQExOnlGYJkjGjKFxImbB//65r+01tGzmepvRFJxi4BFqo1fCjanWWgKEj2LPdg2TZoWujEO3Ub2wORiMQuqwSDlWhQmQeAnuWG670Uu9OZcfXcNGUWsd9XnVW1VV4BJwk1zvFCotXR1ZFvpKi60Fwq1Ka8d6hOAdPlE+t2xk9q/5n0Yk3TQ06VwZY5XucNkA42CHteGFGex0zaVU1pt5yQlK2usAob2QekJhcAIVZJH3PUOqSsmwVpI8iBFN74SnZL6JgBwJaoF2QykNDrzbb8OM2+KJ2R9IVyQ0RFQ1Flsga29xbnw64dExuUW+TcDc9ZQdvFhLIAlYFHSYmnnuokMAPDq8UKJhlveDRZUbZiz7fb4fVBVBV898xMOrg5StGv92aP0xAnta7WvvM1L8lsA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(136003)(39850400004)(451199021)(2906002)(478600001)(2616005)(86362001)(6506007)(6666004)(26005)(6512007)(186003)(38100700002)(83380400001)(6486002)(36756003)(66556008)(5660300002)(41300700001)(66946007)(8936002)(66476007)(4326008)(316002)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LYpFpyl0L2QYFtIVeyI/xGP+bQUMfkO3Tru/CHbMRAqjxWC3/fm80w7HD8govqJXUpyhMxsdlO2rMALVYz+aldiX17U3u7AnAlQ6o+P83T4mVm7/Tjp4usoeUmRzAwvEgnr/Oz97Poz4i0FkSFvVRwcNPKHDlwcMgzEIRndtMYUO9Bjo9rLXsiTWcq2d2DL/Opz55T2X38r6jbQfFwL7HDmmBdwTlspsaJOAZUQmRaDP2wVfb//9KhFPlosgZUROFulPZqJqf/noCihsziRD/rkWkrC1dNcZkCsI6F8u2JwHyYLcogFUuGwy+5RmLr7J0IHehpg8XvU3kxam9QkQ3swNkentc1nKY3iGAySSYNML2vrPdDaHc2T2IxNIhAkD9SHv+8uWXd2vRIOBcaNwNDa/1Kmml1hKjnow1CDiEdvYEJfZLtY/bsopFDNz2G5+iYSa3K2Dwd4KnaQsc94I8ZY8+4+9iueufbnpbUt4StEVdjgWkhcszjLv635BFHN+oIwCGuJB3wrH8FVe4iEsLftzhac9ljX2SSh6S7qOvIh9vTBHmtsyHe+A2eynGNt6IvbjP0quiIqt3vyPSXKaQBgdKkayabCTortNx5x/eCaDLXyrhIccsJqG1Qgi7qeB6Ed8NcY3EXEliALtWxWlqASVL+l8BSIEuW+bf7/Wi97GKaOputW5nl50gBLkv2Th+cXbQ78G3FQkn54gZGJAPyn1mTtJU7tkowAUyBDzSir1H1UmzoF83kwqishzyKFwEffn3ZF+Uqco6vWzpYqXewGv5OjIkABzy7tRfFTdOwO0eH2Xf9mX32rHK69Z5OwNAZEJq+enuVgsFIr3KzRtMA45nin732RjUm7h8wjoOgmlRNIlZv/5qN0qs5GGevrVlbFl1YZX4g2+fz96dsZqO7QfAEIHPpV2xHCrVSElEWm8A5T7FuACMENuiYboH3uF
 SFKrXXklgiWv72cSMDmXq+G9112Gv/Hc9w/BuRoC02IxFHt6p9oI8BVP8Q7CMtP5B4lOubdT+LoWyFlv1A5uRbFTcfF7b41eB9+pkz9+zTvZHQB0dyo7KrxxMjIDxIVde8alIuD48fZ7xYb1RmONuovqhgLYxfAe/8+B5Zx2ts60fyI/xfY+BDLrY6xdclQB1nZ63CJylyOwCNzqEuGaNfYBopybIkvWDXTU8KZNSxkc14LSNhdY8KARCH/u+yUv/41ptw24zMZ/R7YYiVsn7V9WVG90rFmvVxxGcuPnCXcKJeF2T0BpNPnyOPsXnv7ZLcdCoYFkMsyg7bRBH4wX7BtCKn1xCmqwTjsRgRCZ2zrJsPseweHu9yols9smo6JUSRQs/G7/pmUJuGB5eteb/JtBr1ZZ8Ukl7ftJlcHOebGdiv1yrXcq5cHCx/z9buym2FGRabchJjvSlCl6BRrunxT67Pm29ReCN0So1rkMzvnZ9uUXXSouyWm+N0H7z7ktOBBWsFZmHOQwDMCytJnBgBXZFCu46lKp4BNelt12PluaCIcaSUFqmYMGs+ceifhYX8WBZCuG9f6YogdSbJJoARi8+0sFhtq/LqpYyRvLW5cAe0al+y/vAcRBynogCP0huKlA5c4WJ756Prsq5wP+Hw==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad6ec26-5671-4e89-0f6f-08db350639ca
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 12:15:05.9691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQnL84iL1kle1ehDFDawDXxaj1VLO5BqT/BzMdS0vN4eunKsbJQsrbPp5QQQe8y7Sp59h7g2fuwNin0d132EBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1732
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The mcp2221 HID driver exposes a gpiochip device.
While gpioset seemed to work fine, gpioget always returned 1 on all 4
GPIOs of the component (0x01 for input in the field "direction",
according to the documentation).

This patch series addresses this issue by fixing the order of the fields
in the driver's representation of the chip answer, and adding
consistency to the way the callbacks prepare their command and the way
the hid event handler gets these fields.
The set callbacks use a similar mechanism, but work for now because
setting a direction/value only requires gpio-specific positioning in the
command preparation, and not in the raw_event handler.

The core of this issue being a discrepancy in the way the command and
the answer fetch their fields of interest, I would also like to ask if
we should uniformize a bit the way this driver handles gpio, and how.
I thought about several possible implementations for that:
Use mcp->gp_idx as the base offset of the gpio for set too, and modify
the raw_event handler to fetch all relevant data based on that; or set
the buffers in the mcp structure as unions of the various commands
handled and use gp_idx simply as the gpio index to access relevant data
directly from the structured representation everywhere; or go back to ye
old defines to ensure portability...

Louis Morhet (2):
  HID: mcp2221: fix report layout for gpio get
  HID: mcp2221: fix get and get_direction for gpio

 drivers/hid/hid-mcp2221.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.17.1





