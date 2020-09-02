Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03B225B3C5
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 20:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgIBSeH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 14:34:07 -0400
Received: from mail-am6eur05on2135.outbound.protection.outlook.com ([40.107.22.135]:33056
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728029AbgIBSeF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Sep 2020 14:34:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hie1Ya62fpMnIpSHX+2/sw7aRin0rdTB10Vp990derHG4ihTwmXQyn/AGHHLnglN7FGOGWRVdvtnADL//FO1TtKEESWj9BH9xJM3G6qX0Ify6Aj5g9iu/dmT3iTEn1FXaS2K8d07Mez31041bdmV4F15w9miC6jEahgA+QxSNl2FwY3qanTlRnbLGxyycasVn2u56SMewgwcVs1W6IMAx1AoDDObCZpr8lE6AjEEeXZEuy11kiX+qj+qtuXKGgP5RyfNCmYZAu6kahF9A+yv8bC3h+cwJv3jjjuIxo3ggsJk2sLiblcQXEcLqXE1c62SGTMZFrUjLmW1U7aJOpbNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndJgwq1UfJLyAY4jaB+qX/6O8okRGV3rrp7sxCYzwkM=;
 b=LtzQqozhZGUxsZYjFw/TEEa9AEumE4qkZNwoW1mW09o369FLW3Gkpwcc8aCzK9enAHepdEuzgzsA+aJ7yxyl39Fl1TALu1Zsyz0vKOLOmK4WzZWg+NDGXxcehSq0hBP0D5rCfwYP5BBWtVlfZoUHtXZIuvg5OZ5pWPq6kmovROd/cpqX2aQ6mZTRliJVDaBwpYv3MDhF724lMWoMNXsyVx8h/hZ0jyCLdrBwlll1bWjTcuYWVxqWx9qwT70CB8YzactFO343OCCTjrddm/2DqQEbX+TtFSaJWoaFcKqGLGnLE1TwK39auU8BRBwxmsKjB/P8U5JPXRpH5YPHWG/EEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndJgwq1UfJLyAY4jaB+qX/6O8okRGV3rrp7sxCYzwkM=;
 b=R6KNwo5sHTvkBoquJV0Ad4VKz6J7oOhG1l9ZCrG5cudHlok+vYkc6i4kjFLrQapPhW4exuW6hkIW6VNgeWGZxy40VZt2ydKVlvklwNqd3IZbP69nz/QpWClWQXNM+EdFOesqIt0WymMn3DQtllDK7VNF6EJ94LCuGgaubLOfHAs=
Authentication-Results: st-md-mailman.stormreply.com; dkim=none (message not
 signed) header.d=none;st-md-mailman.stormreply.com; dmarc=none action=none
 header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR0201MB2296.eurprd02.prod.outlook.com (2603:10a6:4:32::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 18:34:02 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::3890:7b1:97a6:1e47]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::3890:7b1:97a6:1e47%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 18:34:02 +0000
Subject: Re: [PATCH 9/9] i2c: mux: reg: Simplify with dev_err_probe()
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
 <20200902150643.14839-9-krzk@kernel.org>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <1476aef2-05d8-e41c-e393-ea6f048cbfc6@axentia.se>
Date:   Wed, 2 Sep 2020 20:33:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200902150643.14839-9-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0202CA0034.eurprd02.prod.outlook.com
 (2603:10a6:3:e4::20) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by HE1PR0202CA0034.eurprd02.prod.outlook.com (2603:10a6:3:e4::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 18:33:59 +0000
X-Originating-IP: [85.226.217.78]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 074dd727-653e-4b0c-740a-08d84f6ec393
X-MS-TrafficTypeDiagnostic: DB6PR0201MB2296:
X-Microsoft-Antispam-PRVS: <DB6PR0201MB2296A720E0F244F161658B89BC2F0@DB6PR0201MB2296.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pyx2uZC2w4PhpPwPR0zx7T3THUBtaKEpaH1PFyRQWwyETBlN7IEtSABoorSW++E68EkDdvPkws/K3GjQCReYSOFplBC5/+nurTdiYFO6S8XymgfKL3AsFTfJXD5bHqYVRuE7i36mmr64u1pZXYY2xex+SHSzvycAOe9hyUCCi+f/vFjX3pzTs252yhH/B55gEoPdmqNB1lKKoaMJFrkE8acKdVeIeEJiBfV5pyOUJnGH6lqaWlIXj+6Qm0KfP4o/DA5DNLZQjXIHBGRiQzwUZMT+FH1nbPXGbJ9sQxtSp5PxAiX1YAfveFLeH86/X3Se2KVU4fwOflj4Ni8H4N+qBOi4wxzrsWrdB8yQC+GMakdfJ6swweg+FJXJhTY3KWZ1FC3pZ+2O/soTIvMvBkRzPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(39830400003)(396003)(346002)(956004)(7416002)(83380400001)(36756003)(31696002)(16576012)(66556008)(478600001)(66946007)(8676002)(316002)(36916002)(52116002)(86362001)(558084003)(66476007)(31686004)(110136005)(186003)(8936002)(53546011)(2906002)(2616005)(26005)(6486002)(5660300002)(921003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 5adX7XEeSO5eMM1m2UBdKbAhFpPtHdmG0ekAaJfKdkF53NkwhmnTi3L87qxTHO1MFfGwqiC6ZVz5uYZLmJ5bNufa15aq0sPj5rdSvgf0JAxTIOqnR0YzxYK/uStZi2s4Fdj4dd0adri90ycrR2cMrDk8dT4De5OxCA/WgyDxgNPZNH8rTE0WMVKnrR4CnDgJobhm/wWHZHn6ddRDU2S3gNanqsEXVQczkjDuRP+V21SnyjIktc/7+QGmYz3+Z3O+N4TUBZ7ddygKZLX3JAB525CpF9LTOGZpAYCSogo9FHTYUVRtcSDoUmMVpH3mrBgdw5DN542BJM5VxsumP3VUrz+/stdIMREOcSovvNgXUWknwGENJF3wU5Ft+SrOIyJuHYtbzVVGmy0rmskdrRVjx0WVaoYDWv+M3bivZiFyThoMf23OkYS0WfLkinNNqzAIpbEIcAxeVCR/CLmkE4tyJ/b7448z3bguWNLL1PH2sdoHGJ5G24enAqj5cK9cunFKdZyYL3LyOGNeYFPFFjecspv+0/frWwj1o29WcT+B4iyz5Got8BFr0+5guf5S4BMLTZIcmLJ4qfWhyUaaAGGZTyZ6PohgNIuW4XoTNDMjrNc3sHJSpZHg10RKqCOwniUzT3yrz3MX/P6N45jEW2Z48w==
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 074dd727-653e-4b0c-740a-08d84f6ec393
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 18:34:02.1031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZABZDs/PS89PtYKzDtA2JeJ2div6j8IZ6sFAxry6FitA5tvHFQP8GjXa6ZIhjnd
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

