Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 582C5770FA7
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 14:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjHEMb4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Aug 2023 08:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjHEMbz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Aug 2023 08:31:55 -0400
X-Greylist: delayed 1199 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 05 Aug 2023 05:31:53 PDT
Received: from 5.mo575.mail-out.ovh.net (5.mo575.mail-out.ovh.net [46.105.62.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B0A44B6
        for <linux-i2c@vger.kernel.org>; Sat,  5 Aug 2023 05:31:53 -0700 (PDT)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.146.1])
        by mo575.mail-out.ovh.net (Postfix) with ESMTP id 0FF6826277
        for <linux-i2c@vger.kernel.org>; Sat,  5 Aug 2023 11:56:04 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-r2tzk (unknown [10.110.103.79])
        by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5F8881FD5E;
        Sat,  5 Aug 2023 11:56:02 +0000 (UTC)
Received: from etezian.org ([37.59.142.95])
        by ghost-submission-6684bf9d7b-r2tzk with ESMTPSA
        id JJHCEtI4zmSZjwAAmcL+yg
        (envelope-from <andi@etezian.org>); Sat, 05 Aug 2023 11:56:02 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001b4885951-65d8-4196-9f83-1fe8a642ed56,
                    05ACED94171614EC843435E2D99940E8A2AB1814) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.172.51
From:   Andi Shyti <andi.shyti@kernel.org>
To:     michael.hennerich@analog.com, peda@axentia.se,
        linux-i2c@vger.kernel.org, Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH -next] i2c: mux: ltc4306: Remove an unnecessary ternary operator
Date:   Sat,  5 Aug 2023 13:55:56 +0200
Message-Id: <169123651971.2868114.6900808236241841864.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230801025328.3380963-1-ruanjinjie@huawei.com>
References: <20230801025328.3380963-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4094897963437591111
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrkeeigdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepveevieffieefgfefuddvteelffeuhfelffejteejuddvveekveehvdejgeefteevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudejkedrvdefkedrudejvddrhedupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On Tue, 01 Aug 2023 10:53:28 +0800, Ruan Jinjie wrote:
> The true or false judgement of the ternary operator is unnecessary
> in C language semantics. So remove it to clean Code.
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
[1/1] i2c: mux: ltc4306: Remove an unnecessary ternary operator
      commit: 012d4d9a4683c592f5d3261d91b0c9ee320863ac
