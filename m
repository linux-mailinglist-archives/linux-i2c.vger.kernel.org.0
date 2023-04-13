Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0297B6E0F9B
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 16:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbjDMOGK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 10:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbjDMOGG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 10:06:06 -0400
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com (mail-zr0che01on2059.outbound.protection.outlook.com [40.107.24.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B92894;
        Thu, 13 Apr 2023 07:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3IDZRtKn6hsv89+h4HBceWOovp6w/IYsjaQwcokoyB0Yo5HTXW+6ITJrkAw09gFFYBjWcowWLhWv9ckUynNsZMoPqxoWYrlf1ZpTVJbW0IF7lrjqg6SpnGWdKQBpMGiGcZFnVok+PtehQyeANFB4Zzi3tAAFE2Ls226Paj4IGWCM8D14FDk34gcth5tPd+Luwo6bTfKS2C7RU8TDgBnxJ6WMvCuswrBj+C51qi/EM8ge/XxpetR/UxzGgzKm/d3leG+g9mjjHccz5cR19E+KET8AOfIp12gmzMeblC7xaltKYIhKNklDTweDdFlL3lboOXmVlQ+HcSXfSwaXK8UHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDK7iLJGWjNHgJdJI2U34ty7sXtyVarSLcygAZs9GtI=;
 b=JnBjbns6ktWCOXvYg7pqnHo76KawuJn5fFAaijwmczfNTnJ2LXp4I+IoI6Ydr9HCRLv6/P3DQBNN0x5cEmae6GWSpc8qAvpJ5M1NrPE8BXUpXaZwwHx1Rdh6mhBo+ybpBhR4t/X1sppwmo/YCpJuFNE0m9DGlzt6VA0Au40BFTnxNWMqcaE64WkuAo5drj/XXmO36cY2QCnz4cSN3A66IJaH0OdfbcNXPUCyurPoZr1A4p+pLWHabbDi8oOPlM1yT1ZRRZ/QPO3qRIo498ZsRPlLfUzCWTyhS6HEskv+I5IfpkRcJh0kZ9yfvf7ncEOUaxXHsNHX8Xll3eMa7unjJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cern.ch; dmarc=pass action=none header.from=cern.ch; dkim=pass
 header.d=cern.ch; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDK7iLJGWjNHgJdJI2U34ty7sXtyVarSLcygAZs9GtI=;
 b=fHlefzXeTk3v5bg45e8fgiKKTXLndzkkKeBFrhxe5qpnCHFdCQBlsH99/PIUPEwzxb3clOe9kU82yoKok0jXkD/qTfg6JhMTpy/Lh+HdZjlQxEnQFMB7CzRteD7oB7Z3goHda1MPI9fmEXOT3jIfrfb7H6+W7g9oejUNJtRgoMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZRAP278MB0062.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:11::10)
 by ZRAP278MB0158.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 14:05:56 +0000
Received: from ZRAP278MB0062.CHEP278.PROD.OUTLOOK.COM
 ([fe80::cc5a:c993:34bf:e82a]) by ZRAP278MB0062.CHEP278.PROD.OUTLOOK.COM
 ([fe80::cc5a:c993:34bf:e82a%5]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 14:05:56 +0000
Date:   Thu, 13 Apr 2023 16:05:54 +0200
From:   Federico Vaga <federico.vaga@cern.ch>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@ew.tq-group.com,
        Gregor Herburger <gregor.herburger@tq-group.com>
Subject: Re: [PATCH v2] i2c: ocores: generate stop condition after timeout in
 polling mode
Message-ID: <t4labnjauvgkwt6ebt7tv4nshlerc7h3ihp7cr2qsxhwvw4xay@3zbagnzuhglj>
References: <20230413093737.15303-1-matthias.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230413093737.15303-1-matthias.schiffer@ew.tq-group.com>
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To ZRAP278MB0062.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:11::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0062:EE_|ZRAP278MB0158:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f2912f-c0a5-481e-2999-08db3c283348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wp0W8X0mDTZJX6bTVvHgQCB32jokTgGd5DxcgUxKtd9IQT16v7/EsqsuJuD3cPEjHsMym7uVWAnOkEY5Z7ut/o9kOCEgUIB3FlRMTzV1LbwsTnVf4p3r1p2w5GCbVKZHFkTP0VlwpE9ij55KFGE8vPHKVDdRarRTWRLZciCXWNWXupU6Eh/5otbd6v+1c6iF3AwwhAKGbhuln4V4ey6zZfCWAo3EVauNOm1yeivuab1apnLXdPjuhjOGeeSK2Z2GP7FglOGsSL1mYDZPZQveUfoJn8dG2EvgAjcziFJCyVLVBYxHTV31KUf8wPV1l+JVPZzEpuuxStDaZz38RD0Wa4SU+q3KFNT4rC8YULTnPENnSVkU49QQkVzqOxEikMyq/+QbixRb51vcA7Ikh4WnsNTsUTYZ5cslmTIBmfciYS5wazWheEh3yaZXaQXp1yX5mcZ6npp6Difg18NbP5DZ0Y77aoYydZVGZfwFDjj7uezCCbgeaQElIYZz2yUxQVbyvwYvYImrGGKae+pPSfra1Tw/k7qW4VAhc2NuSmPLIkLWsG/xK4H/f151AMuyKM7m
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0062.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199021)(2906002)(8676002)(8936002)(5660300002)(44832011)(478600001)(41300700001)(786003)(316002)(66946007)(66476007)(83380400001)(66556008)(54906003)(6916009)(4326008)(186003)(86362001)(38100700002)(6486002)(6506007)(9686003)(6512007)(33716001)(41320700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FRX5CmwFs8/pmoiQFocxQH4HZ7DrzY9PKJ3lpocXdjjbmJ4UShclS50WYVgo?=
 =?us-ascii?Q?6Yf6EyzNA65nep15IfniE5t3wAGqgPMropc4Nl8edYLg8z6UKig+s3BJOIna?=
 =?us-ascii?Q?YxMu0BwnM9LL0vpFbdrYs+AgMyhv3JR2yhB/MLCuEm7sc+hK921T7YkJEyVT?=
 =?us-ascii?Q?lOwax+pjcW3TI53bCjDQgc6gBHhEXKIaldXI182pqWeDoKL/DN8XefkiBYtq?=
 =?us-ascii?Q?+eynHLdixRLwkGlLmo9Hb1F6EEEeM1PSMy8UEIu5CO4WZ9fWHV4z1jF0wU0i?=
 =?us-ascii?Q?q4AqfHjZQMIs76efA7Ly1VubSJSBlHgg5XZ9y0TiZbfoAnzfSANtCYSvtJfX?=
 =?us-ascii?Q?/KCf3HAfcIFOsLTVf30IslbBs5NtOPzM/33wIYN/K2pIh3dnyHoHmqbkCkqn?=
 =?us-ascii?Q?kuTQ2Higio/kxYydlbYeGI5GqjYyhPdVTfky+E5ahkFrCp/pFwauaZfhLqZx?=
 =?us-ascii?Q?APqJE4BE5ep+hBonJK2IYEiyxj4H6hfx0limaTEiunpIsVyRIZomgNLcOa/v?=
 =?us-ascii?Q?vP2NxXoRLDnNIcxcZ2BSY04Nb8RCVBvujMb0pdRwToW14W2UHHM9i+CoQDCp?=
 =?us-ascii?Q?Wu0Un/VfYNePiRP9AEvCyJ7tOdqeWEBrelOB7FYPBfel1DWjr3xM8omH/SRT?=
 =?us-ascii?Q?U+H+wVq0C53YOXyxpWLfmljBISqLfjCvtLpWY9pEGxZ79CXwald8pA5Oye+K?=
 =?us-ascii?Q?LtphXBaalbT7g1anbOgjBQGaz36yG3QcyMhBb4GWO5a/iSn3of3/vrS43L8e?=
 =?us-ascii?Q?KvR8UXWIYnoYsWSvM82LN29L6xIc6JUl/LxxAUuCmWfAE6lDw9RFu85IRjBH?=
 =?us-ascii?Q?u/qskO0vIhLXjJKKAi+KH0ShNUixTTVcdtgcEnD5Z2mvyuTMESmz/dWW3WVu?=
 =?us-ascii?Q?5j4wwBSRNhmzKK9DaH3EyKnefjjpIz7+dPt5YQ/+ZwI/HGn/7NIMTIoZfJR6?=
 =?us-ascii?Q?yFeF9WtgfMoLlfawjINIxTEh1Tcbk+Jfdt7kM2cEf44v1K5AwqsUUG0xI9G4?=
 =?us-ascii?Q?rdyhmn5xuFeP/Tn/fUEnzFytvRIxsARLE/Asj32FP9ZNDkhNq5+0poqy3MsH?=
 =?us-ascii?Q?9GgmO/8DInt0wxArijymNT7iFbBLLqU0Ds2DXa7Y3vsRHzqQ4VgkgGR4KcF7?=
 =?us-ascii?Q?IVQRgBOjRgQJ9UrHJl0S10gcadCMPy1AKyz5pAgSg+l31Gk7TC+6JJC1I+rN?=
 =?us-ascii?Q?QNw36QThQbPT46Fdk+8gbnC7BqqXN8oCOHDqx6GsoHFyh4hDzzcrauIN+FcG?=
 =?us-ascii?Q?pdPVQsqfC+Yices8FLYp6fmSvbRCUBySWrCnjYn5kkv7gul8Zx429ET5rWMF?=
 =?us-ascii?Q?lUiaBT8mivCQ/7f4PBnQL3Y3tUn9br0jMjmMLsdQBiuUJx8iZcmvC+oB51Dw?=
 =?us-ascii?Q?Gh5UtjKFUWofKvlJkf/TzXw9ShF/9eXT8w8UHwkQAYK/559h31yzmOJpfcy0?=
 =?us-ascii?Q?f/W12qWgLrUU3T0TIu9vLl5EVKNxXheD4NO+ft9tdvPXCBYc0sIT6novhxj4?=
 =?us-ascii?Q?gkdXWLI0KVlovE4ZotBJjXdOSNF2+GK2Z8yRfb77DboIY1xtOY2OhhcZm3LG?=
 =?us-ascii?Q?lCEyeBfQ+4r+KlznW5iPMdPSHY+lBbI3V1odFqKZNNRRF2SQaNWhd1aeFvY4?=
 =?us-ascii?Q?Ii0IRzQfiPxQEQzTwDm3g6I=3D?=
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f2912f-c0a5-481e-2999-08db3c283348
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0062.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 14:05:56.1024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiEroF2Ca6mgt33BWZ/VSbvryXPy5rS6wfDiP72cwYTp4vNneKZa+XxlHw9iPLR/bdmzqEQGhQvDlNqhhaI2sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0158
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 13, 2023 at 11:37:37AM +0200, Matthias Schiffer wrote:
>From: Gregor Herburger <gregor.herburger@tq-group.com>
>
>In polling mode, no stop condition is generated after a timeout. This
>causes SCL to remain low and thereby block the bus. If this happens
>during a transfer it can cause slaves to misinterpret the subsequent
>transfer and return wrong values.
>
>To solve this, pass the ETIMEDOUT error up from ocores_process_polling()
>instead of setting STATE_ERROR directly. The caller is adjusted to call
>ocores_process_timeout() on error both in polling and in IRQ mode, which
>will set STATE_ERROR and generate a stop condition.
>
>Fixes: 69c8c0c0efa8 ("i2c: ocores: add polling interface")
>Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
>Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
>---
>
>v2: style improvements based on feedback from Federico and Andrew. I went
>    with a slightly different solution than Andrew suggested to avoid using
>    the ret variable for two different kinds of returns.
>
> drivers/i2c/busses/i2c-ocores.c | 35 ++++++++++++++++++---------------
> 1 file changed, 19 insertions(+), 16 deletions(-)

Reviewed-by: Federico Vaga <federico.vaga@cern.ch>

-- 
Federico Vaga - CERN BE-CEM-EDL
