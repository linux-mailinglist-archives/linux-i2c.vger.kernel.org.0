Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D47F2D228D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 06:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgLHE44 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Dec 2020 23:56:56 -0500
Received: from mail-mw2nam10on2078.outbound.protection.outlook.com ([40.107.94.78]:21740
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726114AbgLHE4z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Dec 2020 23:56:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxPwpTVaMqS/v7fMDI2dTInfju8Uto6HwqfpsoNGhJZkuhlz6jW5tzFltsy29SBzjqu1fW/Gx66d7l+7jIJbouHGZoq8pwmt/zGtXBz11ms+B+Fqd1a2H1nhq3kTL7ccymYatUEdmthMZYKjrGFFCND1SpRYR+I45eYZK+4a3nG4778EVpSsHY1KGSl48r8gzuhxOard8sLs9+lB6l9RslH7NObPvGjMHnhHv/wKh4SaRGFAxro0k4eRdfnBI+OKktkhMz/ruQcFt9NFDBGpLtMTUNkbbBxi2I3+Y8kID1s7vPfUimN2D5DFcz2WZCKWN1GEtfcpune4gd0l6M+bWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QqCawIH1tQAsebiOI4W+2X3Gc1gvOvGEbCMiSoVpjU=;
 b=TW6ESCmQxXOLRNTg55mmFsxRZt3zNiSXX9PxswSnPE+1BgwXDv9SGyYRwcMfvxAJqZovjxztuoVVMNy+4Ea/jQNqhKP4hMX1miwSNX3k42mzVFXVztSrwWOkzMcx3Rls8+6SMapOpFBvIjL15YjNUW8YMHVwYAK8waKGoOfnFt6oN5i5NY41nvHh6u2T8jQX96FutykmIRZ5cv9E1TZKQhv1xlUY+IV/tDlaf0XoQIgTd7VPwl0JL9kflRZGi/tNVaXNPNvCW5aUZWXe6rKBKiLhJ/FW3t9cccJ8pMpX/q8Whn73OgAhuZOHMPVgHRyOaBSfiaGL3ZQwhnUeisbYBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QqCawIH1tQAsebiOI4W+2X3Gc1gvOvGEbCMiSoVpjU=;
 b=B94iJsaN4CPqnQ/ScYY0tfYpKexk4fFHXFAWZ83o41rzQztMhs7CBiRDwK824iLgUVWSWXMQ4Rmo2h1L9QZwzBiTnhR84XZhhAqIjHG1vsgFdV0bnxDcN0akVGTIbvyq4d/BvvRyz/MtbMqZJgxajOK5LyY+Qfn5+6UEuGw1EyY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB3745.namprd13.prod.outlook.com (2603:10b6:a03:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7; Tue, 8 Dec
 2020 04:56:02 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 04:56:02 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     broonie@kernel.org, gregkh@linuxfoundation.org,
        aou@eecs.berkeley.edu, lee.jones@linaro.org,
        u.kleine-koenig@pengutronix.de, thierry.reding@gmail.com,
        andrew@lunn.ch, peter@korsgaard.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, robh+dt@kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, Yash Shah <yash.shah@sifive.com>
Subject: [PATCH v2 0/9] arch: riscv: add board and SoC DT file support
Date:   Tue,  8 Dec 2020 10:25:32 +0530
Message-Id: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::27) To BY5PR13MB4453.namprd13.prod.outlook.com
 (2603:10b6:a03:1d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 04:55:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b369ea3-592b-45ca-fb76-08d89b35900c
X-MS-TrafficTypeDiagnostic: BY5PR13MB3745:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR13MB3745C377B120698A9601C03082CD0@BY5PR13MB3745.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z76oZ6PsuMZ+IGHQ3TuP6vK1L+E/Ut95/ufsZqCq+eyi786js4hL5CD7I84VAttogSl4yzNgayGkhi3ZaGAoYYYls+/DhchcnOSsTC1jJ4QWIivRzu/YhpsCJo1xUjD1aroxATRY+RzlTlApqXE6CXhZ6n6BIz9cv3bTIjKb3oEk/wE5zrYw+pSepll4gVnIpSLxaBvpkLjpq5IsOSNV7YCKVNH9md6DUkOntXIasGRyGbSMXqe42cTv9sENPHRS0+pERLDNZNKsv7XCjgigQwnvOvPRuOAQjjjHF+ZdXqHUSmS+3bIjOj6rUcfWpgWKF5P5SVuMDK8ETzben4bJ139+4N0QlFOffj9NRJORGCLCTSXm7bFB19BH7o2gWG4gVrBv3dqiNBDe7wQoHVPRvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR13MB4453.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(39840400004)(136003)(346002)(4326008)(6666004)(6506007)(956004)(16526019)(66556008)(66476007)(966005)(7416002)(42882007)(2616005)(6486002)(26005)(478600001)(186003)(316002)(44832011)(36756003)(8936002)(83380400001)(66946007)(6512007)(107886003)(5660300002)(83170400001)(2906002)(52116002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6yIeZ8VHREi9fPekgPO4DeH4MJKOMBD5WZZce1L4kZ7ce+ZkwUa+EdFJfajp?=
 =?us-ascii?Q?GKK4LvaKo7WI0AKfCrngek310uWA9u00ONm61wOWuuCSltWwi+Hy2QEXgYrF?=
 =?us-ascii?Q?aZAMPpeMkwq6OyxSfmbtOt9j1TYjy1A5TQW4YCBNpz6x1BtXpRME6zLHHzyV?=
 =?us-ascii?Q?G7maRXW6fMFn7AGwFzshVG5CnTwKXz+xpaRyKKPp41yZuOWKUQRb+cDiM/Yz?=
 =?us-ascii?Q?z3gHLU7YQBlXNz/EKv8B+E+UiFlVT0QVRlYaammePoW8mpah3bGlbT0X6Ujk?=
 =?us-ascii?Q?pxS0U1tvHvkTNbcc3ce+nmNqvizIRZ97U1CYG85L1GPyBzNLj+U69N+sbCyd?=
 =?us-ascii?Q?lU65R+A9aEGTRfaMOYfWst9n1x3M+Gsi1pE54ACNkqw+BrjQQW4ra3PWFCS8?=
 =?us-ascii?Q?lk7tN5osROcfxTuff+jG6MCgBxKH6SUKGazi7/z+WgTGO/b89vrZzb2HB9Vq?=
 =?us-ascii?Q?sqURpZqqkJLF3SreOeGTJpAVqbr+yzuwz0Msn+n+RmyxpSXuqVuOg82Et7D2?=
 =?us-ascii?Q?AZpAafito69NBVkIaYWpdA98AR69UBdoUhFkbuzZGc0SAPg7hCyI47F9GezO?=
 =?us-ascii?Q?BmWLgLqfoi1lm6rmUYDYfTtoyS/YI9c9+bPvf3XFpUyOAxXoQryIfNElx/tg?=
 =?us-ascii?Q?fKw2a/BTmhIBWGAZtx0VkrfWu5dEo1szn/rsErzodpq1CW4YaNwGvwbf0Ra1?=
 =?us-ascii?Q?i9quv5Kzx3BEylbwXp7jO/gQPhzXE4Iejr8Fb/PP5wYCNN+gtQRlgjuZhIap?=
 =?us-ascii?Q?s9ynD3pVdhP1Gxcm9lzwFnpb7XZdbQpYOPYwIBf8BYsH+81X656tT6O4ypkn?=
 =?us-ascii?Q?EM0F8rmmttwFTyH+2Ud49NXHLFmxlQHOs05gx1hTTIMmNaUl+mIKG0vIUCkl?=
 =?us-ascii?Q?xqKJIKUynA9n11AeoVEEMuIUt/FC4PQv9oj8Fqb809qMhMIFOOcbs/yRdEtq?=
 =?us-ascii?Q?OWipm4vm/uDkmQ5VS4VCItWb3HDvLM9LtMu2g5iEJcqQ9YdGK4of74kt/q7v?=
 =?us-ascii?Q?0uY2?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 04:56:02.3026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b369ea3-592b-45ca-fb76-08d89b35900c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etpVPxyT7plKRc11wjRLugfVw1D1MuO8ahXxlYrv9pTSvR0Kid8rmup+F6QOJOH+VqBN3nBF8xNYkbtp1gmdag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB3745
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Start board support by adding initial support for the SiFive FU740 SoC
and the first development board that uses it, the SiFive HiFive
Unmatched A00.

Boot-tested on Linux 5.10-rc4 on a HiFive Unmatched A00 board using the
U-boot and OpenSBI.

This patch series is dependent on Zong's Patchset[0]. The patchset also
adds two new nodes in dtsi file. The binding documentation patch
for these nodes are already posted on the mailing list[1][2].

[0]: https://lore.kernel.org/linux-riscv/20201130082330.77268-4-zong.li@sifive.com/T/#u
[1]: https://lore.kernel.org/linux-riscv/1606714984-16593-1-git-send-email-yash.shah@sifive.com/T/#t
[2]: https://lore.kernel.org/linux-riscv/20201126030043.67390-1-zong.li@sifive.com/T/#u

Changes in v2:
- The dt bindings patch is split into several individual patches.
- Expand the full list for compatible strings in i2c-ocores.txt

Yash Shah (9):
  dt-bindings: riscv: Update DT binding docs to support SiFive FU740 SoC
  dt-bindings: spi: Update DT binding docs to support SiFive FU740 SoC
  dt-bindings: pwm: Update DT binding docs to support SiFive FU740 SoC
  dt-bindings: serial: Update DT binding docs to support SiFive FU740
    SoC
  dt-bindings: gpio: Update DT binding docs to support SiFive FU740 SoC
  dt-bindings: i2c: Update DT binding docs to support SiFive FU740 SoC
  riscv: dts: add initial support for the SiFive FU740-C000 SoC
  dt-bindings: riscv: Update YAML doc to support SiFive HiFive Unmatched
    board
  riscv: dts: add initial board data for the SiFive HiFive Unmatched

 .../devicetree/bindings/gpio/sifive,gpio.yaml      |   4 +-
 .../devicetree/bindings/i2c/i2c-ocores.txt         |   8 +-
 .../devicetree/bindings/pwm/pwm-sifive.yaml        |   9 +-
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   6 +
 .../devicetree/bindings/riscv/sifive.yaml          |  17 +-
 .../devicetree/bindings/serial/sifive-serial.yaml  |   4 +-
 .../devicetree/bindings/spi/spi-sifive.yaml        |  10 +-
 arch/riscv/boot/dts/sifive/Makefile                |   3 +-
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi         | 293 +++++++++++++++++++++
 .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 253 ++++++++++++++++++
 10 files changed, 590 insertions(+), 17 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sifive/fu740-c000.dtsi
 create mode 100644 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts

-- 
2.7.4

