Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E35140A972
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Sep 2021 10:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhINImF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Sep 2021 04:42:05 -0400
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:64238
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229448AbhINImE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Sep 2021 04:42:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5TV3qq+DA7/fkcJ2dPPez8H29vV2EuSVWcUqLt1vBSYPK5nl8H+DKXFXUyDRqhH/iW49eIlL6METhmyVfHVsTOXjS5dY/8UuBgfZ2nY9Q1Sc+b+TN9OShiC0x9/kP25/jje3BmlgSUU+W4bg4Xqnh4Nelr5zyzzHuIdeTPRLs3aKo2qiVk+M3Z88qEH5QwPpBJBYjq+/nSvzFTtx8oyRBITyL60N9rE6UYIjmnSfBmL7XFQ8jcSFsP2Uvqe/6V1qNzbLKSz2np6mLHjjQxBboLOvDoC977ye4SDJRonlUirZgWtZdoePNHdL1VaXwVAPMnkvC8a+kXRWsS6W+zISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5ObxGv1PB94H+1OY35cTewREuVOrsFl/yh8w///zzVk=;
 b=l+PFrgT6G0y/++lbjMDRSda1tVTpcOIj692mKGSTN4aR4C1Kl1TG7ZmHs2082FR8OFZcFdKgPM4VfyaYUhSPMHXx4x/rX3FF/LkS1wXH939U/nfBL1uQt97lsDx9iBwffcv+PaJbRfIAktZ4dqxFbZpWSxmM5yMUbdnYRhsuttD0fdG3fEnv+1VRmC2iuM9yPU0s7Bvx1AnPHeMxrAwmjuwQ39j6dioXgr03gMa7GHs1S7gsne+7kyxoYRa1oeYJdsCJEL6GBvzU2W8qRgT9WhJD0NTJnf8/c90jPoJXR1zgBz2BpmiddB0iqJ3wnWjKLvxQIJBrb2EzVoKUc+Vvhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ObxGv1PB94H+1OY35cTewREuVOrsFl/yh8w///zzVk=;
 b=QZLIZs7nXlSSiyBrWzAZVA56XEtAVboaNBcoFicW4rnqxRzxUcoQ52a10hWdl6qd+Kosf4Pq5ZO+ngxXy5zzZ7pWlLxzeYIISHBwhH9tZbTsSfjC1kM0T47pA/aIWgdUJg0IsOMLpgL9cYvp6TrSGZO01On86Qt8OFtCf5bnzOQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR0401MB2638.eurprd04.prod.outlook.com (2603:10a6:800:56::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Tue, 14 Sep
 2021 08:40:44 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb%10]) with mapi id 15.20.4500.019; Tue, 14 Sep
 2021 08:40:44 +0000
Date:   Tue, 14 Sep 2021 11:40:43 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/10] dt-bindings: i2c: imx-lpi2c: Add i.MX8DXL
 compatible match
Message-ID: <YUBgC0S1R1Z0f77f@ryzen>
References: <1631522874-19862-1-git-send-email-abel.vesa@nxp.com>
 <1631522874-19862-10-git-send-email-abel.vesa@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631522874-19862-10-git-send-email-abel.vesa@nxp.com>
X-ClientProxiedBy: VI1PR0602CA0003.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::13) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen (188.25.164.198) by VI1PR0602CA0003.eurprd06.prod.outlook.com (2603:10a6:800:bc::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 08:40:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e75e585d-d46e-4335-970c-08d9775b57a5
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2638:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2638E68BE6AFE0A1E51CC418F6DA9@VI1PR0401MB2638.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:81;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V0llC+tfgZ8gjuWH/DdGAiODNdatxAksbeF2YtZxFSQE4zMXZIQHnVprlt6LWsDGiqql6Z/Hi3dljUlkTQgIosqe47FmTOVPLjGEHRAILTZ8A9LADYScWk9+br18fFpTT6Puzev2zbPYnhDzM6Vak7FbEwyunWgPkxP1TZ6jFyR8XE82ZOMDyMqpctlCNC9sdE8sioh9S0fgueesJDBn3whxGCs1vm4696Y8Dpu51yfDvXa7XE1j54/FC7oOvqMbcD1O2J07NWk2yiD/CA7QzyuQuevx/4j80WIbZEfFgRKEX5nS8otZO1J4FnzrkZSUkX4Ik25gt2VBwuXI76UVwCwVq7lgKEX7XJmSPCU0lbnLxsrBCMg2MP7R3gX8MbnrRR6HrLceCf3S2czajj/BFz9WYhPdsBv7iaWpfL446Z19fVd5IrLohrt63j+W99awM1PMSC1YTnJf1QJVJfFclYzRpNHUJrjpg84jL+WfCXCGMMWJr+eCleogk50eb2TwaZCDrCMvbzp7SyzlMZBWvTV0hQ9aKYxcJRkOpmZALd67jxNbSnjScQAZ8R3EIFEIEU8VaGbcfCHqac4NaRrFZ99Jw3xDM6zRfk92zASQMGvQVLdJIcS+dgZ156ZdmloTrD8ZsM66Vr2WLmLueATbUlZExKOlqfEBjxHnQbyjPBhwJU7k/TSB8eZTJ5zxfDhxXvzcD6V0JaBynQOBWTb4hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(66946007)(66476007)(66556008)(5660300002)(26005)(186003)(52116002)(6496006)(38350700002)(38100700002)(478600001)(86362001)(33716001)(8936002)(53546011)(956004)(83380400001)(9686003)(55016002)(9576002)(2906002)(54906003)(44832011)(4744005)(316002)(7416002)(8676002)(110136005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ddndPDzyJWzqOGv22HLQZ70psFf8iWQWwZTH2IkjPqW1PGbl4Q8aU6bV8FrG?=
 =?us-ascii?Q?y/oiB5il4NF8QC1jh0lpaLZFSaTOy54UWcVF0qif0pXcUnCp4CnGx/9BwbLQ?=
 =?us-ascii?Q?E8Npvg5U8hfZEE+UQdIAQh5DGO9dgc9Kq0uhiP0M6ORhxum3RoV959agki8O?=
 =?us-ascii?Q?U9OKtUv1M+SItl4hG1kpl9lDx00UYau1tcHaTiwqKoKbq928VMMN164XZ9Uw?=
 =?us-ascii?Q?m8AWF45bTRvakk9N1hRQgkfPvYE/cLMbMJ1VOj6Aia8GSwaz5cifW9cQNLYJ?=
 =?us-ascii?Q?1Z8CDnQhaNTfOuhJHCrhAqD5po4v8rQTJjc6hnB1AZhNWZ3APUijnAWf5l+L?=
 =?us-ascii?Q?bWFZEQ6rfGbFOzJsIrLCIkMCpbOMi1gzqn4ZyxWa7XQid1UrXAg+brB8DuXk?=
 =?us-ascii?Q?/1FZqBGmssWo/s+dHJJhjBu4siD5pgxvIiqj2N6wVLahe7LOguP24ex6SSZw?=
 =?us-ascii?Q?H9fbaKL5EcrVYrO68z/SbAoYnWjYqIo2++G9imCCx2G4IIpHwz8EpOHPUuwY?=
 =?us-ascii?Q?F/I0WmKI2XjNWf0RKzrLojsgLVHqlN3O7Oqju+vMoWR90vIKzHEjTaVv5OUO?=
 =?us-ascii?Q?X9VAY2PxcKgQTv78qHVBMiYN2EIgKYacvwH5p5k7+i/YNIcLKDqxuX14Y5wH?=
 =?us-ascii?Q?dd3ajO9wsDxYOSpA2QKlYr+yuoVwbHPdPsgdaABdXEm1gIH3bFeuAB1u5FOB?=
 =?us-ascii?Q?uebXqUHlpK4gIdYAMiec1FLq7OnZz02KJJjeEKSXqK/9z25TeW8JUFSquf6Z?=
 =?us-ascii?Q?WHCf29WnnQ+/vhnsTiuH+Ah2csX2AFpGUxSaGWw+zhMkJk1FI6rdgW2OASWS?=
 =?us-ascii?Q?e4ofr44BQCQFGuK8JnLbWTOM4HkAQsXZiPNFPmVgVYcQAnbbGkEKpgxDflAN?=
 =?us-ascii?Q?3tb6yr/zkf4Z9RebDUY0RWnV5Zzz1Y/XicCgn1ahjqUT/AVnVrklFviB1SMy?=
 =?us-ascii?Q?npJLr1gzkNdIvKjPzN/eR8LsHTORtp5MN0vm9KMQoqc84Dx2n0gP5Fd5yM6m?=
 =?us-ascii?Q?ns16ec7u4pXFcbtLz+G1qfyLlOCxYe+ABiSm2XhD4Ga/5teDSLpYhm4MKOvA?=
 =?us-ascii?Q?1RF+KdqzF6ymlmcV+PK5v3HYQ1wqgbpF6uF1pxfUWu86KoESYu3Bk5J91hYB?=
 =?us-ascii?Q?zWaFG+me2POhCPb3yjbcLL1O0Bv/70MQHpVmMY1q8psMmtliJZvLUp0VfwUg?=
 =?us-ascii?Q?6dntqhNC8utE2BKLe3r48pbK5LTJGe1A8c7F1F/duRUjaTXypPmFmfN/Au8N?=
 =?us-ascii?Q?Weqam+bYPdk5VtPrqGTbBHzrCTAnoFxCnGwnPv5ndX+v8WE4bq+22oQFODhu?=
 =?us-ascii?Q?0jYKKqTd8Vlqw81tlBSsK/Vk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e75e585d-d46e-4335-970c-08d9775b57a5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 08:40:44.7424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdUs3xxvKaOZlPKtMwn5quwPJuXvGCueAJNqYPjhjqNQ03mPZgBCUb2UHmBGtHFqu6+uu7SeTHKOqVHN35jHMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2638
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21-09-13 11:47:53, Abel Vesa wrote:
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>

Please ignore. Will resend with proper commit message.

> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> index 29b9447f3b84..3505577082d7 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> @@ -18,7 +18,9 @@ properties:
>        - enum:
>            - fsl,imx7ulp-lpi2c
>            - fsl,imx8qm-lpi2c
> +          - fsl,imx8dxl-lpi2c
>        - items:
> +          - const: fsl,imx8dxl-lpi2c
>            - const: fsl,imx8qxp-lpi2c
>            - const: fsl,imx7ulp-lpi2c
>  
> -- 
> 2.31.1
> 
