Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 402762571B6
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 03:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgHaB4W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Aug 2020 21:56:22 -0400
Received: from mail-eopbgr60111.outbound.protection.outlook.com ([40.107.6.111]:41218
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726630AbgHaB4R (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Aug 2020 21:56:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJse5mseux0xfgPnZfnMjL/zPboRlj5+tWnmqJiyZlkd9VLz1tGYBnQA4k9gvLk728AlN69vXHp7vlmZRTWibl6wqTvHeAxq0U/N3LEkjUwzfs5Qj4KG/8sYI0W6mwcRE0veMmLN0SOpc3ztp6LeiHTzFE3V8ecg5oK9z3xakvPyUWLM6+0+NMB6nBzYF5eYsPrwdmjIQhmIxHauMmPVc5oLoilN4b+4cZgLKhpF2yfasUV3wP7BJqrA1ZYYJzn5cAragShe/bBMhqolNgekRoaKviSBxTDVaavLjgimJaV8W3ZPKI0qsMe2T9uqYzcDTd1lcIqF10xWMEw/NEeRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snbDzKnB/lT3JYeIcVWFzpZUABJbnZ0fuT/dyP94Aco=;
 b=aXxQVd6Amd11J5j+i7djVhLm4B089cgFqrVlBE11PBS3gVrvizPWnUsCfO61hBOJ4IVtBiHYOjOkPOTzYjN4gdf1IL7Y1HnXH9PF6TpLxXSBNoi623ucIWfNZE6QtC+t0hLha1vN88qq1wAb3i19fJuAus8uBFw6TamqsBoZ10/n95eFZf/LbeJDd+8CNytneYpsCHk1DhUlzhfvfP8PAVFVQamOAnQTnNzkk2RxDnU1cTU3JhFct79HeCaF7HafpKWhcAwBocW1PCQYn9PXNYoUcFHCYbTAhyHQCMZ/A0QKkQ3uZPoL5yxfuTDYLdLck1YTqottPasydHL2S3tkww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snbDzKnB/lT3JYeIcVWFzpZUABJbnZ0fuT/dyP94Aco=;
 b=DYPxAx6VICyhbci4uulqOav7xziqjz5Alm5yOl5t4MMUpBhig6NGQjRdgIyuzXA0Dm/eV1vCGL/5N72ym3WM19whBoloAXXDlsciGhoJhwBhpVaTN0p4aOf86VwrrA3s/U/vDAo3IBGNCktIiMYw5JiVjZhS9mZSvm79fp8ECqU=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=plvision.eu;
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:56::28) by
 HE1P190MB0364.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:62::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.23; Mon, 31 Aug 2020 01:56:06 +0000
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::b1a4:e5e3:a12b:1305]) by HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::b1a4:e5e3:a12b:1305%6]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 01:56:06 +0000
From:   Vadym Kochan <vadym.kochan@plvision.eu>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vadym Kochan <vadym.kochan@plvision.eu>
Subject: [PATCH v3 1/3] nvmem: core: allow to register cells during nvmem registration
Date:   Mon, 31 Aug 2020 04:55:37 +0300
Message-Id: <20200831015539.26811-2-vadym.kochan@plvision.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831015539.26811-1-vadym.kochan@plvision.eu>
References: <20200831015539.26811-1-vadym.kochan@plvision.eu>
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0201CA0022.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::32) To HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:7:56::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc60716vkochan.x.ow.s (217.20.186.93) by AM5PR0201CA0022.eurprd02.prod.outlook.com (2603:10a6:203:3d::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.20 via Frontend Transport; Mon, 31 Aug 2020 01:56:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.20.186.93]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a34225dd-ee09-4398-c73b-08d84d5105bc
X-MS-TrafficTypeDiagnostic: HE1P190MB0364:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1P190MB0364E931A9DB9C4D9946980A95510@HE1P190MB0364.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jCjuUUkVn6ZhSqvO358GlS5gl0OWNUuJyfbjzLjrU/52WgQBRMpcvkTo7BPPfBvx+JHOtpOZEcDQYl3DKz4i8aMhhO33q1DWhlY8IpCzxmajqPX5oUY3aE4x5Ns+86fLpztrlyjSAuaYkRvV31JwFiNnlS5RbOGUSSGMJ8EvO8XzSiNAZ64E3BwvFNTEarg4D8NYvThc/k6pLG9d7DBWbHC7Faaffwj976vNHvz8nikOUZ9XaHc5u/uCxGQAzfNKU1x02x0i0dd0GOW21WcLdigAPfbdz30goFSC+piRfbTSTx1HWF07dyw3yXqjHt5VyO5UDVPbYpNxPkGGjC2RqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1P190MB0539.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(136003)(39830400003)(366004)(396003)(346002)(36756003)(478600001)(6486002)(5660300002)(316002)(2906002)(110136005)(8936002)(8676002)(6512007)(6666004)(66476007)(1076003)(66556008)(44832011)(66946007)(107886003)(2616005)(956004)(26005)(86362001)(4326008)(6506007)(83380400001)(16526019)(186003)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: j+fhYh1KVEdngjd+dhcWX6hJ0S8LQ/hXBwGVq3ibhbd0RLBvC2xRipi4+SpFYRGouqHM/e1A1Z3f3nUEZ/QDE263o8d+1uIdUAIhDSlBx8Axy8RNrINarIg2zT1tN3X0wQYAY+sChfQKaJ41GYcvwvvRIVCyoIc5KZJ8rCWVp3iUyf/nXc2NY4tOo3cTaUAy9g/aJE43O6GLaAwZd6b6pxoj7DG0BFwuRzHE6Djy+BIOuK2mWXe0m/c/8vq4PT7pdXxTkIGCzCqI1RGlsQfFIpZGKrrJ33a1EGyyo1cxdQ+CeJmMKhxU7akXtNQoxdV5qSVkKTclYC+yoDs5yxmDSWbUWJ+bYZMVWrMRj73vwFRNgN15rVDdU+QbjkJqAHU9w3mArdoK3GnCWTzoD8CU0D44IDITSkcbRzzxZ+NeeHkvVe0MZ2qmoVdqwmLg9rnknnhDsByobULFWgPEpHAMoS0qww/FV7mXDxNBPvfIbEud/LrwFfTL6SVAis3j33nz1Zy/pwUhCrWDRQgVv/CMb/p2TsOHiBCe6PcCU2gfGi7zjPwCODJ2By9rfzWEDRDlc4c07dPwBz1pSM1lcPW34wGG1MIhJ1It3K+IoP8tcwAepnsXSwS4zWuteAnNlcDoYtg5s3AMrPFnloZ/wA4ErA==
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a34225dd-ee09-4398-c73b-08d84d5105bc
X-MS-Exchange-CrossTenant-AuthSource: HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 01:56:06.0340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: psQrg5mZG4iBPXi7UjM4Ccxcnh4SSRN32MsMk9QdUZPhRqQ8VPb8zb/0ZF+0dM6a7usDIhKM3ZAPGBVrxpSAkqnDTjjOSc8GpBjPul+3/8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1P190MB0364
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add NVMEM_PRE_ADD notification step which is called before any cells
binding - from lookup table or config, this allows to register cells
in some specific layout (tlv) which should be parsed first and then
registered. So there might be a cell parser driver which can register
lookup table during this notification step.

Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
---
v3:
    1) Update core.c changes by extending notification mechanism
       by adding new NVMEM_PRE_ADD event id which is called before lookup
       table cells binding, this allows for notification handler to
       register cells which require nvmem parsing.

 drivers/nvmem/core.c           | 2 ++
 include/linux/nvmem-consumer.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 6cd3edb2eaf6..c48a69e0ebbe 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -668,6 +668,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 			goto err_device_del;
 	}
 
+	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_PRE_ADD, nvmem);
+
 	if (config->cells) {
 		rval = nvmem_add_cells(nvmem, config->cells, config->ncells);
 		if (rval)
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index 052293f4cbdb..0f7107276756 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -50,6 +50,7 @@ enum {
 	NVMEM_REMOVE,
 	NVMEM_CELL_ADD,
 	NVMEM_CELL_REMOVE,
+	NVMEM_PRE_ADD,
 };
 
 #if IS_ENABLED(CONFIG_NVMEM)
-- 
2.17.1

