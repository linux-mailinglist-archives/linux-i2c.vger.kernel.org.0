Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1320762F40
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 10:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbjGZII6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 04:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233265AbjGZIIO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 04:08:14 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2094.outbound.protection.outlook.com [40.107.92.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1BAE77;
        Wed, 26 Jul 2023 01:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNAsgrxmf9t60Nv5LiHx4lqlpFWjdZ2DbqNCtGGLWPvddfcujveoicqNlGOPzHVboc8kBSdVSgtjmzPVqOOehkDo/OrO24BbCh34TFe5D/x7AFX4ctWbysjeAhAPl5m4u2OFyR3HhZxfivPw3IoJJVmTC5j7RUyWZADIq2Ewnl6YSUgrfK/iKQfnYWosdkbYpTQ5vZ670lq2nKICyO/Ld9b+Kss/HsoehnlXngudKSjwanRt7LvszTXx+gqV/ut/BBVAPFfMzNnPuTFXK5Ir/m2NjDgE7zpGBt3686xOgXAeu99a9F524lSaGFcJ/FSgrU48iSxGqwNB89f/FJIr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8FNCZh7LhGVk9AWk3yAQnoE8eAoxth3kSbybEyXp0E=;
 b=I8oMjOYZY7AWwygrlIc2CWPr758B4vk7vdb/ku91VmzYdVwVJgJZqveT/rqcHd69OxtFgQSCukewv+lxarN+9VUMfhLS5iB3zXOv7yM2bkhwxw4GooleNTnH7FShFlncJo167/VaVeFniwqPMv95HNsGtc6AMyuwyREgbo1ptPnKL2PlqEtYWvpaScWmR1JiTKnuudJ9OTmcOixkPjPJ23QbInywvHnxhfcGxb2oBHIfolLvtRRjQ+jlCTp9lufNOfA+o4OJGJtpEl+dvSvjbMXvX5Gq0+2Aa5IxpkfSgGtClw66+2Rtqwpc7vI09TPZp480JkFKdIlnpo+wIzi/XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8FNCZh7LhGVk9AWk3yAQnoE8eAoxth3kSbybEyXp0E=;
 b=oD8f5Q++3Qxpxhp3814ks9noNsTk8vBbwOCKeFNMBapRpRXW914sxNuII4OzrUe3Vgi0Wl/K0ovttd/rYXoi0xAIIjLu0FbzKXpXFt3foeryl96ycatC09diqFo63nBFKIgz1HNT1oB/kq/4ugPu4fNCyPPJ6euBpHGtEwFNWwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SA1PR01MB8131.prod.exchangelabs.com (2603:10b6:806:325::8) by
 SA3PR01MB7988.prod.exchangelabs.com (2603:10b6:806:304::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.25; Wed, 26 Jul 2023 08:00:27 +0000
Received: from SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::ad0:68f6:fb88:bf5a]) by SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::ad0:68f6:fb88:bf5a%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 08:00:27 +0000
From:   Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, tamnguyenchi@os.amperecomputing.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com
Subject: [PATCH v2 0/2] i2c: designware: Handle invalid SMBus block data response length value
Date:   Wed, 26 Jul 2023 14:59:59 +0700
Message-Id: <20230726080001.337353-1-tamnguyenchi@os.amperecomputing.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::26)
 To SA1PR01MB8131.prod.exchangelabs.com (2603:10b6:806:325::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR01MB8131:EE_|SA3PR01MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: cabb6f14-406e-4106-9bc3-08db8dae5f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojLOvwDx2F06NcoCDKk67xenzHydGcpe4j63gcIFnGEDZkjtE6QrqiWwHVcGpkfvahDAy27xJ4s+AwdurqDZiZmXb/jlZ2+tKYUJmMJWWlCHbErgVg3VGOiLiIP5UUXko9gaOnyzDyYLK4UVPlDo9ktJcpsTZM2d61JtGkIj/1d3mW57M/vd7eCtXDeooCj64wrwYrqRfy0EK1rEdJkFocToi0qJr3Pkh6iR+2xyaQrF8TuYJEoBV13xJdAsVL/1o6QSkrOEk6i7z7u5ajdm+Kxstb4SZ1xbwM6/eNGX4WMevkyZqU6o/IpBxdIl5eotaFLAhIk3L7EgJhWfqhZ0YU6rIzAQ4Wz0DMHgNoCHSLCxxAiadOg7pm8lJc4gOXWoDUAbnlEpRgeeesCY8HsKpLsv73+7ypA9WQWf8u7BAVspu0umSd6ehWJl/TLKB7OCe0diri3eybS6jGBgU04IxCzVb/lhNKIh7dbKHmJLxT5kWLC+o9lRWnT0iyu5yWXbu7NnzgactmCqSRKUznZTS9w4prj8WLsjOGj1G75tjM4n8DAmBdIX9aaqTZST69VWBfR/Eux8hPhU/ge7G9IfWe5gkVePBoXVBman3Z17LEG6oDy3PEvca+RZgHA4dT+/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR01MB8131.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(396003)(346002)(136003)(376002)(451199021)(4744005)(2906002)(83380400001)(2616005)(86362001)(38350700002)(38100700002)(107886003)(6486002)(6506007)(1076003)(41300700001)(52116002)(66476007)(66946007)(316002)(66556008)(4326008)(186003)(6666004)(26005)(6512007)(8936002)(8676002)(478600001)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GFyNOa2Ehgatq1qLmPtR5T8mIgaxp4ILcOTwmAqAQrUqfV2suseNz7CdueaX?=
 =?us-ascii?Q?QwtaRHFsgNBodjm2URfM//wwJ/hmaa7/yrKrLgY6fGkNMseo86GVR2XOyfEO?=
 =?us-ascii?Q?rBV0wNGQRp4a8GN/0Ef5f8vQqUyYykdvNgxw2QnTAgqD6JvLxigJlGiErEjX?=
 =?us-ascii?Q?S95bed82uk0W0tbolXvq1/bHnJDWFgWvq9lkX3zGCTtEvfdynts6QDJqA9aJ?=
 =?us-ascii?Q?jWhthWdOO0cfLZZuiCm9BNjHV1OBoPEwWIWm0r3awvEn3gKyeGL5jmHFoVrg?=
 =?us-ascii?Q?cq9d56M/qeXGRl+/wqQXP3mG66+ps4JZt2YJ8CZem0zsDruOPwEVqyQBtZ2J?=
 =?us-ascii?Q?iY33V8EFLE1ed70eMfKuijtHb4tCBUfAcBRCwFt8Dr6ftQ82TViGJEkoi0/P?=
 =?us-ascii?Q?ij5W88M9xouqAHWN4x8anPjxol225yS8jB+P8LYavc/phFonnDpI7IY0GOs4?=
 =?us-ascii?Q?t9cxkoEyiLxmiV0MykJd5s+xtoAJ37AHRdz/xggwX1BDVruqRC+HxsoDpGnn?=
 =?us-ascii?Q?kKPB3JEWoaKFcB8DknOPrI+fYVIIqw0l2kLNr1n657Vc09b1kx/BLZglb5Qm?=
 =?us-ascii?Q?hJ6BAjOpaZ6x4Dx77a4qEzzZi4FuFQCpw60reb/s4TwljAYzC0F1WJbtS3fx?=
 =?us-ascii?Q?AiAGTamHKQCjZjs4ZfwxxbnVDpvoBNgB7FFT1UQDRout9NiVZs3qt3mGbTyX?=
 =?us-ascii?Q?sr08GywMGfKV6+92JRu0klQr/viQTPmnefsoNEliWqG7knQA/a252DfcGHKu?=
 =?us-ascii?Q?hSwaFsrYJY5r0khBzPqX1Gm5AL+nQZb5CBGKRv5F6Xmsb9YJh0Cs2K+LXw5R?=
 =?us-ascii?Q?S5x0vmJr9rC/Wb5GjKI8CsUUNOv9QhmRroHlZF403cfHzlejxqaq085EHrmN?=
 =?us-ascii?Q?EjUzQVg5uq8yuoyzSFbs0bC40i9AEbRrf6Ise8MT0FOQrlswzcYCQlnA/JsK?=
 =?us-ascii?Q?LnuObLy5MNajmKK23HLaYxuamq+lAZpDZyyJ0vZ6HgbiW3KHuFuAZBR6JK+b?=
 =?us-ascii?Q?XRZSoJKsePjajCaeWhPeXpxax1N9PyodepA4Clls36V3YvYDmfN09bCtW0Nk?=
 =?us-ascii?Q?OOW84wNev/AqvX/CRdkxwzguO8+f/iTbCn5dffitl2X1RPDpiaCYXO3o+1iW?=
 =?us-ascii?Q?KLw7a23VSPU7AhOjZ3iYHttnrxICo3ULlooJqgpkY4hMvk72zQaBjgVhK/4b?=
 =?us-ascii?Q?Oa6yB0FyIU+KE4f1gZ2Qgp1B9xhMFl3TXJEgYTuV06YuGFixmKt4z4MpMV6o?=
 =?us-ascii?Q?LwNzSazFJRleGxGnUvPai1t+tQ3vRGxyDJ3MxyeTjrhFsoNA5XzXthmylkwi?=
 =?us-ascii?Q?YXaaXtcGbzWP+aFO5Iss31+D0NyUc/nB60oKhJ6NXMWx+UgNYjL2F7aaGAd6?=
 =?us-ascii?Q?PbL1/4dk6dsY1iURvLhvqW/l68pj7i81ornIYqbnMQZSxKpXOUvjCcyYppoZ?=
 =?us-ascii?Q?f/xz82pEDFBpj5FhIg8iajueEtKV+QSA4CpGyldsmGfGUNYeadtdp4JRidwL?=
 =?us-ascii?Q?l43hz1QIps3gQNVS389weeKUBvY7j73T4YwUWmFa6TrHENR15lnsFTsGPn2j?=
 =?us-ascii?Q?qTysGVc8N/qTUWDgx8uQJxePRh+zmtPIiEJz2lHK30Dj6O7zYaW7SjwVAAK8?=
 =?us-ascii?Q?6H00+2tSIZbDJH0lzp6kPeQNSM6IouF/q8L2QMIpYtKQ?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cabb6f14-406e-4106-9bc3-08db8dae5f8c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR01MB8131.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 08:00:27.3988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fw0BXWjZAQKcfDFhIV5ISgz4xIdxGq/95BmBiR7Nz4AemklVYHGpE99V3HSMOnNhgpuzLzghXz72jBGDhowVFfY+iUGSSefXxcbgWVlJBglwarv9p7vt+h9a8g8PKhm1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR01MB7988
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This v2 patch series updates the I2C DesignWare driver to handle invalid
SMBus block data response length value that causes the bus is hang and
can not be recovered.

v2:
  + Create new commit to correct length byte validation logic    [Quan]
  + Get right data length from IC_DATA_CMD register              [Jarkko]

Quan Nguyen (1):
  i2c: designware: Correct length byte validation logic

Tam Nguyen (1):
  i2c: designware: Handle invalid SMBus block data response length value

 drivers/i2c/busses/i2c-designware-master.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.25.1

