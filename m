Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75EFD76D97C
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 23:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbjHBV2I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 17:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232651AbjHBV16 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 17:27:58 -0400
X-Greylist: delayed 4556 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 02 Aug 2023 14:27:57 PDT
Received: from 5.mo560.mail-out.ovh.net (5.mo560.mail-out.ovh.net [87.98.181.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27EAA1734
        for <linux-i2c@vger.kernel.org>; Wed,  2 Aug 2023 14:27:56 -0700 (PDT)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.20.39])
        by mo560.mail-out.ovh.net (Postfix) with ESMTP id 28E8626B78
        for <linux-i2c@vger.kernel.org>; Wed,  2 Aug 2023 20:11:59 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ngzf7 (unknown [10.110.115.108])
        by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 51E9F1FD5C;
        Wed,  2 Aug 2023 20:11:57 +0000 (UTC)
Received: from etezian.org ([37.59.142.98])
        by ghost-submission-6684bf9d7b-ngzf7 with ESMTPSA
        id /o/REI24ymTfJQAASXnxfg
        (envelope-from <andi@etezian.org>); Wed, 02 Aug 2023 20:11:57 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R002b9c406f2-25d1-4ea4-a4b2-02c6855a5449,
                    0C641BB37B7CC30D107EA61C426C60CA54BC1A77) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.172.51
From:   Andi Shyti <andi.shyti@kernel.org>
To:     brgl@bgdev.pl, conor.dooley@microchip.com,
        daire.mcnamara@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
        Zhu Wang <wangzhu9@huawei.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH -next v2] i2c: remove redundant dev_err_probe()
Date:   Wed,  2 Aug 2023 22:10:36 +0200
Message-Id: <169100562785.1919254.291391952713888023.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230801134814.247782-1-wangzhu9@huawei.com>
References: <20230801134814.247782-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13298848225985038919
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrkedtgdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepveevieffieefgfefuddvteelffeuhfelffejteejuddvveekveehvdejgeefteevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudejkedrvdefkedrudejvddrhedupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpeduieenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On Tue, 01 Aug 2023 21:48:14 +0800, Zhu Wang wrote:
> When platform_get_irq() is called, the error message has been printed,
> so it need not to call dev_err_probe() to print error.
> 
> As the comment of platform_get_irq() says, it returned non-zero value
> when it succeeded, and it returned negative value when it failed.
> 
> 
> [...]

Applied to i2c/andi-for-next on

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please note that this patch may still undergo further evaluation
and the final decision will be made in collaboration with
Wolfram.

Thank you,
Andi

Patches applied
===============
[1/1] i2c: remove redundant dev_err_probe()
      commit: 6a07ab839a9c14df82ba2fe0b5dd4faa85a64d89
