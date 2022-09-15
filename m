Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8D55B9366
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Sep 2022 05:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbiIODzI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Sep 2022 23:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiIODzF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Sep 2022 23:55:05 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2139.outbound.protection.outlook.com [40.107.244.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B03561FCC3;
        Wed, 14 Sep 2022 20:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWe1taXkaFWTZZOBUKIew+bncz1kQrKqL7tz4V4iDqz/IUOP0nNBlo2Hif15k6leBUKa65Ufcn2xxmH8M6/pn55nNWKSdfTX5QyW6oIIeSdS20JU3u5FzA40hgDkIckMpdHj2PP9yvSxdKXZQJZFZYAilc1tWpVvJFMIca4TX1TdhLimq73WJAMbsFrwPSIe5cw3ysXNpSdbZ8WIN4XzgZEJh9j3heSV+wZkiTA3sLbIZQ0vY0djqgDIWrqISHEwCi1JXxsZbBbgodgx7rW1BhmiE1uDdOUnSog1RiJ7wGcmwBgwHQlVkYFYJuEtzuTXifOuC6ahWkULkn0n+R60kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ta21anwT4ysG1gPKKJskzXOOFKKj5bTxyb99fh0IzNw=;
 b=bauoreQcUvOWVJLGq4RKlE+1vqNaks9+RphwTeYaqw+nA4fINNnJh9rFQOl3B1oGtWP41w5Wt6N+kqJA2Ngf93zACye7nedOoVsA5JfToAfQpDJXMkUaUc9ssZ0CM9MNC+J9ajU34mE3Zjrw1m6VjJvxcTzVEpK8Ojm7WLLgsW4EvoJH6ifSTC8W1/NdczDok4rDv+5fNif6aQbHcwygcpcFBoYj2YPV64L35ye0XBaf9UkKRUnixrUaPsFHAKH8ZJEBSxTYvxij4/yfWlUyGRlxSkzTag7bx1FlLBRLfqoXNQjIQGf+13aTVawvnDJuA5JiZhj52QlKkktOH9lD2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ta21anwT4ysG1gPKKJskzXOOFKKj5bTxyb99fh0IzNw=;
 b=bLt4MbUr7bxNSFqxqoPpEdHcYfA1qHFeL58+pNQ0pkRkjIg3RruCJcOioEQQS3vvvkZs4D2VhTIgEtbPRavWCjcHf+6VBG+GuztBX4bK0gKNtNkrmwPgukf1T2/2NvhmdFpmSjjOY2gZ4FTKXuX15p7od0RSrvovV1VRlH87ysM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MN0PR01MB7659.prod.exchangelabs.com (2603:10b6:208:37a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.22; Thu, 15 Sep 2022 03:54:58 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::48f7:ac49:a2f8:614e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::48f7:ac49:a2f8:614e%5]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 03:54:57 +0000
From:   Quan Nguyen <quan@os.amperecomputing.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>
Cc:     quan@os.amperecomputing.com,
        Phong Vo <phong@os.amperecomputing.com>,
        Thang Nguyen <thang@os.amperecomputing.com>
Subject: [PATCH] docs: i2c: slave-interface: return errno when handle I2C_SLAVE_WRITE_REQUESTED
Date:   Thu, 15 Sep 2022 10:54:40 +0700
Message-Id: <20220915035440.2862532-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|MN0PR01MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7a5dee-d77c-48ef-4071-08da96ce0e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+scuXP6P2VMB2Fhhu3n89YST0yLxG+FJlKJ1mYQyUn3n35ICA2eHKONVC8GaXiUqLlt/atkDRDVM10lTX93Yd0IZKFzYHKiP7BHQiGMENjRt/02EqQZRX3l1JcS2KsTF/EJdMhhlf9rb4Fga6fBsuu+sKlPutLBFL0GIE0azFuNHofTlT0cXOet0/CIt+k/UqzmQb7DiI6Tf5PbscXEVYXrMDljqkJ5a7SgZv09T4tEpmKWQ50LGfksRqyNUN3vCu3bdLiB1A+tAT9+iYaClgwQ6F6wkMtU7UjD8SU8nwemuX+tdEFzJfjkl6pbf7lXAxwQhrRJP0hl/3hPzZ3c1ZFQIzGR+aufMtz6cpK6OHg7u2A0yQnwKJ2UTRyAmlcB8FK1uszw1Z3jAWs4dhplw/N3Cl7OjArT01h6mX6FIUeh1XcqqRu/Mq5tfOZ84ZINyvh7GSxCTWyLFvMi3Jc5UFcFJW5AoeWFSIieXegYnjxpZsEPvnQ16ZQZDiFAx2h8J3XEJV/NZ+71HY+SWLxvcFoInmGtjHSiGtNvgQddefR6mGp0ls/0TxUGg7D1VEc+1mFaGQoOm3Bko6tov1bXuqwWyk5qozA4l4zDE4iTk9tcHK8ZX8DPmu0i7ukRDZnqB3TqfJNkw6pH9MykRJrKoY8KBaJj51K9wHShRqfRTcgvRavf80RBtLRiQ0gs/jRdw45Y3j4dShlLuLho2gf8aMG129iEOyvWPrTaGzdsIbzMjdQJ4Swzk5EL12IaBSy3g0taZ+eg3cuR2/wfRyKA5LMxW1Eu2tIi0TV1bJo1Fq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39850400004)(366004)(451199015)(41300700001)(4326008)(6506007)(6512007)(8676002)(6666004)(54906003)(52116002)(6486002)(83380400001)(478600001)(26005)(66476007)(110136005)(38350700002)(316002)(2906002)(66946007)(38100700002)(107886003)(2616005)(8936002)(5660300002)(66556008)(186003)(1076003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LcEi+/JfA86hMnpaTf2H0AgvGlTTWny3THSKcIPZCd5j9o1bUcsIWpiEVVra?=
 =?us-ascii?Q?sbpaNkQsOJ3cK++u+/jxqdh2yaedGqKRdvrdjIRKixTDjK2UEJbXyP9BZihF?=
 =?us-ascii?Q?2rkixplDxQlgiTyJWvSG6NY/NX7yoBSGOJazSGb7w5eAjpspWJx3ks/u4GxI?=
 =?us-ascii?Q?xq/DHzAKhFzPc7f3KZPGDNq1+JBQP8BrvSsT84H6I62ckQLVRh2uT03Gtk2Z?=
 =?us-ascii?Q?XSLXnbw1PfHvUJQ5HmQC06MWuHADt0Js25gq2VyKeBkz8FfPrpyG/AJQjDGI?=
 =?us-ascii?Q?m9p4WcxB6VlzO9ENYBDXT8mgFLYxbmtid/KyEE3cHCydEnTNNpbZcBj+EsnF?=
 =?us-ascii?Q?aVIJ5IiKIjQP6gVpFtkny06GbN3AQBBnhcCslqbBWvOA1yXQE9fUZZl3HzzX?=
 =?us-ascii?Q?pPSA8NszgWY+xm9qltGXjvX4vc6hmAUgGniC5YYYG0QTAo045rXTH4itw1/q?=
 =?us-ascii?Q?GXY1BybIHlGpbZ0PfgoEsifJGs5j9JLkfK9Xf4LiOR7Nvoh7iHIsPso5csGn?=
 =?us-ascii?Q?sfjqbc3XQfzHw1Ycs3ILQIuSUrWcGq5HJdiQTN3Djp4nH62TpsALneGN/K7J?=
 =?us-ascii?Q?0FzSHi+EEAkBqUkqvxO7eyIMyciC3un8neG13IbRL7CdU0z45wg8duNHEEHI?=
 =?us-ascii?Q?vwWPodo8Tp1+HL9E2em71kgKb4tKbxDHDJ9qOL/+7R7RPcAMSmhD1VhesnGC?=
 =?us-ascii?Q?fqe76ZBawyUnlk3FgHnZQaBsXOvKFI94ELenldc1K4rxKmin8jLIzrQ9g+rZ?=
 =?us-ascii?Q?6OOrt/HqpvsdnFmULzv0E7ROeG1pUKEZk+rOl6kLPJAUgp6VaxfU0JwLufvQ?=
 =?us-ascii?Q?Z6fJR9vWuTuXqj7K2JxYwEW8NJJQaVAJx11PhVjMnoXdUqdKlqN9f3epGbbP?=
 =?us-ascii?Q?E4yEPJ73UiSo9Lc07x0QQozWyCSzAPYb8cYI4bIUuEw3WXKVpJZJzm+kNl3S?=
 =?us-ascii?Q?2ZNrM5AWdkHqvfwRK8mYNXSIL+nFWohvkCKGgyKsPfW9mtQoErig5ZrXwekj?=
 =?us-ascii?Q?jtfk9A6NJbsdFKkYL8EA1ePiNymf7+cfxY4LVITGB83dcQo9a1ycwnDUMhzT?=
 =?us-ascii?Q?S504WCRxg4IuqggAOhScZ7h+/h6WACDbHwEyjhK1us4r7ZCIWxQZqkiSKhAa?=
 =?us-ascii?Q?bEvF0IyphA5ZQ6VNgOL+cu8rN7Oz7BJCPBbUsDqtJvW5ECuaiejc+kEUv4Wf?=
 =?us-ascii?Q?eDUGUGADiEcM5OAaIoZl4VJZLeZ/uM/myIQ1/+dTFjc78uekNr6ldDhn+nnN?=
 =?us-ascii?Q?Zh6vBglAD5mxKZr2+t8qtsDfm7oGC/bNq5+cHBgsIFZCV8H4yWivjbJ0/UZS?=
 =?us-ascii?Q?bw8S4HZmQW6PVvgfZz5XOy75zj1iSu8zaSTUVbBO6LhQuAY9poYG3jL9GKlN?=
 =?us-ascii?Q?lolYi03N1qPCS7KdBl3fWF4T/H8B4jWwZgUx0v+Dj8pVgn/kDAFLG1FjKKzS?=
 =?us-ascii?Q?kmLA45ZXqATOzVoLmCqPs6tVhUWQNlYpVmZ2FNS8HNC4pizpY38XhlbujGDN?=
 =?us-ascii?Q?x9jow1EmIJqSX0/koGaO26iSgRZtXwHDbSoWdCxNGNtQ9hi6Z0y+DMv/TlLO?=
 =?us-ascii?Q?88iB9Lew3NA7l+qoF79sLFVgCiT254TNoTikkdzt5F3v+ebYu/q0XdLgscfG?=
 =?us-ascii?Q?3VsbaqHoeKz+52QesBJxRt8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7a5dee-d77c-48ef-4071-08da96ce0e65
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 03:54:57.8885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXODtYV4G81oLXCiaftw3huX3lgDSHCERp3TDy22JCPBluR+SUz+5sCSJ96McEO+1O93ths7h7NWPN7Bn0et0tdVjM/Eq8fK5hR3J37C0Fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR01MB7659
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In case backend is not ready, ie: fail to wakeup or initialization, on
the returning of the I2C_SLAVE_WRITE_REQUESTED event, bus driver should
aware the backend status and might auto sending NACK on the next
incoming bytes for I2C master to retry.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Links:https://lore.kernel.org/linux-arm-kernel/556fa9e1-c54b-8370-4de7-c2d3ec7d6906@os.amperecomputing.com/
---
 Documentation/i2c/slave-interface.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/i2c/slave-interface.rst b/Documentation/i2c/slave-interface.rst
index 82ea3e1d6fe4..03b15b21d392 100644
--- a/Documentation/i2c/slave-interface.rst
+++ b/Documentation/i2c/slave-interface.rst
@@ -72,12 +72,15 @@ Event types:
 
   'val': unused
 
-  'ret': always 0
+  'ret': 0 if backend ready, otherwise, returns some errno
 
 Another I2C master wants to write data to us. This event should be sent once
 our own address and the write bit was detected. The data did not arrive yet, so
-there is nothing to process or return. Wakeup or initialization probably needs
-to be done, though.
+there is nothing to process or return. After returning, the bus driver should
+always ack on this address phase. If 'ret' is zero, backend initialization or
+wakeup is done and ready. If 'ret' is an errno, bus driver should aware the
+backend status and might need to nack all next incoming bytes for I2C master to
+retry.
 
 * I2C_SLAVE_READ_REQUESTED (mandatory)
 
-- 
2.35.1

