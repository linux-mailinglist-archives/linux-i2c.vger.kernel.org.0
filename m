Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD3146D6023
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Apr 2023 14:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234159AbjDDMVA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Apr 2023 08:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234793AbjDDMUo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Apr 2023 08:20:44 -0400
X-Greylist: delayed 305 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 04 Apr 2023 05:20:16 PDT
Received: from smtpout140.security-mail.net (smtpout140.security-mail.net [85.31.212.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FB5A30C8
        for <linux-i2c@vger.kernel.org>; Tue,  4 Apr 2023 05:20:16 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx403.security-mail.net (Postfix) with ESMTP id 73AFA32170D
        for <linux-i2c@vger.kernel.org>; Tue,  4 Apr 2023 14:15:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1680610529;
        bh=gauixd1iuOtVK70h8yUdgdOb2bdhudVJjAc3iGY3Q/c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=Pbc60nkg6k3uOEgG0YESj6kz2y8gry1SWAZuUQDaul8HTIpTtH+vlj2f0f24LQA5x
         g5IECrex3rNjeDMeIVpXo9nPlbOhNAGLj7/ru7p+HLeH81lohhkqScC7E+FUWzxQEY
         VqVoneEcsKemWBrIztukm9aW54/daHk9KXiavOWc=
Received: from fx403 (localhost [127.0.0.1]) by fx403.security-mail.net
 (Postfix) with ESMTP id 43CCD320FEC; Tue,  4 Apr 2023 14:15:29 +0200 (CEST)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01lp0106.outbound.protection.outlook.com [104.47.25.106]) by
 fx403.security-mail.net (Postfix) with ESMTPS id 6FE38320EF0; Tue,  4 Apr
 2023 14:15:28 +0200 (CEST)
Received: from MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::18)
 by MR1P264MB1732.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.34; Tue, 4 Apr
 2023 12:15:27 +0000
Received: from MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ce25:a152:1cab:d832]) by MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ce25:a152:1cab:d832%3]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 12:15:27 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <1af7.642c14e0.6f31b.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzoS2w4QblvPH2srM3A0z8PbmWUbOPkCmczyvxSePMNU5a2CilNi6qbRn+kNh0Bj1qPSpEashQ8zHP7fH6f5GCDMsw0DdvxxK5i+vMsKXQIt/V9uuX63/5gGOiMiwkpVKT7tl9oHzs5OM46Pnf02KHhZe731Z2+T4rKvXYtQRWBvsR320OdTMg3uSnT416Sct4zme1RAsoK8FACDdW9TY0D2YsIePFs6iz9Asw25uNgKyEcSW137jSYzxihdL0lDTTbGq7OHaQUWD5VKeWSI0nHn9IXh9vhFRPrcRhr8RbRksRwO3+MFvOOcP+5iWO31nw9m224khwV4gtXfbr8frQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJAjxoGAai39r5axt5mcuGSUGCRLwYlh92gzRy3EPvY=;
 b=mwOyAOlxqXxMDzoIGHMPFgn8l9cCgSWZU4ILJvuKGwoo1prmDhYg85j/6apI8c75cHW1UJdYgRuLBSfZ3LRsSlm9oPaSm+DP0cWdh4E6Xz7c2yEGDHwMcT+9zDysJXTCiU9NMUBpSf1ONFKvx+oLLarkoAFzLxG0HZ6ZRMi8yFI59dKne0xFY5wDevZLaPCF/taXKXBXue9nph82bKyF3OdiI+TcwldycfUWSDcm87kJIJrmJ+ycX8QeubEJ1JxqgZ7cL9UllLVtQJsxTWqdYwPmHClfrKj723ByBjrs1wrilsqPt9nE7q5muBajZf2SRBcHcqyWvTouSAU9cIJCHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJAjxoGAai39r5axt5mcuGSUGCRLwYlh92gzRy3EPvY=;
 b=KDLbSh+Wah1GB5lZNb4l38KIjqZE8FC5u6jhoxp80QQgx9ak5WTRuhhHgLLSC9WKgTAdUkoJ4TJ2IQJ+aK0viNZ9UZ/NHFfRjBI5H7teSZIWZsJJIZRERQsW5gIBM2e3gwPgVwj0cg+vBmQkYvMnkBaghbTa4jL/cxEaB6AxD7+mbnPDHlnDBLpiMONxWZRmdveJBMQRFvvTuOziaDouyQ2cMKVoy1HCYmYBo//FaSS2QnO+/3e8cjOmCs5IlMAnvg7uvqqgaTBVRRXblxN+6IbWY8Du3PfAjJRbkLO3SVIUslky0vacQqSoga+xsYKdDxOwURs62dDZPP2zUWF4YQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Date:   Tue, 4 Apr 2023 14:15:25 +0200
From:   Louis Morhet <lmorhet@kalrayinc.com>
To:     gupt21@gmail.com, jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] HID: mcp2221: fix get and get_direction for gpio
Message-ID: <dd0b23800a79d2a464e1e9ed429b018b69fd5df2.1680602387.git.lmorhet@kalrayinc.com>
References: <cover.1680602387.git.lmorhet@kalrayinc.com>
Content-Disposition: inline
In-Reply-To: <cover.1680602387.git.lmorhet@kalrayinc.com>
X-ClientProxiedBy: LO6P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::14) To MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:15::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1555:EE_|MR1P264MB1732:EE_
X-MS-Office365-Filtering-Correlation-Id: 14fbad16-0aa2-4cbf-262c-08db350646b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6JO6R6MG+rkG8XWUj3Rv/wBFQqju9v2/uyomQfjKsBXvGvKU2UwNS+v3bzHNZGb4Jc+kL4IBXD0xjGK57RxKHwa8IX/j7eqEMscTCKeq5mv0HpEK59DriCaFO+EGp7anu153X90/1z0NwSV0pnCJbjoVG3n3xBOjuyrFhbsZkMrvl7K/eEkV2JbyXcRpK6x2U5BBfiggZZA4PQLaDf7egh9HGx6XT8e98bbyNX/exOlr0A4zX0ryV0kIP+uE1pLclWOrj5W+6xE3z4ihRl37hc24Hz16MbjaXAvEjlSSHZ5STfA8qRw/hg/mtUtogXPQ+H0wZ5Ynk7oNl9LfD4W6Ui4Nd4PYNdQQ+VYUsaaK2cg45mtCNSYVAzBL+3R6bajTLgZFbi5ie1MEHMnv5AViDKshRAVg07bTrJT9aL97/v2cYtkIDGx+dGi08VKA1c0lC6eIfvFO3zVShtraIy+I46UptkgWjK11nsQHqMmTa+w4rF/hrGMD7bM2hC1T6PXXLgEEzfx/21kmrkGMxEiw/02ZR0n+Lq+myGeDEfFyiXjGw+xMAss634Of8Th1XOef
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(136003)(39850400004)(451199021)(2906002)(478600001)(2616005)(86362001)(6506007)(26005)(6512007)(186003)(38100700002)(83380400001)(6486002)(36756003)(66556008)(5660300002)(41300700001)(66946007)(8936002)(66476007)(4326008)(316002)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iTX/cypZx3ScxdBEzPlnGnjNOuok8VUQHZhmqQtrBizocZ2GssmF3utWxbAGu414Vc4cUolvYQIDrKUmRZIfJWsdQE92gw2ZekwImwjlHMd5geXyPsec4oqhsLujvxFEJktAbY4XBEe7iOiG9hPUv0f6YgjXbuMRVVhLCrJLfZ5NilqZ6dXTlS/Qh4+0gDERVe02K4DGxRtp+g3CWPSqSIwpzeaEvtiSFcxvtJ+NX3wPGWzgfO+uzfOsgFXnZ11LOIsjs6VD0kSolO/0S0VcVeZpzVwLTnv6B/erwkkgYRxg5HNE1C0wyHPXPiXsXYMZOCpBzATjNt0nxFPUbUHds3z4NpFZjovJYAWUwSnfyimsq0nQ+ZPT43x9DgAiqFobuluyfqKHXYfrjJpOqk8SEbKO6/gE0zVBTh2P3kmwNwyo3KKzk9HZLBFQseK9PnpQOUssJF1cCY//EHlrifj5QMLNCwEVqxsI6k0pOTFwDm4sL5DSmw/+qd8U4tEH9pcxhrHe24jYyYHSQhMCNgkRhfJJmLibYHxjmrnOt9B2EUtuAWdXP34jVQA9HZcy9OXVd2aU4uNxVGIlc1VLebW76EyN6O5xqMRewa29tBpxRdRfw/PTHShOXeqAu999mi2rhIXgAk3tN7x8LEdElgwLMI1tS6FLk0Hxll+TVNUivGU944ynnnYJJtxJhIksZVHz97zkUG88UI1idp2zle0xK7idEt2DKlEnDigNApz181wqsU4vj9xFKU0BCqjxNg3KXR82+czJ7qeAekCisLHl0KPW8XHHM9ss79S1B4TBu94MxXjThIoCNBxkHCsj4CGN088KH7GDfUGBSBmgwAz7t/fKlGRBqTXwN2gjdGkB9ZXv8v1PKHREzFfzStvsoVojIr1WudGdR1Ne9lptCKM7TC4MIr1F8swgmfC26NLRpV6TYU4FXQpZOOd9c7oV+YqV
 42NnjsLq9MeZ52U9PZVG80/DOZEYgwbVdeg6cnMEwRHwV/mRtu73y0702gqZN/NwgHmhm17fBnu7dmcl4KTuHOZoBojxNZGsiWbaTO6RqyD4SNajEMU2MkZETEk6R3Tu/2Y0F8r+n1CtY0W9gZTgz7a/RcO/HUgC3qOBbXdNdbONYhIp6o1w726VMz6Xk9OADhuChI8rim0mHfsupkJWQUQRMzZsAD+82XCDVqGBp1es4rZuTGd5vF2m+T8WaO53FK9iBv2arihIy87VJW79pR5m+yoTmI0zJ7a/z4Z9rM5q/NLqls57rwO6a6Ix/0Kc9ZNNV038qdKhtu6kofHUtfz4F/uUu2tKvEg/pbVWRw86onjAqt613k/4FNp+UMwrLy1jktkswmUZnQ5u6Vum/Pkv2NdNtfcRSvYQ+kzJ6pZ6wGPvrAgL1s/QbspZ05uIljjRQwSTMqKgVogj5XaoHHWQkko+9CGeNFjJrR0DoTFY6/dHV13iF+/dWlKXDQOcmEipfExqJh7tXRaf6/494XI3DA/7rDHUfGXLcJP7HXiq/OQJcCxrrz407Fo9aS+Q0J3I2fdAjCfoeAR+Ob31HE/VPc8k0w/eVINYR/hWO/RtKDfEVduQXgoQfk3wqq/6/ytclr1Il8Hzsytenl4Oxg==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fbad16-0aa2-4cbf-262c-08db350646b8
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 12:15:27.6218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q91uFvRvdKxBtrp4RBAv4opfyPl1M5pOXCOiBpYFpS6aWfSHAeP1LOQxQsB2uU9Hbglag2q19OiEGebh44MFwQ==
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

The mcp2221_raw_event retrieves the value and direction of gpio on the
same command, by setting the value on mcp->status and the direction on
mcp->gpio_dir; and the offset at which they are read is based on
mcp->gp_idx, set by the gpiochip callbacks.

However, the individual gpiochip calls set the index to look for
directly on the field they want to track. This create a "double offset"
in the final read in the response report.

Align the behaviour of mcp2221_raw_event and
mcp_gpio_get/mcp_gpio_get_direction by putting gp_idx on those calls to
the base offset of the gpio status struct.

Signed-off-by: Louis Morhet <lmorhet@kalrayinc.com>
---
 drivers/hid/hid-mcp2221.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index fa20ed4d395a..72883e0ce757 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -594,7 +594,7 @@ static int mcp_gpio_get(struct gpio_chip *gc,
 
 	mcp->txbuf[0] = MCP2221_GPIO_GET;
 
-	mcp->gp_idx = offsetof(struct mcp_get_gpio, gpio[offset].value);
+	mcp->gp_idx = offsetof(struct mcp_get_gpio, gpio[offset]);
 
 	mutex_lock(&mcp->lock);
 	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
@@ -675,7 +675,7 @@ static int mcp_gpio_get_direction(struct gpio_chip *gc,
 
 	mcp->txbuf[0] = MCP2221_GPIO_GET;
 
-	mcp->gp_idx = offsetof(struct mcp_get_gpio, gpio[offset].direction);
+	mcp->gp_idx = offsetof(struct mcp_get_gpio, gpio[offset]);
 
 	mutex_lock(&mcp->lock);
 	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
-- 
2.17.1





