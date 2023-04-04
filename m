Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFB1A6D6027
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Apr 2023 14:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbjDDMV3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Apr 2023 08:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234805AbjDDMUp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Apr 2023 08:20:45 -0400
Received: from smtpout140.security-mail.net (smtpout140.security-mail.net [85.31.212.146])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F085A3C16
        for <linux-i2c@vger.kernel.org>; Tue,  4 Apr 2023 05:20:18 -0700 (PDT)
Received: from localhost (fx601.security-mail.net [127.0.0.1])
        by fx601.security-mail.net (Postfix) with ESMTP id 152E4349718
        for <linux-i2c@vger.kernel.org>; Tue,  4 Apr 2023 14:15:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1680610519;
        bh=v9/UOFWoty46gGGGAMkEg/e9h2ANrGw1UpD6m+GOj7Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=V+JzMGZtLVaXkEBD/vMt6TmtBW1qEf/R+K/A9Eapscbu9ag2HCRJQ02K6MzPq/bCT
         naqqrtIuH1FYvky5MNtNrQYSCUvIua4vUX5xhsTouDJmrz5x3R2iq/RvGOm+/LIvK2
         cnIKoEYje1NCBo7wsoRJAKYSyv0lb6rs/MZFFkos=
Received: from fx601 (fx601.security-mail.net [127.0.0.1]) by
 fx601.security-mail.net (Postfix) with ESMTP id DBA2B3496D3; Tue,  4 Apr
 2023 14:15:18 +0200 (CEST)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0107.outbound.protection.outlook.com [104.47.25.107]) by
 fx601.security-mail.net (Postfix) with ESMTPS id 278F73495CD; Tue,  4 Apr
 2023 14:15:18 +0200 (CEST)
Received: from MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::18)
 by MR1P264MB1732.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.34; Tue, 4 Apr
 2023 12:15:17 +0000
Received: from MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ce25:a152:1cab:d832]) by MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ce25:a152:1cab:d832%3]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 12:15:17 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <c55.642c14d6.2683e.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1xHbApkTxZPTUPMKv8vMbvi9TgmABArgaHcxR4v2yPHXuQ9VE8AytbXVdL3mlGagImKb1rdN+rmaev481ngDw2MqIM94TqhtGmNez42AmQrd37ikGvC7ZjOv3C6unD7/iZ1o7fDztDqc6aWKzJUeaD3O5esTZMvElRzJ1hgVOIxJ4xVh8PNNGlBICTdBdV9WFBFq6sN20uEW31/+r4jRD96Fkt1wLSqHEdxlHgYca9GjF2DPSZEkMB0wx+5E5OdDCoHPlqX9/YG04dIgYR8jK3mx8svIvIgWU4/uEgX5W4MHtBhtLTHXlTjlXwC74r+eDQKVixHqZTibT/fcMN9sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCd4w0Z/CWR9onMkp7KpZ1rZUZEJb4Wkn6H7drjQ1Hg=;
 b=h+dHEp21KU6Gy81OUD/+Wi41dUszZTsipByeOOS6NxJbsuwrgcRpFu95lOaY+sfey1SE2iNm2IoCFuiDxbULNIdpdwk2PdsbcJbCncWtts3kLWgvvaUCGAeNnCJO3reiRturWCdtsmKoGW94+2kZexb2svkH4Qu8Aab9qu27rRmtNi+j8nuMMxFG+theiRcaWghJ/iP3XZg3Zm2UsrHiPvTlYr05PcLQJkXVMBxU5shZMO1P3ISmqNyDPbwIsxMvnvx/097Mr/p8qbpngoewp+lY6c2uz0MVWaL9h43ln7EJCFaSz8dvn5WU5ppWiMRq9iBtaPudg8grnZ08Rac7qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCd4w0Z/CWR9onMkp7KpZ1rZUZEJb4Wkn6H7drjQ1Hg=;
 b=c9+i09qIKYPeXvoEjfvPl7LQA4dpsBz+WdWzBRtOjKWVss4lwJl+v8yz2uNzrrjqybtnnq2xPR86DyO5onondA32uLtzCr7GINGKJgyTxAqPjgRkAmRY+Cr37c8jYhw7IuodE1Q/b2oDI+jOUxjuGrsRYSed32SZD4r5n/rO7CwiXyVVHfPV+KLJRsgzFZzuDczXGPxnfiShsA9LVlXSRnlp2nC7PfXw+ph3Lx2F0hpZ8KQ9TSJMXL/7fKrmXCki6DfG6Ej2SRPSqfd1V+zAfkccDvTmgPtAlfj3NxD4kO2rTzn4TRJ/zPphSDyoYm9BwbbecN/DbBUDpdHZGozyNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Date:   Tue, 4 Apr 2023 14:15:14 +0200
From:   Louis Morhet <lmorhet@kalrayinc.com>
To:     gupt21@gmail.com, jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] HID: mcp2221: fix report layout for gpio get
Message-ID: <945967fbab56d53f9630ad3844b64734f8c3107e.1680602387.git.lmorhet@kalrayinc.com>
References: <cover.1680602387.git.lmorhet@kalrayinc.com>
Content-Disposition: inline
In-Reply-To: <cover.1680602387.git.lmorhet@kalrayinc.com>
X-ClientProxiedBy: LNXP123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::26) To MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:15::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1555:EE_|MR1P264MB1732:EE_
X-MS-Office365-Filtering-Correlation-Id: c1f51f09-8e7b-45d7-b9d5-08db35064083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 18VtDEGqReRy9XjRzYAONODXS+LHRWVOHud8cTsmVXwVL1xaQXCiRonyScEqymUGeD/rR5iJARxHsEoaQI/gDbYK7c3PBJ9acf3sQrw5UaFi/sz2W6pHyiL6z9n2e+clXfl5J1yB3cAAWKOwhz4t/Jg6ZGHqdLIIs/vXaSdumnxDrc6yVeIekWRXrqOWKiKVfTc0wqxnehSf6Vhr6DfTEFYfwCUbtJuxub9xUqghBYNJDH/1/QM4xMwKAVmGWd+65q5dXcYYLfCYZTxsvsSU6RujYhhrOuxUEVRHUIfNQQWQEwDt4uQq1se6lZ0RIT2dkRlPJj6izGhL/LvmAfIBYZdptEhbD257B37hktdh9LTcL91NazvBemqk8LRqvPajWRy/QOH6LL+SzMbTScFTBOFB/DB1a4dCHT5tXn3pEpiy5aoEyMA/u0sj4L+abkF5FqwnyCzzYRRkE29crEKs78HvQeRgUAI+WB0nb71jw6zK2Mwh3NzQh5PMKY4bhSQeqqmY1KADJNTeZ98OUJvIihrvcP9/eOovBBGoSjdxozCI34qS1xq1+q98Z0C5m2aA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(136003)(39850400004)(451199021)(2906002)(478600001)(2616005)(86362001)(6506007)(6666004)(26005)(6512007)(186003)(38100700002)(83380400001)(6486002)(36756003)(66556008)(5660300002)(41300700001)(66946007)(8936002)(4744005)(66476007)(4326008)(316002)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rKZ4hsqZns9gTw0omI2aji6EypZupblZSDXlfjXjn7I2RXK+BM+2efxXxV+gbw8mQZ6iuLroZyEc2dHnv94iL6vQIh3HeJ4HYBZ8BqTkjsSMbvv8ILpdXQcsjippl/cWbjydVUfFMnktsPXdlpI0FTrJXzXxr6tEeNvcWWllk1vTCubecm5FJiPgD0XE1ysYOv+Ubb+wGPAxldlNUWUThCI/o6Wyfli+IpaSVFkfxs85/yQF2u0XVgHyn6EHsNjL8QciQFsocuR9yJiwv/fxtJBzepUOK57/RLNKZyMsK5rGxKpKWa7hqDj5SjkQ03UP5C21iLxLgWTzVz4Gjojj78E0zr0yMECwkILs2Gmc3eSIrfL/7/PlkDhg7YoDursN42ASAxmdEFhqkjroEho+6Mcq1nvINPbFX8ZQIXsZqOo05Ig9hAIs+Fs/bNv2zBeCX1XonfeNZDuz9duCgyL/lRLepC0hjY/bHx+EYjczPsUQBrTE7w8Lr9/iU19d4ZywWl/2yliqFp/WY3J4agO9/9X4pZKr13TajP8Q2lZRwKVZ4ksdsbENaXd5NxvUP8APH6Go5OnXZuihMQxHokBaO8RobicTtM61UcopIRf+USb42mc2AteUApjgeocx6zWMIr/3GNqjwWUXDnoUa/G8LiLnqrgbsSAW2+RayPxrUB0nmZJ4d4qydZ9T/rgLNU+YT+Mv5tMlrM53ud2qGkS83pDLKGzDJJdYschffmaoGPTjlKamZjZO1uZ2FvFycsdS9kgSUNXki6qtOuPtZ9BFLk30pqCR1zrB9hv0Xx58wVQa4zqZ4XFnQ1MgUqfHK2snG4Lnq/0LdyxKdAts9qm2/42lxm65ZL02L+OsFWdr/rbXoRrHimg7Y1iAezMbCBQnO90MFa0i5qwcclkdsOhCxnfOGnV0dhjttFsSH2Swu9fcVfHp5IPiKVNoCb8XoQN7
 Bb/KcvhfB0uWwwNWvQEUeNFiSkn2F9/GxwIHRv38mweChBfmEpL2dbJVJVJXQ9a8cwtJqvreikAeHBoDXLe/8k7CQp2ORdZJUec4m8ci3jcngbBdmQEdkOqCrdqpxgaC5IjmSOJ1ERWHPQgl6xH+lvDIQvbYiqBrq+x0Lcj2pJkONh06r6ghMTWAVByQKbPFetrfQ2T2M6I1Of+RNaACaK9MbN7jXgELXg1n2bERoph3G3WsKncWrvia7Wfy/sDiWpekIeev4feMHBlCvxUZn1cR3qWlEaTRWZCVh7pdh7bGrxItHROn4ucSeDrC5Kf1Uza8bg97mAkoK+NKVz7b6gSikD+C6MEWRhwFx96lrjKuCpKbOj+qjAhtAYGbbMVE2RSfGC4EUc4jzF1aaBAWik7yo3490jIxStjk/gJRTbQFAhr561B0Dx1OpNa4oC9t+Es1mlmplEBazqHJp5FiTGi9iM6RtinxkO/PMpdzFyfv349QdQtAWa47KWQL4LRoL5HxLHD0k09f4rffFpAjDYyyHYL1PvnqwTMz7By3dSTJVXua6K4EEMUhW3ybbSVTADZ91fjbnEz86TjTno183keJ1ZdMTexyCzvHr3hUE4IR7KCAcDmLyQiTvfOEUG6VmPBMxzmupGj/Zizns+N5vg==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f51f09-8e7b-45d7-b9d5-08db35064083
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1555.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 12:15:17.2367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwScBCyHEWba9iUnn2DZHzdqQ1Ou8EV3qfPzDFsEYxNIlRkj5zqJUJLifMaCMJ2gZ/j7JFp5Rl65ooBY6PwXQg==
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

The documentation of the component (section 3.1.12 GET GPIO VALUES)
describes the hid report structure with two fields per gpio:
its value, followed by its direction.

However, the driver describes it with a wrong order:
direction followed by value.

Fix the structure representing the report answered by the chip to the
GET GPIO VALUES command.

Fixes commit 567b8e9fed8a ("HID: mcp2221: Fix GPIO output handling")

Signed-off-by: Louis Morhet <lmorhet@kalrayinc.com>
---
 drivers/hid/hid-mcp2221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index f74a977cf8f8..fa20ed4d395a 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -79,8 +79,8 @@ struct mcp_get_gpio {
 	u8 cmd;
 	u8 dummy;
 	struct {
-		u8 direction;
 		u8 value;
+		u8 direction;
 	} gpio[MCP_NGPIO];
 } __packed;
 
-- 
2.17.1





