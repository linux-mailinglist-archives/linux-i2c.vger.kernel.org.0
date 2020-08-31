Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0462571B3
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 03:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgHaB4O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Aug 2020 21:56:14 -0400
Received: from mail-eopbgr60111.outbound.protection.outlook.com ([40.107.6.111]:41218
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726454AbgHaB4L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Aug 2020 21:56:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caaxP1A4lVxyykHBQ2Jhl7R3eEL5mTMiVbFA/wpstMCavHrJWWGivBFUc0XUq/oEJOAnj254xghdeGR6dP7q+uxC57yT1SMLJkZWUr3Re+D3UEdOJI+H4+vZ0KK2ROrq3S9z0CaVBXHiSrLrJqekUq1UysVEAtyo+ySK/wGKzX4DKAiA/x35hEt3NLKLt796p7HHGiPxHLJEB5suenYfIvoPeY8bOth82ztinLLSneB639o6KT+J9zaNGsR0L0hMz3toRr87OgUyYPEtOvmy8a2OStjQCRnDEk2/TX7tUQ+bDt29sxV84s2tFaB/JLJg7IT7wRjh10BJDsig/D6dQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTUd+tv8XU9tfTf9LnK9By7HWFX0H4ZNyA8Jee7DUgM=;
 b=KEjra3k6ct2aPQch9x8Nfd93HVV89fc4iQJuEYIhyIofOcHgJdSBqqBsqwiqYViXYyOsTePPlA96CyzeE5Bez6Aiu62pDw3zRJ3m7thXqRBc93FH+TG0NRP1xJupafL2A1S6raSWDT0nakWkzMdtAuOhaCqSHmoGyVrVNr+6gcCFMiI8YMUAoDGHFek1FmZgu63CYDpSTG/mnbcvBVz9X2EItfgF9GAQ4CJSJkfkuoffs/ZEbBkOLOMBznbhWFZBx0l0hTqDLlpZh8IjM7ZrMDo5SfAS0aik/PK+7LOgrG4bkPEg1GDRg9zWcvCCYeZaIvdNypRzDRzzoJ5fP/f+aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTUd+tv8XU9tfTf9LnK9By7HWFX0H4ZNyA8Jee7DUgM=;
 b=ygn3M/fLVewzRJ8xB91tFAjD+VUgF5VZkR2Igb+S3sSvxyArPBD6vY5AhmvYBLHXVwljvsReKEfjiBqj//lzc30QvtSAsLa66Y2aEIXZSlziul0rtipXQ6anDhGMXC2E6SXZcwSsTNRN1BwQu1lmmmfB1iyxRq5+na8PKOhD1yE=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=plvision.eu;
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:56::28) by
 HE1P190MB0364.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:62::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.23; Mon, 31 Aug 2020 01:56:05 +0000
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::b1a4:e5e3:a12b:1305]) by HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::b1a4:e5e3:a12b:1305%6]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 01:56:04 +0000
From:   Vadym Kochan <vadym.kochan@plvision.eu>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vadym Kochan <vadym.kochan@plvision.eu>
Subject: [PATCH v3 0/3] nvmem: add ONIE NVMEM cells provider
Date:   Mon, 31 Aug 2020 04:55:36 +0300
Message-Id: <20200831015539.26811-1-vadym.kochan@plvision.eu>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0201CA0022.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::32) To HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:7:56::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc60716vkochan.x.ow.s (217.20.186.93) by AM5PR0201CA0022.eurprd02.prod.outlook.com (2603:10a6:203:3d::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.20 via Frontend Transport; Mon, 31 Aug 2020 01:56:03 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.20.186.93]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3f9dfea-e2e7-4cb3-5b68-08d84d5104c4
X-MS-TrafficTypeDiagnostic: HE1P190MB0364:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1P190MB0364EC146EF0A3D5B4BE4FA495510@HE1P190MB0364.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ssk2ks84jle2kwgqLZyOeFadxlDREcklDhQEobd7v8g+19UBGakZrnHXnzs3y/aPJ2yz5K3QzKA8Izfrl/UoupwLfPPuNos6r4gjV5chgM7j2RCCkD7DfqFkBMHU8/DgMycRNGOOkGcczfIhRHrpkE1FvALj44w6vJQw4bdozOYKDQk1Ei9j6Z/bC7/qZlV5tBq9C2d9bKKuNK4QGwlZTID5fmsP4IVslUDhawWVg4hbexhn4Pbs+0ApctR3RG0NStK8JBcdH3bIO7lTctLCine5o6/SFkoyT9J+Okxle6fWOPHseg3UvMcFWn9exkJs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1P190MB0539.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(136003)(39830400003)(366004)(396003)(346002)(36756003)(478600001)(6486002)(5660300002)(316002)(2906002)(110136005)(8936002)(8676002)(6512007)(6666004)(66476007)(1076003)(66556008)(44832011)(66946007)(107886003)(2616005)(956004)(26005)(86362001)(4326008)(6506007)(83380400001)(16526019)(186003)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: hEsDgqDyC10YBfMB+WCoRlZX20MeEFRrjfhtpECmoF+iGQRv7HN5IKXtJIyF85nbCiDWNxCDcfK9eEo66xD5++aGDkksiIpOjxf0sZwLwLiVto0LXcWTD6c0ZN6rIdglkbE02VLC2ehHKYoGAyhlOG0crFp+dXo1jRIzy4b9Y1uA8Y0SFaQY+aaOWZB+8WYUqJOfr8dWe9qvH6q8kwtgu4vIJwyPCruPrVbwRGAmCbvVkG5979GB1bZ/msy+5YCzDe7zC/mWfqoIulyop9/evLtqXN7YQWijvfGQA44YFOYrQqBI41I4OujAz5XSNoSFkwgy1gygMrHWsF/hK/UJn4a4Ho6bobmQLKe5HGpCA2ugdHmoelCyjn7dFt4KALWjs0gk7Vp+ONby7cYYxM5arpDszMQS2zsrpTUsrHEg2Cgn4OXs3ALE0u+X6MkfZkY++tYnayZegSsaWnCngmhUxlb8QCs8FgTNnja8f4PivF1lOBsG9hscpgvP3WOgcGO+P8S5Wo/M9yj1EnwLnYP+3L22YwctYdjztIhlpVqSN9AUIVr1xdTpNg5HJZLyfSItDBDVB+1ZHBzn/tJ+0IPKaB3UKd/7pWH5CGHIVSo4iYuBSyRZf9wa3OslSWrByq0nDBLr9tkzcS+tSTU1NMVlaw==
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f9dfea-e2e7-4cb3-5b68-08d84d5104c4
X-MS-Exchange-CrossTenant-AuthSource: HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 01:56:04.5629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9Zjll57zahNNgyKZF7vK24b76xTArt5pu/a//O3znrqCMcdginFaE8bMxKQ3rvgIpyzs15bi//7sCYrvutKNW1Y7oTfHWWMhVb8GsteQZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1P190MB0364
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series adds cells provider for the ONIE TLV attributes which are
stored on NVMEM device. It adds possibility to read the mac address (and
other info) by other drivers.

There is a special case for this driver that before registering cells
the nvmem device should be first parsed to read the TLV layout which
holds the cells data.

v3:
    1) Update core.c changes by extending notification mechanism
       by adding new NVMEM_PRE_ADD event id which is called before lookup
       table cells binding, this allows for notification handler to
       register cells which require nvmem parsing.

    2) Update onie-cells.c to use nvmem notification to parse and
       register cells before device and cells are finally registered.

       Use subsys_init() macro which allows to probe before nvmem drivers.

    3) at24 driver enables regulator and pm state machine after nvmem
       registration which does not allow to use it on handing NVMEM_PRE_ADD event.

v2:
    1) Fixed wrong memcmp comparison

Vadym Kochan (3):
  nvmem: core: allow to register cells during nvmem registration
  nvmem: add ONIE NVMEM cells support
  misc: eeprom: at24: register nvmem only after eeprom is ready to use

 drivers/misc/eeprom/at24.c     |  11 +-
 drivers/nvmem/Kconfig          |   9 +
 drivers/nvmem/Makefile         |   3 +
 drivers/nvmem/core.c           |   2 +
 drivers/nvmem/onie-cells.c     | 410 +++++++++++++++++++++++++++++++++
 include/linux/nvmem-consumer.h |   1 +
 6 files changed, 432 insertions(+), 4 deletions(-)
 create mode 100644 drivers/nvmem/onie-cells.c

-- 
2.17.1

