Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194EB25B3BF
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 20:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgIBSdb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 14:33:31 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com ([40.107.22.122]:49632
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726446AbgIBSda (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Sep 2020 14:33:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aj+THUp2+8t0pervOFdIViarz7JfVG82ieXMCpzaApPg3Sg9KGpSTtvQT4g9gvncgguAcnl0a9OzZlefI7kuW0xtAbE4WG1FWKYcLK8ncFZVg7J82XONu1VSppZmXi4UNpLPFfR4umyZnQRjygx+b4wPyyneft+3w9OS30T60pnOKW85BI0Vd9iElQfm/gvwS1v2y6DzeZvuzz4IJmK9c/RUxwjTIkAEZIFpKyTW9Md5zpNFngzfMoHfH2xcwyn336hIDeC5oBQ4xtbV9K1FsAjRG1u4NtLkF/KX9Bplbt6G76/p0u8zrtxVGFURBOLbzNKj2xIISkFZSLw4DZh/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndJgwq1UfJLyAY4jaB+qX/6O8okRGV3rrp7sxCYzwkM=;
 b=dR11sjK8vOilYz/exx1KE1Ig5wA+g2bO9fTrWNBq9Ccd+ccTqbqg4Xnp+UJ+3csppvZOcKvkGVj0XoOLU4B85zhms5OQvPv4Hkl5iZYY2/K6Os88R60kCQDgwIhwKWhx4zx9ZImIXOALlnunV+pvfsrleLjJaD7l9k+PJ0sczaHErx0gBLwVRlLpc2mqUOSSDsexvCjFT1P5p9l6+mmbR76IKCCxmzBPc8io2hzm84ZjXab+5BzCaOBPPGdTfUIGC+cLRg5NuGb048B5ITNYP4HUKgtefL9lfJqbeaL8bt6nCc/FXJKNVo1dpAgTT/2hn4d7519vbzktkjlQ/unTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndJgwq1UfJLyAY4jaB+qX/6O8okRGV3rrp7sxCYzwkM=;
 b=dnZ+SpPgghctc+R6r8MN0XaPtJTK9dCoF5tkehf53V166b6NaY2aLhIiCFpt79Utom55VzKwKzxzPmNTQUgS2mTvzXr9TykNI4cNXrQcEcWGo88XIcWYC/cVeB5pRKySTJwOZR1OHgDA1wZqsRiB//8u8uMCoeAzany2CJLgEqs=
Authentication-Results: st-md-mailman.stormreply.com; dkim=none (message not
 signed) header.d=none;st-md-mailman.stormreply.com; dmarc=none action=none
 header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR0201MB2296.eurprd02.prod.outlook.com (2603:10a6:4:32::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 18:33:26 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::3890:7b1:97a6:1e47]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::3890:7b1:97a6:1e47%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 18:33:26 +0000
Subject: Re: [PATCH 8/9] i2c: mux: gpmux: Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Michal Simek <michal.simek@xilinx.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-8-krzk@kernel.org>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <5e444922-1094-81b4-49f9-9595725d9c7f@axentia.se>
Date:   Wed, 2 Sep 2020 20:33:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200902150643.14839-8-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0202CA0040.eurprd02.prod.outlook.com
 (2603:10a6:3:e4::26) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by HE1PR0202CA0040.eurprd02.prod.outlook.com (2603:10a6:3:e4::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 18:33:22 +0000
X-Originating-IP: [85.226.217.78]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a7dbb3a-b26c-4a2e-ceff-08d84f6eaddc
X-MS-TrafficTypeDiagnostic: DB6PR0201MB2296:
X-Microsoft-Antispam-PRVS: <DB6PR0201MB2296F2032EF3176ED587769ABC2F0@DB6PR0201MB2296.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dqnHW0zlj+2RDJtvXHantJzlC8AdQyutZrs0p6rQ69tJNsVxHOn0EW2DQ7Nr5dDJApZl40v3ePp3mgwPlLd+nGxQ9GZzzhMPX4SwHFMO05xZPR76EASSlFbxrGzdjWdCIqFryDSat1+PR3338zvPgV8uU03/4ITjV1puX1zdszBtzTKRBR0Sso4bGPzPNFVDe6jipVscnXWvA7RYG6KezZuQLK8kYC5jEW9isMycx7sFOZ9zeh7iXX5MzevXAQcFt43WcyfKq8QJsc+9P2QNzZJE0hC1EZgqRCOCyRUHUgBbCXj2VxgLsjK90f71+n7VS71UPxJU3fvXyzL7hxZDQhC2045VHHAlr7pbCd+aS+nhawMxofqrtgq2vK3jnl+kQLcS6EppIB2IMaQauEZTeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(39830400003)(396003)(346002)(956004)(7416002)(83380400001)(36756003)(31696002)(16576012)(66556008)(478600001)(66946007)(8676002)(316002)(36916002)(52116002)(86362001)(558084003)(66476007)(31686004)(110136005)(186003)(8936002)(53546011)(2906002)(2616005)(26005)(6486002)(5660300002)(6666004)(921003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: rwJX4IWGu4MLU/Gfz325wUBKjY5xI7KEKqVY/V0HInwV5QZuZ20AZjR9wlHFvQsmPzXBJ/4XDL04XI/N+rBHMI8t3M9tIMX+Gt/kt37mfCp6GbBjfCizj2fzVvx/6Tc7530AKg43h8OxBDN8ZXENc1w3uX4mc9Bvq+9MF/Zav5NyzLK9BcsmffUl2BMidvLsziudBDB68ycuut0XP4R5HE1OqNo6qqzEyRSI0E6J4ErCnJ9Slbt7mGrlbQjSIca0oflnR9PHaNruU35tZc9+jN/ZNqWUYQWaeyXicZOzZK4q8qE64O3AY0usAI+G3CTAoudORLZ7sgUu9EhDbyJwZP6yzHmm1gS9tPQuWtpCBVMFiEgYnkAkDY/vXQEe5+3EdWjPO8/pFkIxAiZl5yM1Rrv+82UHnPSsoRUGBt4OnjN1YBWsq/uLyxTz6SagE71Z0JtMU+tIjAkAGufHwr+bccrBZkJULXAp86v03Fz9b7NPZWXxXYDmEBuJXYvSPFh/DLkxyG7XDYshykASmiAYiAr0QWOQhJp7pYKktkXIqXHUigj/hKJY+xo9CS0fTfmQW7vPiUYAUUrbojTLUd3Dt/7U1sIcoYLUieUqVZdwDxTc3U/bNKrYM8EDRIm9RcS/s6RNjpzAv6vnr2MhhBDZGA==
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7dbb3a-b26c-4a2e-ceff-08d84f6eaddc
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 18:33:25.7189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpmFFW6UZ+eA/aHcg/ZlOLe4on0/0ikaTCKsPdN3P8JCqs4PbXBf2BPY4+DgTYVo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0201MB2296
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-09-02 17:06, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
