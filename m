Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B92F5BB6AB
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Sep 2022 08:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiIQGdi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Sep 2022 02:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiIQGdh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Sep 2022 02:33:37 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE2D4DB02
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 23:33:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4MV1NR4jvtz4x1V;
        Sat, 17 Sep 2022 16:33:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1663396408;
        bh=KjMTk+7Rl2KC/AZXlSN/X+dxc3ZWXGWLL/VsuneopGU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=caQZ+WbId01r4rWDPyLvg44rLzYC/kkYvB88ZVCFrxlNVgd5aNAun04CTIrrVL2BM
         FwY12Heh7lsrDSxGabl6u6lKm9YYxBCAhwv7ujuA/d4iAiyyVraMECJjBrt2G/dAOk
         OWMUqm3CMwHMI51yaOrG1qJFCd3ihvkqPS559g+o0XQdw6hg7DOyrImzd2G4g6hriQ
         oqIbfMYq+NDeTVcnuEYoVK4QnQbh2m0uuHh80WUQfG+ZUCziMz8i65eqGP8CHaSAez
         2L6heYIduYhwnL1FF0B7gehp6K6HtaHsi/3ZFjIwdv+ojj1azCYZzjoKfuA0OLlWvy
         sYaHMSLvAuVUQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] macintosh/ams: Adapt declaration of ams_i2c_remove() to
 earlier change
In-Reply-To: <YyTEi++70eURjXpQ@shikoro>
References: <20220916090802.261279-1-u.kleine-koenig@pengutronix.de>
 <YyTEi++70eURjXpQ@shikoro>
Date:   Sat, 17 Sep 2022 16:33:26 +1000
Message-ID: <87v8pmldc9.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram Sang <wsa@kernel.org> writes:
>> I don't know how to proceed with this fix. Squashing into the broken
>> commit is out of the game as the commit is on a stable branch that is
>> already merged in a few trees. Maybe let it go in via the i2c tree?
>
> I think it would be simplest if I put it on top of my for-next branch.

Yeah please do.

An ack if you need it:

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)


cheers
