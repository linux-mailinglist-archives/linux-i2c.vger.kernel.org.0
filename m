Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7CC2CB633
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 09:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387751AbgLBIFL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 03:05:11 -0500
Received: from mail-eopbgr770054.outbound.protection.outlook.com ([40.107.77.54]:53377
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387747AbgLBIFL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 03:05:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fzggsbll1NKXOqIrYOVckQ5uD+A3k/Z4dZIozAwkWCTIR+nGoMss9sdDzMA57ifVr3OA1uuT/C4TQ3+ZpsUVh7dHgml4UW+SG7YsrldUeHnaZvNBpzGVg/JOUuatp22DvBSMb6f1SFtlgc1aOPxADZliX5qmOdK7JoXqo/Dxpbu6PsjMyS1UabE/cyrOWUarJpFj2AYwIfbFPbOF+AmSm5PjLpSsY7qRQ46LPaVBxB48DZegtEjn6nekB4IIAY3/3sVKQJ4NeGmMfW7cmjCJDkZ6wfq/Y3sVwWNUJWfWRHU1iceqcbPYvRZ+YD9VIMKTq7cdr6bCXwpNvQfJ1qSoew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lokp4fHtuvzfblfGZUmhqUCbojpWzus3liIh15gT2D0=;
 b=QNU1k0kE4fujKTZPdrVWQxKyF4qMMt9/tX0HSO9Vh8gS/j8xEFyDi28LOLyh5Bt4ZI39nF7k/rxXs3RdTNaUPw9FVOvnprLOtMG1WxNJ9UiowyQ87xsDhpQXwxWfbs3XohE274YUMNpCGsNSkePLeOLKu4ZbPgjW+YR477DpgjkA+DcvmFI3xq/UbroDBPMla4rEHePceOo/AkPMiHzJvclqu6/vBQWLLneqBQyDDsVnU0tcF9MUoZe1e5e7RaLyPF7uEmSwdTYWDXUxtHkFX033fwNMP6naYYbDm+fuuG2OM4CSsynfuJfIzHWqup2UUQ+dD3LlWGKGf46KGGPTGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lokp4fHtuvzfblfGZUmhqUCbojpWzus3liIh15gT2D0=;
 b=DL1V+1+FMcY1DUjwRJ5HwFWcXG00MKWO3dzdpjHXTEqkmAe60jeRIf9ZPfUNvqowSMk7oW9FR9eXHWrWlWOk7NYDhwe8ncH/Ps+FmzbkxgGy5cn7PAirTFogjwEeZJouZ44EneiU8Ykuv34XOfO8YI7zeekF2UiStveZzVTGaCQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from CH2PR13MB4458.namprd13.prod.outlook.com (2603:10b6:610:6c::22)
 by CH2PR13MB3543.namprd13.prod.outlook.com (2603:10b6:610:2b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6; Wed, 2 Dec
 2020 08:04:21 +0000
Received: from CH2PR13MB4458.namprd13.prod.outlook.com
 ([fe80::bdcd:2c1b:bf81:515c]) by CH2PR13MB4458.namprd13.prod.outlook.com
 ([fe80::bdcd:2c1b:bf81:515c%7]) with mapi id 15.20.3632.006; Wed, 2 Dec 2020
 08:04:21 +0000
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
        linus.walleij@linaro.org, sachin.ghadi@sifive.com,
        Yash Shah <yash.shah@sifive.com>
Subject: [PATCH 0/4] arch: riscv: add board and SoC DT file support
Date:   Wed,  2 Dec 2020 13:33:52 +0530
Message-Id: <1606896236-62780-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: BMXPR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::28) To CH2PR13MB4458.namprd13.prod.outlook.com
 (2603:10b6:610:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by BMXPR01CA0018.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 08:04:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5c9a6a6-70c0-4851-34f0-08d89698e02d
X-MS-TrafficTypeDiagnostic: CH2PR13MB3543:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR13MB3543A0DC604150AE7CBF58FA82F30@CH2PR13MB3543.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7fmbLO5njw71lR5jAtFm8sUcNSgGtBMKRiBMvJ9Bun1QAS9ax4iNF74hoUmx/DTwhmo0EJ+Ikp+Ktp7iI7SgR+XR3AENk5Lmiv78wDyxNpIN6cMzjT/+PapjW7COkN453EwpnpxmaVjYc13sMm1f+PG0yv/z9kmdBpRhq1iGsP5LwzzP55dwncPp0yqosYAIf8Wfm13Tb92fxjeGcFPDO1W3772BzEmBEsIbRXWTxGvhsgkrCxzZVXZhEjsoCFWcdKe14D6zraS6F8c8/MnlqgiynSqZEQvjcvHWbbqAlamJ6/slSft9wl8Sv+RoTsVZna2WoQ+5EC+DiJcL3QueNXA3j4aIHV+NYj0kstWjOpi1GEA5NSg6I0NDi0wh6Eh46mk7Mg4I/1rWFlM72xmD5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR13MB4458.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(39850400004)(346002)(376002)(83170400001)(36756003)(42882007)(66476007)(316002)(66556008)(83380400001)(2906002)(4326008)(956004)(2616005)(26005)(44832011)(5660300002)(7416002)(52116002)(478600001)(107886003)(66946007)(966005)(16526019)(8936002)(6512007)(6666004)(6506007)(186003)(6486002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xrZbnmfzMCMOKGqA+uzHGzc/lugSrCqRj7RGVDAPpqvBb3mhkiuOheYsDBlZ?=
 =?us-ascii?Q?RjdRh57URFM5F0AY2bs4kj7KswlhhFiKDZh9LJew1V9ibCikOtizL6BlcIkD?=
 =?us-ascii?Q?nsyTovyg+HLYZifr/U6FvZRFwXlosyu9si9odFLrllOqe9mVJCv/n0MqoQ5C?=
 =?us-ascii?Q?OudPc3o1ly4q4bMSNHTbKqd9O2tuUB7Pw/sGD/hgUa8eCIbD72wV+J+5TtGt?=
 =?us-ascii?Q?UDwzEiF2TVtsVNbwMLiAbP06Op+QobVP+GPrpot+cElfLbP/DBafZZzQsI+m?=
 =?us-ascii?Q?1fkqH1IyGGgbCayBxiBR20DuofmVhWhfOy81VhTu0yoy0KXOGyzRXBGqdX6u?=
 =?us-ascii?Q?FRq2MNOPViCRSD5fSkKzOoKz3r4Z4JjjoMGjijRJVNfOWMNH/0PeIIn/R0sC?=
 =?us-ascii?Q?bJ/cUvBI92heAg8dU8yEWGSVJM1ufGw35bGHOS5zN9dzKMVJi0Mm1wqtabGL?=
 =?us-ascii?Q?oeyyZ3djTrJDbG6XG+8ekkQep5wuHBo/TvDx4JTSMPmCRQ4SPMbEPEZURLl+?=
 =?us-ascii?Q?/IjK3Y39VX2vPJb0V1h2wWFmDhx9w1ULfk3UBYXHzYMLas28PUCF/0aORWss?=
 =?us-ascii?Q?kqLDYgo+78/R6XFWg3xCVpIqlkLuaOo6uY8iSHAMx1tdVr6LxzwsAaAm/uAJ?=
 =?us-ascii?Q?mz00LxRXRxfY6jteCLvrEQ4OIuVQ5GjqTX4e9FHFAtTnIBAIJFnP299dei4T?=
 =?us-ascii?Q?t2J2X5h7zbnEa8g2YKcQBpTpbZuRQQdoBq7K3QAsNqv9pbEEsPEZ7PZoprc7?=
 =?us-ascii?Q?xQMjX/UFOJyDWoLiYN4bnpKVWjigKkNLBVNs4lwWnisPvrZQn6FrujYfOTnl?=
 =?us-ascii?Q?AV5s6yUfFvzDkY4dhmyev7t65Lv1YJQm9XfkuwsdjQ+2G008YvWd/1fOu+3n?=
 =?us-ascii?Q?iMfWWcFdMyWNV7lz1lVcqWupLhTPOcWx+u1BJ1s/UHiuoMVnKSG0sonKw+5A?=
 =?us-ascii?Q?srmR/ED+NSFgP8u44GzZoPwC7m6f55otZ7v9QPnBawwSWPKHZYOSv6+OH0Uq?=
 =?us-ascii?Q?89rt?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: CH2PR13MB4458.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 08:04:21.1058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c9a6a6-70c0-4851-34f0-08d89698e02d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIMwcXU6BWM1mESFxVQjKIOxqBF1R79qgVW7rvr8gi4r2iES8JIUP2kUG3DRWfXsd/BsC/HMwLwH9bjx0g5X5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3543
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

Yash Shah (4):
  dt-bindings: riscv: Update DT binding docs to support SiFive FU740 SoC
  riscv: dts: add initial support for the SiFive FU740-C000 SoC
  dt-bindings: riscv: Update YAML doc to support SiFive HiFive Unmatched
    board
  riscv: dts: add initial board data for the SiFive HiFive Unmatched

 .../devicetree/bindings/gpio/sifive,gpio.yaml      |   4 +-
 .../devicetree/bindings/i2c/i2c-ocores.txt         |   6 +-
 .../devicetree/bindings/pwm/pwm-sifive.yaml        |   9 +-
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   6 +
 .../devicetree/bindings/riscv/sifive.yaml          |  17 +-
 .../devicetree/bindings/serial/sifive-serial.yaml  |   4 +-
 .../devicetree/bindings/spi/spi-sifive.yaml        |  10 +-
 arch/riscv/boot/dts/sifive/Makefile                |   3 +-
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi         | 293 +++++++++++++++++++++
 .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 253 ++++++++++++++++++
 10 files changed, 588 insertions(+), 17 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sifive/fu740-c000.dtsi
 create mode 100644 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts

-- 
2.7.4

