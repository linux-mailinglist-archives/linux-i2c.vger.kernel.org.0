Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CEEB770D33
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 03:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjHEBtD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 21:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjHEBtC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 21:49:02 -0400
X-Greylist: delayed 1141 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 04 Aug 2023 18:49:01 PDT
Received: from 16.mo550.mail-out.ovh.net (16.mo550.mail-out.ovh.net [178.33.104.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131761BE
        for <linux-i2c@vger.kernel.org>; Fri,  4 Aug 2023 18:49:00 -0700 (PDT)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.16.251])
        by mo550.mail-out.ovh.net (Postfix) with ESMTP id 9A46B25951
        for <linux-i2c@vger.kernel.org>; Sat,  5 Aug 2023 01:29:57 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ckdcs (unknown [10.109.156.99])
        by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 993DF1FD47;
        Sat,  5 Aug 2023 01:29:55 +0000 (UTC)
Received: from etezian.org ([37.59.142.95])
        by ghost-submission-6684bf9d7b-ckdcs with ESMTPSA
        id ai7tIROmzWTHWAMAIGJpLQ
        (envelope-from <andi@etezian.org>); Sat, 05 Aug 2023 01:29:55 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001d9e3624c-ac52-4978-b522-021b72bbbf33,
                    05ACED94171614EC843435E2D99940E8A2AB1814) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.172.51
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com,
        Michal Simek <michal.simek@amd.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: cadence: Describe power-domains property
Date:   Sat,  5 Aug 2023 03:29:11 +0200
Message-Id: <169119887100.1781235.4441400054342220300.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <8774dba53cae5508f9f7aa173fbaf814d97898b1.1691047405.git.michal.simek@amd.com>
References: <8774dba53cae5508f9f7aa173fbaf814d97898b1.1691047405.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11967471585594182288
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrkeehgdeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepveevieffieefgfefuddvteelffeuhfelffejteejuddvveekveehvdejgeefteevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudejkedrvdefkedrudejvddrhedupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On Thu, 03 Aug 2023 09:23:31 +0200, Michal Simek wrote:
> ZynqMP Cadence I2c IP core has own power domain that's why describe it as
> optional property.
> 
> 

Applied to i2c/andi-for-next on

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please note that this patch may still undergo further evaluation
and the final decision will be made in collaboration with
Wolfram.

Thank you,
Andi

Patches applied
===============
[1/1] dt-bindings: i2c: cadence: Describe power-domains property
      commit: 26a106e540b100a887209a3012b6ac2ec9a577f8
