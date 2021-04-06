Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C40E355226
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241552AbhDFLdH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:33:07 -0400
Received: from mail-db8eur05on2088.outbound.protection.outlook.com ([40.107.20.88]:39329
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241603AbhDFLdH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:33:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVAIlSMDec7iN7X9iZJjValjJDAwAfc9X4bgBW/3k14TSjfniAhhTGkoxvU1NahoFmnOqjYLOTm0E8REtYaD5fi/KvFLxl4R2ETElAptPL8kwi/NPzwvTAj615zeKASd9Jqqg2syCAfWwjrtXjCg0HZMwhkI7DTlfL+I5PVWArSaKbKKIuvjLWJYRHtcUM1oIzPXAsBZfuBmi2WFjrV3eKjkR49ZDAgtC8/W3UQQFsi4BCJpl2yPdoAxf6ICWxmYx68SwRcKqYNK2tF9M5PN1zUjpPhF7WboXuPMR86lGS+orCHsEo7CLCFE42FyA/25mHC1BHwM8b2y5FqtnP6y1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PovCox4VRTR3F3FtfKR9ij8pYnKK+WN4Cf7yUO4KuHQ=;
 b=NkY4bLSxbRZSDUGBhcVP4AK8t5ww9r20JQcgjpnekM2ZiMIfGduJNcm3IK6ItOG4gXZ+D4yHayJiQKn31xIoG2/cFu1QNt5RCab/XotrbigElEvzJgfp/MxS+OnOYYkFaSocc1J/HB6Zqi3iNSK0pNeQfO643DMgpNQElLduUpiky9eW79Nj5sixSRDz15v6jKGSzNA0mevKO+eQIOn+k0UB7hSsmh10XREh6JIvZcbM3gKARqimxXo2FWoMY2Q2+9FoD5QgWKAcFe9d+gJdGEit0HcUv4FqaUSt8jGodTX8wy9nTia0zG0PzmaOFNq/p9SFepo3qsoSX0pm46d13Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PovCox4VRTR3F3FtfKR9ij8pYnKK+WN4Cf7yUO4KuHQ=;
 b=UnN+zCj9G+2ERVLOExrcZBvJZse1rfQNdJMB9ieckg3SGh/3mw6Qa31E5u5UV8zvXB1Ifnv4z3JVGKgG4FG3VbMHmleKaj6Vett5b2Xkamh05SSMn4/Xl2sPbIDnmlA7vLSwkEuW11iz7UFQlSNuQLKAAJoUuoephJOOL57zSzM=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR0402MB3765.eurprd04.prod.outlook.com (2603:10a6:209:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 11:32:56 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:32:56 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 00/18] i2c: imx-lpi2c: New features and bug fixes
Date:   Tue,  6 Apr 2021 19:32:48 +0800
Message-Id: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:202:2::20) To AM6PR04MB5623.eurprd04.prod.outlook.com
 (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:32:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94d0c02c-f144-4d78-0144-08d8f8efb937
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB37651DA8DB1580C99ED702C4F3769@AM6PR0402MB3765.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Id2JxaS6O1WmhV++2BhXUXJLlb6QqLuo5E2MdSOykxJFMtLRZSVcUJ3hhvFnRX0hQa0X8Cg94q2gbWSNnC9QfkoKm7shPhDpZjjZKr+qrM4JzYE59ou9J30jw/VZGAnzgMWqbJDFrs/ZA3Zz4cr0BSo2HnC1DpuoZZ2T3B9StJM312Vr2HsGbHvrqsyBoGSar0KgLmwIbt1aNYq/AaJ28gp0ocgTuYURMUBd7Mnthki2rRnCirgbfnrDkLdbAcMucESlZBRRu+0xq7taH0OphcdOCl6RO5hy5LUpPcUaR25devbnr87zox/BIhe1BusHmFIkDirFE7Yt6RLYk0j3dDI8ZRqyU/4L2c4KSeRpFHoXulGRdgjgl2/a/1J0A4LziuglAs/CQ98iB+eGD8Bws+BZpy6ZzzR9Ezw5JJLY4DyMN7v9HSDkKjTa6bA2WXMnM/03026hQ2TH49yHr9q4HoguEWj2S/kwFwkRRYZVyv3z8eU0MvKLdifYKURrEfgsXGgRo8esXOWPTZ/2U979haDmpqvbKW92tEW/oTcBuouUWtwT/C02zHu4tYGsaQQVKUE2A41VHwWSA+TvGhFdsedzoTBm8R6uXxvSh0gxPL7ItCPswVsgNLYfHsrA9yp6PL7EOuPwNJoFrUXXvDv3sY4u3fXX09Zm5ohIJ3J54l38KtLnmKu2FHNEfJxDN7c+rzkGAzk3hWbwIS34FJk9t4LIFNbseMjx1yI0yQ9oLXU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(69590400012)(66946007)(36756003)(6666004)(38350700001)(66476007)(66556008)(498600001)(83380400001)(52116002)(1076003)(26005)(38100700001)(4326008)(956004)(16526019)(2616005)(186003)(86362001)(6506007)(6512007)(2906002)(6486002)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NVd/QgJGddxKDc7L3UQ6XjKukuJ/6Xc/eOiLh/fvDRZ7piA3yRi1dOoJjtxG?=
 =?us-ascii?Q?qM284d48A/5zk6uZfEufAkphI8GC556o0TkOP7onEJQce15cekBTk0Thly4Y?=
 =?us-ascii?Q?iCM0JS1J2pKLnpZj/CwNNaEWETn72s67lqtT9A30XYn+r5q9XvRmr2az/4U0?=
 =?us-ascii?Q?M01+sRU/cbOUzZXAGUg/GoYfmArhUhojndsyM3uEn9P0lR/tF+c7LVx+iWyP?=
 =?us-ascii?Q?vTbxkXKcOPKNwognk2yT+at6hxxcWWVu0E4a6sLmvRceAsRXSrBchEKsT64e?=
 =?us-ascii?Q?xruCOY42L+d6PDt1hgBYyg/cYii91ACGQzlHe6+dPDJuN60ZwdZj3H1BtRZA?=
 =?us-ascii?Q?WqX2YTiZq7qBFNgj374B3XjlyHKjt4CP3FCMbi+dnrTZvJlUQfJxZ73XnmOS?=
 =?us-ascii?Q?A67PIacSt1QoScwIOIGdIjV8GMO3KLDrH8d0EgA0j/Vr7mzZeI/GkiSsFp8I?=
 =?us-ascii?Q?zaP50iORiEoCojzXbNlnkaqT6VTKo3Kc9/KKJ+7XQYb9s0hzo7IXt5qvFvUD?=
 =?us-ascii?Q?WqN7lEN0gTiWpV81T3YbOUPTNwXx5TU9vNUiGR6OhPv2V14FgRUJLtdEHmta?=
 =?us-ascii?Q?bIS/f0FhJ5v7//J+suXK0B+pfo9C0rUrvz/edWEiVP4zK1gKIxr7hoB85Bx8?=
 =?us-ascii?Q?tECLx0kVnxLs8mHU57N8f9lL2DpSNK6wnQRucSMRVreKiTroHT/XzlfEOAH1?=
 =?us-ascii?Q?BWYn8Yc+Avr8BgEBFt1IAQ37dIHTERh7nE5U+eeXC38HbJlLA8gaQ3Embbqi?=
 =?us-ascii?Q?ttLOh9emVkPlt07G9pMRGNXCt2JFRTjhJjB05qxhWkgTmdXs64hM8e7BkEI5?=
 =?us-ascii?Q?oXypPL0oBl5ZjqVqK0JYpoCaGnDg0NvosO01J+2goJ4DcX6yiT5tTXYQtIL/?=
 =?us-ascii?Q?gdIpCtN4KkOailqbzzEiHtoEMQGD8zFadcfyRQSz8XDzlpwirkIjpCqUbFI5?=
 =?us-ascii?Q?iWkMD/4zX/wKRbo2n+oqj+62muIz5T9VehgWP4H7gXSPUkJjiQtLAuuMqBoV?=
 =?us-ascii?Q?qjSHZRjqcyMG32jC6K+ySXYX6kyWH4MtK+NW/NanLsaC6M3vNC90LLbx10Mo?=
 =?us-ascii?Q?E0sWtbiI6tsFxSGRWX/TbZvG4JmZCPIoxmBvR9GDVuQUHgdGSVMualubO/AZ?=
 =?us-ascii?Q?WIRZvQ4Lwts4idJ/jAeKyDxic3vGonlqlQzvazxuIVJ7z/5wLfQGamOXjwgy?=
 =?us-ascii?Q?xldhSf0jYu8w1Z5oD6Sw9zWZIKJNiy5qY78bL5CrvVMPIv5Ty7TT9U1lH/EI?=
 =?us-ascii?Q?uen8cPFTBzY9E27oVx4I1I77dZFKLEUSRS6yEJAespZm2SUZOYl/AlV1UXPq?=
 =?us-ascii?Q?FiVrhy20BJk9g3sxOHY1K6vz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d0c02c-f144-4d78-0144-08d8f8efb937
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:32:56.4125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D68wnrySHLxow23DJC3V6TfL7cbXdCPmGOkl9O7VRovyU/yxNsym/VYdQyZy5jIC54eaLZblr87Nhrk8G9IkqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3765
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

According to V1's feedback, V2 has been modified.
For summary of the changes, please refer to the header of each patch file.

Added some dt-bindings and dts patches.
At the same time, a patch has been added to fix the problem that data larger
than 256 bytes cannot be sent in one frame in PIO mode.

Clark Wang (14):
  i2c: imx-lpi2c: add ipg clk for lpi2c driver
  ARM: dts: imx7ulp: add the missing lpi2c ipg clock
  ARM: dts: imx7ulp: add the missing lpi2c nodes
  ARM64: dts: imx8: add the missing lpi2c ipg clock
  ARM64: dts: imx8: change i2c irq number to non-combined
  i2c: imx-lpi2c: increase PM timeout to avoid operate clk frequently
  i2c: imx-lpi2c: add bus recovery feature
  dt-bindings: i2c: imx-lpi2c: Add bus recovery example
  i2c: imx-lpi2c: fix i2c timing issue
  i2c: imx-lpi2c: fix type char overflow issue when calculating the
    clock cycle
  i2c: imx-lpi2c: add edma mode support
  dt-bindings: i2c: imx-lpi2c: Add dma configuration example
  ARM: dts: imx7ulp: add dma configurations for lpi2c
  ARM: dts: imx7ulp: add the missing status property of lpi2c5
  i2c: imx-lpi2c: fix pio mode cannot send 256+ bytes in one frame

Fugang Duan (1):
  i2c: imx-lpi2c: manage irq resource request/release in runtime pm

Gao Pan (2):
  i2c: imx-lpi2c: directly retrun ISR when detect a NACK
  i2c: imx-lpi2c: add debug message when i2c peripheral clk doesn't work

 .../bindings/i2c/i2c-imx-lpi2c.yaml           |  26 +
 arch/arm/boot/dts/imx7ulp.dtsi                |  50 +-
 .../arm64/boot/dts/freescale/imx8-ss-dma.dtsi |  32 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c            | 506 ++++++++++++++++--
 4 files changed, 548 insertions(+), 66 deletions(-)

-- 
2.25.1

