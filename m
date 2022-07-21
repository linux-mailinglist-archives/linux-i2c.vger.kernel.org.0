Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3EB57C552
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Jul 2022 09:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiGUHal (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jul 2022 03:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiGUHak (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jul 2022 03:30:40 -0400
Received: from 2.mo560.mail-out.ovh.net (2.mo560.mail-out.ovh.net [188.165.53.149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1117A40BCB
        for <linux-i2c@vger.kernel.org>; Thu, 21 Jul 2022 00:30:39 -0700 (PDT)
Received: from player730.ha.ovh.net (unknown [10.109.146.131])
        by mo560.mail-out.ovh.net (Postfix) with ESMTP id C9BEE233B8
        for <linux-i2c@vger.kernel.org>; Thu, 21 Jul 2022 07:30:37 +0000 (UTC)
Received: from RCM-web2.webmail.mail.ovh.net (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player730.ha.ovh.net (Postfix) with ESMTPSA id 07AC42CA88489;
        Thu, 21 Jul 2022 07:30:13 +0000 (UTC)
MIME-Version: 1.0
Date:   Thu, 21 Jul 2022 09:30:12 +0200
From:   =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To:     William Zhang <william.zhang@broadcom.com>
Cc:     Linux ARM List <linux-arm-kernel@lists.infradead.org>,
        joel.peshkin@broadcom.com, dan.beygelman@broadcom.com,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [RESEND PATCH 6/9] arm64: bcmbca: Make BCM4908 drivers depend on
 ARCH_BCMBCA
In-Reply-To: <20220721000740.29624-1-william.zhang@broadcom.com>
References: <20220721000740.29624-1-william.zhang@broadcom.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <67a913c5cc1672152a34370f952b93eb@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 44191571924659028
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudelkedgvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtjehjtddtredvnecuhfhrohhmpeftrghfrghlpgfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeegvdffjeelvdeggeetheegveejieetgeeiiefggeelveejffehieekhfduueelhfenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejfedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeitd
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022-07-21 02:07, William Zhang wrote:
> Replace ARCH_BCM4908 with ARCH_BCMBCA in subsystem Kconfig files.

Commit messages should generally answer *why* instead of *what*.

That helps subsystem maintainers review/approve your change without
having to walk through the whole series.
