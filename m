Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34048770D58
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 04:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjHECpY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 22:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjHECpY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 22:45:24 -0400
X-Greylist: delayed 3607 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 04 Aug 2023 19:45:21 PDT
Received: from 8.mo581.mail-out.ovh.net (8.mo581.mail-out.ovh.net [46.105.77.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9644EDB
        for <linux-i2c@vger.kernel.org>; Fri,  4 Aug 2023 19:45:21 -0700 (PDT)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.143.189])
        by mo581.mail-out.ovh.net (Postfix) with ESMTP id 2A8C120091
        for <linux-i2c@vger.kernel.org>; Sat,  5 Aug 2023 01:30:06 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-pnhxz (unknown [10.110.171.120])
        by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5B5731FE49;
        Sat,  5 Aug 2023 01:30:05 +0000 (UTC)
Received: from etezian.org ([37.59.142.108])
        by ghost-submission-6684bf9d7b-pnhxz with ESMTPSA
        id Ix4hDR2mzWQPPwAAYnACEA
        (envelope-from <andi@etezian.org>); Sat, 05 Aug 2023 01:30:05 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S002dd6b534a-6dc9-46b8-bb69-b53ea92a6e10,
                    05ACED94171614EC843435E2D99940E8A2AB1814) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.172.51
From:   Andi Shyti <andi.shyti@kernel.org>
To:     pierre-yves.mordret@foss.st.com, alain.volmat@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH -next] i2c: stm32: fix the return value handle for platform_get_irq()
Date:   Sat,  5 Aug 2023 03:29:12 +0200
Message-Id: <169119887102.1781235.17733733758389845864.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731112755.1943630-1-ruanjinjie@huawei.com>
References: <20230731112755.1943630-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11970004863637654087
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrkeehgdegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepveevieffieefgfefuddvteelffeuhfelffejteejuddvveekveehvdejgeefteevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudejkedrvdefkedrudejvddrhedupdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
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

On Mon, 31 Jul 2023 19:27:55 +0800, Ruan Jinjie wrote:
> There is no possible for platform_get_irq() to return 0,
> and the return value of platform_get_irq() is more sensible
> to show the error reason.
> 
> 

With the commit log fixed, applied to i2c/andi-for-next on

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please note that this patch may still undergo further evaluation
and the final decision will be made in collaboration with
Wolfram.

Thank you,
Andi

Patches applied
===============
[1/1] i2c: stm32: fix the return value handle for platform_get_irq()
      commit: 603b3cf89d8a96cc0e51eb15853f28944eb78f31
